package th.co.toyota.kv0.web.newcar.form;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;

public class NewCarInsuranceForm extends CommonBaseForm {

	private String vinNo;
	private String series;
	private String model;
	private String ddmsStatus;
	private String typeOfPurchase;
	private String personalId;
	private String firstName;
	private String lastName;
	private String companyName;
	private String documentStatus;
	private String insuranceCompany;
	private String insuranceType;
	private String premiumType;
	private String insuranceClass;
	private String createDateFrom;
	private String createDateTo;
	private String deliveryDateFrom;
	private String deliveryDateTo;
	private String activationDateFrom;
	private String activationDateTo;
	
	private List<ComboValue> seriesList;
	private List<ComboValue> modelList;
	private List<ComboValue> ddmsStatusList;
	private List<ComboValue> typeOfPurchaseList;
	private List<ComboValue> documentStatusList;
	private List<ComboValue> insuranceCompanyList;
	private List<ComboValue> insuranceTypeList;
	private List<ComboValue> premiumTypeList;
	private List<ComboValue> insuranceClassList;
	
	private String messageResult;
	
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getDdmsStatus() {
		return ddmsStatus;
	}
	public void setDdmsStatus(String ddmsStatus) {
		this.ddmsStatus = ddmsStatus;
	}
	public String getTypeOfPurchase() {
		return typeOfPurchase;
	}
	public void setTypeOfPurchase(String typeOfPurchase) {
		this.typeOfPurchase = typeOfPurchase;
	}
	public String getPersonalId() {
		return personalId;
	}
	public void setPersonalId(String personalId) {
		this.personalId = personalId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDocumentStatus() {
		return documentStatus;
	}
	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}
	public String getInsuranceCompany() {
		return insuranceCompany;
	}
	public void setInsuranceCompany(String insuranceCompany) {
		this.insuranceCompany = insuranceCompany;
	}
	public String getInsuranceType() {
		return insuranceType;
	}
	public void setInsuranceType(String insuranceType) {
		this.insuranceType = insuranceType;
	}
	public String getPremiumType() {
		return premiumType;
	}
	public void setPremiumType(String premiumType) {
		this.premiumType = premiumType;
	}
	public String getInsuranceClass() {
		return insuranceClass;
	}
	public void setInsuranceClass(String insuranceClass) {
		this.insuranceClass = insuranceClass;
	}
	public String getCreateDateFrom() {
		return createDateFrom;
	}
	public void setCreateDateFrom(String createDateFrom) {
		this.createDateFrom = createDateFrom;
	}
	public String getCreateDateTo() {
		return createDateTo;
	}
	public void setCreateDateTo(String createDateTo) {
		this.createDateTo = createDateTo;
	}
	public String getDeliveryDateFrom() {
		return deliveryDateFrom;
	}
	public void setDeliveryDateFrom(String deliveryDateFrom) {
		this.deliveryDateFrom = deliveryDateFrom;
	}
	public String getDeliveryDateTo() {
		return deliveryDateTo;
	}
	public void setDeliveryDateTo(String deliveryDateTo) {
		this.deliveryDateTo = deliveryDateTo;
	}
	public String getActivationDateFrom() {
		return activationDateFrom;
	}
	public void setActivationDateFrom(String activationDateFrom) {
		this.activationDateFrom = activationDateFrom;
	}
	public String getActivationDateTo() {
		return activationDateTo;
	}
	public void setActivationDateTo(String activationDateTo) {
		this.activationDateTo = activationDateTo;
	}
	public List<ComboValue> getSeriesList() {
		return seriesList;
	}
	public void setSeriesList(List<ComboValue> seriesList) {
		this.seriesList = seriesList;
	}
	public List<ComboValue> getModelList() {
		return modelList;
	}
	public void setModelList(List<ComboValue> modelList) {
		this.modelList = modelList;
	}
	public List<ComboValue> getDdmsStatusList() {
		return ddmsStatusList;
	}
	public void setDdmsStatusList(List<ComboValue> ddmsStatusList) {
		this.ddmsStatusList = ddmsStatusList;
	}
	public List<ComboValue> getTypeOfPurchaseList() {
		return typeOfPurchaseList;
	}
	public void setTypeOfPurchaseList(List<ComboValue> typeOfPurchaseList) {
		this.typeOfPurchaseList = typeOfPurchaseList;
	}
	public List<ComboValue> getDocumentStatusList() {
		return documentStatusList;
	}
	public void setDocumentStatusList(List<ComboValue> documentStatusList) {
		this.documentStatusList = documentStatusList;
	}
	public List<ComboValue> getInsuranceCompanyList() {
		return insuranceCompanyList;
	}
	public void setInsuranceCompanyList(List<ComboValue> insuranceCompanyList) {
		this.insuranceCompanyList = insuranceCompanyList;
	}
	public List<ComboValue> getInsuranceTypeList() {
		return insuranceTypeList;
	}
	public void setInsuranceTypeList(List<ComboValue> insuranceTypeList) {
		this.insuranceTypeList = insuranceTypeList;
	}
	public List<ComboValue> getPremiumTypeList() {
		return premiumTypeList;
	}
	public void setPremiumTypeList(List<ComboValue> premiumTypeList) {
		this.premiumTypeList = premiumTypeList;
	}
	public List<ComboValue> getInsuranceClassList() {
		return insuranceClassList;
	}
	public void setInsuranceClassList(List<ComboValue> insuranceClassList) {
		this.insuranceClassList = insuranceClassList;
	}
	public String getMessageResult() {
		return messageResult;
	}
	public void setMessageResult(String messageResult) {
		this.messageResult = messageResult;
	}
	
