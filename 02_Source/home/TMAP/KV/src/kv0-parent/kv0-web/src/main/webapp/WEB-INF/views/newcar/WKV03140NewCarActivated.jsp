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
	window.doClose = function doClose() {
		window.parent.FISLib.dialog.close();
	};
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<form>
	<div id="screen-panel" class="container-fluid">
		<div class="row"> 
            <div class="col-12">
                <label>IN1900001</label>
            </div>
        </div>
       <div class="row"> 
            <div class="pr-3 col-12" style="text-align: right;">
            	<div class="d-flex align-items-end justify-content-end" style="height:100%">
		   			<sc2:button functionId="KV0314"  screenId="WKV03140" buttonId="WKV03140OK"
						type="button" value="OK" styleClass="button" secured="false" onClick="doClose();"/>
				</div>
            </div>
		</div>
	</div>
</form>