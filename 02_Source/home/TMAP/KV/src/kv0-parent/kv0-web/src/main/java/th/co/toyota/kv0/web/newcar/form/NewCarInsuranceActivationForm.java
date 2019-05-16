package th.co.toyota.kv0.web.newcar.form;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;

public class NewCarInsuranceActivationForm extends CommonBaseForm {
	
	private String cuspGender;
	private String finLisingCompany;
	private String finTypePurchase;
	private String insClass;
	private String insPremiumType;
	private String insType;	
	
	private String cuspProvince;
	private String cuspDistrict;
	private String cuspSubDistrict;
	private String cuspZipcode;
	private String cuspBillProvince;
	private String cuspBillDistrict;
	private String cuspBillSubDistrict;
	private String cuspBillZipcode;
	
	private String cuscProvince;
	private String cuscDistrict;
	private String cuscSubDistrict;
	private String cuscZipcode;
	private String cuscBillProvince;
	private String cuscBillDistrict;
	private String cuscBillSubDistrict;
	private String cuscBillZipcode;
	
	private List<ComboValue> genderList;
	private List<ComboValue> finLisingCompanyList;
	private List<ComboValue> finTypePurchaseList;
	private List<ComboValue> insClassList;
	private List<ComboValue> insPremiumTypeList;
	private List<ComboValue> insTypeList;	
	
	private List<ComboValue> cuspProvinceList;
	private List<ComboValue> cuspDistrictList;
	private List<ComboValue> cuspSubDistrictList;
	private List<ComboValue> cuspZipcodeList;
	private List<ComboValue> cuspBillProvinceList;
	private List<ComboValue> cuspBillDistrictList;
	private List<ComboValue> cuspBillSubDistrictList;
	private List<ComboValue> cuspBillZipcodeList;
	
	private List<ComboValue> cuscProvinceList;
	private List<ComboValue> cuscDistrictList;
	private List<ComboValue> cuscSubDistrictList;
	private List<ComboValue> cuscZipcodeList;
	private List<ComboValue> cuscBillProvinceList;
	private List<ComboValue> cuscBillDistrictList;
	private List<ComboValue> cuscBillSubDistrictList;
	private List<ComboValue> cuscBillZipcodeList;
	
	private String messageResult;

	public String getCuspGender() {
		return cuspGender;
	}

	public void setCuspGender(String cuspGender) {
		this.cuspGender = cuspGender;
	}

	public String getFinLisingCompany() {
		return finLisingCompany;
	}

	public void setFinLisingCompany(String finLisingCompany) {
		this.finLisingCompany = finLisingCompany;
	}

	public String getFinTypePurchase() {
		return finTypePurchase;
	}

	public void setFinTypePurchase(String finTypePurchase) {
		this.finTypePurchase = finTypePurchase;
	}

	public String getInsClass() {
		return insClass;
	}

	public void setInsClass(String insClass) {
		this.insClass = insClass;
	}

	public String getInsPremiumType() {
		return insPremiumType;
	}

	public void setInsPremiumType(String insPremiumType) {
		this.insPremiumType = insPremiumType;
	}

	public String getInsType() {
		return insType;
	}

	public void setInsType(String insType) {
		this.insType = insType;
	}

	public String getCuspProvince() {
		return cuspProvince;
	}

	public void setCuspProvince(String cuspProvince) {
		this.cuspProvince = cuspProvince;
	}

	public String getCuspDistrict() {
		return cuspDistrict;
	}

	public void setCuspDistrict(String cuspDistrict) {
		this.cuspDistrict = cuspDistrict;
	}

	public String getCuspSubDistrict() {
		return cuspSubDistrict;
	}

	public void setCuspSubDistrict(String cuspSubDistrict) {
		this.cuspSubDistrict = cuspSubDistrict;
	}

	public String getCuspZipcode() {
		return cuspZipcode;
	}

	public void setCuspZipcode(String cuspZipcode) {
		this.cuspZipcode = cuspZipcode;
	}

