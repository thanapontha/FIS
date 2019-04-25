<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="views" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<script>
	mappingPath = '${_mappingPath}';
	window.doCancel = function doCancel() {
		window.parent.FISLib.dialog.close();
	};
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<form>
	<div id="screen-panel" class="container-fluid">
		<div class="row"> 
            <div class="col-12">
                <li style="list-style-type: square;"><label>ลูกค้า คุณ Supachai Chimpalee</label></li>
            </div>
        </div>
        <div class="row"> 
            <div class="col-12">
                <li style="list-style-type: square;"><label>รถ TOYOTA C-HR Hi ปี 2019</label></li>
            </div>
       </div>
       <div class="row"> 
            <div class="col-12">
                <li style="list-style-type: square;"><label>ทำประกันแบบ TMT campaign ชั้น 1 T-Care</label></li>
            </div>
       </div>
       <div class="row"> 
            <div class="col-12">
                <li style="list-style-type: square;"><label>วันที่ต้องการ Activate 20/4/2019</label></li>
            </div>
       </div>
       <div class="row"> 
            <div class="pr-3 col-12" style="text-align: right;">
            	<div class="d-flex align-items-end justify-content-end" style="height:100%">
                	<sc2:button functionId="KV0313"  screenId="WKV03130" buttonId="WKV03130Submit"
						type="button" value="Submit" styleClass="button mr-1" secured="false" onClick=""/>
		   			<sc2:button functionId="KV0313"  screenId="WKV03130" buttonId="WKV03130Cancel"
						type="button" value="Cancel" styleClass="button" secured="false" onClick="doCancel();"/>
				</div>
            </div>
		</div>
	</div>
</form>