/******************************************************
 * Program History
 * 
 * Project Name	            :  FIS : Finance & Insurance System
 * Client Name				:  TDEM
 * Package Name             :  th.co.toyota.kv0.web.report.main
 * Program ID 	            :  CommonDownloadReportRepository.java
 * Program Description	    :  <put description>
 * Environment	 	        :  Java 7
 * Author					:  Thanawut T.
 * Version					:  1.0
 * Creation Date            :  August 28, 2017
 *
 * Modification History	    :
 * Version	   Date		   Person Name		Chng Req No		Remarks
 *
 * Copyright(C) 2017-Toyota Daihatsu Engineering & Manufacturing Co., Ltd. All Rights Reserved.    
 ********************************************************/
package th.co.toyota.kv0.batch.report.repository;

import java.sql.Connection;
import java.util.List;

public interface CommonDownloadReportRepository {
	public List<Object[]> searchObject(Connection conn, String getsudoMonth, String timing,
			String plantCondition) throws Exception;
}