	public String getCuspBillProvince() {
		return cuspBillProvince;
	}

	public void setCuspBillProvince(String cuspBillProvince) {
		this.cuspBillProvince = cuspBillProvince;
	}

	public String getCuspBillDistrict() {
		return cuspBillDistrict;
	}

	public void setCuspBillDistrict(String cuspBillDistrict) {
		this.cuspBillDistrict = cuspBillDistrict;
	}

	public String getCuspBillSubDistrict() {
		return cuspBillSubDistrict;
	}

	public void setCuspBillSubDistrict(String cuspBillSubDistrict) {
		this.cuspBillSubDistrict = cuspBillSubDistrict;
	}

	public String getCuspBillZipcode() {
		return cuspBillZipcode;
	}

	public void setCuspBillZipcode(String cuspBillZipcode) {
		this.cuspBillZipcode = cuspBillZipcode;
	}

	public String getCuscProvince() {
		return cuscProvince;
	}

	public void setCuscProvince(String cuscProvince) {
		this.cuscProvince = cuscProvince;
	}

	public String getCuscDistrict() {
		return cuscDistrict;
	}

	public void setCuscDistrict(String cuscDistrict) {
		this.cuscDistrict = cuscDistrict;
	}

	public String getCuscSubDistrict() {
		return cuscSubDistrict;
	}

	public void setCuscSubDistrict(String cuscSubDistrict) {
		this.cuscSubDistrict = cuscSubDistrict;
	}

	public String getCuscZipcode() {
		return cuscZipcode;
	}

	public void setCuscZipcode(String cuscZipcode) {
		this.cuscZipcode = cuscZipcode;
	}

	public String getCuscBillProvince() {
		return cuscBillProvince;
	}

	public void setCuscBillProvince(String cuscBillProvince) {
		this.cuscBillProvince = cuscBillProvince;
	}

	public String getCuscBillDistrict() {
		return cuscBillDistrict;
	}

	public void setCuscBillDistrict(String cuscBillDistrict) {
		this.cuscBillDistrict = cuscBillDistrict;
	}

	public String getCuscBillSubDistrict() {
		return cuscBillSubDistrict;
	}

	public void setCuscBillSubDistrict(String cuscBillSubDistrict) {
		this.cuscBillSubDistrict = cuscBillSubDistrict;
	}

	public String getCuscBillZipcode() {
		return cuscBillZipcode;
	}

	public void setCuscBillZipcode(String cuscBillZipcode) {
		this.cuscBillZipcode = cuscBillZipcode;
	}

	public List<ComboValue> getGenderList() {
		return genderList;
	}

	public void setGenderList(List<ComboValue> genderList) {
		this.genderList = genderList;
	}

	public List<ComboValue> getFinLisingCompanyList() {
		return finLisingCompanyList;
	}

	public void setFinLisingCompanyList(List<ComboValue> finLisingCompanyList) {
		this.finLisingCompanyList = finLisingCompanyList;
	}

	public List<ComboValue> getFinTypePurchaseList() {
		return finTypePurchaseList;
	}

	public void setFinTypePurchaseList(List<ComboValue> finTypePurchaseList) {
		this.finTypePurchaseList = finTypePurchaseList;
	}

	public List<ComboValue> getInsClassList() {
		return insClassList;
	}

	public void setInsClassList(List<ComboValue> insClassList) {
		this.insClassList = insClassList;
	}

	public List<ComboValue> getInsPremiumTypeList() {
		return insPremiumTypeList;
	}

	public void setInsPremiumTypeList(List<ComboValue> insPremiumTypeList) {
		this.insPremiumTypeList = insPremiumTypeList;
	}

	public List<ComboValue> getInsTypeList() {
		return insTypeList;
	}

	public void setInsTypeList(List<ComboValue> insTypeList) {
		this.insTypeList = insTypeList;
	}

	public List<ComboValue> getCuspProvinceList() {
		return cuspProvinceList;
	}

	public void setCuspProvinceList(List<ComboValue> cuspProvinceList) {
		this.cuspProvinceList = cuspProvinceList;
	}

