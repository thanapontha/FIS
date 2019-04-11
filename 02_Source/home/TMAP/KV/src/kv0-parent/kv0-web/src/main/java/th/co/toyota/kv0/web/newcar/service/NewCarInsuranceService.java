package th.co.toyota.kv0.web.newcar.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.api.constants.AppConstants;
import th.co.toyota.kv0.api.exception.common.CommonErrorException;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.common.repository.CommonWebRepository;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceForm;
import th.co.toyota.kv0.web.newcar.repository.NewCarInsuranceRepository;
import th.co.toyota.kv0.web.vo.NewCarInfo;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;
import th.co.toyota.st3.api.constants.CST30000Messages;

@Service
public class NewCarInsuranceService {

	final Logger logger = LoggerFactory.getLogger(NewCarInsuranceService.class);
	private String sep = "\\" + AppConstants.CHECKBOX_SEPERATER;

	@Autowired
	private NewCarInsuranceRepository repository;
	
	@Autowired
	private CommonWebRepository commonRepository;

	public void loadCombobox(CSC22110UserInfo userInfo, NewCarInsuranceForm form) throws Exception {
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
	
	public void deleteObject(String[] object, CommonBaseForm form) throws CommonErrorException, Exception {
		List<String> lstVehicleModel = new ArrayList<String>();
		String vehiclePlant = "";
		
		List<Object[]> dataList = new ArrayList<Object[]>();
		for (String obj : object) {
			String[] updateKeySet = obj.split(sep);
			Object[] arrayObj = new Object[4];
			if ((updateKeySet != null) && (updateKeySet.length >= 4)) {
				String updatedate = updateKeySet[0];
				vehiclePlant = updateKeySet[1];
				String vehicleModel = updateKeySet[2];
				String tcFrom = updateKeySet[3];
				arrayObj[0] = vehiclePlant;
				arrayObj[1] = vehicleModel;
				arrayObj[2] = updatedate;
				arrayObj[3] = tcFrom;
				dataList.add(arrayObj);
				
				lstVehicleModel.add(vehicleModel);
			}
		}
		Connection conn = null;
		try{
			conn = commonRepository.getConnection();
			int count = repository.getCountTransactionRelation(conn, vehiclePlant, lstVehicleModel);
			if(count == 0){
				repository.deleteObject(conn, dataList, form);
			}else{
				throw new CommonErrorException(CST30000Messages.ERROR_CANNOT_DELETE, new String[] { "this vehicle model"," there using on Vehicle-Unit Relation Master." }, AppConstants.ERROR);
			}
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

	public List<String> submitAddObject(MessageSource messageSource, Locale locale, Payload payload, NewCarInsuranceForm form, CSC22110UserInfo userInfo)
			throws CommonErrorException, Exception {
		Connection conn = null;
		try{
			conn = commonRepository.getConnection();
			
			List<String> errorList = new ArrayList<String>();
			
			if (errorList.isEmpty()) {
				repository.addObject(conn, form, userInfo);
			}
			return errorList;
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

	public List<String> submitEditObject(MessageSource messageSource, Locale locle, Payload payload, NewCarInsuranceForm form, CSC22110UserInfo userInfo)
			throws CommonErrorException, Exception {
		Connection conn = null;
		try{
			conn = commonRepository.getConnection();
			List<String> errorList = new ArrayList<String>();
			
			if (errorList.isEmpty()) {
				 repository.editObject(conn, form, userInfo);
			}
			return errorList;
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
	public boolean searchAllData(NewCarInsuranceForm form, Payload payload, HttpServletRequest request) throws Exception {
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
