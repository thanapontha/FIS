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


<views:style src="tim/WKV03110.css"/>
<script>
	mappingPath = '${_mappingPath}';
	firstResult = '${form.firstResult}';
	rowsPerPage = '${form.rowsPerPage}';
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="tim/WKV03110.js?t=${currentTimestamp}"/>
	
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
			
			<div class="row"> 
			 	<div class="pt-2 col-12">
		              <!-- <h3>Screening Criteria</h3> -->
		               
		               <!-- form complex example -->
		               <div class="form-row mt-1">
		               	    <div class="pb-1 pr-3 col-md-3">
		                       <label for="vinNo" class="mx-1 my-0">Vin No.&nbsp;:</label>
		                       <input type="text" class="form-control form-control-sm" id="vinNo" name="vinNo">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="series" class="mx-1 my-0">Series&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="series">
		                           <option>All</option>
		                           <option>Vios</option>
		                           <option>Yaris</option>
		                           <option>Camry</option>
		                       </select>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="model" class="mx-1 my-0">Model&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="model">
		                           <option>All</option>
		                           <option>2019</option>
		                           <option>2011</option>
		                       </select>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="ddmsStatus" class="mx-1 my-0">DDMS Status&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="ddmsStatus">
		                           <option>All</option>
		                           <option>Unassign (Buy Off)</option>
		                           <option>Final Assign</option>
		                           <option>Dealer Arrival</option>
		                           <option>Matched</option>
		                           <option>Delivery</option>
		                           <option>Revise Retail Sales</option>
		                       </select>
		                   </div>
		                                      
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="typeOfPurchase" class="mx-1 my-0">Type of purchase&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="typeOfPurchase">
		                           <option>All</option>
		                           <option>Cash</option>
		                           <option>Finance</option>
		                           <option>Fleet</option>
		                       </select>
		                   </div>
		                   
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="personalId" class="mx-1 my-0">Personal ID&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="personalId">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="firstName" class="mx-1 my-0">First Name&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="firstName">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="lastName" class="mx-1 my-0">Last Name&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="lastName">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-4">
		                       <label for="companyName" class="mx-1 my-0">Company Name&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="companyName">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="documentStatus" class="mx-1 my-0">Document Status&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="documentStatus">
		                           <option>All</option>
		                           <option>New</option>
		                           <option>Waiting Activate</option>
		                           <option>Need Info</option>
		                           <option>Request Cancel</option>
		                           <option>Completed</option>
		                           <option>Cancel</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceCompany" class="mx-1 my-0">Insurance Company&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceCompany">
		                           <option>All</option>
		                           <option>AIOI</option>
		                           <option>Viriya</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceType" class="mx-1 my-0">Insurance Type&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceType">
		                           <option>All</option>
		                           <option>T. Care</option>
		                           <option>None T. Care</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="premiumType" class="mx-1 my-0">Premium Type&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="premiumType">
		                           <option>All</option>
		                           <option>TMT Campaign</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceClass" class="mx-1 my-0">Insurance Class&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceClass">
		                           <option>All</option>
		                           <option>1st class</option>
		                           <option>2nd class</option>
		                           <option>3rd class</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="createDateFrom" class="mx-1 my-0">Create From Date&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="createDateFrom" maxlength="10">
        						</div>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="createDateTo" class="mx-1 my-0">Create To Date&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="createDateTo" maxlength="10">
        						</div>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="activationDateFrom" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Activation From Date&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm MandatoryField" id="activationDateFrom" maxlength="10">
        						</div>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="activationDateTo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Activation To Date&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm MandatoryField" id="activationDateTo" maxlength="10">
        						</div>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-4">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-12" style="text-align: right;">
								<div class="d-flex align-items-end justify-content-end" style="height:100%">
			                       <sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Search"
										type="button" value="Search"
										styleClass="button mr-1" secured="false" onClick="clickSearch();" />
									<sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Clear"
										type="button" value="Clear"
										styleClass="button mr-1" secured="false" onClick="clearSearch();" />
									<sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Export"
										type="button" value="Export"
										styleClass="button" secured="false" onClick="" />
								</div>
							</div>
		               </div>
				</div>
			</div>
			</form:form>
		</div>
		
		<div id="data-head-panel" class="row" style="border: none; padding-top: 0.5rem;">	
			<div class="pb-5 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div id="search-result" class="overflow-hidden">
					<div id="dataList" class="" style="width:100%;" >
						<form id="result-list-form" 
								action="dataList" 
								method="post"  
								ajax="updateObjectFinish" 
								ajax-loading-target="#screen-panel" 
					   			validate-error="saveValidateError">
						    
							<datatables:table id="result" 
							    					data="${dataList}" 
							    					cdn="false" 
							    					row="row" 
							    					cssClass="result fixedheader fixedcolumn" 
							    					paginate="true" 
							    					cssStyle="height:300px;width:120%;"
													info="true" 
													filter="false"
													displayLength="${form.rowsPerPage}" 
													paginationType="full_numbers" 
													fixedPosition="col"
													lengthChange="false"
													sort="false"
													serverData="serverData"
													serverSide="true"
													>
											  
								<datatables:column title="No." cssClass="col1 rownum" sortable="false" searchable="false" cssStyle="text-align:center;" />
				        		<datatables:column title="Document Status" cssClass="col2" cssStyle="text-align:center;" sortable="false" searchable="false"/>
								<datatables:column title="Model" cssClass="col3 fixed" sortable="false" searchable="false" cssStyle="text-align:center;" />
								<datatables:column title="VIN" cssClass="col4" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Customer Name" cssClass="col5" sortable="false" cssStyle="text-align:center;" />
								<datatables:column title="INS Type" cssClass="col6" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Premium Type" cssClass="col7" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Company" cssClass="col8" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Class" cssClass="col9" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Premium" cssClass="col10" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Activation Date" cssClass="col11" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="DDMS Status" cssClass="col12" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								
							</datatables:table>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>