package th.co.toyota.kv0.web.inscompany;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContext;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.common.base.Strings;
import com.google.gson.Gson;

import th.co.toyota.application.model.Payload;
import th.co.toyota.application.model.ServiceStatus;
import th.co.toyota.application.model.XmlPayload;
import th.co.toyota.application.web.CommonBaseController;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.service.CommonWebService;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceForm;
import th.co.toyota.kv0.web.newcar.service.NewCarInsuranceService;
import th.co.toyota.kv0.web.vo.NewCarInfo;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;
import th.co.toyota.st3.api.constants.CST30000Messages;

@Controller
@RequestMapping("InsuranceCompany")
public class InsuranceCompanyController extends CommonBaseController {
	final Logger log = LoggerFactory.getLogger(InsuranceCompanyController.class);
	static final String VIEW_NAME = "WKV05110";
	
	@Value("${projectCode}")
	protected String PROJECT_CODE;

	@Autowired
	protected Validator validator;

	@Autowired
	protected NewCarInsuranceService service;

	@Autowired
	protected CommonWebService commonService;
	
	private HashMap<String,Object> tableMeataData;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView initial(HttpServletRequest request, NewCarInsuranceForm form) {
		log.info("Initial form is initated.");

		ModelAndView mv = new ModelAndView(VIEW_NAME);
		Payload payload = new XmlPayload();
		ServiceStatus status = ServiceStatus.OK;
		try {			
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			CSC22110UserInfo userInfo = getUserInSession(request);

			mv.addObject(AppConstants.MV_USER_COMPANY, this.getUserCompany(userInfo));
			mv.addObject(AppConstants.MV_USER, userInfo);
			mv.addObject(AppConstants.MV_FORM, form);
			mv.addObject(AppConstants.MV_PAYLOAD, payload);
			
			//for mockup only
//			List<NewCarInfo> objectsInfoList = new ArrayList<NewCarInfo>();
//			for(int i=0;i<10;i++){
//				NewCarInfo newCarInfo = new NewCarInfo();
//				newCarInfo.setDdmsStatus("ddmsStatus"+i);
//				newCarInfo.setInsStatus("insStatus"+i);
//				newCarInfo.setModel("model"+i);
//				newCarInfo.setVinNo("VinNo"+i);
//				newCarInfo.setTypeOfPurchase("typeOfPurchase"+i);
//				newCarInfo.setFnCompany("fnCompany"+i);
//				newCarInfo.setInsCode("insCode"+i);
//				newCarInfo.setInsCompany("insCompany"+i);
//				newCarInfo.setInsType("insType"+i);
//				newCarInfo.setInsPremium("insPremium"+i);
//				newCarInfo.setInsActivationDate("12/12/2017");
//				newCarInfo.setCustomerName("customerName"+i);
//				newCarInfo.setDealerCode("dealerCode"+i);
//				objectsInfoList.add(newCarInfo);
//			}
//			payload.setObjectsInfoList(objectsInfoList);
//			
//			Gson gson = new Gson();
//			String tmp = gson.toJson(payload);
//			mv.addObject("jsonPayload", tmp);
			//for mockup only
			
//			int rowsPerPage = commonRepository.getRowPerPage(VIEW_NAME);
//			form.setRowsPerPage(rowsPerPage);
			form.setRowsPerPage(10);
//			
//			service.loadCombobox(userInfo, form);
			
			
//		}catch (CommonErrorException e){
//			log.error(ExceptionUtils.getStackTrace(e));
//			status = ServiceStatus.NG;
//			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
					RequestContextUtils.getLocale(request)));
		}
		payload.setStatus(status);
		return mv;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object searchData(NewCarInsuranceForm form, HttpServletRequest request, RequestContext context) {
		log.info("Searching New Car Insurance");

		Payload payload = new XmlPayload();
		ServiceStatus status = ServiceStatus.OK;
		try {
			Set<ConstraintViolation<NewCarInsuranceForm>> errors = validator.validate(form);
			List<String> errorList = form.validate(messageSource, RequestContextUtils.getLocale(request), AppConstants.ACTION_SEARCH, payload, tableMeataData);

			if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
				errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new NewCarInsuranceForm()));
				status = ServiceStatus.NG;
				payload.addErrorMessages(errorList);
			}else{			
				payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
				boolean isFound = service.searchAllData(form, payload, request);
				form.setMessageResult(request.getParameter("messageResult"));
				if (!isFound && Strings.isNullOrEmpty(form.getMessageResult())) {
					status = ServiceStatus.NG;
					payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_MESSAGE_DATA_NOT_FOUND, new String[] {},
							Locale.getDefault()));
				}
			}
		}catch (CommonErrorException e){
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		}catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
					RequestContextUtils.getLocale(request)));
		}
		payload.setStatus(status);
		return payload;
	}
}
