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
	
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="fis/WKV03120.js?t=${currentTimestamp}"/>

<form:form method="post" 
						   id="search-form" 
						   action="${_mappingPath}/search" 
						   ajax="searchFinish" 
						   ajax-loading-target="#screen-panel" 
						   validate-error="searchValidateError">
						   
	<div id="screen-panel" class="container-fluid"">
		<div class="row pt-2 pb-1">
			<div class="col-6">
				<div class="row">
					<div class="col-12" style="text-align: left;">
						<label>Document No.&nbsp;: INS00001</label>
					</div>
					<div class="col-12" style="text-align: left;">
						<label>Status&nbsp;: New</label>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row">
					<div class="col-12">&nbsp;</div>
		        	<div class="col-12" style="text-align: right;">
		        		<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Delete"
									type="button" value="Delete" styleClass="button" secured="false" onClick=""/>
		        		<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Submit"
									type="button" value="Submit" styleClass="button" secured="false" onClick="doConfirmSubmit();"/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Save"
									type="button" value="Save" styleClass="button" secured="false" onClick=""/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Reset"
									type="button" value="Reset" styleClass="button" secured="false" onClick=""/>
									
						<%-- <sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Activate"
									type="button" value="Activate" styleClass="button" secured="false" onClick="doActivate();"/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120NeedMoreInfo"
									type="button" value="Need More infor." styleClass="button" secured="false" onClick=""/>
						<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Back"
									type="button" value="Back" styleClass="button" secured="false" onClick=""/> --%>
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
							<div class="card-header text-white bg-secondary">1. Vehicle Information</div>
					     	<div class="card-body">
					     		<div class="row">
					     			<div class="col-md-2 col-12">
		        						<label for="brand" class="mx-1 my-0">Brand&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="brand" value="Toyota" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="vinNo" class="mx-1 my-0">Vin no.&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="vinNo" value="MR053REH100010123" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="series" class="mx-1 my-0">Series&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="series" value="CH-R" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="model" class="mx-1 my-0">Model Description&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="model" value="HI" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="color" class="mx-1 my-0">Color&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="color" value="Red" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="year" class="mx-1 my-0">Year&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="year" value="2019" disabled>
		        					</div>
		        					
		        					<div class="col-md-2 col-12">
		        						<label for="regNo" class="mx-1 my-0">Reg no.&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="regNo" value="RED PLATE" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="engine" class="mx-1 my-0">Engine&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="engine" value="4S-F4567" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="weightCC" class="mx-1 my-0">Weight/CC&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="weightCC" value="1,200 Kg./ 1,800 CC" disabled>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="type" class="mx-1 my-0">Type&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="type" value="Sub SUV" disabled>
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
							<div class="card-header text-white bg-secondary">2. Financial Information</div>
					     	<div class="card-body">
					        	<div class="row"> 
					        		<div class="col-md-6 col-12">
					        			<div class="row"> 
				        					<div class="col-md-4 col-12">
				        						<label for="finTypePurchase" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Type of purchase&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="finTypePurchase">
							                       	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.finTypePurchaseList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-8 col-12">
				        						<label for="finLisingCompany" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Leasing company&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="finLisingCompany">
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
							<div class="card-header text-white bg-secondary">3. Insurance Information</div>
					     	<div class="card-body">
					     		<div class="row">
					     			<div class="col-12">
				                       	<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="InsuranceRadio" id="InsuranceRadio" value="1">
										  <label class="form-check-label" for="InsuranceRadio1"><spring:message code="Label.InsuranceRadio1" /></label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="InsuranceRadio" id="InsuranceRadio" value="2">
										  <label class="form-check-label" for="InsuranceRadio"><spring:message code="Label.InsuranceRadio2" /></label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="InsuranceRadio" id="InsuranceRadio" value="3">
										  <label class="form-check-label" for="InsuranceRadio"><spring:message code="Label.InsuranceRadio3" /></label>
										</div>
									</div> 
					     		
		        					<div class="col-md-4 col-12">
		        						<label for="insuranceCompany" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Company&nbsp;:</label>
		        						<select class="form-control form-control-sm MandatoryField" id="insuranceCompany">
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
		        						<label for="insClass" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Insurance Class&nbsp;:</label>
				                       	<select class="form-control form-control-sm MandatoryField" id="insClass">
				                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insClassList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       	</select>
		        					</div>
		        					<div class="col-md-2 col-12">
				                       <label for="insType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Insurance Type&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="insType">
				                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insTypeList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       </select>
				                    </div>
				                    <div class="col-md-2 col-12">
				                       <label for="insPremiumType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Premium Type&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="insPremiumType">
				                           	<option value=""><spring:message code="KV0.common.combobox.select" /></option>
											<c:forEach items="${form.insPremiumTypeList}" var="item">
												<option value="${item.stValue}"><c:out
														value="${item.stLabel}" /></option>
											</c:forEach>
				                       </select>
				                    </div>
		        					<div class="col-md-2 col-12">
		        						<label for="coverageYear" class="mx-1 my-0">Coverage Year&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="coverageYear" style="text-align: right;" value="3" disabled>
		        					</div>
		        					
		        					<div class="col-md-2 col-12">
		        						<label for="insPremium" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Premium&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="insPremium" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="Label.Baht" /></label>
										</div> 
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="coverage" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Coverage&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="coverage" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="Label.Baht" /></label>
										</div> 
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="vehicleAct" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span><spring:message code="Label.VehicleAct" />&nbsp;:</label>
		        						<div class="input-group">
										  	<input type="text" class="form-control form-control-sm MandatoryField" id="vehicleAct" style="text-align: right;">
										  	<label style="margin-top: 3px;">&nbsp;<spring:message code="Label.Baht" /></label>
										</div> 
		        					</div>
		
		        					<div class="col-md-2 col-12">
		        						<label for="activation" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Activation From Date&nbsp;:</label>
		        						<div class="d-flex flex-row">
		        							<input type="text" class="form-control form-control-sm MandatoryField" id="activation" maxlength="10">
		        						</div>
		        					</div>
		
		        					<div class="col-md-2 col-12">
		        						<label for="coverageTo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Coverage To Date&nbsp;:</label>
		        						<div class="d-flex flex-row">
		        							<input type="text" class="form-control form-control-sm MandatoryField" id="coverageTo" maxlength="10">
		        						</div>
		        					</div>
		        					<div class="col-md-8 col-12">
		        						<label for="remark" class="mx-1 my-0">Remark&nbsp;:</label>
		        						<textarea class="form-control" id="remark" rows="4" maxlength="2000"></textarea>
		        					</div>
		        					<div class="col-md-4 col-12">
		        						<div class="row">
				        					<div class="col-md-12 col-12">
				        						<label for="policyNo" class="mx-1 my-0">Temp Policy no.&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="tempPolicyNo" disabled>
				        					</div>
				        					<div class="col-md-12 col-12">
				        						<label for="policyNo" class="mx-1 my-0">Policy no.&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="policyNo" disabled>
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
							<div class="card-header text-white bg-secondary">4. Customer Information</div>
					     	<div class="card-body">
					        	<div class="row">
					        		<div class="col-12">
				                       	<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="typeOfCustomer" value="Personal">
										  <label class="form-check-label" for="typeOfCustomer">Personal</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="typeOfCustomer" value="Company">
										  <label class="form-check-label" for="typeOfCustomer">Company</label>
										</div>
									</div>
		        				</div>
		        				
		        				<div class="row" id="customerIndividual">
		        					<div class="col-12 py-1">
		        						<div class="input-group col-12"><label>Policy Delivery&nbsp;:&nbsp;&nbsp;</label>
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="policyDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="policyDelivery">Dealer</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="policyDelivery" value="Customer">
											  <label class="form-check-label" for="policyDelivery">Customer</label>
											</div>
										</div>
									</div>
									<div class="col-12">
					     				<div class="row">
				        					<div class="col-md-2 col-12">
				        						<label for="idCardNo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>ID Card&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="idCardNo">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="mobile" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Mobile&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="mobile">
				        					</div>
				        					<div class="col-md-1">
				        						<label for=""title1"" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Title 1&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="title1">
						                           <option>xxxx</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-1">
				        						<label for="title2" class="mx-1 my-0">Title 2&nbsp;:</label>
						                       	<select class="form-control form-control-sm" id="title2">
						                           <option>xxx</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2">
				        						<label for="firstName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Fist Name&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="firstName">
				        					</div>
				        					<div class="col-md-3">
				        						<label for="lastName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Last Name&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="lastName">
				        					</div>
				        					<div class="col-md-1">
				        						<label for="cuspGender" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Gender&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspGender">
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
				        						<label for="birthDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Birth Date&nbsp;:</label>
				        						<div class="d-flex flex-row">
				        							<input type="text" class="form-control form-control-sm MandatoryField" id="birthDate" maxlength="10">
				        						</div>
				        					</div>
				        					<div class="col-5">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Address 1&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-5">
				        						<label for="address2" class="mx-1 my-0">Address 2&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuspProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuspDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuspSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuspZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="telephone" class="mx-1 my-0">Telephone&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="telephone">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" name="personalSameAsAddress" value="Y">
											  <label class="form-check-label" for="personalSameAsAddress">Same as address</label>
											</div>
									</div>
				        			<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-6">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Address 1&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-6">
				        						<label for="address2" class="mx-1 my-0">Address 2&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuspBillProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuspBillDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuspBillSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuspBillSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuspBillSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuspBillZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuspBillZipcode">
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
				        						<label for="beneficiary" class="mx-1 my-0"><spring:message code="Label.Beneficiary" />&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="beneficiary">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="refTelNo" class="mx-1 my-0">Ref. Tel no.&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="refTelNo">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="lineID" class="mx-1 my-0">Line ID&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="lineID">
				        					</div>
				        					<div class="col-md-4">
				        						<label for="email" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Email&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="email">
				        					</div>
				        				</div>
				        			</div>
		        				</div>
		        			
		        				<div class="row" id="customerJuristic">
		        					<div class="col-12 py-1">
		        						<div class="input-group col-12"><label>Policy Delivery&nbsp;:&nbsp;&nbsp;</label>
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="compPolicyDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="compPolicyDelivery">Dealer</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="compPolicyDelivery" value="Customer">
											  <label class="form-check-label" for="compPolicyDelivery">Customer</label>
											</div>
										</div>
									</div>
									<div class="col-12">
					     				<div class="row">
				        					<div class="col-md-2 col-12">
				        						<label for="idCardNo" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Tax ID&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="idCardNo">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="mobile" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Company Phone&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="mobile">
				        					</div>
				        					<div class="col-md-4">
				        						<label for="firstName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Comapny Name&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="firstName">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="lastName" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Branch No.&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="lastName">
				        					</div>
				        					<div class="col-md-2">
				        						<label for="registerDate" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Register Date&nbsp;:</label>
				        						<div class="d-flex flex-row">
				        							<input type="text" class="form-control form-control-sm MandatoryField" id="registerDate" maxlength="10">
				        						</div>
				        					</div>
				        				</div>
				        			</div>
			        				<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-2">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Name&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-2">
				        						<label for="address2" class="mx-1 my-0">Last Name&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        					<div class="col-4">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Address 1&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-4">
				        						<label for="address2" class="mx-1 my-0">Address 2&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuscProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuscDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuscSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuscZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="telephone" class="mx-1 my-0">Mobile&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="telephone">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="checkbox" name="companySameAsAddress" value="Y">
											  <label class="form-check-label" for="companySameAsAddress">Same as address</label>
											</div>
									</div>
				        			<div class="col-12">
					     				<div class="row"> 
				        					<div class="col-6">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Address 1&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-6">
				        						<label for="address2" class="mx-1 my-0">Address 2&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="cuscBillProvince" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscBillProvince">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillProvinceList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="cuscBillDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscBillDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="cuscBillSubDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="cuscBillSubDistrict">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillSubDistrictList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="cuscBillZipcode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<select class="form-control form-control-sm MandatoryField" id="cuscBillZipcode">
						                       		<option value=""><spring:message code="KV0.common.combobox.select" /></option>
													<c:forEach items="${form.cuscBillZipcodeList}" var="item">
														<option value="${item.stValue}"><c:out
																value="${item.stLabel}" /></option>
													</c:forEach>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="email" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Email&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm MandatoryField" id="email">
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
							<div class="card-header text-white bg-secondary">5. Salesperson Information</div>
					     	<div class="card-body">
					        	<div class="row"> 
		        					<div class="col-md-6 col-12">
		        						<label for="salesman" class="mx-1 my-0">Salesman&nbsp;:</label>
				                       <select class="form-control form-control-sm" id="salesman">
				                           <option>0089 : Mr. Supachai Thanaviboon</option>
				                       </select>
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
		        						<label for="createdBy" class="mx-1 my-0">Created By&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="createdBy" value="Mr. Somchay Nadin" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="createdDate" class="mx-1 my-0">Created Date&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="createdDate" value="20/12/2018 13:45:12" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="updatedBy" class="mx-1 my-0">Updated By&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="updatedBy" value="Mr. Somchay Nadin" disabled>
		        					</div>
		        					<div class="col-md-3 col-6">
		        						<label for="updatedDate" class="mx-1 my-0">Updated Date&nbsp;:</label>
				                       	<input type="text" class="form-control form-control-sm" id="updatedDate" value="21/12/2018 15:45:02" disabled>
		        					</div>
		        					<div class="col-md-4 col-12">
		        						<div class="row">
				        					<div class="col-md-12 col-12">
				        						<label for="policyNo" class="mx-1 my-0">Cancel By&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="cancelBy" disabled>
				        					</div>
				        					<div class="col-md-12 col-12">
				        						<label for="policyNo" class="mx-1 my-0">Cancel Date&nbsp;:</label>
				        						<input type="text" class="form-control form-control-sm" id="cancelDate" disabled>
				        					</div>
			        					</div>
		        					</div>
		        					<div class="col-md-8 col-12">
		        						<label for="remark" class="mx-1 my-0">Cancel Reason&nbsp;:</label>
		        						<textarea class="form-control" id="cancelReason" rows="4" maxlength="2000"></textarea>
		        					</div>
		        				</div>
					      	</div>
					  	</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</form:form>