<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="views" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<views:script src="json2.js"/>
<views:script src="jquery.caret.1.02.min.js"/>

<views:style src="fis/WKV03120.css"/>

<style>

</style>

<script>
	mappingPath = '${_mappingPath}';
	firstResult = '${form.firstResult}';
	rowsPerPage = '${form.rowsPerPage}';
	MSTD0031AERR = '<spring:message code="MSTD0031AERR"></spring:message>';
	MSTD0003ACFM = '<spring:message code="MSTD0003ACFM"></spring:message>';
	MKV00002ACFM = '<spring:message code="MKV00002ACFM"></spring:message>';
	MKV00001ACFM = '<spring:message code="MKV00001ACFM"></spring:message>';
	var dataForm = ${jsonForm};
	
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="fis/WKV03120.js?t=${currentTimestamp}"/>

<form method="post" 
	   id="search-form" 
	   action="${_mappingPath}/search" 
	   ajax="updateObjectFinish" 
	   ajax-loading-target="#screen-panel" 
	   validate-error="saveValidateError">
						   
	<div id="screen-panel" class="container-fluid"">
		<div class="row pt-2 pb-1">
			<div class="col-6">
				<div class="row">
					<div class="col-12" style="text-align: left;">
						<label><spring:message code="WKV03120.Label.DocumentNo"/>&nbsp;: <span id="documentNoDisp">${form.documentNo }</span> </label>
						<input type="hidden" id="documentNo" name="documentNo" disabled>
					</div>
					<div class="col-12" style="text-align: left;">
						<label><spring:message code="WKV03120.Label.DocumentStatus"/>&nbsp;: <span id="documentStatusDisp">${form.documentStatus }</span></label>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col-12">&nbsp;</div>
		        	<div class="col-12" style="text-align: right;">
		        		<spring:message code="WKV03120.Label.BtnDelete" var="BtnDelete" />
		        		<spring:message code="WKV03120.Label.BtnSubmit" var="BtnSubmit" />
		        		<spring:message code="WKV03120.Label.BtnSave" var="BtnSave" />
		        		<spring:message code="WKV03120.Label.BtnReset" var="BtnReset" />
		        		<spring:message code="WKV03120.Label.BtnActivate" var="BtnActivate" />
		        		<spring:message code="WKV03120.Label.BtnBack" var="BtnBack" />
		        		
		        		<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Delete"
									type="button" value="${BtnDelete}" styleClass="button" secured="false" onClick=""/>
		        		<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Submit"
									type="button" value="${BtnSubmit}" styleClass="button" secured="false" onClick="doSubmit();"/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Save"
									type="button" value="${BtnSave}" styleClass="button" secured="false" onClick="doSave();"/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Reset"
									type="button" value="${BtnReset}" styleClass="button" secured="false" onClick=""/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Back"
									type="button" value="${BtnBack}" styleClass="button" secured="false" onClick=""/>
						<%-- <sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Activate"
									type="button" value="${BtnActivate}" styleClass="button" secured="false" onClick="doActivate();"/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120NeedMoreInfo"
									type="button" value="Need More infor." styleClass="button" secured="false" onClick=""/>
						 --%>
		        	</div>
	        	</div>
        	</div>
        </div>
       	<hr/>
       	<div class="row" style="height:495px; overflow: auto;"> 
        	<div class="col-12">
				<div class="row"> 
		        	<div class="py-2 col-12">
						<div class="card">
							<div class="card-header text-white bg-secondary"><spring:message code="WKV03120.Label.1.VehicleInformation"/></div>
					     	<div class="card-body">
					     		<div class="row">
					     			<div class="col-md-2 col-12">
		        						<label for="vehBrand" class="mx-1 my-0"><spring:message code="WKV03120.Label.Brand"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehBrandDisp" value="${form.vehBrand}" disabled>
		        						<input type="hidden" id="vehBrand" name="vehBrand">
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="vehVinNo" class="mx-1 my-0"><spring:message code="WKV03120.Label.VinNo"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehVinNoDisp" value="${form.vehVinNo}" disabled>
		        						<input type="hidden" id="vehVinNo" name="vehVinNo">
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="series" class="mx-1 my-0"><spring:message code="WKV03120.Label.Series"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehSeries" value="${form.vehVinNo}" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="model" class="mx-1 my-0"><spring:message code="WKV03120.Label.ModelDescription"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehModel" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="color" class="mx-1 my-0"><spring:message code="WKV03120.Label.Color"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehColor" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="year" class="mx-1 my-0"><spring:message code="WKV03120.Label.Year"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehYear" disabled>
		        					</div>
		        					
		        					<div class="col-md-2 col-12">
		        						<label for="regNo" class="mx-1 my-0"><spring:message code="WKV03120.Label.RegNo"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehRegNo" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="engine" class="mx-1 my-0"><spring:message code="WKV03120.Label.Engine"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehEngine" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="weightCC" class="mx-1 my-0"><spring:message code="WKV03120.Label.WeightCC"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehWeightCC" value="${form.vehWeight} / ${form.vehCC}" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="type" class="mx-1 my-0"><spring:message code="WKV03120.Label.Type"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vehType" disabled>
		        					</div>
		        					<div class="col-md-4 col-12">
		        					</div>
			        			</div>
			       			</div>
		       			</div>
					</div>
				</div>
				
				<div class="row"> 
		        	<div class="py-2 col-12">
						<div class="card">
							<div class="card-header text-white bg-secondary"><spring:message code="WKV03120.Label.2.FinancialInformation"/></div>
					     	<div class="card-body">
					        	<div class="row"> 
					        		<div class="col-md-6 col-12">
					        			<div class="row"> 
				        					<div class="col-md-4 col-12">
				        						<label for="finTypePurchase" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.TypeOfPurchase"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="finTypePurchase" name="finTypePurchase">
							                       	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.finTypePurchaseList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-8 col-12">
				        						<label for="finLisingCompany" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.LeasingCompany"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="finLisingCompany" name="finLisingCompany">
						                        	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.finLisingCompanyList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
			        					</div>
		        					</div>
		        					<div class="col-md-6 col-12">
		        					</div>
		        				</div>
					      	</div>
					  	</div>
					</div>
				</div>
				
				<div class="row"> 
		        	<div class="py-2 col-12">
						<div class="card">
							<div class="card-header text-white bg-secondary"><spring:message code="WKV03120.Label.3.InsuranceInformation"/></div>
					     	<div class="card-body">
					     		<div class="row">
					     			<div class="col-12">
				                       	<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="insChoice" id="insChoice" value="1">
										  <label class="form-check-label" for="insChoice"><spring:message code="WKV03120.Label.InsuranceRadio1"/></label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="insChoice" id="insChoice" value="2">
										  <label class="form-check-label" for="insChoice"><spring:message code="WKV03120.Label.InsuranceRadio2"/></label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="insChoice" id="insChoice" value="3">
										  <label class="form-check-label" for="insChoice"><spring:message code="WKV03120.Label.InsuranceRadio3"/></label>
										</div>
									</div> 
					     		
		        					<div class="col-md-4 col-12">
		        						<label for="insCompany" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Company"/>&nbsp;:</label>
		        						<select class="form-control form-control-sm MandatoryField" id="insCompany" name="insCompany">
				                           <option>AIOI</option>
				                           <option>Viriya</option>
				                           <option>Company 1</option>
				                           <option>Company 2</option>
				                           <option>Company 3</option>
				                           <option>Company 4</option>
				                           <option>Company 5</option>
				                           <option>Company 6</option>
				                           <option>Company 7</option>
				                           <option>Company 8</option>
				                           <option disabled>--------------------------------</option>
				                           <option>Company 9</option>
				                           <option>Company 10</option>
				                       	</select>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="insClass" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.InsuranceClass"/>&nbsp;:</label>
				                       	<select class="form-control form-control-sm MandatoryField" id="insClass" name="insClass">
				                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insClassList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       	</select>
		        					</div>
		        					<div class="col-md-2 col-12">
				                       <label for="insType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.InsuranceType"/>&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="insType" name="insType">
				                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insTypeList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       </select>
				                    </div>
				                    <div class="col-md-2 col-12">
				                       <label for="insPremiumType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.PremiumType"/>&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="insPremiumType" name="insPremiumType">
				                           	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insPremiumTypeList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       </select>
				                    </div>
		        					<div class="col-md-2 col-12">
		        						<label for="insCoverageYearDisp" class="mx-1 my-0"><spring:message code="WKV03120.Label.CoverageYear"/>&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="insCoverageYearDisp" name="insCoverageYearDisp" value="${form.insCoverageYear}" style="text-align: right;" disabled>
		        						<input type="hidden" id="insCoverageYear" name="insCoverageYear" style="text-align: right;" disabled>
		        					</div>
		        					
		        					<div class="col-md-2 col-12">
		        						<label for="insPremium" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Premium"/>&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="insPremium" name="insPremium" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="WKV03120.Label.Baht" /></label>
										</div> 
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="insCoverage" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Coverage"/>&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="insCoverage" name="insCoverage" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="WKV03120.Label.Baht" /></label>
										</div> 
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="insAct" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.VehicleAct"/>&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="insAct" name="insAct" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="WKV03120.Label.Baht" /></label>
										</div> 
		        					</div>
		
		        					<div class="col-md-2 col-12">
		        						<label for="insActivationDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ActivationFromDate"/>&nbsp;:</label>
		        						<div class="d-flex flex-row">
		        							<input type="text" class="form-control form-control-sm MandatoryField" id="insActivationDate" name="insActivationDate" maxlength="10">
		        						</div>
		        					</div>
		
		        					<div class="col-md-2 col-12">
		        						<label for="insCoverageDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.CoverageToDate"/>&nbsp;:</label>
		        						<div class="d-flex flex-row">
		        							<input type="text" class="form-control form-control-sm MandatoryField" id="insCoverageDate" name="insCoverageDate" maxlength="10">
		        						</div>
		        					</div>
		        					<div class="col-md-8 col-12">
		        						<label for="insRemark" class="mx-1 my-0"><spring:message code="WKV03120.Label.Remark"/>&nbsp;:</label>
		        						<textarea class="form-control" id="insRemark" name="insRemark" rows="4" maxlength="2000"></textarea>
		        					</div>
		        					<div class="col-md-4 col-12">
		        						<div class="row">
				        					<div class="col-md-12 col-12">
				        						<label for="insTempPolicyNo" class="mx-1 my-0"><spring:message code="WKV03120.Label.TempPolicyNo"/>&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="insTempPolicyNoDisp" name="insTempPolicyNoDisp" disabled>
				        						<input type="hidden" id="insTempPolicyNo" name="insTempPolicyNo">
				        					</div>
				        					<div class="col-md-12 col-12">
				        						<label for="insPolicyNo" class="mx-1 my-0"><spring:message code="WKV03120.Label.PolicyNo"/>&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="insPolicyNoDisp" name="insPolicyNoDisp" disabled>
				        						<input type="hidden" id="insPolicyNo" name="insPolicyNo">
				        					</div>
			        					</div>
		        					</div>
		        				</div>
					      	</div>
					  	</div>
					</div>
				</div>
				
				<div class="row"> 
		        	<div class="py-2 col-12">
						<div class="card">
							<div class="card-header text-white bg-secondary"><spring:message code="WKV03120.Label.4.CustomerInformation"/></div>
					     	<div class="card-body">
					        	<div class="row">
					        		<div class="col-12">
				                       	<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="cusType" value="P">
										  <label class="form-check-label" for="cusType"><spring:message code="WKV03120.Label.Personal"/></label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="cusType" value="C">
										  <label class="form-check-label" for="cusType"><spring:message code="WKV03120.Label.Company"/></label>
										</div>
									</div>
		        				</div>
		        				
		        				<div class="row" id="customerIndividual">
		        					<div class="col-12 py-1">
		        						<div class="input-group col-12"><label><spring:message code="WKV03120.Label.PolicyDelivery"/>&nbsp;:&nbsp;&nbsp;</label>
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="cuspPolicyDelivery" value="D">
											  <label class="form-check-label" for="cuspPolicyDelivery"><spring:message code="WKV03120.Label.Dealer"/></label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="cuspPolicyDelivery" value="C">
											  <label class="form-check-label" for="cuspPolicyDelivery"><spring:message code="WKV03120.Label.Customer"/></label>
											</div>
										</div>
									</div>
									<div class="col-12">
					     				<div class="row">
				        					<div class="col-md-2 col-12">
				        						<label for="cuspIdCardNo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.IDCard"/>&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="cuspIdCardNo" name="cuspIdCardNo">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspMobile" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Mobile"/>&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="cuspMobile" name="cuspMobile">
				        					</div>
				        					<div class="col-md-1">
				        						<label for="cuspTitle1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Title1"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspTitle1" name="cuspTitle1">
						                           <option value="Mr.">Mr.</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-1">
				        						<label for="cuspTitle2" class="mx-1 my-0"></span><spring:message code="WKV03120.Label.Title2"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuspTitle2" name="cuspTitle2">
						                           <option value="xx">xxx</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2">
				        						<label for="cuspFirstName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.FirstName"/>&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="cuspFirstName" name="cuspFirstName">
				        					</div>
				        					<div class="col-md-3">
				        						<label for="cuspLastName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.LastName"/>&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="cuspLastName" name="cuspLastName">
				        					</div>
				        					<div class="col-md-1">
				        						<label for="cuspGender" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Gender"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspGender" name="cuspGender">
						                           	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.genderList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        				</div>
				        			</div>
			        				<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-md-2">
				        						<label for="cuspBirthDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.BirthDate"/>&nbsp;:</label>
				        						<div class="d-flex flex-row">
				        							<input type="text" class="form-control form-control-sm MandatoryField" id="cuspBirthDate" name="cuspBirthDate" maxlength="10">
				        						</div>
				        					</div>
				        					<div class="col-5">
				        						<label for="cuspAddress1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Address1"/>&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="cuspAddress1" name="cuspAddress1">
				        					</div>
				        					<div class="col-5">
				        						<label for="cuspAddress2" class="mx-1 my-0"><spring:message code="WKV03120.Label.Address2"/>&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuspAddress2" name="cuspAddress2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuspProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Province"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspProvince" name="cuspProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuspDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.District"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspDistrict" name="cuspDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuspSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.SubDistrict"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspSubDistrict" name="cuspSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ZipCode"/>&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuspZipcode" name="cuspZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspTelephone" class="mx-1 my-0"><spring:message code="WKV03120.Label.Telephone"/>&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuspTelephone" name="cuspTelephone">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" name="cuspSameAddressFlag" value="Y">
											  <label class="form-check-label" for="cuspSameAddressFlag"><spring:message code="WKV03120.Label.SameAsAddress"/></label>
											</div>
									</div>
				        			<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-6">
				        						<label for="cuspBillAddress1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Address1"/>&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="cuspBillAddress1" name="cuspBillAddress1">
				        					</div>
				        					<div class="col-6">
				        						<label for="cuspBillAddress2" class="mx-1 my-0"><spring:message code="WKV03120.Label.Address2"/>&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuspBillAddress2" name="cuspBillAddress2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuspBillProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Province"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillProvince" name="cuspBillProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuspBillDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.District"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillDistrict" name="cuspBillDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuspBillSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.SubDistrict"/>&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillSubDistrict" name="cuspBillSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspBillZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ZipCode"/>&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuspBillZipcode" name="cuspBillZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12">
					     				<div class="row">
				        					<div class="col-md-4 col-12">
				        						<label for="cuspBeneficiary" class="mx-1 my-0"><spring:message code="WKV03120.Label.Beneficiary" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuspBeneficiary" name="cuspBeneficiary">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspRefTelNo" class="mx-1 my-0"><spring:message code="WKV03120.Label.RefTelNo" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuspRefTelNo" name="cuspRefTelNo">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="cuspLineID" class="mx-1 my-0"><spring:message code="WKV03120.Label.LineID" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuspLineID" name="cuspLineID">
				        					</div>
				        					<div class="col-md-4">
				        						<label for="cuspEmail" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Email" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="cuspEmail" name="cuspEmail">
				        					</div>
				        				</div>
				        			</div>
		        				</div>
		        			
		        				<div class="row" id="customerJuristic">
		        					<div class="col-12 py-1">
		        						<div class="input-group col-12"><label><spring:message code="WKV03120.Label.PolicyDelivery" />&nbsp;:&nbsp;&nbsp;</label>
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="cuscPolicyDelivery" value="D">
											  <label class="form-check-label" for="cuscPolicyDelivery"><spring:message code="WKV03120.Label.Dealer" /></label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="cuscPolicyDelivery" value="C">
											  <label class="form-check-label" for="cuscPolicyDelivery"><spring:message code="WKV03120.Label.Customer" /></label>
											</div>
										</div>
									</div>
									<div class="col-12">
					     				<div class="row">
				        					<div class="col-md-2 col-12">
				        						<label for="cuscTaxID" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.TaxID" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscTaxID" name="cuscTaxID">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscPhone" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.CompanyPhone" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscPhone" name="cuscPhone">
				        					</div>
				        					<div class="col-md-4">
				        						<label for="cuscCompanyName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ComapnyName" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscCompanyName" name="cuscCompanyName">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="cuscBranchNo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.BranchNo" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscBranchNo" name="cuscBranchNo">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="cuscRegisterDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.RegisterDate" />&nbsp;:</label>
				        						<div class="d-flex flex-row">
				        							<input type="text" class="form-control form-control-sm" id="cuscRegisterDate" name="cuscRegisterDate" maxlength="10">
				        						</div>
				        					</div>
				        				</div>
				        			</div>
			        				<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-2">
				        						<label for="cuscFirstName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.FirstName" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscFirstName" name="cuscFirstName">
				        					</div>
				        					<div class="col-2">
				        						<label for="cuscLastName" class="mx-1 my-0"><spring:message code="WKV03120.Label.LastName" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscLastName" name="cuscLastName">
				        					</div>
				        					<div class="col-4">
				        						<label for="cuscAddress1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Address1" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscAddress1" name="cuscAddress1">
				        					</div>
				        					<div class="col-4">
				        						<label for="cuscAddress2" class="mx-1 my-0"><spring:message code="WKV03120.Label.Address2" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscAddress2" name="cuscAddress2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuscProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Province" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscProvince" name="cuscProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuscDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.District" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscDistrict" name="cuscDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuscSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.SubDistrict" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscSubDistrict" name="cuscSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ZipCode" />&nbsp;:</label>
		        								<select class="form-control form-control-sm" id="cuscZipcode" name="cuscZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscMobile" class="mx-1 my-0"><spring:message code="WKV03120.Label.Mobile" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscMobile" name="cuscMobile">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" name="cuscSameAddressFlag" value="Y">
											  <label class="form-check-label" for="cuscSameAddressFlag"><spring:message code="WKV03120.Label.SameAsAddress" /></label>
											</div>
									</div>
				        			<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-6">
				        						<label for="cuscBillAddress1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Address1" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscBillAddress1" name="cuscBillAddress1">
				        					</div>
				        					<div class="col-6">
				        						<label for="cuscBillAddress2" class="mx-1 my-0"><spring:message code="WKV03120.Label.Address2" />&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="cuscBillAddress2" name="cuscBillAddress2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuscBillProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Province" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscBillProvince" name="cuscBillProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuscBillDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.District" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscBillDistrict" name="cuscBillDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuscBillSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.SubDistrict" />&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="cuscBillSubDistrict" name="cuscBillSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscBillZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.ZipCode" />&nbsp;:</label>
		        								<select class="form-control form-control-sm" id="cuscBillZipcode" name="cuscBillZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscEmail" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="WKV03120.Label.Email" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="cuscEmail" name="cuscEmail">
				        					</div>
				        				</div>
				        			</div>
		        				</div>
		        					
					      	</div>
					  	</div>
					</div>
				</div>
				
				<div class="row"> 
		        	<div class="py-2 col-12">
						<div class="card">
							<div class="card-header text-white bg-secondary"><spring:message code="WKV03120.Label.5.SalespersonInformation" /></div>
					     	<div class="card-body">
					        	<div class="row"> 
		        					<div class="col-md-6 col-12">
		        						<label for="salesman" class="mx-1 my-0"><spring:message code="WKV03120.Label.Salesman" />&nbsp;:</label>
				                       	<select class="form-control form-control-sm" id="salesmanDisp">
				                           	<option>0089 : Mr. Supachai Thanaviboon</option>
				                       	</select>
				                       	<input type="hidden" id="salesman" name="salesman">
		        					</div>
		        				</div>
					      	</div>
					  	</div>
					</div>
				</div>
				<div class="row"> 
		        	<div class="pt-2 pb-3 col-12">
						<div class="card">
							<div class="card-body">
					        	<div class="row"> 
		        					<div class="col-md-3 col-6">
		        						<label for="createdBy" class="mx-1 my-0"><spring:message code="WKV03120.Label.CreatedBy" />&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="createdBy" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="createdDate" class="mx-1 my-0"><spring:message code="WKV03120.Label.CreatedDate" />&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="createdDate" name="createdDate" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="updatedBy" class="mx-1 my-0"><spring:message code="WKV03120.Label.UpdatedBy" />&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="updatedBy" name="updatedBy" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="updatedDateDisp" class="mx-1 my-0"><spring:message code="WKV03120.Label.UpdatedDate" />&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="updatedDateDisp" name="updatedDateDisp" disabled>
				                       	<input type="hidden" id="updatedDate" name="updatedDate">
		        					</div>
		        					<div class="col-md-4 col-12">
		        						<div class="row">
				        					<div class="col-md-12 col-12">
				        						<label for="cancelBy" class="mx-1 my-0"><spring:message code="WKV03120.Label.CancelBy" />&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="cancelBy" name="cancelBy" disabled>
				        					</div>
				        					<div class="col-md-12 col-12">
				        						<label for="cancelDate" class="mx-1 my-0"><spring:message code="WKV03120.Label.CancelDate" />&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="cancelDate" name="cancelDate" disabled>
				        					</div>
			        					</div>
		        					</div>
		        					<div class="col-md-8 col-12">
		        						<label for="cancelReason" class="mx-1 my-0"><spring:message code="WKV03120.Label.CancelReason" />&nbsp;:</label>
		        						<textarea class="form-control" id="cancelReason" name="cancelReason" rows="4" maxlength="2000"></textarea>
		        					</div>
		        				</div>
					      	</div>
					  	</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</form>