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


<views:style src="fis/WKV03110.css"/>
<script>
	mappingPath = '${_mappingPath}';
	firstResult = '${form.firstResult}';
	rowsPerPage = '${form.rowsPerPage}';
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="fis/WKV03110.js?t=${currentTimestamp}"/>
	
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
		                       <label for="vinNo" class="mx-1 my-0"><spring:message code="WKV03110.Label.VinNo"/>&nbsp;:</label>
		                       <input type="text" class="form-control form-control-sm" id="vinNo" name="vinNo">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="series" class="mx-1 my-0"><spring:message code="WKV03110.Label.Series"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="series" name="series">
		                           <option>All</option>
		                           <option>Vios</option>
		                           <option>Yaris</option>
		                           <option>Camry</option>
		                       </select>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="model" class="mx-1 my-0"><spring:message code="WKV03110.Label.Model"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="model" name="model">
		                           <option>All</option>
		                           <option>2019</option>
		                           <option>2011</option>
		                       </select>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="ddmsStatus" class="mx-1 my-0"><spring:message code="WKV03110.Label.DDMSStatus"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="ddmsStatus" name="ddmsStatus">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.ddmsStatusList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                                      
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="typeOfPurchase" class="mx-1 my-0"><spring:message code="WKV03110.Label.TypeOfPurchase"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="typeOfPurchase" name="typeOfPurchase">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.typeOfPurchaseList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                   
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="personalId" class="mx-1 my-0"><spring:message code="WKV03110.Label.PersonalID"/>&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="personalId" name="personalId">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="firstName" class="mx-1 my-0"><spring:message code="WKV03110.Label.FirstName"/>&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="firstName" name="firstName">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-3">
		                       <label for="lastName" class="mx-1 my-0"><spring:message code="WKV03110.Label.LastName"/>&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="lastName" name="lastName">
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-4">
		                       <label for="companyName" class="mx-1 my-0"><spring:message code="WKV03110.Label.CompanyName"/>&nbsp;</label>
		                       <input type="text" class="form-control form-control-sm" id="companyName" name="companyName">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="documentStatus" class="mx-1 my-0"><spring:message code="WKV03110.Label.DocumentStatus"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="documentStatus" name="documentStatus">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.documentStatusList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceCompany" class="mx-1 my-0"><spring:message code="WKV03110.Label.InsuranceCompany"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceCompany" name="insuranceCompany">
		                       		<%-- <option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.insuranceCompanyList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach> --%>
		                           <option>All</option>
		                           <option>AIOI</option>
		                           <option>Viriya</option>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceType" class="mx-1 my-0"><spring:message code="WKV03110.Label.InsuranceType"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceType" name="insuranceType">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.insuranceTypeList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="premiumType" class="mx-1 my-0"><spring:message code="WKV03110.Label.PremiumType"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="premiumType" name="premiumType">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.premiumTypeList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="insuranceClass" class="mx-1 my-0"><spring:message code="WKV03110.Label.InsuranceClass"/>&nbsp;:</label>
		                       <select class="form-control form-control-sm" id="insuranceClass" name="insuranceClass">
		                       		<option value=""><spring:message code="KV0.common.combobox.all" /></option>
									<c:forEach items="${form.insuranceClassList}" var="item">
										<option value="${item.stValue}"><c:out
												value="${item.stLabel}" /></option>
									</c:forEach>
		                       </select>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                   </div>
		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="createDateFrom" class="mx-1 my-0"><spring:message code="WKV03110.Label.CreateFromDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="createDateFrom" name="createDateFrom" maxlength="10">
        						</div>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="createDateTo" class="mx-1 my-0"><spring:message code="WKV03110.Label.CreateToDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="createDateTo" name="createDateTo" maxlength="10">
        						</div>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="deliveryDateFrom" class="mx-1 my-0"><spring:message code="WKV03110.Label.DeliveryFromDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="deliveryDateFrom" name="deliveryDateFrom" maxlength="10">
        						</div>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="deliveryDateTo" class="mx-1 my-0"><spring:message code="WKV03110.Label.DeliveryToDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm" id="deliveryDateTo" name="deliveryDateTo" maxlength="10">
        						</div>
		                   </div>
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="activationDateFrom" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03110.Label.ActivationFromDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm MandatoryField" id="activationDateFrom" name="activationDateFrom" maxlength="10">
        						</div>
		                   </div>		                   
		                   <div class="pb-1 pr-3 col-md-2">
		                       <label for="activationDateTo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03110.Label.ActivationToDate"/>&nbsp;:</label>
		                       <div class="d-flex flex-row">
        							<input type="text" class="form-control form-control-sm MandatoryField" id="activationDateTo" name="activationDateTo" maxlength="10">
        						</div>
		                   </div>
		                   
		                   <div class="py-1 pr-3 col-12" style="text-align: right;">
								<div class="d-flex align-items-end justify-content-end" style="height:100%">
									<spring:message code="WKV03110.Label.BtnSearch" var="BtnSearch"/>
									<spring:message code="WKV03110.Label.BtnClear" var="BtnClear"/>
									<spring:message code="WKV03110.Label.BtnExport" var="BtnExport"/>
			                       <sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Search"
										type="button" value="${BtnSearch}"
										styleClass="button mr-1" secured="false" onClick="clickSearch();" />
									<sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Clear"
										type="button" value="${BtnClear}"
										styleClass="button mr-1" secured="false" onClick="clearSearch();" />
									<sc2:button functionId="KV0311"  screenId="WKV03110" buttonId="WKV03110Export"
										type="button" value="${BtnExport}"
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
						    
						    <spring:message code="WKV03110.Label.ColNo" var="ColNo"/>
						    <spring:message code="WKV03110.Label.ColDocumentStatus" var="ColDocumentStatus"/>
						    <spring:message code="WKV03110.Label.ColModel" var="ColModel"/>
						    <spring:message code="WKV03110.Label.ColVIN" var="ColVIN"/>
						    <spring:message code="WKV03110.Label.ColCustomerName" var="ColCustomerName"/>
						    <spring:message code="WKV03110.Label.ColINSType" var="ColINSType"/>
						    <spring:message code="WKV03110.Label.ColPremiumType" var="ColPremiumType"/>
						    <spring:message code="WKV03110.Label.ColINSCompany" var="ColINSCompany"/>
						    <spring:message code="WKV03110.Label.ColINSClass" var="ColINSClass"/>
						    <spring:message code="WKV03110.Label.ColINSPremium" var="ColINSPremium"/>
						    <spring:message code="WKV03110.Label.ColActivationDate" var="ColActivationDate"/>
						    <spring:message code="WKV03110.Label.ColDDMSStatus" var="ColDDMSStatus"/>
						    
							<datatables:table id="result" 
							    					data="${dataList}" 
							    					cdn="false" 
							    					row="row" 
							    					cssClass="result fixedheader fixedcolumn" 
							    					paginate="true" 
							    					cssStyle="height:290px;width:120%;"
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
											  
								<datatables:column title="${ColNo}" cssClass="col1 rownum" sortable="false" searchable="false" cssStyle="text-align:center;" />
				        		<datatables:column title="${ColDocumentStatus}" cssClass="col2" cssStyle="text-align:center;" sortable="false" searchable="false"/>
								<datatables:column title="${ColModel}" cssClass="col3" sortable="false" searchable="false" cssStyle="text-align:center;" />
								<datatables:column title="${ColVIN}" cssClass="col4 fixed" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColCustomerName}" cssClass="col5" sortable="false" cssStyle="text-align:center;" />
								<datatables:column title="${ColINSType}" cssClass="col6" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColPremiumType}" cssClass="col7" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColINSCompany}" cssClass="col8" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColINSClass}" cssClass="col9" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColINSPremium}" cssClass="col10" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColActivationDate}" cssClass="col11" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								<datatables:column title="${ColDDMSStatus}" cssClass="col12" sortable="false" searchable="false" cssStyle="text-align:center;"/>
								
							</datatables:table>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>