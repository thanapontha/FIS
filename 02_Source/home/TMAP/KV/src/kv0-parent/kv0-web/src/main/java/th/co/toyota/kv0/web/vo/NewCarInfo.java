package th.co.toyota.kv0.web.vo;

import java.util.Date;

import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.util.FormatUtil;

public class NewCarInfo {

	private String ddmsStatus;
	private String insStatus;
	private String model;
	private String vinNo;
	private String typeOfPurchase;
	private String fnCompany;
	private String insCode;
	private String insCompany;
	private String insType;
	private String insPremium;
	private String insActivationDate;
	private String customerName;
	private String dealerCode;

	private Date createDt;
	private Date updateDt;
	private String createBy;
	private String updateBy;

	public String getUpdateDateDisp() {
		return FormatUtil.convertDateToString(this.getUpdateDt(), AppConstants.DATE_TIME_IN_SCREEN_NOT_24);
	}

	public String getDdmsStatus() {
		return ddmsStatus;
	}

	public void setDdmsStatus(String ddmsStatus) {
		this.ddmsStatus = ddmsStatus;
	}

	public String getInsStatus() {
		return insStatus;
	}

	public void setInsStatus(String insStatus) {
		this.insStatus = insStatus;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getTypeOfPurchase() {
		return typeOfPurchase;
	}

	public void setTypeOfPurchase(String typeOfPurchase) {
		this.typeOfPurchase = typeOfPurchase;
	}

	public String getFnCompany() {
		return fnCompany;
	}

	public void setFnCompany(String fnCompany) {
		this.fnCompany = fnCompany;
	}

	public String getInsCode() {
		return insCode;
	}

	public void setInsCode(String insCode) {
		this.insCode = insCode;
	}

	public String getInsCompany() {
		return insCompany;
	}

	public void setInsCompany(String insCompany) {
		this.insCompany = insCompany;
	}

	public String getInsType() {
		return insType;
	}

	public void setInsType(String insType) {
		this.insType = insType;
	}

	public String getInsPremium() {
		return insPremium;
	}

	public void setInsPremium(String insPremium) {
		this.insPremium = insPremium;
	}

	public String getInsActivationDate() {
		return insActivationDate;
	}

	public void setInsActivationDate(String insActivationDate) {
		this.insActivationDate = insActivationDate;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Date getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDealerCode() {
		return dealerCode;
	}

	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

}
