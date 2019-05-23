package th.co.toyota.kv0.web.newcar.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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
import th.co.toyota.kv0.util.ComboValue;
import th.co.toyota.kv0.web.newcar.form.NewCarInsuranceActivationForm;
import th.co.toyota.kv0.web.newcar.repository.ActivateRedPlantRepository;
import th.co.toyota.sc2.client.model.simple.CSC22110UserInfo;

@Service
public class ActivateRedPlantService {

	final Logger logger = LoggerFactory.getLogger(ActivateRedPlantService.class);
	private String sep = "\\" + AppConstants.CHECKBOX_SEPERATER;

	@Autowired
	private ActivateRedPlantRepository repository;
	
	@Autowired
	private CommonWebRepository commonRepository;

	public void loadCombobox(CSC22110UserInfo userInfo, NewCarInsuranceActivationForm form) throws Exception {
		try(Connection conn = commonRepository.getConnection()){
			repository.loadComboboxs(conn, form);
		}
	}
	
	public List<ComboValue> loadDistrict(String provinceCode) throws Exception{
		try(Connection conn = commonRepository.getConnection()){
			return repository.loadDistrict(conn, provinceCode);
		}	
	}
	
	public List<ComboValue> loadSubDistrict(String provinceCode, String districtCode) throws Exception{
		try(Connection conn = commonRepository.getConnection()){
			return repository.loadSubDistrict(conn, provinceCode, districtCode);
		}	
	}
	
	public List<ComboValue> loadZipcode(String subDistrictCode) throws Exception{
		try(Connection conn = commonRepository.getConnection()){
			return repository.loadZipcode(conn, subDistrictCode);
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
//			int count = repository.getCountTransactionRelation(conn, vehiclePlant, lstVehicleModel);
//			if(count == 0){
				repository.deleteObject(conn, dataList, form);
//			}else{
//				throw new CommonErrorException(CST30000Messages.ERROR_CANNOT_DELETE, new String[] { "this vehicle model"," there using on Vehicle-Unit Relation Master." }, AppConstants.ERROR);
//			}
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

	public List<String> submitAddObject(MessageSource messageSource, Locale locale, Payload payload, NewCarInsuranceActivationForm form, CSC22110UserInfo userInfo)
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

	public List<String> submitEditObject(MessageSource messageSource, Locale locle, Payload payload, NewCarInsuranceActivationForm form, CSC22110UserInfo userInfo)
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
	
	public void searchObject(CSC22110UserInfo userInfo, NewCarInsuranceActivationForm form) throws Exception {
		try(Connection conn = commonRepository.getConnection()){
			repository.searchObject(conn, form);
		}
	}
	
}
