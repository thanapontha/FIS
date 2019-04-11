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
		               <h3>Screening Criteria</h3>
		               
		               <!-- form complex example -->
		               <div class="form-row mt-1">
		               	    <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="vinNo" class="mx-1 my-0">Vin&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="vinNo">
		                   </div>
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="typeOfPurchase" class="mx-1 my-0">Type of purchase&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="typeOfPurchase">
		                           <option>All</option>
		                           <option>Cash</option>
		                           <option>Finance</option>
		                           <option>Fleet</option>
		                       </select>
		                   </div>
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="ddmsPeriodOfTime" class="mx-1 my-0">DDMS Period of time&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="ddmsPeriodOfTime" maxlength="10">
        						</div>
		                   </div>
		                   
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="exampleAccount" class="mx-1 my-0">DDMS Status&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="exampleSt">
		                           <option>All</option>
		                           <option>Buy off</option>
		                           <option>Dealer arrival</option>
		                           <option>Confirm Booking</option>
		                           <option>Retail sale</option>
		                       </select>
		                   </div>
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="insuranceCompany" class="mx-1 my-0">Insurance Company&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceCompany">
		                           <option>All</option>
		                           <option>AIOI</option>
		                           <option>Viriya</option>
		                       </select>
		                   </div>
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="insActivationPeriod" class="mx-1 my-0">INS Activation Period&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="insActivationPeriod" maxlength="10">
        						</div>
		                   </div>
		                   
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="insStatus" class="mx-1 my-0">INS Status&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insStatus">
		                           <option>All</option>
		                           <option>Temporary number</option>
		                           <option>Issued Insurance policy</option>
		                       </select>
		                   </div>
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="typeOfInsurance" class="mx-1 my-0">Type of Insurance&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="typeOfInsurance">
		                           <option>1st class</option>
		                           <option>2nd class</option>
		                           <option>3rd class</option>
		                           <option>other</option>
		                       </select>
		                   </div>
		                    <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="keyInDate" class="mx-1 my-0">Key in date&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="keyInDate" maxlength="10">
        						</div>
		                   </div>
		                   
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="model" class="mx-1 my-0">Model&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="model">
		                           <option>All</option>
		                           <option>Vios</option>
		                           <option>Yaris</option>
		                           <option>Camry</option>
		                       </select>
		                   </div>
		                   
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="premiumType" class="mx-1 my-0">Premium Type&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="premiumType">
		                           <option>All</option>
		                           <option>Premium 1</option>
		                           <option>Premium 2</option>
		                           <option>Premium 3</option>
		                       </select>
		                   </div>
		                   
		                   <div class="input-group pb-1 pr-3 col-md-4">
		                       <label for="citizenId" class="mx-1 my-0">Citizen ID&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="citizenId">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-12" style="text-align: right;">
								<div class="d-flex align-items-end justify-content-end" style="height:100%">
			                       <sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Search"
										type="button" value="Search"
										styleClass="button mr-1" secured="false" onClick="clickSearch();" />
									<sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Clear"
										type="button" value="Clear"
										styleClass="button" secured="false" onClick="clearSearch();" />
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
				        		<datatables:column title="DDMS Status" cssClass="col2" cssStyle="text-align:center;" sortable="false" searchable="false"/>
				        		<datatables:column title="INS Status" cssClass="col3" sortable="false" cssStyle="text-align:center;" />
								<datatables:column title="Model" cssClass="col4 fixed" sortable="false" cssStyle="text-align:center;" />
								<datatables:column title="V/N" cssClass="col5" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Type of purchase" cssClass="col6" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="FN Company" cssClass="col7" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Code" cssClass="col8" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Company" cssClass="col9" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Type" cssClass="col10" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Premium" cssClass="col11" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="INS Activation Date" cssClass="col12" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Customer Name" cssClass="col13" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="Dealer Code" cssClass="col14" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								
							</datatables:table>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>