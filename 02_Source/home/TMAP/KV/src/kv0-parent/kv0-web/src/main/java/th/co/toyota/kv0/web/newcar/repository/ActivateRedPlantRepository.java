package th.co.toyota.kv0.web.newcar.repository;

import java.sql.Connection;
import java.util.List;

import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;

public interface ActivateRedPlantRepository {
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws CommonErrorException;
	public boolean addObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws CommonErrorException;
	public boolean editObject(Connection conn, CommonBaseForm activeform, CSC22110UserInfo userInfo) throws CommonErrorException;
	void deleteObject(Connection conn, List<Object[]> dataList, CommonBaseForm activeform) throws CommonErrorException;
	void searchObject(Connection conn, CommonBaseForm activeform) throws CommonErrorException;
	public List<ComboValue> loadDistrict(Connection conn, String proviceCode) throws CommonErrorException;
	public List<ComboValue> loadSubDistrict(Connection conn, String proviceCode, String districtCode) throws CommonErrorException;
	public List<ComboValue> loadZipcode(Connection conn, String subDistrictCode) throws CommonErrorException;
}
