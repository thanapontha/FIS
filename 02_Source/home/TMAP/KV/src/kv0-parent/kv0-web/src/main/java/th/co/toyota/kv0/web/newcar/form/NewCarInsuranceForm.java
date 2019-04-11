package th.co.toyota.kv0.web.newcar.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;

public class NewCarInsuranceForm extends CommonBaseForm {

	private String vehiclePlantSearch;
	private String includeExpiredData;

	private String vehiclePlant;
	private String vehicleModel;
	private String tcFrom;
	private String tcTo;

	private List<ComboValue> vehicleModelList;
	private List<ComboValue> vehiclePlantList;
	
	private String messageResult;
	
	public List<ComboValue> getVehiclePlantList() {
		return vehiclePlantList;
	}

	public void setVehiclePlantList(List<ComboValue> vehiclePlantList) {
		this.vehiclePlantList = vehiclePlantList;
	}


	public String getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public String getTcFrom() {
		return tcFrom;
	}

	public void setTcFrom(String tcFrom) {
		this.tcFrom = tcFrom;
	}

	public String getTcTo() {
		return tcTo;
	}

	public void setTcTo(String tcTo) {
		this.tcTo = tcTo;
	}

	public String getVehiclePlantSearch() {
		return vehiclePlantSearch;
	}

	public void setVehiclePlantSearch(String vehiclePlantSearch) {
		this.vehiclePlantSearch = vehiclePlantSearch;
	}

	public String getVehiclePlant() {
		return vehiclePlant;
	}

	public void setVehiclePlant(String vehiclePlant) {
		this.vehiclePlant = vehiclePlant;
	}

	public List<ComboValue> getVehicleModelList() {
		return vehicleModelList;
	}

	public void setVehicleModelList(List<ComboValue> vehicleModelList) {
		this.vehicleModelList = vehicleModelList;
	}

	public String getIncludeExpiredData() {
		return includeExpiredData;
	}

	public void setIncludeExpiredData(String includeExpiredData) {
		this.includeExpiredData = includeExpiredData;
	}

	public String getMessageResult() {
		return messageResult;
	}

	public void setMessageResult(String messageResult) {
		this.messageResult = messageResult;
	}
	

	public List<String> validate(MessageSource messagesource, Locale locale, String action, Payload payload, HashMap<String,Object> tableMeataData) throws Exception {
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
