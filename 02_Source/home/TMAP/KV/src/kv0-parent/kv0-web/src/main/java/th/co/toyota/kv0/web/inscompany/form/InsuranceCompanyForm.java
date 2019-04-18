package th.co.toyota.kv0.web.inscompany.form;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.web.multipart.MultipartFile;

import th.co.toyota.application.model.Payload;
import th.co.toyota.kv0.common.form.CommonBaseForm;
import th.co.toyota.kv0.util.ComboValue;

public class InsuranceCompanyForm extends CommonBaseForm {

	private MultipartFile WKV05110Browse;	

	private List<ComboValue> importTypeList;
	private List<ComboValue> exportTypeList;
	
	private String messageResult;
	

	public MultipartFile getWKV05110Browse() {
		return WKV05110Browse;
	}


	public void setWKV05110Browse(MultipartFile wKV05110Browse) {
		WKV05110Browse = wKV05110Browse;
	}


	public List<ComboValue> getImportTypeList() {
		return importTypeList;
	}


	public void setImportTypeList(List<ComboValue> importTypeList) {
		this.importTypeList = importTypeList;
	}


	public List<ComboValue> getExportTypeList() {
		return exportTypeList;
	}


	public void setExportTypeList(List<ComboValue> exportTypeList) {
		this.exportTypeList = exportTypeList;
	}


	public String getMessageResult() {
		return messageResult;
	}


	public void setMessageResult(String messageResult) {
		this.messageResult = messageResult;
	}


	public List<String> validate(MessageSource messagesource, Locale locale, String action, Payload payload) throws Exception {
		List<String> errors = new ArrayList<String>();
		return errors;
	}
}
