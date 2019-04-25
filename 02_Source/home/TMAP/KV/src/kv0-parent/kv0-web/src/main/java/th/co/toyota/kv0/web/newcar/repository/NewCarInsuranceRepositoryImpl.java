package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import th.co.toyota.kv0.util.FormatUtil;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceForm;
import th.co.toyota.kv0.web.vo.NewCarInfo;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;
import th.co.toyota.st3.api.constants.CST30000Messages;

@Repository
public class NewCarInsuranceRepositoryImpl implements NewCarInsuranceRepository {

	final Logger logger = LoggerFactory.getLogger(NewCarInsuranceRepository.class);
	private String sep = "\\" + AppConstants.CHECKBOX_SEPERATER;

	@NotNull
	@PersistenceContext(unitName = "entityManagerFactory")
	private EntityManager em;

	@Autowired
	private CommonWebRepository commonRepository;

	@Override
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws Exception {
//		if (activeform instanceof NewCarInsuranceForm) {
//			NewCarInsuranceForm form = (NewCarInsuranceForm) activeform;
//			form.setVehiclePlantList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_C_VEHICLE_PLANT, new String[] { "VEHICLE_PLANT",
//			"VEHICLE_PLANT" }, null, "UPPER(VEHICLE_PLANT) ASC"));
//
//			StringBuilder criteria = new StringBuilder();
//			criteria.append("CATEGORY='").append(AppConstants.SYS_CATEGORY_MASTER).append("'");
//			criteria.append(" AND SUB_CATEGORY ='").append(AppConstants.SYS_SUB_CATEGORY_VEHICLE_MODEL).append("'");
//			criteria.append(" AND STATUS='").append(AppConstants.YES_STR).append("'");
//
//			form.setVehicleModelList(commonRepository.loadCombobox(conn, AppConstants.TABLE_TB_M_SYSTEM, new String[] { "VALUE", "VALUE" },
//					criteria.toString(), "VALUE ASC"));
//		}
	}

