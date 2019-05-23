package th.co.toyota.kv0.web.newcar.form;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;

public class NewCarInsuranceActivationForm extends CommonBaseForm {
	private String documentNo;
	private String documentStatus;
	private String vehBrand;
	private String vehVinNo;
	private String vehSeries;
	private String vehModel;
	private String vehColor;
	private String vehYear;
	private String vehRegNo;
	private String vehEngine;
	private String vehWeight;
	private String vehCC;
	private String vehType;
	
	private String finLisingCompany;
	private String finTypePurchase;
	
	private String insChoice;
	private String insCompany;
	private String insClass;
	private String insPremiumType;
	private String insType;	
	private String insCoverageYear;
	private String insPremium;
	private String insCoverage;
	private String insAct;
	private String insActivationDate;
	private String insCoverageDate;
	private String insRemark;
	
	private String insTempPolicyNo;
	private String insPolicyNo;
	
	private String cusType;
	private String cuspPolicyDelivery;
	private String cuspIdCardNo;
	private String cuspMobile;
	private String cuspTitle1;
	private String cuspTitle2;
	private String cuspFirstName;
	private String cuspLastName;
	private String cuspGender;
	private String cuspBirthDate;
	private String cuspAddress1;
	private String cuspAddress2;
	private String cuspProvince;
	private String cuspDistrict;
	private String cuspSubDistrict;
	private String cuspZipcode;
	private String cuspTelephone;
	private String cuspSameAddressFlag;
	private String cuspBillAddress1;
	private String cuspBillAddress2;
	private String cuspBillProvince;
	private String cuspBillDistrict;
	private String cuspBillSubDistrict;
	private String cuspBillZipcode;
	private String cuspBeneficiary;
	private String cuspRefTelNo;
	private String cuspLineID;
	private String cuspEmail;
	
	private String cuscPolicyDelivery;
	private String cuscTaxID;
	private String cuscPhone;
	private String cuscCompanyName;
	private String cuscBranchNo;
	private String cuscRegisterDate;
	private String cuscFirstName;
	private String cuscLastName;
	private String cuscAddress1;
	private String cuscAddress2;
	private String cuscProvince;
	private String cuscDistrict;
	private String cuscSubDistrict;
	private String cuscZipcode;
	private String cuscMobile;
	private String cuscSameAddressFlag;
	private String cuscBillAddress1;
	private String cuscBillAddress2;
	private String cuscBillProvince;
	private String cuscBillDistrict;
	private String cuscBillSubDistrict;
	private String cuscBillZipcode;
	private String cuscEmail;

	private String salesman;
	private String createdBy;
	private String createdDate;
	private String updatedBy;
	private String updatedDate;
	private String updatedDateDisp;
	private String cancelBy;
	private String cancelDate;
	private String cancelReason;
	
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

