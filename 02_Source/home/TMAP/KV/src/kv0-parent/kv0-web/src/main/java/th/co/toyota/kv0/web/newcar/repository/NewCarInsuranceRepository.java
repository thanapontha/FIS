package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.util.List;

import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.web.vo.NewCarInfo;

public interface NewCarInsuranceRepository {
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws CommonErrorException;
	public Object[] generateSearchQuery(CommonBaseForm form) throws CommonErrorException;
	public List<NewCarInfo> searchObjectList(Connection conn, StringBuilder sql, List<Object> parameter, int firstResult, int rowsPerPage) throws CommonErrorException;
	public int getCountTransactionRelation(Connection conn, String vehiclePlant,List<String> listVehicleModel) throws CommonErrorException;
}
