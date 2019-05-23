package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.hibernate.internal.SessionImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.base.Strings;

import th.co.toyota.kv0.api.common.CommonUtility;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.common.repository.CommonWebRepository;
import th.co.toyota.kv0.util.ComboValue;
import th.co.toyota.kv0.util.FormatUtil;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceActivationForm;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;
import th.co.toyota.st3.api.constants.CST30000Messages;

@Repository
public class ActivateRedPlantRepositoryImpl implements ActivateRedPlantRepository {

	final Logger logger = LoggerFactory.getLogger(NewCarInsuranceRepository.class);
	private String sep = "\\" + AppConstants.CHECKBOX_SEPERATER;

	@NotNull
	@PersistenceContext(unitName = "entityManagerFactory")
	private EntityManager em;

	@Autowired
	private CommonWebRepository commonRepository;

	@Override
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws CommonErrorException {
		if (activeform instanceof NewCarInsuranceActivationForm) {
			NewCarInsuranceActivationForm form = (NewCarInsuranceActivationForm) activeform;
	
			StringBuilder criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_FIN_TYPE_PURCHASE).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setFinTypePurchaseList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_FIN_LEASING_COMPANY).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setFinLisingCompanyList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_INS_CLASS).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setInsClassList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_INS_TYPE).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setInsTypeList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_INS_PREMIUM_TYPE).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setInsPremiumTypeList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_LIST).append("'");
			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_GENDER).append("'");
			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");

			form.setGenderList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "CD", "VALUE" },
					criteria.toString(), "VALUE ASC"));
			
			criteria = new StringBuilder();
			form.setCuspProvinceList(commonRepository.loadCombobox(conn, "TB_M_PROVINCE", new String[] { "PROVINCE_CODE", "PROVINCE_NAME" },
					criteria.toString(), "UPPER(PROVINCE_NAME) ASC"));
			form.setCuspBillProvinceList(form.getCuspProvinceList());
			form.setCuscProvinceList(form.getCuspProvinceList());
			form.setCuscBillProvinceList(form.getCuspProvinceList());
		}
	}
	
	@Override
	public List<ComboValue> loadDistrict(Connection conn, String provinceCode)throws CommonErrorException {
		StringBuilder criteria = new StringBuilder();
		criteria.append("PROVINCE_CODE='").append(provinceCode).append("'");
		return commonRepository.loadCombobox(conn, "TB_M_AMPHUR", new String[] {"AMPHUR_CODE", "AMPHUR_NAME" }, criteria.toString(), "UPPER(AMPHUR_NAME) ASC");
	}
	
	@Override
	public List<ComboValue> loadSubDistrict(Connection conn, String provinceCode, String districtCode)throws CommonErrorException {
		StringBuilder criteria = new StringBuilder();
		criteria.append("PROVINCE_CODE='").append(provinceCode).append("'");
		criteria.append(" AND AMPHUR_CODE='").append(districtCode).append("'");
		return commonRepository.loadCombobox(conn, "TB_M_DISTRICT", new String[] {"DISTRICT_CODE", "DISTRICT_NAME" }, criteria.toString(), "UPPER(DISTRICT_NAME) ASC");
	}
	
	@Override
	public List<ComboValue> loadZipcode(Connection conn, String subDistrictCode)throws CommonErrorException {
		StringBuilder criteria = new StringBuilder();
		criteria.append("DISTRICT_CODE='").append(subDistrictCode).append("'");
		return commonRepository.loadCombobox(conn, "TB_M_ZIPCODES", new String[] {"ZIPCODE", "ZIPCODE" }, criteria.toString(), "UPPER(ZIPCODE) ASC");
	}

	@Override
	public boolean addObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws CommonErrorException {
		PreparedStatement ps = null;
		boolean completed = false;
		if (activeform instanceof NewCarInsuranceActivationForm) {
			NewCarInsuranceActivationForm form = (NewCarInsuranceActivationForm) activeform;
			try {
				Timestamp sysdate = FormatUtil.currentTimestampToOracleDB();
				
				conn.setAutoCommit(false);
				
				StringBuilder sql = new StringBuilder();
				sql.append(" INSERT INTO TB_R_CAR_INSURANCE ");
				sql.append(" ( ");
				sql.append("   DOCUMENT_NO                  , ");
				sql.append("   DOCUMENT_STATUS              , ");
				sql.append("   VEH_BRAND                    , ");
				sql.append("   VEH_VIN_NO                   , ");
				sql.append("   VEH_SERIES                   , ");
				sql.append("   VEH_MODEL                    , ");
				sql.append("   VEH_COLOR                    , ");
				sql.append("   VEH_YEAR                     , ");
				sql.append("   VEH_REG_NO                   , ");
				sql.append("   VEH_ENGINE                   , ");
				sql.append("   VEH_WEIGHT                   , ");
				sql.append("   VEH_CC                       , ");
				sql.append("   VEH_TYPE                     , ");
				sql.append("   FIN_TYPE_PURCHASE            , ");
				sql.append("   FIN_LEASING_COMPANY          , ");
				sql.append("   INS_CHOICE                   , ");    
				sql.append("   INS_COMPANY                  , ");    
				sql.append("   INS_CLASS                    , ");    
				sql.append("   INS_TYPE                     , ");    
				sql.append("   INS_PREMIUM_TYPE             , ");    
				sql.append("   INS_COVERAGE_YEAR            , ");    
				sql.append("   INS_PREMIUM                  , ");   
				sql.append("   INS_COVERAGE                 , ");     
				sql.append("   INS_ACT                      , ");     
				sql.append("   INS_ACTIVATION_DATE          , ");         
				sql.append("   INS_COVERAGE_DATE            , ");           
				sql.append("   INS_POLICY_NO                , ");    
				sql.append("   INS_TEMP_POLICY_NO           , ");    
				sql.append("   INS_REMARK                   , ");
				sql.append("   CUS_TYPE                     , ");     
				sql.append("   CUS_POLICY_DELIVERY          , ");    
				sql.append("   CUS_P_ID_CARD                , ");    
				sql.append("   CUS_P_MOBILE                 , ");    
				sql.append("   CUS_P_TITLE1                 , ");    
				sql.append("   CUS_P_TITLE2                 , ");    
				sql.append("   CUS_P_FIRST_NAME             , ");    
				sql.append("   CUS_P_LAST_NAME              , ");    
				sql.append("   CUS_P_GENDER                 , ");    
				sql.append("   CUS_P_BIRTH_DATE             , ");          
				sql.append("   CUS_P_ADDRESS1               , ");  
				sql.append("   CUS_P_ADDRESS2               , ");   
				sql.append("   CUS_P_PROVINCE               , ");    
				sql.append("   CUS_P_DISTRICT               , ");    
				sql.append("   CUS_P_SUB_DISTRICT           , ");    
				sql.append("   CUS_P_ZIPCODE                , ");     
				sql.append("   CUS_P_TELEPHONE              , ");    
				sql.append("   CUS_P_SAME_ADDRESS_FLAG      , ");   
				sql.append("   CUS_P_BILL_ADDRESS1          , ");   
				sql.append("   CUS_P_BILL_ADDRESS2          , "); 
				sql.append("   CUS_P_BILL_PROVINCE          , ");    
				sql.append("   CUS_P_BILL_DISTRICT          , ");    
				sql.append("   CUS_P_BILL_SUB_DISTRICT      , ");    
				sql.append("   CUS_P_BILL_ZIPCODE           , ");     
				sql.append("   CUS_P_BENEFICIARY            , ");    
				sql.append("   CUS_P_REF_TEL_NO             , ");    
				sql.append("   CUS_P_LINE_ID                , ");    
				sql.append("   CUS_P_EMAIL                  , ");    
				sql.append("   CUS_C_TAX_ID                 , ");    
				sql.append("   CUS_C_PHONE                  , ");    
				sql.append("   CUS_COMPANY_NAME             , ");    
				sql.append("   CUS_C_BRANCH_NO              , ");    
				sql.append("   CUS_C_REGISTER_DATE          , ");    
				sql.append("   CUS_C_FIRST_NAME             , ");    
				sql.append("   CUS_C_LAST_NAME              , ");    
				sql.append("   CUS_C_ADDRESS1               , ");
				sql.append("   CUS_C_ADDRESS2               , ");   
				sql.append("   CUS_C_PROVINCE               , ");    
				sql.append("   CUS_C_DISTRICT               , ");    
				sql.append("   CUS_C_SUB_DISTRICT           , ");    
				sql.append("   CUS_C_ZIPCODE                , "); 
				sql.append("   CUS_C_MOBILE                 , ");    
				sql.append("   CUS_C_SAME_ADDRESS_FLAG      , "); 
				sql.append("   CUS_C_BILL_ADDRESS1          , "); 
				sql.append("   CUS_C_BILL_ADDRESS2          , ");
				sql.append("   CUS_C_BILL_PROVINCE          , ");    
				sql.append("   CUS_C_BILL_DISTRICT          , ");    
				sql.append("   CUS_C_BILL_SUB_DISTRICT      , ");    
				sql.append("   CUS_C_BILL_ZIPCODE           , ");
				sql.append("   CUS_C_EMAIL                  , ");    
				sql.append("   CANCEL_REASON                , ");    
				sql.append("   CANCEL_BY                    , ");    
				sql.append("   CANCEL_DATE                  , ");  
				sql.append("   CREATE_BY                    , ");
				sql.append("   CREATE_DT                    , ");
				sql.append("   UPDATE_BY                    , ");
				sql.append("   UPDATE_DT                      ");    
				sql.append("   )                              ");    
				sql.append(" VALUES(  						  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,?,?,?,?,?, 			  ");
				sql.append(" ?,?,?,?,?,? 		 			  ");
				sql.append(" ) 								  ");
				ps = conn.prepareStatement(sql.toString());
				int index = 1;
				ps.setString(index++, "Doc01");
				ps.setString(index++, null);
				ps.setString(index++, form.getVehBrand());
				ps.setString(index++, form.getVehVinNo());
				ps.setString(index++, form.getVehSeries());
				ps.setString(index++, form.getVehModel());
				ps.setString(index++, form.getVehColor());
				ps.setString(index++, form.getVehYear());
				ps.setString(index++, form.getVehRegNo());
				ps.setString(index++, form.getVehEngine());
				ps.setString(index++, form.getVehWeight());
				ps.setString(index++, form.getVehCC());
				ps.setString(index++, form.getVehType());
				ps.setString(index++, form.getFinTypePurchase());
				ps.setString(index++, form.getFinLisingCompany());
				ps.setString(index++, form.getInsChoice());
				ps.setString(index++, form.getInsCompany());
				ps.setString(index++, form.getInsClass());
				ps.setString(index++, form.getInsType());
				ps.setString(index++, form.getInsPremiumType());
				ps.setString(index++, form.getInsCoverageYear());
				ps.setBigDecimal(index++, FormatUtil.convertStringToBigDecimal(form.getInsPremium()));
				ps.setBigDecimal(index++, FormatUtil.convertStringToBigDecimal(form.getInsCoverage()));
				ps.setBigDecimal(index++, FormatUtil.convertStringToBigDecimal(form.getInsAct()));
				ps.setDate(index++, FormatUtil.convertDateToOracleDB(form.getInsActivationDate()));
				ps.setDate(index++, FormatUtil.convertDateToOracleDB(form.getInsCoverageDate()));
				ps.setString(index++, form.getInsPolicyNo());
				ps.setString(index++, form.getInsTempPolicyNo());
				ps.setString(index++, form.getInsRemark());
				ps.setString(index++, form.getCusType());
				String policyDelivery = "";
				if("C".equalsIgnoreCase(form.getCusType())) {
					policyDelivery = form.getCuscPolicyDelivery();
					
					form.setCuspIdCardNo("");
					form.setCuspMobile("");
					form.setCuspTitle1("");
					form.setCuspTitle2("");
					form.setCuspFirstName("");
					form.setCuspLastName("");
					form.setCuspGender("");
					form.setCuspBirthDate("");
					form.setCuspAddress1("");
					form.setCuspAddress2("");
					form.setCuspProvince("");
					form.setCuspDistrict("");
					form.setCuspSubDistrict("");
					form.setCuspZipcode("");
					form.setCuspTelephone("");
					form.setCuspSameAddressFlag("");
					form.setCuspBillAddress1("");
					form.setCuspBillAddress2("");
					form.setCuspBillProvince("");
					form.setCuspBillDistrict("");
					form.setCuspBillSubDistrict("");
					form.setCuspBillZipcode("");
					form.setCuspBeneficiary("");
					form.setCuspRefTelNo("");
					form.setCuspLineID("");
					form.setCuspEmail("");
				}else {
					policyDelivery = form.getCuspPolicyDelivery();
					
					form.setCuscTaxID("");
					form.setCuscPhone("");
					form.setCuscCompanyName("");
					form.setCuscBranchNo("");
					form.setCuscRegisterDate("");
					form.setCuscFirstName("");
					form.setCuscLastName("");
					form.setCuscAddress1("");
					form.setCuscAddress2("");
					form.setCuscProvince("");
					form.setCuscDistrict("");
					form.setCuscSubDistrict("");
					form.setCuscZipcode("");
					form.setCuscMobile("");
					form.setCuscSameAddressFlag("");
					form.setCuscBillAddress1("");
					form.setCuscBillAddress2("");
					form.setCuscBillProvince("");
					form.setCuscBillDistrict("");
					form.setCuscBillSubDistrict("");
					form.setCuscBillZipcode("");
					form.setCuscEmail("");
				}
				ps.setString(index++, policyDelivery);
				ps.setString(index++, form.getCuspIdCardNo());
				ps.setString(index++, form.getCuspMobile());
				ps.setString(index++, form.getCuspTitle1());
				ps.setString(index++, form.getCuspTitle2());
				ps.setString(index++, form.getCuspFirstName());
				ps.setString(index++, form.getCuspLastName());
				ps.setString(index++, form.getCuspGender());
				ps.setDate(index++, FormatUtil.convertDateToOracleDB(form.getCuspBirthDate()));
				ps.setString(index++, form.getCuspAddress1());
				ps.setString(index++, form.getCuspAddress2());
				ps.setString(index++, form.getCuspProvince());
				ps.setString(index++, form.getCuspDistrict());
				ps.setString(index++, form.getCuspSubDistrict());
				ps.setString(index++, form.getCuspZipcode());
				ps.setString(index++, form.getCuspTelephone());
				ps.setString(index++, form.getCuspSameAddressFlag());
				ps.setString(index++, form.getCuspBillAddress1());
				ps.setString(index++, form.getCuspBillAddress2());
				ps.setString(index++, form.getCuspBillProvince());
				ps.setString(index++, form.getCuspBillDistrict());
				ps.setString(index++, form.getCuspBillSubDistrict());
				ps.setString(index++, form.getCuspBillZipcode());
				ps.setString(index++, form.getCuspBeneficiary());
				ps.setString(index++, form.getCuspRefTelNo());
				ps.setString(index++, form.getCuspLineID());
				ps.setString(index++, form.getCuspEmail());
				
				ps.setString(index++, form.getCuscTaxID());
				ps.setString(index++, form.getCuscPhone());
				ps.setString(index++, form.getCuscCompanyName());
				ps.setString(index++, form.getCuscBranchNo());
				ps.setDate(index++, FormatUtil.convertDateToOracleDB(form.getCuscRegisterDate()));
				ps.setString(index++, form.getCuscFirstName());
				ps.setString(index++, form.getCuscLastName());
				ps.setString(index++, form.getCuscAddress1());
				ps.setString(index++, form.getCuscAddress2());
				ps.setString(index++, form.getCuscProvince());
				ps.setString(index++, form.getCuscDistrict());
				ps.setString(index++, form.getCuscSubDistrict());
				ps.setString(index++, form.getCuscZipcode());
				ps.setString(index++, form.getCuscMobile());
				ps.setString(index++, form.getCuscSameAddressFlag());
				ps.setString(index++, form.getCuscBillAddress1());
				ps.setString(index++, form.getCuscBillAddress2());
				ps.setString(index++, form.getCuscBillProvince());
				ps.setString(index++, form.getCuscBillDistrict());
				ps.setString(index++, form.getCuscBillSubDistrict());
				ps.setString(index++, form.getCuscBillZipcode());
				ps.setString(index++, form.getCuscEmail());
				
				ps.setString(index++, form.getCancelReason());
				ps.setString(index++, form.getCancelBy());
				ps.setDate(index++, FormatUtil.convertDateToOracleDB(form.getCancelDate()));
				
				ps.setString(index++, userInfo.getUserId());
				ps.setTimestamp(index++, sysdate);
				ps.setString(index++, userInfo.getUserId());
				ps.setTimestamp(index++, sysdate);
				
				ps.executeUpdate();
				completed = true;
			} catch (Exception e) {
				throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
			} finally {
				try {
					if ((conn != null) && !conn.isClosed()) {
						if (ps != null) {
							ps.close();
							ps = null;
						}
						if (completed) {
							conn.commit();
						} else {
							conn.rollback();
						}
					}
				} catch (Exception e1) {
					logger.error(ExceptionUtils.getStackTrace(e1));
				}
			}
		}
		return completed;
	}

	@Override
	public boolean editObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws CommonErrorException {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		if (activeform instanceof NewCarInsuranceActivationForm) {
			try {
				NewCarInsuranceActivationForm form = (NewCarInsuranceActivationForm) activeform;
				String[] updateKeySet = form.getUpdateKeySet().split(sep);
				if ((updateKeySet != null) && (updateKeySet.length == 4)) {
					String updatedate = updateKeySet[0];
					String vehiclePlant = updateKeySet[1];
					String vehicleModel = updateKeySet[2];
					 String tcFromDisp = updateKeySet[3];

					 StringBuilder sql = new StringBuilder();
					sql.append(" UPDATE  TB_M_VEHICLE_PLANT ");
					sql.append("SET TC_TO = LAST_DAY(?)");
					sql.append(", UPDATE_BY = ?");
					sql.append(", UPDATE_DT = ?");
					sql.append(" WHERE ");
					sql.append("  VEHICLE_PLANT = ? ");
					sql.append("  AND VEHICLE_MODEL = ? ");
					sql.append("  AND TC_FROM = ? ");
					sql.append("  AND UPDATE_DT = ? ");

					Timestamp sysdate = FormatUtil.currentTimestampToOracleDB();
//					java.sql.Date tcTo = FormatUtil.convertDateToOracleDB(form.getTcTo());
					
					if(conn==null){
						SessionImpl session = (SessionImpl)(em.getDelegate());
						conn = session.getJdbcConnectionAccess().obtainConnection();
					}else{
						closeConnection = false;
					}
					conn.setAutoCommit(false);
					
					ps = conn.prepareStatement(sql.toString());
//					ps.setDate(1, tcTo);
					ps.setString(2, userInfo.getUserId());
					ps.setTimestamp(3, sysdate);
					ps.setString(4, vehiclePlant);
					ps.setString(5, vehicleModel);
					ps.setDate(6, FormatUtil.convertDateToOracleDB(tcFromDisp));
					ps.setTimestamp(7, FormatUtil.convertTimestampToOracleDB(updatedate));
					int count = ps.executeUpdate();
					if (count == 0) {
						throw new CommonErrorException(CST30000Messages.ERROR_UPDATE_CONCURRENCY_CHECK, new String[] {"Error in updated, because of concurrency check",""}, AppConstants.ERROR);
					}
					completed = true;
				} else {
					logger.debug("ERROR: Don't have key for check update data");
					throw new CommonErrorException(CST30000Messages.ERROR_UNDEFINED_ERROR,
							new String[] { "ERROR: Don't have key for check update data" }, AppConstants.ERROR);
				}
			}catch(SQLIntegrityConstraintViolationException e){
				logger.error(ExceptionUtils.getStackTrace(e));
				throw new CommonErrorException(CST30000Messages.ERR_ENTITY_EXISTS, new String[] { "Data already exists" },
						AppConstants.ERROR);
			} catch (Exception e) {
				throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
			} finally {
				try {
					if ((conn != null) && !conn.isClosed()) {
						if (ps != null) {
							ps.close();
							ps = null;
						}
						if (completed) {
							conn.commit();
						} else {
							conn.rollback();
						}
						if(closeConnection){
							conn.close();
							conn = null;
						}
					}
				} catch (Exception e1) {
					logger.error(ExceptionUtils.getStackTrace(e1));
				}
			}
		}
		return completed;
	}

	@Override
	public void deleteObject(Connection conn, List<Object[]> dataList, CommonBaseForm activeform) throws CommonErrorException {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		try {
			if (activeform instanceof NewCarInsuranceActivationForm) {				
				if(conn==null){
					SessionImpl session = (SessionImpl)(em.getDelegate());
					conn = session.getJdbcConnectionAccess().obtainConnection();
				}else{
					closeConnection = false;
				}
				conn.setAutoCommit(false);
				
				if(dataList!=null && !dataList.isEmpty()){
					StringBuilder sql = new StringBuilder();
					sql.append(" DELETE  TB_M_VEHICLE_PLANT ");
					sql.append(" WHERE ");
					sql.append("  VEHICLE_PLANT = ? ");
					sql.append("  AND VEHICLE_MODEL = ? ");
					sql.append("  AND UPDATE_DT = ? ");
					sql.append("  AND TC_FROM = ? ");
					
					for(int i=0;i<dataList.size();i++){
						Object[] objArr = dataList.get(i);
						ps = conn.prepareStatement(sql.toString());
						ps.setString(1, (String)objArr[0]);
						ps.setString(2, (String)objArr[1]);
						ps.setTimestamp(3, FormatUtil.convertTimestampToOracleDB((String)objArr[2]));
						ps.setDate(4, FormatUtil.convertDateToOracleDB((String)objArr[3]));
						int count = ps.executeUpdate();
						ps.close();
						ps = null;
						if (count == 0) {
							throw new CommonErrorException(CST30000Messages.ERROR_DELETE_CONCURRENCY_CHECK, new String[] {"Error in Delete because of concurrency check",""}, AppConstants.ERROR);
						}
					}
				}
				dataList = null;
				completed = true;
			}
		} catch (Exception e) {
			completed = false;
			throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
		} finally {
			try {
				if ((conn != null) && !conn.isClosed()) {
					if (ps != null) {
						ps.close();
						ps = null;
					}
					if (completed) {
						conn.commit();
					} else {
						conn.rollback();
					}
					if(closeConnection){
						conn.close();
						conn = null;
					}
				}
			} catch (Exception e1) {
				logger.error(ExceptionUtils.getStackTrace(e1));
			}
		}
	}
	
	@Override
	public void searchObject(Connection conn, CommonBaseForm activeform) throws CommonErrorException {
		if (activeform instanceof NewCarInsuranceActivationForm) {
			NewCarInsuranceActivationForm form = (NewCarInsuranceActivationForm)activeform;
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT C.DOCUMENT_NO,                         ");
			sql.append("        (CASE                                  ");
			sql.append("          WHEN C.DOCUMENT_NO IS NULL THEN      ");
			sql.append("           'New'                               ");
			sql.append("          ELSE                                 ");
			sql.append("           C.DOCUMENT_STATUS                   ");
			sql.append("        END) AS DOCUMENT_STATUS,               ");
			sql.append("        V.VEH_BRAND,                           ");
			sql.append("        V.VEH_VIN_NO,                          ");
			sql.append("        V.VEH_SERIES,                          ");
			sql.append("        V.VEH_MODEL,                           ");
			sql.append("        V.VEH_COLOR,                           ");
			sql.append("        V.VEH_YEAR,                            ");
			sql.append("        V.VEH_REG_NO,                          ");
			sql.append("        V.VEH_ENGINE,                          ");
			sql.append("        V.VEH_WEIGHT,                          ");
			sql.append("        V.VEH_CC,                              ");
			sql.append("        V.VEH_TYPE,                            ");
			sql.append("        C.FIN_TYPE_PURCHASE,                   ");
			sql.append("        C.FIN_LEASING_COMPANY,                 ");
			sql.append("        C.INS_CHOICE,                          ");
			sql.append("        C.INS_COMPANY,                         ");
			sql.append("        C.INS_CLASS,                           ");
			sql.append("        C.INS_TYPE,                            ");
			sql.append("        C.INS_PREMIUM_TYPE,                    ");
			sql.append("        C.INS_COVERAGE_YEAR,                   ");
			sql.append("        C.INS_PREMIUM,                         ");
			sql.append("        C.INS_COVERAGE,                        ");
			sql.append("        C.INS_ACT,                             ");
			sql.append("        TO_CHAR(C.INS_ACTIVATION_DATE,'DD/MM/YYYY') AS INS_ACTIVATION_DATE,                 ");
			sql.append("        TO_CHAR(C.INS_COVERAGE_DATE,'DD/MM/YYYY') AS INS_COVERAGE_DATE,                 ");
			sql.append("        C.INS_POLICY_NO,                       ");
			sql.append("        C.INS_TEMP_POLICY_NO,                  ");
			sql.append("        C.INS_REMARK,                          ");
			sql.append("        C.CUS_TYPE,                            ");
			sql.append("        C.CUS_POLICY_DELIVERY,                 ");
			sql.append("        C.CUS_P_ID_CARD,                       ");
			sql.append("        C.CUS_P_MOBILE,                        ");
			sql.append("        C.CUS_P_TITLE1,                        ");
			sql.append("        C.CUS_P_TITLE2,                        ");
			sql.append("        C.CUS_P_FIRST_NAME,                    ");
			sql.append("        C.CUS_P_LAST_NAME,                     ");
			sql.append("        C.CUS_P_GENDER,                        ");
			sql.append("        TO_CHAR(C.CUS_P_BIRTH_DATE,'DD/MM/YYYY') AS CUS_P_BIRTH_DATE,                 ");
			sql.append("        C.CUS_P_ADDRESS1,                      ");
			sql.append("        C.CUS_P_ADDRESS2,                      ");
			sql.append("        C.CUS_P_PROVINCE,                      ");
			sql.append("        C.CUS_P_DISTRICT,                      ");
			sql.append("        C.CUS_P_SUB_DISTRICT,                  ");
			sql.append("        C.CUS_P_ZIPCODE,                       ");
			sql.append("        C.CUS_P_TELEPHONE,                     ");
			sql.append("        C.CUS_P_SAME_ADDRESS_FLAG,             ");
			sql.append("        C.CUS_P_BILL_ADDRESS1,                 ");
			sql.append("        C.CUS_P_BILL_ADDRESS2,                 ");
			sql.append("        C.CUS_P_BILL_PROVINCE,                 ");
			sql.append("        C.CUS_P_BILL_DISTRICT,                 ");
			sql.append("        C.CUS_P_BILL_SUB_DISTRICT,             ");
			sql.append("        C.CUS_P_BILL_ZIPCODE,                  ");
			sql.append("        C.CUS_P_BENEFICIARY,                   ");
			sql.append("        C.CUS_P_REF_TEL_NO,                    ");
			sql.append("        C.CUS_P_LINE_ID,                       ");
			sql.append("        C.CUS_P_EMAIL,                         ");
			sql.append("        C.CUS_C_TAX_ID,                        ");
			sql.append("        C.CUS_C_PHONE,                         ");
			sql.append("        C.CUS_COMPANY_NAME,                    ");
			sql.append("        C.CUS_C_BRANCH_NO,                     ");
			sql.append("        TO_CHAR(C.CUS_C_REGISTER_DATE,'DD/MM/YYYY') AS CUS_C_REGISTER_DATE,                 ");
			sql.append("        C.CUS_C_FIRST_NAME,                    ");
			sql.append("        C.CUS_C_LAST_NAME,                     ");
			sql.append("        C.CUS_C_ADDRESS1,                      ");
			sql.append("        C.CUS_C_ADDRESS2,                      ");
			sql.append("        C.CUS_C_PROVINCE,                      ");
			sql.append("        C.CUS_C_DISTRICT,                      ");
			sql.append("        C.CUS_C_SUB_DISTRICT,                  ");
			sql.append("        C.CUS_C_ZIPCODE,                       ");
			sql.append("        C.CUS_C_MOBILE,                        ");
			sql.append("        C.CUS_C_SAME_ADDRESS_FLAG,             ");
			sql.append("        C.CUS_C_BILL_ADDRESS1,                 ");
			sql.append("        C.CUS_C_BILL_ADDRESS2,                 ");
			sql.append("        C.CUS_C_BILL_PROVINCE,                 ");
			sql.append("        C.CUS_C_BILL_DISTRICT,                 ");
			sql.append("        C.CUS_C_BILL_SUB_DISTRICT,             ");
			sql.append("        C.CUS_C_BILL_ZIPCODE,                  ");
			sql.append("        C.CUS_C_EMAIL,                         ");
			sql.append("        C.CANCEL_REASON,                       ");
			sql.append("        C.CANCEL_BY,                           ");
			sql.append("        TO_CHAR(C.CANCEL_DATE,'DD/MM/YYYY hh24:mi:ss') AS CANCEL_DATE,                 ");
			sql.append("        C.CREATE_BY,                           ");
			sql.append("        TO_CHAR(C.CREATE_DT,'DD/MM/YYYY hh24:mi:ss') AS CREATE_DT,                 ");
			sql.append("        C.UPDATE_BY,                           ");
			sql.append("        C.UPDATE_DT,                            ");
			sql.append("        TO_CHAR(C.UPDATE_DT,'DD/MM/YYYY hh24:mi:ss') AS UPDATE_DT_DISP               ");
			sql.append("   FROM TB_M_VEHICLE V                         ");
			sql.append("   LEFT JOIN TB_R_CAR_INSURANCE C              ");
			sql.append("     ON C.VEH_BRAND = V.VEH_BRAND              ");
			sql.append("    AND C.VEH_VIN_NO = V.VEH_VIN_NO            ");
			sql.append("   WHERE V.VEH_BRAND = ?                       ");
			sql.append("   AND   V.VEH_VIN_NO = ?                      ");
			ResultSet rs = null;
			try (PreparedStatement ps = conn.prepareStatement(sql.toString());){
				int index = 1;
				ps.setString(index++, form.getVehBrand().toUpperCase());
				ps.setString(index++, form.getVehVinNo());
				rs = ps.executeQuery();
				while(rs.next()) {
					form.setDocumentNo(Strings.nullToEmpty(rs.getString("DOCUMENT_NO")));
					form.setDocumentStatus(Strings.nullToEmpty(rs.getString("DOCUMENT_STATUS")));
					form.setVehBrand(Strings.nullToEmpty(rs.getString("VEH_BRAND")));
					form.setVehVinNo(Strings.nullToEmpty(rs.getString("VEH_VIN_NO")));
					form.setVehSeries(Strings.nullToEmpty(rs.getString("VEH_SERIES")));
					form.setVehModel(Strings.nullToEmpty(rs.getString("VEH_MODEL")));
					form.setVehColor(Strings.nullToEmpty(rs.getString("VEH_COLOR")));
					form.setVehYear(Strings.nullToEmpty(rs.getString("VEH_YEAR")));
					form.setVehRegNo(Strings.nullToEmpty(rs.getString("VEH_REG_NO")));
					form.setVehEngine(Strings.nullToEmpty(rs.getString("VEH_ENGINE")));
					form.setVehWeight(Strings.nullToEmpty(rs.getString("VEH_WEIGHT")));
					form.setVehCC(Strings.nullToEmpty(rs.getString("VEH_CC")));
					form.setVehType(Strings.nullToEmpty(rs.getString("VEH_TYPE")));
					
					form.setFinTypePurchase(Strings.nullToEmpty(rs.getString("FIN_TYPE_PURCHASE")));
					form.setFinLisingCompany(Strings.nullToEmpty(rs.getString("FIN_LEASING_COMPANY")));
					
					
					form.setInsChoice(Strings.nullToEmpty(rs.getString("INS_CHOICE")));
					form.setInsCompany(Strings.nullToEmpty(rs.getString("INS_COMPANY")));
					form.setInsClass(Strings.nullToEmpty(rs.getString("INS_CLASS")));
					form.setInsType(Strings.nullToEmpty(rs.getString("INS_TYPE")));
					form.setInsPremiumType(Strings.nullToEmpty(rs.getString("INS_PREMIUM_TYPE")));
					form.setInsCoverageYear(Strings.nullToEmpty(rs.getString("INS_COVERAGE_YEAR")));
					form.setInsPremium(FormatUtil.convertBigDecimalToString(rs.getBigDecimal("INS_PREMIUM"), 0, true));
					form.setInsCoverage(FormatUtil.convertBigDecimalToString(rs.getBigDecimal("INS_COVERAGE"), 0, true));
					form.setInsAct(FormatUtil.convertBigDecimalToString(rs.getBigDecimal("INS_ACT"), 2, true));
					form.setInsActivationDate(Strings.nullToEmpty(rs.getString("INS_ACTIVATION_DATE")));
					form.setInsCoverageDate(Strings.nullToEmpty(rs.getString("INS_COVERAGE_DATE")));
					form.setInsPolicyNo(Strings.nullToEmpty(rs.getString("INS_POLICY_NO")));
					form.setInsTempPolicyNo(Strings.nullToEmpty(rs.getString("INS_TEMP_POLICY_NO")));
					form.setInsRemark(Strings.nullToEmpty(rs.getString("INS_REMARK")));
					
					form.setCusType(Strings.nullToEmpty(rs.getString("CUS_TYPE")));
					if("C".equalsIgnoreCase(form.getCusType())) {
						form.setCuscPolicyDelivery(Strings.nullToEmpty(rs.getString("CUS_POLICY_DELIVERY")));
					}else {
						form.setCuspPolicyDelivery(Strings.nullToEmpty(rs.getString("CUS_POLICY_DELIVERY")));
					}
					form.setCuspIdCardNo(Strings.nullToEmpty(rs.getString("CUS_P_ID_CARD")));
					form.setCuspMobile(Strings.nullToEmpty(rs.getString("CUS_P_MOBILE")));
					form.setCuspTitle1(Strings.nullToEmpty(rs.getString("CUS_P_TITLE1")));
					form.setCuspTitle2(Strings.nullToEmpty(rs.getString("CUS_P_TITLE2")));
					form.setCuspFirstName(Strings.nullToEmpty(rs.getString("CUS_P_FIRST_NAME")));
					form.setCuspLastName(Strings.nullToEmpty(rs.getString("CUS_P_LAST_NAME")));
					form.setCuspGender(Strings.nullToEmpty(rs.getString("CUS_P_GENDER")));
					form.setCuspBirthDate(Strings.nullToEmpty(rs.getString("CUS_P_BIRTH_DATE")));
					form.setCuspAddress1(Strings.nullToEmpty(rs.getString("CUS_P_ADDRESS1")));
					form.setCuspAddress2(Strings.nullToEmpty(rs.getString("CUS_P_ADDRESS2")));
					form.setCuspProvince(Strings.nullToEmpty(rs.getString("CUS_P_PROVINCE")));
					form.setCuspDistrict(Strings.nullToEmpty(rs.getString("CUS_P_DISTRICT")));
					form.setCuspSubDistrict(Strings.nullToEmpty(rs.getString("CUS_P_SUB_DISTRICT")));
					form.setCuspZipcode(Strings.nullToEmpty(rs.getString("CUS_P_ZIPCODE")));
					form.setCuspTelephone(Strings.nullToEmpty(rs.getString("CUS_P_TELEPHONE")));
					form.setCuspSameAddressFlag(Strings.nullToEmpty(rs.getString("CUS_P_SAME_ADDRESS_FLAG")));
					form.setCuspBillAddress1(Strings.nullToEmpty(rs.getString("CUS_P_BILL_ADDRESS1")));
					form.setCuspBillAddress2(Strings.nullToEmpty(rs.getString("CUS_P_BILL_ADDRESS2")));
					form.setCuspBillProvince(Strings.nullToEmpty(rs.getString("CUS_P_BILL_PROVINCE")));
					form.setCuspBillDistrict(Strings.nullToEmpty(rs.getString("CUS_P_BILL_DISTRICT")));
					form.setCuspBillSubDistrict(Strings.nullToEmpty(rs.getString("CUS_P_BILL_SUB_DISTRICT")));
					form.setCuspBillZipcode(Strings.nullToEmpty(rs.getString("CUS_P_BILL_ZIPCODE")));
					form.setCuspBeneficiary(Strings.nullToEmpty(rs.getString("CUS_P_BENEFICIARY")));
					form.setCuspRefTelNo(Strings.nullToEmpty(rs.getString("CUS_P_REF_TEL_NO")));
					form.setCuspLineID(Strings.nullToEmpty(rs.getString("CUS_P_LINE_ID")));
					form.setCuspEmail(Strings.nullToEmpty(rs.getString("CUS_P_EMAIL")));
					
					form.setCuscTaxID(Strings.nullToEmpty(rs.getString("CUS_C_TAX_ID")));
					form.setCuscPhone(Strings.nullToEmpty(rs.getString("CUS_C_PHONE")));
					form.setCuscCompanyName(Strings.nullToEmpty(rs.getString("CUS_COMPANY_NAME")));
					form.setCuscBranchNo(Strings.nullToEmpty(rs.getString("CUS_C_BRANCH_NO")));
					form.setCuscRegisterDate(Strings.nullToEmpty(rs.getString("CUS_C_REGISTER_DATE")));
					form.setCuscFirstName(Strings.nullToEmpty(rs.getString("CUS_C_FIRST_NAME")));
					form.setCuscLastName(Strings.nullToEmpty(rs.getString("CUS_C_LAST_NAME")));
					form.setCuscAddress1(Strings.nullToEmpty(rs.getString("CUS_C_ADDRESS1")));
					form.setCuscAddress2(Strings.nullToEmpty(rs.getString("CUS_C_ADDRESS2")));
					form.setCuscProvince(Strings.nullToEmpty(rs.getString("CUS_C_PROVINCE")));
					form.setCuscDistrict(Strings.nullToEmpty(rs.getString("CUS_C_DISTRICT")));
					form.setCuscSubDistrict(Strings.nullToEmpty(rs.getString("CUS_C_SUB_DISTRICT")));
					form.setCuscZipcode(Strings.nullToEmpty(rs.getString("CUS_C_ZIPCODE")));
					form.setCuscMobile(Strings.nullToEmpty(rs.getString("CUS_C_MOBILE")));
					form.setCuscSameAddressFlag(Strings.nullToEmpty(rs.getString("CUS_C_SAME_ADDRESS_FLAG")));
					form.setCuscBillAddress1(Strings.nullToEmpty(rs.getString("CUS_C_BILL_ADDRESS1")));
					form.setCuscBillAddress2(Strings.nullToEmpty(rs.getString("CUS_C_BILL_ADDRESS2")));
					form.setCuscBillProvince(Strings.nullToEmpty(rs.getString("CUS_C_BILL_PROVINCE")));
					form.setCuscBillDistrict(Strings.nullToEmpty(rs.getString("CUS_C_BILL_DISTRICT")));
					form.setCuscBillSubDistrict(Strings.nullToEmpty(rs.getString("CUS_C_BILL_SUB_DISTRICT")));
					form.setCuscBillZipcode(Strings.nullToEmpty(rs.getString("CUS_C_BILL_ZIPCODE")));
					form.setCuscEmail(Strings.nullToEmpty(rs.getString("CUS_C_EMAIL")));
					
					form.setCancelReason(Strings.nullToEmpty(rs.getString("CANCEL_REASON")));
					form.setCancelBy(Strings.nullToEmpty(rs.getString("CANCEL_BY")));
					form.setCancelDate(Strings.nullToEmpty(rs.getString("CANCEL_DATE")));
					
					form.setCreatedBy(Strings.nullToEmpty(rs.getString("CREATE_BY")));
					form.setCreatedDate(Strings.nullToEmpty(rs.getString("CREATE_DT")));
					form.setUpdatedBy(Strings.nullToEmpty(rs.getString("UPDATE_BY")));
					form.setUpdatedDate(rs.getTimestamp("UPDATE_DT")!=null?rs.getTimestamp("UPDATE_DT").getTime()+"":"");
					form.setUpdatedDateDisp(Strings.nullToEmpty(rs.getString("UPDATE_DT_DISP")));
					
				}
			} catch (Exception e) {
				throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
			}finally{
				try {
					if(rs!=null) {
						rs.close();
					}
				} catch (Exception e1) {
					logger.error(ExceptionUtils.getStackTrace(e1));
				}
			}
		}
	}
}