	@Override
	public boolean addObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws Exception {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		if (activeform instanceof NewCarInsuranceForm) {
			NewCarInsuranceForm form = (NewCarInsuranceForm) activeform;
			try {
				Timestamp sysdate = FormatUtil.currentTimestampToOracleDB();
				
				java.sql.Date tcFrom = FormatUtil.convertDateToOracleDB(form.getTcFrom());	
				java.sql.Date tcTo = FormatUtil.convertDateToOracleDB(form.getTcTo());				

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
				ps.setDate(1, tcFrom);
				ps.setTimestamp(2, sysdate);
				ps.setString(3, userInfo.getUserId());
				ps.setString(4, form.getVehiclePlant());
				ps.setString(5, form.getVehicleModel());
				
				ps.setDate(6, tcFrom);
				ps.setString(7, form.getVehiclePlant());
				ps.setString(8, form.getVehicleModel());
				
				ps.executeUpdate();
				ps.close();
				ps = null;
				
				
				StringBuilder sql = new StringBuilder();
				sql.append(" INSERT INTO TB_M_VEHICLE_PLANT ");
				sql.append(" ( VEHICLE_PLANT, VEHICLE_MODEL, TC_FROM, TC_TO, CREATE_BY, CREATE_DT, UPDATE_BY, UPDATE_DT )");
				sql.append(" VALUES(?,?,?,LAST_DAY(?),?,?,?,?)");
				ps = conn.prepareStatement(sql.toString());
				ps.setString(1, form.getVehiclePlant());
				ps.setString(2, form.getVehicleModel());
				ps.setDate(3, tcFrom);
				ps.setDate(4, tcTo);
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
	public boolean editObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws Exception {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		if (activeform instanceof NewCarInsuranceForm) {
			try {
				NewCarInsuranceForm form = (NewCarInsuranceForm) activeform;
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
					java.sql.Date tcTo = FormatUtil.convertDateToOracleDB(form.getTcTo());
					
					if(conn==null){
						SessionImpl session = (SessionImpl)(em.getDelegate());
						conn = session.getJdbcConnectionAccess().obtainConnection();
					}else{
						closeConnection = false;
					}
					conn.setAutoCommit(false);
					
					ps = conn.prepareStatement(sql.toString());
					ps.setDate(1, tcTo);
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
	public void deleteObject(Connection conn, List<Object[]> dataList, CommonBaseForm activeform) throws Exception {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		boolean completed = false;
		try {
			if (activeform instanceof NewCarInsuranceForm) {				
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
	public Object[] generateSearchQuery(NewCarInsuranceForm activeform) throws  Exception {
		StringBuilder SQL = new StringBuilder();
		SQL.append(" SELECT 	");
		SQL.append(" 	VEHICLE_PLANT,  ");
		SQL.append(" 	VEHICLE_MODEL, ");
		SQL.append(" 	TC_FROM, ");
		SQL.append(" 	TC_TO, ");
		SQL.append(" 	CREATE_BY, ");
		SQL.append(" 	CREATE_DT, ");
		SQL.append(" 	UPDATE_BY, ");
		SQL.append(" 	UPDATE_DT, ");
		SQL.append(" 	ROW_NUMBER() OVER(order by VEHICLE_MODEL, TC_FROM DESC) AS ROW_NUM ");
		SQL.append(" FROM TB_M_VEHICLE_PLANT ");
		SQL.append(" WHERE VEHICLE_PLANT = ? ");
		
		if(activeform.getIncludeExpiredData() == null){
			SQL.append(" AND NVL(TC_TO, TO_DATE('"+AppConstants.DEFULAT_DATE+"','DD/MM/YYYY')) >= TRUNC(SYSDATE)");
		}

		NewCarInsuranceForm form = activeform;
		List<Object> parameter = new ArrayList<Object>();
		parameter.add(form.getVehiclePlantSearch());
		return new Object[] { SQL, parameter };
	}
	
	@Override
	public List<NewCarInfo> searchObjectList(Connection conn, StringBuilder sql, List<Object> parameter, int firstResult, int rowsPerPage)
			throws Exception {
		List<NewCarInfo> listResult = new ArrayList<NewCarInfo>();
		NewCarInfo newCarInfo = null;
		boolean closeConnection = true;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			if(conn==null){
				SessionImpl session = (SessionImpl)(em.getDelegate());
				conn = session.getJdbcConnectionAccess().obtainConnection();
			}else{
				closeConnection = false;
			}
			
			/*int sumRowNum = firstResult + rowsPerPage;
			StringBuilder sqlPaging = new StringBuilder();
			sqlPaging.append(" SELECT * FROM ( ");
			sqlPaging.append(sql.toString());
			sqlPaging.append(" ) T ");
			sqlPaging.append(" WHERE T.ROW_NUM >= (" + (firstResult == 0 ? 0 : 1) + " + " + firstResult + ") ");
			sqlPaging.append("   AND T.ROW_NUM <= (" + sumRowNum + ") ");

			ps = conn.prepareStatement(sqlPaging.toString());
			int index = 1;
			for (Object objParam : parameter) {
				ps.setString(index++, (String) objParam);
			}
			rs = ps.executeQuery();
			while (rs.next()) {*/
			for(int i=0;i<10;i++){
				newCarInfo = new NewCarInfo();

				if(i==0) {
					newCarInfo.setDocumentStatus("Waiting Activate");
					newCarInfo.setModel("HI");
					newCarInfo.setVinNo("MR053REH100010123");
					newCarInfo.setCustomerName("Somchai Manadee");
					newCarInfo.setInsType("T. Care");
					newCarInfo.setPremiumType("TMT Campaign");
					newCarInfo.setInsCompany("AOIO");
					newCarInfo.setInsClass("1st class");
					newCarInfo.setInsPremium("20,000");
					newCarInfo.setActivationDate("01/12/2018");
					newCarInfo.setDealerCode("dealerCode"+i);
					newCarInfo.setDdmsStatus("Dealer arrival");
				}else {
					newCarInfo.setDocumentStatus("Completed");
					newCarInfo.setModel("HI");
					newCarInfo.setVinNo("vinNo"+i);
					newCarInfo.setCustomerName("customerName"+i);
					newCarInfo.setInsType("None T. Care");
					newCarInfo.setPremiumType("TMT Campaign");
					newCarInfo.setInsCompany("Viriya");
					newCarInfo.setInsClass("2nd class");
					newCarInfo.setInsPremium("15,000");
					newCarInfo.setActivationDate("12/12/2017");
					newCarInfo.setDealerCode("dealerCode"+i);
					newCarInfo.setDdmsStatus("Delivery");
				}
				
				listResult.add(newCarInfo);
			}
		} catch (Exception e) {
			throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
		} finally {
			try {
				if ((conn != null) && !conn.isClosed()) {
					if (rs != null) {
						rs.close();
						rs = null;
					}
					
					if (ps != null) {
						ps.close();
						ps = null;
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

		return listResult;
	}

	@Override
	public int getCountTransactionRelation(Connection conn, String vehiclePlant,List<String> listVehicleModel) throws Exception {
		boolean closeConnection = true;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int numberOfRows = 0;
		try {
			if(conn==null){
				SessionImpl session = (SessionImpl)(em.getDelegate());
				conn = session.getJdbcConnectionAccess().obtainConnection();
			}else{
				closeConnection = false;
			}
			
			StringBuilder sqlCount = new StringBuilder();
			sqlCount.append(" SELECT COUNT(ROWNUM) FROM TB_M_VEHICLE_UNIT_RELATION ");
			
			sqlCount.append(" WHERE VEHICLE_PLANT = ? ");
			sqlCount.append(" AND VEHICLE_MODEL IN ( ");
			for(int i = 0 ; i < listVehicleModel.size() ; i++){
				sqlCount.append(" ?,");
			}
			String strSql = sqlCount.toString().substring(0, sqlCount.length()-1);
			strSql = strSql += ")";
			
			ps = conn.prepareStatement(strSql);
			ps.setString(1, vehiclePlant);
			
			int row = 2;
			for(String obb : listVehicleModel){
				ps.setString(row, obb);
				row++;
			}
			rs = ps.executeQuery();
		    if (rs.next()) {
		        numberOfRows = rs.getInt(1);
		    }
		} catch (Exception e) {
			throw CommonUtility.handleExceptionToCommonErrorException(e, logger, false);
		} finally {
			try {
				if ((conn != null) && !conn.isClosed()) {
					if (rs != null) {
						rs.close();
						rs = null;
					}
					
					if (ps != null) {
						ps.close();
						ps = null;
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
		return numberOfRows;
	}
	
	@Override
	public String genSQLExistVehiclePlantUnitRelationForVehiclePlantMaster(String tcTo, String vehiclePlant, String vehicleModel) {
		StringBuilder sql = new StringBuilder();
		    sql.append("SELECT (CASE ");
		    sql.append("                 WHEN MAX_TC_TO IS NOT NULL AND INPUT_TO < MAX_TC_TO THEN ");
		    sql.append("                  'NG' ");
		    sql.append("                 ELSE ");
		    sql.append("                  'OK' ");
		    sql.append("               END) AS VALID ");
		    sql.append("          FROM (SELECT DISTINCT NVL(LAST_DAY(TO_DATE('"+tcTo+"', 'Mon-YY')), ");
		    sql.append("                                    TO_DATE('"+AppConstants.DEFULAT_DATE+"', 'DD/MM/YYYY')) AS INPUT_TO, ");
		    sql.append("                                (SELECT MAX(NVL(TC_TO, TO_DATE('"+AppConstants.DEFULAT_DATE+"', 'DD/MM/YYYY'))) ");
		    sql.append("                                   FROM TB_M_VEHICLE_UNIT_RELATION ");
		    sql.append("                                  WHERE VEHICLE_PLANT = '"+vehiclePlant+"' ");
		    sql.append("                                    AND VEHICLE_MODEL = '"+vehicleModel+"' ");
		    sql.append("                                  GROUP BY VEHICLE_PLANT, VEHICLE_MODEL) AS MAX_TC_TO ");
		    sql.append("                  FROM TB_M_VEHICLE_UNIT_RELATION T ");
		    sql.append("                 WHERE VEHICLE_PLANT = '"+vehiclePlant+"' ");
		    sql.append("                   AND VEHICLE_MODEL = '"+vehicleModel+"') ");
		return sql.toString();
	}
}
