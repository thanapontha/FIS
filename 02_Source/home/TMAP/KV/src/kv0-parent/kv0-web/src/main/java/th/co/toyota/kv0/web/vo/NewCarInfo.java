package th.co.toyota.kv0.web.vo;

import java.util.Date;

import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.util.FormatUtil;

public class NewCarInfo {

	private String documentStatus;
	private String model;
	private String vinNo;
	private String customerName;
	private String insType;
	private String premiumType;
	private String insCompany;
	private String insClass;
	private String insPremium;
	private String activationDate;
	private String dealerCode;
	private String ddmsStatus;

	private Date createDt;
	private Date updateDt;
	private String createBy;
	private String updateBy;
	
	public String getUpdateDateDisp() {
		return FormatUtil.convertDateToString(this.getUpdateDt(), AppConstants.DATE_TIME_IN_SCREEN_NOT_24);
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getInsType() {
		return insType;
	}

	public void setInsType(String insType) {
		this.insType = insType;
	}

	public String getPremiumType() {
		return premiumType;
	}

	public void setPremiumType(String premiumType) {
		this.premiumType = premiumType;
	}

	public String getInsCompany() {
		return insCompany;
	}

	public void setInsCompany(String insCompany) {
		this.insCompany = insCompany;
	}

	public String getInsClass() {
		return insClass;
	}

	public void setInsClass(String insClass) {
		this.insClass = insClass;
	}

	public String getInsPremium() {
		return insPremium;
	}

	public void setInsPremium(String insPremium) {
		this.insPremium = insPremium;
	}

	public String getActivationDate() {
		return activationDate;
	}

	public void setActivationDate(String activationDate) {
		this.activationDate = activationDate;
	}

	public String getDealerCode() {
		return dealerCode;
	}

	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

	public String getDdmsStatus() {
		return ddmsStatus;
	}

	public void setDdmsStatus(String ddmsStatus) {
		this.ddmsStatus = ddmsStatus;
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

}