	public List<ComboValue> getCuspDistrictList() {
		return cuspDistrictList;
	}

	public void setCuspDistrictList(List<ComboValue> cuspDistrictList) {
		this.cuspDistrictList = cuspDistrictList;
	}

	public List<ComboValue> getCuspSubDistrictList() {
		return cuspSubDistrictList;
	}

	public void setCuspSubDistrictList(List<ComboValue> cuspSubDistrictList) {
		this.cuspSubDistrictList = cuspSubDistrictList;
	}

	public List<ComboValue> getCuspZipcodeList() {
		return cuspZipcodeList;
	}

	public void setCuspZipcodeList(List<ComboValue> cuspZipcodeList) {
		this.cuspZipcodeList = cuspZipcodeList;
	}

	public List<ComboValue> getCuspBillProvinceList() {
		return cuspBillProvinceList;
	}

	public void setCuspBillProvinceList(List<ComboValue> cuspBillProvinceList) {
		this.cuspBillProvinceList = cuspBillProvinceList;
	}

	public List<ComboValue> getCuspBillDistrictList() {
		return cuspBillDistrictList;
	}

	public void setCuspBillDistrictList(List<ComboValue> cuspBillDistrictList) {
		this.cuspBillDistrictList = cuspBillDistrictList;
	}

	public List<ComboValue> getCuspBillSubDistrictList() {
		return cuspBillSubDistrictList;
	}

	public void setCuspBillSubDistrictList(List<ComboValue> cuspBillSubDistrictList) {
		this.cuspBillSubDistrictList = cuspBillSubDistrictList;
	}

	public List<ComboValue> getCuspBillZipcodeList() {
		return cuspBillZipcodeList;
	}

	public void setCuspBillZipcodeList(List<ComboValue> cuspBillZipcodeList) {
		this.cuspBillZipcodeList = cuspBillZipcodeList;
	}

	public List<ComboValue> getCuscProvinceList() {
		return cuscProvinceList;
	}

	public void setCuscProvinceList(List<ComboValue> cuscProvinceList) {
		this.cuscProvinceList = cuscProvinceList;
	}

	public List<ComboValue> getCuscDistrictList() {
		return cuscDistrictList;
	}

	public void setCuscDistrictList(List<ComboValue> cuscDistrictList) {
		this.cuscDistrictList = cuscDistrictList;
	}

	public List<ComboValue> getCuscSubDistrictList() {
		return cuscSubDistrictList;
	}

	public void setCuscSubDistrictList(List<ComboValue> cuscSubDistrictList) {
		this.cuscSubDistrictList = cuscSubDistrictList;
	}

	public List<ComboValue> getCuscZipcodeList() {
		return cuscZipcodeList;
	}

	public void setCuscZipcodeList(List<ComboValue> cuscZipcodeList) {
		this.cuscZipcodeList = cuscZipcodeList;
	}

	public List<ComboValue> getCuscBillProvinceList() {
		return cuscBillProvinceList;
	}

	public void setCuscBillProvinceList(List<ComboValue> cuscBillProvinceList) {
		this.cuscBillProvinceList = cuscBillProvinceList;
	}

	public List<ComboValue> getCuscBillDistrictList() {
		return cuscBillDistrictList;
	}

	public void setCuscBillDistrictList(List<ComboValue> cuscBillDistrictList) {
		this.cuscBillDistrictList = cuscBillDistrictList;
	}

	public List<ComboValue> getCuscBillSubDistrictList() {
		return cuscBillSubDistrictList;
	}

	public void setCuscBillSubDistrictList(List<ComboValue> cuscBillSubDistrictList) {
		this.cuscBillSubDistrictList = cuscBillSubDistrictList;
	}

	public List<ComboValue> getCuscBillZipcodeList() {
		return cuscBillZipcodeList;
	}

	public void setCuscBillZipcodeList(List<ComboValue> cuscBillZipcodeList) {
		this.cuscBillZipcodeList = cuscBillZipcodeList;
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
