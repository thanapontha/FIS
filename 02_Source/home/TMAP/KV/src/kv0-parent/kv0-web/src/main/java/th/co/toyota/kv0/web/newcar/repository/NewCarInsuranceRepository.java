package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.util.List;

import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceForm;
import th.co.toyota.kv0.web.vo.NewCarInfo;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;

public interface NewCarInsuranceRepository {
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws Exception;
	public boolean addObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws Exception;
	public boolean editObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws Exception;
	void deleteObject(Connection conn, List<Object[]> dataList, CommonBaseForm activeform) throws Exception;
	public Object[] generateSearchQuery(NewCarInsuranceForm form) throws Exception;
	public List<NewCarInfo> searchObjectList(Connection conn, StringBuilder sql, List<Object> parameter, int firstResult, int rowsPerPage) throws Exception;
	public int getCountTransactionRelation(Connection conn, String vehiclePlant,List<String> listVehicleModel) throws Exception;
	public String genSQLExistVehiclePlantUnitRelationForVehiclePlantMaster(String tcTo, String vehiclePlant, String vehicleModel);	
}
