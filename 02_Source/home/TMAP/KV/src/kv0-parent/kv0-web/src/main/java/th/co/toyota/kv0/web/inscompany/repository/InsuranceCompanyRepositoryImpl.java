package th.co.toyota.kv0.web.inscompany.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.common.repository.CommonWebRepository;
import th.co.toyota.kv0.web.vo.NewCarInfo;

@Repository
public class InsuranceCompanyRepositoryImpl implements InsuranceCompanyRepository {

	final Logger logger = LoggerFactory.getLogger(InsuranceCompanyRepository.class);
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
	public Object[] generateSearchQuery(CommonBaseForm activeform) throws  Exception {
//		if (activeform instanceof InsuranceCompanyForm) {
//			
//		}
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
		
		List<Object> parameter = new ArrayList<Object>();
//		parameter.add(form.getVehiclePlantSearch());
		return new Object[] { SQL, parameter};
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
				newCarInfo.setDdmsStatus("ddmsStatus"+i);
				newCarInfo.setInsStatus("insStatus"+i);
				newCarInfo.setModel("model"+i);
				newCarInfo.setVinNo("VinNo"+i);
				newCarInfo.setTypeOfPurchase("typeOfPurchase"+i);
				newCarInfo.setFnCompany("fnCompany"+i);
				newCarInfo.setInsCode("insCode"+i);
				newCarInfo.setInsCompany("insCompany"+i);
				newCarInfo.setInsType("insType"+i);
				newCarInfo.setInsPremium("insPremium"+i);
				newCarInfo.setInsActivationDate("12/12/2017");
				newCarInfo.setCustomerName("customerName"+i);
				newCarInfo.setDealerCode("dealerCode"+i);
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
}
