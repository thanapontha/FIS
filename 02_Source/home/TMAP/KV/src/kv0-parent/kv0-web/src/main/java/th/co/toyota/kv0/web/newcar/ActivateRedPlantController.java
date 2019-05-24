package th.co.toyota.kv0.web.newcar;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.common.base.Strings;

import th.co.toyota.application.model.Payload;
import th.co.toyota.application.model.ServiceStatus;
import th.co.toyota.application.model.XmlPayload;
import th.co.toyota.application.web.CommonBaseController;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.service.CommonWebService;
import th.co.toyota.kv0.util.ComboValue;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceActivationForm;
import th.co.toyota.kv0.web.newcar.service.ActivateRedPlantService;
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
	protected ActivateRedPlantService service;
	
	@Autowired
	protected CommonWebService commonService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView initial(HttpServletRequest request, NewCarInsuranceActivationForm form) {
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
			 
			service.loadCombobox(userInfo, form);
			
			ObjectMapper mapper = new ObjectMapper();
			mv.addObject("jsonForm", mapper.writeValueAsString(form));
		}catch (CommonErrorException e){
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
					RequestContextUtils.getLocale(request)));
		}
		payload.setStatus(status);
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView initial2(HttpServletRequest request, NewCarInsuranceActivationForm form) {
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
			 
			service.loadCombobox(userInfo, form);
			
			service.searchObject(userInfo, form);
			
			
			ObjectMapper mapper = new ObjectMapper();
			mv.addObject("jsonForm", mapper.writeValueAsString(form));
		}catch (CommonErrorException e){
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			log.error(ExceptionUtils.getStackTrace(e));
			status = ServiceStatus.NG;
			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
					RequestContextUtils.getLocale(request)));
		}
		payload.setStatus(status);
		return mv;
	}
	
	@RequestMapping(value="/cuspProvinceChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspProvinceChange(@RequestParam("cuspProvince") String provinceCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadDistrict(provinceCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuspDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspDistrictChange(@RequestParam("cuspProvince") String provinceCode, 
			@RequestParam("cuspDistrict") String districtCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadSubDistrict(provinceCode, districtCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuspSubDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspSubDistrictChange(@RequestParam("cuspSubDistrict") String subDistrictCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadZipcode(subDistrictCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	
	@RequestMapping(value="/cuspBillProvinceChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspBillProvinceChange(@RequestParam("cuspBillProvince") String provinceCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadDistrict(provinceCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuspBillDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspBillDistrictChange(@RequestParam("cuspBillProvince") String provinceCode, 
			@RequestParam("cuspBillDistrict") String districtCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadSubDistrict(provinceCode, districtCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuspBillSubDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuspBillSubDistrictChange(@RequestParam("cuspBillSubDistrict") String subDistrictCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadZipcode(subDistrictCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	
	
	@RequestMapping(value="/cuscProvinceChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscProvinceChange(@RequestParam("cuscProvince") String provinceCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadDistrict(provinceCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuscDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscDistrictChange(@RequestParam("cuscProvince") String provinceCode, 
			@RequestParam("cuscDistrict") String districtCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadSubDistrict(provinceCode, districtCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuscSubDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscSubDistrictChange(@RequestParam("cuscSubDistrict") String subDistrictCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadZipcode(subDistrictCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	
	@RequestMapping(value="/cuscBillProvinceChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscBillProvinceChange(@RequestParam("cuscBillProvince") String provinceCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadDistrict(provinceCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuscBillDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscBillDistrictChange(@RequestParam("cuscBillProvince") String provinceCode, 
			@RequestParam("cuscBillDistrict") String districtCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadSubDistrict(provinceCode, districtCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	@RequestMapping(value="/cuscBillSubDistrictChange", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object cuscBillSubDistrictChange(@RequestParam("cuscBillSubDistrict") String subDistrictCode, HttpServletRequest request){
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
		List<ComboValue> list = new ArrayList<>();
		try{
			list.addAll(service.loadZipcode(subDistrictCode));			
		}catch (CommonErrorException e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
		} catch (Exception e) {
			payload.setStatus(ServiceStatus.NG);
			payload.addErrorMessage(messageSource.getMessage(
					CST30000Messages.ERROR_UNDEFINED_ERROR,
					new String[] { e.getMessage() }, RequestContextUtils.getLocale(request)));
		}
		return list;
	}
	
	
	@RequestMapping(value = "/confirmSubmit", method = RequestMethod.GET)
	public ModelAndView initialConfirmSubmit(HttpServletRequest request, NewCarInsuranceActivationForm form) {
		ModelAndView mv = new ModelAndView("WKV03130");
		Payload payload = new XmlPayload();
		ServiceStatus status = ServiceStatus.OK;
		try {			
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			CSC22110UserInfo userInfo = getUserInSession(request);

			mv.addObject(AppConstants.MV_USER_COMPANY, this.getUserCompany(userInfo));
			mv.addObject(AppConstants.MV_USER, userInfo);
			mv.addObject(AppConstants.MV_FORM, form);
			mv.addObject(AppConstants.MV_PAYLOAD, payload);
	
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
	
	@RequestMapping(value = "/activate", method = RequestMethod.GET)
	public ModelAndView initialActivated(HttpServletRequest request, NewCarInsuranceActivationForm form) {
		ModelAndView mv = new ModelAndView("WKV03140");
		Payload payload = new XmlPayload();
		ServiceStatus status = ServiceStatus.OK;
		try {			
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			CSC22110UserInfo userInfo = getUserInSession(request);

			mv.addObject(AppConstants.MV_USER_COMPANY, this.getUserCompany(userInfo));
			mv.addObject(AppConstants.MV_USER, userInfo);
			mv.addObject(AppConstants.MV_FORM, form);
			mv.addObject(AppConstants.MV_PAYLOAD, payload);
	
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
	
//	@RequestMapping(value = "/search", method = RequestMethod.POST)
//	public ModelAndView search(HttpServletRequest request, NewCarInsuranceActivationForm form) {
//		ModelAndView mv = new ModelAndView(VIEW_NAME);
//		Payload payload = new XmlPayload();
//		ServiceStatus status = ServiceStatus.OK;
//		try {			
//			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
//			CSC22110UserInfo userInfo = getUserInSession(request);
//
//			mv.addObject(AppConstants.MV_USER_COMPANY, this.getUserCompany(userInfo));
//			mv.addObject(AppConstants.MV_USER, userInfo);
//			mv.addObject(AppConstants.MV_FORM, form);
//			mv.addObject(AppConstants.MV_PAYLOAD, payload);
//			 
//			service.loadCombobox(userInfo, form);
//			
//			service.searchObject(userInfo, form);
//			
//			
//			ObjectMapper mapper = new ObjectMapper();
//			mv.addObject("jsonForm", mapper.writeValueAsString(form));
//		}catch (CommonErrorException e){
//			log.error(ExceptionUtils.getStackTrace(e));
//			status = ServiceStatus.NG;
//			payload.addErrorMessage(messageSource.getMessage(e.getMessageCode(), e.getMessageArg(), Locale.getDefault()));
//		} catch (Exception e) {
//			log.error(ExceptionUtils.getStackTrace(e));
//			status = ServiceStatus.NG;
//			payload.addErrorMessage(messageSource.getMessage(CST30000Messages.ERROR_UNDEFINED_ERROR, new String[] { e.getMessage() },
//					RequestContextUtils.getLocale(request)));
//		}
//		payload.setStatus(status);
//		return mv;
//	}
	
/*
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

	@RequestMapping(value = "/saveAdd", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Object saveAdd(NewCarInsuranceActivationForm form, HttpServletRequest request) {
		Payload payload = new XmlPayload();
		try {
			
			payload = populatePayloadForDisplay(VIEW_NAME, payload, RequestContextUtils.getLocale(request));
			Set<ConstraintViolation<NewCarInsuranceActivationForm>> errors = validator.validate(form);
			List<String> errorList = form.validate(messageSource, RequestContextUtils.getLocale(request), AppConstants.ACTION_SAVE_ADD, payload);

			if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
				errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new NewCarInsuranceActivationForm()));
				payload.setStatus(ServiceStatus.NG);
				payload.addErrorMessages(errorList);
			} else {
				CSC22110UserInfo userInfo = getUserInSession(request);
					
				errorList = service.submitAddObject(messageSource, RequestContextUtils.getLocale(request), payload, form, userInfo);
				if ((!errors.isEmpty()) || (!errorList.isEmpty())) {
					errorList.addAll(processErrorMessageFromValidator(errors.toArray(), RequestContextUtils.getLocale(request), new NewCarInsuranceActivationForm()));
					payload.setStatus(ServiceStatus.NG);
					payload.addErrorMessages(errorList);
				} else {
					
					service.searchObject(userInfo, form);
					
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
}
