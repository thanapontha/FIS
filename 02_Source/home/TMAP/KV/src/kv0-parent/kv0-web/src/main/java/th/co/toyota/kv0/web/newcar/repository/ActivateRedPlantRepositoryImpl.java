package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		if (activeform instanceof NewCarInsuranceActivationForm) {
//			NewCarInsuranceActivationForm form = (NewCarInsuranceActivationForm) activeform;
			try {
				Timestamp sysdate = FormatUtil.currentTimestampToOracleDB();
				
//				java.sql.Date tcFrom = FormatUtil.convertDateToOracleDB(form.getTcFrom());	
//				java.sql.Date tcTo = FormatUtil.convertDateToOracleDB(form.getTcTo());				

				if(conn==null){
					SessionImpl session = (SessionImpl)(em.getDelegate());
					conn = session.getJdbcConnectionAccess().obtainConnection();
				}else{
					closeConnection = false;
				}
				conn.setAutoCommit(false);
				//Close time control
				StringBuilder sqlCount = new StringBuilder();
				
				sqlCount.append(" UPDATE TB_M_VEHICLE_PLANT T ");
				sqlCount.append(" SET T.TC_TO = LAST_DAY(ADD_MONTHS(TRUNC(?,'MM'),-1)), UPDATE_DT = ? , UPDATE_BY = ?  ");
				sqlCount.append(" WHERE T.VEHICLE_PLANT = ?  ");
				sqlCount.append(" AND T.VEHICLE_MODEL = ?  ");
				sqlCount.append(" AND T.TC_FROM = (SELECT TC_FROM FROM TB_M_VEHICLE_PLANT ");
				sqlCount.append("     WHERE TC_TO IS NULL  ");
				sqlCount.append("     AND TC_FROM < ? ");
				sqlCount.append("     AND VEHICLE_PLANT = ?  ");
				sqlCount.append("     AND VEHICLE_MODEL = ?  ");
				sqlCount.append("     ) ");
				sqlCount.append(" AND T.TC_TO IS NULL ");
				
				ps = conn.prepareStatement(sqlCount.toString());
//				ps.setDate(1, tcFrom);
				ps.setTimestamp(2, sysdate);
				ps.setString(3, userInfo.getUserId());
//				ps.setString(4, form.getVehiclePlant());
//				ps.setString(5, form.getVehicleModel());
				
//				ps.setDate(6, tcFrom);
//				ps.setString(7, form.getVehiclePlant());
//				ps.setString(8, form.getVehicleModel());
//				
				ps.executeUpdate();
				ps.close();
				ps = null;
				
				
				StringBuilder sql = new StringBuilder();
				sql.append(" INSERT INTO TB_M_VEHICLE_PLANT ");
				sql.append(" ( VEHICLE_PLANT, VEHICLE_MODEL, TC_FROM, TC_TO, CREATE_BY, CREATE_DT, UPDATE_BY, UPDATE_DT )");
				sql.append(" VALUES(?,?,?,LAST_DAY(?),?,?,?,?)");
				ps = conn.prepareStatement(sql.toString());
//				ps.setString(1, form.getVehiclePlant());
//				ps.setString(2, form.getVehicleModel());
//				ps.setDate(3, tcFrom);
//				ps.setDate(4, tcTo);
				ps.setString(5, userInfo.getUserId());
				ps.setTimestamp(6, sysdate);
				ps.setString(7, userInfo.getUserId());
				ps.setTimestamp(8, sysdate);
				
				ps.executeUpdate();
				completed = true;
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
}
