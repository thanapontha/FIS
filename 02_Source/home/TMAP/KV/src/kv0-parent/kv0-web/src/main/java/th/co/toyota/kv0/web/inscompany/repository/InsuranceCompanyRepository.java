package th.co.toyota.kv0.web.inscompany.repository;

import java.sql.Connection;
import java.util.List;

import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.web.vo.NewCarInfo;

public interface InsuranceCompanyRepository {
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws Exception;
	public Object[] generateSearchQuery(CommonBaseForm form) throws Exception;
	public List<NewCarInfo> searchObjectList(Connection conn, StringBuilder sql, List<Object> parameter, int firstResult, int rowsPerPage) throws Exception;
	public int getCountTransactionRelation(Connection conn, String vehiclePlant,List<String> listVehicleModel) throws Exception;
}