	public String getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}

	public String getVehBrand() {
		return vehBrand;
	}

	public void setVehBrand(String vehBrand) {
		this.vehBrand = vehBrand;
	}

	public String getVehVinNo() {
		return vehVinNo;
	}

	public void setVehVinNo(String vehVinNo) {
		this.vehVinNo = vehVinNo;
	}

	public String getVehSeries() {
		return vehSeries;
	}

	public void setVehSeries(String vehSeries) {
		this.vehSeries = vehSeries;
	}

	public String getVehModel() {
		return vehModel;
	}

	public void setVehModel(String vehModel) {
		this.vehModel = vehModel;
	}

	public String getVehColor() {
		return vehColor;
	}

	public void setVehColor(String vehColor) {
		this.vehColor = vehColor;
	}

	public String getVehYear() {
		return vehYear;
	}

	public void setVehYear(String vehYear) {
		this.vehYear = vehYear;
	}

	public String getVehRegNo() {
		return vehRegNo;
	}

	public void setVehRegNo(String vehRegNo) {
		this.vehRegNo = vehRegNo;
	}

	public String getVehEngine() {
		return vehEngine;
	}

	public void setVehEngine(String vehEngine) {
		this.vehEngine = vehEngine;
	}

	public String getVehWeight() {
		return vehWeight;
	}

	public void setVehWeight(String vehWeight) {
		this.vehWeight = vehWeight;
	}

	public String getVehCC() {
		return vehCC;
	}

	public void setVehCC(String vehCC) {
		this.vehCC = vehCC;
	}

	public String getVehType() {
		return vehType;
	}

	public void setVehType(String vehType) {
		this.vehType = vehType;
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

	public String getInsChoice() {
		return insChoice;
	}

	public void setInsChoice(String insChoice) {
		this.insChoice = insChoice;
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

	public String getInsCoverageYear() {
		return insCoverageYear;
	}

	public void setInsCoverageYear(String insCoverageYear) {
		this.insCoverageYear = insCoverageYear;
	}

	public String getInsPremium() {
		return insPremium;
	}

	public void setInsPremium(String insPremium) {
		this.insPremium = insPremium;
	}

	public String getInsCoverage() {
		return insCoverage;
	}

	public void setInsCoverage(String insCoverage) {
		this.insCoverage = insCoverage;
	}

	public String getInsAct() {
		return insAct;
	}

	public void setInsAct(String insAct) {
		this.insAct = insAct;
	}

	public String getInsActivationDate() {
		return insActivationDate;
	}

	public void setInsActivationDate(String insActivationDate) {
		this.insActivationDate = insActivationDate;
	}

	public String getInsCoverageDate() {
		return insCoverageDate;
	}

	public void setInsCoverageDate(String insCoverageDate) {
		this.insCoverageDate = insCoverageDate;
	}

	public String getInsRemark() {
		return insRemark;
	}

	public void setInsRemark(String insRemark) {
		this.insRemark = insRemark;
	}

	public String getInsTempPolicyNo() {
		return insTempPolicyNo;
	}

	public void setInsTempPolicyNo(String insTempPolicyNo) {
		this.insTempPolicyNo = insTempPolicyNo;
	}

	public String getInsPolicyNo() {
		return insPolicyNo;
	}

	public void setInsPolicyNo(String insPolicyNo) {
		this.insPolicyNo = insPolicyNo;
	}

	public String getCusType() {
		return cusType;
	}

	public void setCusType(String cusType) {
		this.cusType = cusType;
	}

	public String getCuspPolicyDelivery() {
		return cuspPolicyDelivery;
	}

	public void setCuspPolicyDelivery(String cuspPolicyDelivery) {
		this.cuspPolicyDelivery = cuspPolicyDelivery;
	}

	public String getCuspIdCardNo() {
		return cuspIdCardNo;
	}

	public void setCuspIdCardNo(String cuspIdCardNo) {
		this.cuspIdCardNo = cuspIdCardNo;
	}

	public String getCuspMobile() {
		return cuspMobile;
	}

	public void setCuspMobile(String cuspMobile) {
		this.cuspMobile = cuspMobile;
	}

	public String getCuspTitle1() {
		return cuspTitle1;
	}

	public void setCuspTitle1(String cuspTitle1) {
		this.cuspTitle1 = cuspTitle1;
	}

	public String getCuspTitle2() {
		return cuspTitle2;
	}

	public void setCuspTitle2(String cuspTitle2) {
		this.cuspTitle2 = cuspTitle2;
	}

	public String getCuspFirstName() {
		return cuspFirstName;
	}

	public void setCuspFirstName(String cuspFirstName) {
		this.cuspFirstName = cuspFirstName;
	}

	public String getCuspLastName() {
		return cuspLastName;
	}

	public void setCuspLastName(String cuspLastName) {
		this.cuspLastName = cuspLastName;
	}

	public String getCuspGender() {
		return cuspGender;
	}

	public void setCuspGender(String cuspGender) {
		this.cuspGender = cuspGender;
	}

	public String getCuspBirthDate() {
		return cuspBirthDate;
	}

	public void setCuspBirthDate(String cuspBirthDate) {
		this.cuspBirthDate = cuspBirthDate;
	}

	public String getCuspAddress1() {
		return cuspAddress1;
	}

	public void setCuspAddress1(String cuspAddress1) {
		this.cuspAddress1 = cuspAddress1;
	}

	public String getCuspAddress2() {
		return cuspAddress2;
	}

	public void setCuspAddress2(String cuspAddress2) {
		this.cuspAddress2 = cuspAddress2;
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

	public String getCuspTelephone() {
		return cuspTelephone;
	}

	public void setCuspTelephone(String cuspTelephone) {
		this.cuspTelephone = cuspTelephone;
	}

	public String getCuspSameAddressFlag() {
		return cuspSameAddressFlag;
	}

	public void setCuspSameAddressFlag(String cuspSameAddressFlag) {
		this.cuspSameAddressFlag = cuspSameAddressFlag;
	}

	public String getCuspBillAddress1() {
		return cuspBillAddress1;
	}

	public void setCuspBillAddress1(String cuspBillAddress1) {
		this.cuspBillAddress1 = cuspBillAddress1;
	}

	public String getCuspBillAddress2() {
		return cuspBillAddress2;
	}

	public void setCuspBillAddress2(String cuspBillAddress2) {
		this.cuspBillAddress2 = cuspBillAddress2;
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

	public String getCuspBeneficiary() {
		return cuspBeneficiary;
	}

	public void setCuspBeneficiary(String cuspBeneficiary) {
		this.cuspBeneficiary = cuspBeneficiary;
	}

	public String getCuspRefTelNo() {
		return cuspRefTelNo;
	}

	public void setCuspRefTelNo(String cuspRefTelNo) {
		this.cuspRefTelNo = cuspRefTelNo;
	}

	public String getCuspLineID() {
		return cuspLineID;
	}

	public void setCuspLineID(String cuspLineID) {
		this.cuspLineID = cuspLineID;
	}

	public String getCuspEmail() {
		return cuspEmail;
	}

	public void setCuspEmail(String cuspEmail) {
		this.cuspEmail = cuspEmail;
	}

	public String getCuscPolicyDelivery() {
		return cuscPolicyDelivery;
	}

	public void setCuscPolicyDelivery(String cuscPolicyDelivery) {
		this.cuscPolicyDelivery = cuscPolicyDelivery;
	}

	public String getCuscTaxID() {
		return cuscTaxID;
	}

	public void setCuscTaxID(String cuscTaxID) {
		this.cuscTaxID = cuscTaxID;
	}

	public String getCuscPhone() {
		return cuscPhone;
	}

	public void setCuscPhone(String cuscPhone) {
		this.cuscPhone = cuscPhone;
	}

	public String getCuscCompanyName() {
		return cuscCompanyName;
	}

	public void setCuscCompanyName(String cuscCompanyName) {
		this.cuscCompanyName = cuscCompanyName;
	}

	public String getCuscBranchNo() {
		return cuscBranchNo;
	}

	public void setCuscBranchNo(String cuscBranchNo) {
		this.cuscBranchNo = cuscBranchNo;
	}

	public String getCuscRegisterDate() {
		return cuscRegisterDate;
	}

	public void setCuscRegisterDate(String cuscRegisterDate) {
		this.cuscRegisterDate = cuscRegisterDate;
	}

	public String getCuscFirstName() {
		return cuscFirstName;
	}

	public void setCuscFirstName(String cuscFirstName) {
		this.cuscFirstName = cuscFirstName;
	}

	public String getCuscLastName() {
		return cuscLastName;
	}

	public void setCuscLastName(String cuscLastName) {
		this.cuscLastName = cuscLastName;
	}

	public String getCuscAddress1() {
		return cuscAddress1;
	}

	public void setCuscAddress1(String cuscAddress1) {
		this.cuscAddress1 = cuscAddress1;
	}

	public String getCuscAddress2() {
		return cuscAddress2;
	}

	public void setCuscAddress2(String cuscAddress2) {
		this.cuscAddress2 = cuscAddress2;
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

	public String getCuscMobile() {
		return cuscMobile;
	}

	public void setCuscMobile(String cuscMobile) {
		this.cuscMobile = cuscMobile;
	}

	public String getCuscSameAddressFlag() {
		return cuscSameAddressFlag;
	}

	public void setCuscSameAddressFlag(String cuscSameAddressFlag) {
		this.cuscSameAddressFlag = cuscSameAddressFlag;
	}

	public String getCuscBillAddress1() {
		return cuscBillAddress1;
	}

	public void setCuscBillAddress1(String cuscBillAddress1) {
		this.cuscBillAddress1 = cuscBillAddress1;
	}

	public String getCuscBillAddress2() {
		return cuscBillAddress2;
	}

	public void setCuscBillAddress2(String cuscBillAddress2) {
		this.cuscBillAddress2 = cuscBillAddress2;
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

	public String getCuscEmail() {
		return cuscEmail;
	}

	public void setCuscEmail(String cuscEmail) {
		this.cuscEmail = cuscEmail;
	}

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUpdatedDateDisp() {
		return updatedDateDisp;
	}

	public void setUpdatedDateDisp(String updatedDateDisp) {
		this.updatedDateDisp = updatedDateDisp;
	}

	public String getCancelBy() {
		return cancelBy;
	}

	public void setCancelBy(String cancelBy) {
		this.cancelBy = cancelBy;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
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
