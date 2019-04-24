package th.co.toyota.kv0.web.inscompany.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.toyota.kv0.common.repository.CommonWebRepository;
import th.co.toyota.kv0.web.inscompany.form.InsuranceCompanyForm;
import th.co.toyota.kv0.web.inscompany.repository.InsuranceCompanyRepository;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;

@Service
public class InsuranceCompanyService {

	final Logger logger = LoggerFactory.getLogger(InsuranceCompanyService.class);

	@Autowired
	private InsuranceCompanyRepository repository;
	
	@Autowired
	private CommonWebRepository commonRepository;

	public void loadCombobox(CSC22110UserInfo userInfo, InsuranceCompanyForm form) throws Exception {
		Connection conn = null;
		try{
			conn = commonRepository.getConnection();
			repository.loadComboboxs(conn, form);
		}finally{
			try {
				if(conn!=null && !conn.isClosed()){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
