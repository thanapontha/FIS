package th.co.toyota.kv0.web.inscompany.repository;

import java.sql.Connection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.validation.constraints.NotNull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.common.repository.CommonWebRepository;

@Repository
public class InsuranceCompanyRepositoryImpl implements InsuranceCompanyRepository {

	final Logger logger = LoggerFactory.getLogger(InsuranceCompanyRepository.class);
	
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
}
