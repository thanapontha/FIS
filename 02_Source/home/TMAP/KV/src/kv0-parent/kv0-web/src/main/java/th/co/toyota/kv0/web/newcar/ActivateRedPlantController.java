package th.co.toyota.kv0.web.newcar;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Validator;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import th.co.toyota.application.model.Payload;
import th.co.toyota.application.model.ServiceStatus;
import th.co.toyota.application.model.XmlPayload;
import th.co.toyota.application.web.CommonBaseController;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.common.service.CommonWebService;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceForm;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;
import th.co.toyota.st3.api.constants.CST30000Messages;

@Controller
@RequestMapping("NewCarInsurance/ActivateRedPlant")
public class ActivateRedPlantController extends CommonBaseController {
	final Logger log = LoggerFactory.getLogger(ActivateRedPlantController.class);
	static final String VIEW_NAME = "WKV03120";
	
	@Value("${projectCode}")
	protected String PROJECT_CODE;

	@Autowired
	protected Validator validator;


	@Autowired
	protected CommonWebService commonService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView initial(HttpServletRequest request, NewCarInsuranceForm form) {
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
			
//			int rowsPerPage = commonRepository.getRowPerPage(VIEW_NAME);
//			form.setRowsPerPage(rowsPerPage);
			form.setRowsPerPage(10);
			
			/*service.loadCombobox(userInfo, form);*/
			
		
			
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
	
	/*
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object searchData(CKV04110Form form, HttpServletRequest request, RequestContext context) {
		log.info("Searching VehiclePlant");

		Payload payload = new XmlPayload();
		ServiceStatus status = ServiceStatus.OK;
		try {
			Set<ConstraintViolation<CKV04110Form>> errors = validator.validate(form);
			List<String> errorList = form.validate(messageSource, RequestContextUtils.getLocale(request), AppConstants.ACTION_SEARCH, payload, tableMeataData);

			if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
				errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new CKV04110Form()));
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

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object deleteObject(@RequestParam("dataList[]") String[] objects, CKV04110Form activeform, HttpServletRequest request) {
		log.info("Delete VehiclePlantMaster");

		Payload payload = new XmlPayload();
		try {
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			
			service.deleteObject(objects, activeform);
			String message = messageSource.getMessage(CST30000Messages.INFO_DELETION_SUCCESS, null, RequestContextUtils.getLocale(request));
			service.searchAllData(activeform, payload, request);
			activeform.setMessageResult(message);
			
			payload.setStatus(ServiceStatus.OK);
			payload.addInfoMessage(message);
		} catch (CommonErrorException e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			String message = messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault());
			payload.addErrorMessage(message);
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			String message = messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
					RequestContextUtils.getLocale(request));
			payload.addErrorMessage(message);
		}
		return payload;
	}

	@RequestMapping(value = "/submitAdd", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object submitAddObject(CKV04110Form form, HttpServletRequest request) {
		log.info("Add VehiclePlantMaster");
		Payload payload = new XmlPayload();
		try {
			tableMeataData = commonRepository.getTableMeataData(AppConstants.TABLE_TB_M_VEHICLE_PLANT);
			
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			Set<ConstraintViolation<CKV04110Form>> errors = validator.validate(form);
			List<String> errorList = form.validate(messageSource, RequestContextUtils.getLocale(request), AppConstants.ACTION_SAVE_ADD, payload, tableMeataData);

			if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
				errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new CKV04110Form()));
				payload.setStatus(ServiceStatus.NG);
				payload.addErrorMessages(errorList);
			} else {
				CSC22110UserInfo userInfo = getUserInSession(request);
				form.setVehiclePlantSearch(form.getVehiclePlant());
					
				errorList = service.submitAddObject(messageSource, RequestContextUtils.getLocale(request), payload, form, userInfo);
				if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
					errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new CKV04110Form()));
					payload.setStatus(ServiceStatus.NG);
					payload.addErrorMessages(errorList);
				} else {
					payload.setObjectForm(form);
					String message = messageSource.getMessage(CST30000Messages.INFO_SAVE_SUCCESSFUL, null,
							RequestContextUtils.getLocale(request));
					payload.setStatus(ServiceStatus.OK);
					payload.addInfoMessage(message);
					form.setMessageResult(message);
				}
			}
		} catch (CommonErrorException e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			if (Strings.isNullOrEmpty(e.getDisplayMessage())) {
				payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
			} else {
				payload.addErrorMessage(e.getDisplayMessage());
			}
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.toString() },
					RequestContextUtils.getLocale(request)));
		}
		return payload;
	}

	@RequestMapping(value = "/submitEdit", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object submitEditObject(CKV04110Form form, HttpServletRequest request) {
		log.info("Edit VehiclePlantMaster");

		Payload payload = new XmlPayload();
		try {
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			String[] arrayUpdateKeySet = form.getUpdateKeySet().split("\\|");
			form.setTcFrom(arrayUpdateKeySet[3]);
			form.setVehicleModel(arrayUpdateKeySet[2]);
			Set<ConstraintViolation<CKV04110Form>> errors = validator.validate(form);
			List<String> errorList = form.validate(messageSource, RequestContextUtils.getLocale(request), AppConstants.ACTION_SAVE_EDIT, payload, tableMeataData);

			if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
				errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new CKV04110Form()));
				payload.setStatus(ServiceStatus.NG);
				payload.addErrorMessages(errorList);
			} else {
				CSC22110UserInfo userInfo = getUserInSession(request);
				form.setVehiclePlantSearch(form.getVehiclePlant());
				errorList = service.submitEditObject(messageSource, RequestContextUtils.getLocale(request), payload, form, userInfo);
				if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
					errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new CKV04110Form()));
					payload.setStatus(ServiceStatus.NG);
					payload.addErrorMessages(errorList);
				} else {
						payload.setObjectForm(form);
						String message = messageSource.getMessage(CST30000Messages.INFO_SAVE_SUCCESSFUL, null,
								RequestContextUtils.getLocale(request));
						payload.setStatus(ServiceStatus.OK);
						payload.addInfoMessage(message);
						form.setMessageResult(message);
				}
			}
		} catch (CommonErrorException e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			if (Strings.isNullOrEmpty(e.getDisplayMessage())) {
				payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
			} else {
				payload.addErrorMessage(e.getDisplayMessage());
			}
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.toString() },
					RequestContextUtils.getLocale(request)));
		}
		return payload;
	}
	*/

}
