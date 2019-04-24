package th.co.toyota.kv0.web.inscompany.repository;

import java.sql.Connection;

import th.co.toyota.kv0.common.form.CommonBaseForm;

public interface InsuranceCompanyRepository {
	public void loadComboboxs(Connection conn, CommonBaseForm activeform) throws Exception;
}