	public List<String> validate(MessageSource messagesource, Locale locale, String action, Payload payload) throws Exception {
		List<String> errors = new ArrayList<String>();
		/*try{
			if(AppConstants.ACTION_SAVE_ADD.equals(action) || AppConstants.ACTION_SAVE_EDIT.equals(action)){
				
				
				if(AppConstants.ACTION_SAVE_ADD.equals(action)){
					HashMap colInfo = (HashMap)tableMeataData.get("VEHICLE_MODEL");
					if(colInfo!=null){
						Integer len =  (Integer)colInfo.get("LENGTH");
						if(this.getVehicleModel().length() > len.intValue()){
							errors.add(messagesource.getMessage(MessagesConstants.A_ERROR_INVALID_LENGTH,
									new String[]{messagesource.getMessage("KV0.WKV04110.Label.VehicleModel", null, null), len.toString()},
										locale));
							if(Strings.isNullOrEmpty(payload.getFocusId())){
								payload.setFocusId("vehicleModel");
							}
						}
					}
				}
				
				
				boolean tcFromValid = true;
				boolean tcToValid = true;
				if(FormatUtil.isValidDate(this.tcFrom)==false){
					errors.add(messagesource.getMessage(CST30000Messages.ERROR_INVALID_DATE_FORMAT,
							new String[]{messagesource.getMessage("KV0.WKV04110.Label.TCFrom", null, null), "MMM-YY"},
								locale));
					tcFromValid = false;
					if(Strings.isNullOrEmpty(payload.getFocusId())){
						payload.setFocusId("tcFrom");
					}
				}
				if(!Strings.isNullOrEmpty(this.tcTo) && FormatUtil.isValidDate(this.tcTo)==false){
					errors.add(messagesource.getMessage(CST30000Messages.ERROR_INVALID_DATE_FORMAT,
							new String[]{messagesource.getMessage("KV0.WKV04110.Label.TCTo", null, null), "MMM-YY"},
								locale));
					tcToValid = false;
					if(Strings.isNullOrEmpty(payload.getFocusId())){
						payload.setFocusId("tcTo");
					}
				}
				
				if(tcFromValid && tcToValid){
					Date tcFormChk = FormatUtil.convertStringToDate(this.tcFrom);//
					Date tcToChk = FormatUtil.convertStringToDate(AppConstants.DEFULAT_DATE, AppConstants.DATE_STRING_SCREEN_FORMAT);
					if(!Strings.isNullOrEmpty(this.tcTo)){
						tcToChk = FormatUtil.convertStringToDate(this.tcTo);
					}
					
					Date currentDate = FormatUtil.getCurrentMonth();
					
					if(AppConstants.ACTION_SAVE_ADD.equals(action)){
						if(!Strings.isNullOrEmpty(this.tcFrom) && !(FormatUtil.compareDate(tcFormChk,currentDate) != -1)){ // form >= current
							errors.add(messagesource.getMessage(MessagesConstants.A_ERROR_MUST_BE_GREATER_THAN_OR_EQUAL,
									new String[]{messagesource.getMessage("KV0.WKV04110.Label.TCFrom", null, null), "Current Date"},
										locale));
							if(Strings.isNullOrEmpty(payload.getFocusId())){
								payload.setFocusId("tcFrom");
							}
						}			
					}
				
					if((!Strings.isNullOrEmpty(this.tcFrom) && !Strings.isNullOrEmpty(this.tcTo)) && !(FormatUtil.compareDate(tcFormChk,tcToChk) != 1)){ // form <= to
						errors.add(messagesource.getMessage(MessagesConstants.A_ERROR_MUST_BE_GREATER_THAN_OR_EQUAL,
								new String[]{messagesource.getMessage("KV0.WKV04110.Label.TCTo", null, null),
											messagesource.getMessage("KV0.WKV04110.Label.TCFrom", null, null)},
											locale));
						if(Strings.isNullOrEmpty(payload.getFocusId())){
							payload.setFocusId("tcTo");
						}
					}if(!Strings.isNullOrEmpty(this.tcTo) && !(FormatUtil.compareDate(tcToChk,currentDate) != -1)){ // to >= current
						errors.add(messagesource.getMessage(MessagesConstants.A_ERROR_MUST_BE_GREATER_THAN_OR_EQUAL,
								new String[]{messagesource.getMessage("KV0.WKV04110.Label.TCTo", null, null), "Current Date"},
											locale));
						if(Strings.isNullOrEmpty(payload.getFocusId())){
							payload.setFocusId("tcTo");
						}
					}
					
				}
			}
		}catch(Exception e){
			throw e;
		}*/
		return errors;
	}
}
