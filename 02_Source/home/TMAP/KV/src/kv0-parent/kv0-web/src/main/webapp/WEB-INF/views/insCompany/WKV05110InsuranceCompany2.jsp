<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="views" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<views:script src="json2.js"/>
<views:script src="jquery.caret.1.02.min.js"/>
<views:script src="jquery-ui-1.9.1/jquery.dataTables.js"/>
<views:style src="jquery.dataTables.css"/>


<views:style src="tim/WKV05110.css"/>
<script>
	mappingPath = '${_mappingPath}';
	firstResult = '${form.firstResult}';
	rowsPerPage = '${form.rowsPerPage}';
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="tim/WKV05110.js?t=${currentTimestamp}"/>
	
	<div id="screen-panel" class="container-fluid">
	
		<div id="search-criteria">
			<form:form method="post" 
				   id="search-form" 
				   action="${_mappingPath}/search" 
				   ajax="searchFinish" 
				   ajax-loading-target="#screen-panel" 
				   validate-error="searchValidateError">
			<input name="firstResult" type="hidden" value="0" default="0" />
			<input name="rowsPerPage" type="hidden" value="10" default="10" />
			<input name="messageResult" id="messageResult"  type="hidden" />
			
<!-- 			 <div class="row"> 
			 	<div class="py-2 mx-auto text-center">
			   		<h3 class="display-5">Insurance Company Data Import & Export</h3>
			 	</div>
			</div> -->
		 	<div class="row"> 
		       	<div class="py-1 col-xl-8 col-lg-10 col-md-12 col-sm-12 col-12 row-body-center">
					<div class="card card-top-15">
				      	<div class="tabs">
							<ul class="tab-links">
								<li class="active"><a href="#tab-template">Template</a></li>
								<li><a href="#tab-import">Import</a></li>
								<li><a href="#tab-export">Export</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-template" class="tab active">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-input">
										<label class="control-label" for="importType"><span class="star-red">*</span>Excel Template Type &nbsp;:</label>
									      <select class="form-control form-control-sm" id="importType">
					                           <option>1st year INS Sales Premium (Normal/TLT Exclusive and etc.)</option>
					                           <option>Import Transfer Premium</option>
					                           <option>No Claim Bonus Premium(NCB)</option>
					                           <option>Status of issued INS Policy</option>
					                       	</select>
					                 </div>  
									 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-button"> 
				                       	 <sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110DownloadTemplate"
												type="button" value="Download"
												styleClass="button" secured="false" onClick="clearSearch();"
											/>
									</div> 
								</div>
								<div id="tab-import" class="tab">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-input">
										<label class="control-label" for="importType"><span class="star-red">*</span>Excel Template Type &nbsp;:</label>
									      <select class="form-control form-control-sm" id="importType">
					                           <option>1st year INS Sales Premium (Normal/TLT Exclusive and etc.)</option>
					                           <option>Import Transfer Premium</option>
					                           <option>No Claim Bonus Premium(NCB)</option>
					                           <option>Status of issued INS Policy</option>
					                       	</select>
					                 </div>  
					                 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-input"> 
					                       <label class="control-label" for="importFile"><span class="star-red">*</span>Excel File Upload &nbsp;:</label>
									      <sc2:button functionId="KV0511" screenId="WKV05110"
												buttonId="WKV05110Browse" type="file" value="${WKV05110Browse}"
												styleClass="button MandatoryField"
												onClick="" /> 
									</div> 
									 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-button"> 
					                       <sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110UploadTemplate"
												type="button" value="Upload"
												styleClass="button" secured="false" onClick="clearSearch();"
											/>
									</div> 
								</div>
								<div id="tab-export" class="tab">	
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-input"> 
					                      <label class="control-label" for="importType"><span class="star-red">*</span>Excel Template Type &nbsp;:</label>
									      <select class="form-control form-control-sm" id="exportType">
						                           <option>1st year INS Sales Daily</option>
						                           <option>Renewal Insurance Sales Daily</option>
						                       </select>
									</div> 
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 form-group-button"> 
					                      <sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110Export"
												type="button" value="Export"
												styleClass="button" secured="false" onClick="clearSearch();"
												/>
									</div> 
								</div>
							</div>
						</div>
				  	</div>
				</div>
			</div>
		</div><%--<div id="search-criteria">--%>
		</form:form>
	</div>
</div>