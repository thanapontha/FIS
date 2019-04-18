package th.co.toyota.kv0.web.inscompany.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.common.repository.CommonWebRepository;
import th.co.toyota.kv0.web.inscompany.form.InsuranceCompanyForm;
import th.co.toyota.kv0.web.inscompany.repository.InsuranceCompanyRepository;
import th.co.toyota.kv0.web.vo.NewCarInfo;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;

@Service
public class InsuranceCompanyService {

	final Logger logger = LoggerFactory.getLogger(InsuranceCompanyService.class);
	private String sep = "\\" + AppConstants.CHECKBOX_SEPERATER;

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
	
	
	@SuppressWarnings("unchecked")
	public boolean searchAllData(InsuranceCompanyForm form, Payload payload, HttpServletRequest request) throws Exception {
		boolean foundData = false;
		Connection conn = null;
		try{
			conn = commonRepository.getConnection();
			Object[] query = repository.generateSearchQuery(form);
			StringBuilder sql = (StringBuilder) query[0];
			List<Object> parameter = (List<Object>) query[1];
			int totalRows = 10;//commonRepository.getTotalActiveRecordSize(conn, sql, parameter);
			int firstResult = form.getFirstResult();
			int rowsPerPage = form.getRowsPerPage();
			int first = firstResult - (firstResult % rowsPerPage);
			if (first >= totalRows) {
				first = totalRows - rowsPerPage;
				if (first < 0) {
					first = 0;
				}
			}
			firstResult = first;
			if (totalRows > 0) {				
				List<NewCarInfo> ls = repository.searchObjectList(conn, sql, parameter, firstResult, rowsPerPage);
				payload.setObjectForm(form);
				if ((ls != null) && (!ls.isEmpty())) {
					payload.setObjectsInfoList(ls);
					foundData = true;
				} else {
					payload.setObjectsInfoList(null);
				}
			}
			payload.setFirstResult(firstResult);
			payload.setRowsPerPage(rowsPerPage);
			payload.setTotalRows(totalRows);
		}finally{
			try {
				if(conn!=null && !conn.isClosed()){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return foundData;
	}

}
