<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="views" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<views:script src="json2.js"/>
<views:script src="jquery.caret.1.02.min.js"/>

<views:style src="fis/WKV04110.css"/>

<style>

</style>

<script>
	mappingPath = '${_mappingPath}';
	firstResult = '${form.firstResult}';
	rowsPerPage = '${form.rowsPerPage}';
	MSTD0031AERR = '<spring:message code="MSTD0031AERR"></spring:message>';

	
	
	$(function(){
		
		$('#premiumInput, #activation, #birthDate, #dateCompRegistration, #coverageUntil').datepicker({
			showOn: "button",
			buttonImage: calendarImgPath,
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: 'dd/mm/yy',
			onSelect: function(){
				$(this).focus();	
			}
		});
		
		validateDate(document.getElementById('activation'));
		validateDate(document.getElementById('birthDate'));
		validateDate(document.getElementById('registerDate'));
		validateDate(document.getElementById('coverageUntil'));
		
		validateDecimal(document.getElementById('insPremium'), 10, 0, '');
		validateDecimal(document.getElementById('coverage'), 10, 0, '');
		validateNumber(document.getElementById('vehicleAct'), 3, 0, false);
		
		
/* 		$('#coverageUntil').MonthPicker({
	        MonthFormat: 'M-y', // Short month name, Full year.
	        Button: '<img class="ui-datepicker-trigger" title="Select Month" src='+calendarImgPath+ '/>',
	        AltFormat: 'M-y', //result
	        onSelect: function(){
				$(this).focus();
			},
			OnAfterChooseMonth: function(){
				$('#coverageUntil').focus();
			}
	    });
		
		validateDateMMMYY(document.getElementById('coverageUntil')); 
*/
		
		$("[name='typeOfCustomer']").click(function() {
			if($(this).val()=='Personal'){
				$('#customerIndividual').show();
				$('#customerJuristic').hide();
			}else{
				$('#customerIndividual').hide();
				$('#customerJuristic').show();
			}
		});
		
		
		$("input:radio[name='typeOfCustomer']:first").attr("checked",true);
		$("input:radio[name='typeOfCustomer']:first").click();
	});
	
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="fis/WKV04110.js?t=${currentTimestamp}"/>

<form>
	<div id="screen-panel" class="container-fluid"">
		<div class="row py-2"> 
			<div class="col-4" style="text-align: left;">
				<label>Status&nbsp;: New</label>
			</div>
        	<div class="col-8" style="text-align: right;">
        		<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Submit"
							type="button" value="Submit" styleClass="button" secured="false" onClick=""/>
				<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Save"
							type="button" value="Save" styleClass="button" secured="false" onClick=""/>
				<sc2:button functionId="KV0312"  screenId="WKV03120" buttonId="WKV03120Reset"
							type="button" value="Reset" styleClass="button" secured="false" onClick=""/>
        	</div>
        </div>
       	<hr/>
       	<div class="row" style="height:510px; overflow: auto;"> 
        	<div class="col-12">
				<div class="row"> 
		        	<div class="col-12">
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
				        						<label for="typeOfPurchase" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Type of purchase&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="typeOfPurchase">
						                           <option>Financial</option>
						                           <option>Cash</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-8 col-12">
				        						<label for="fnCompany" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Leasing company&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="fnCompany">
						                           <option>Toyota Leasing</option>
						                           <option>KK</option>
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
				                       	</select>
		        					</div>
		        					<div class="col-md-2 col-12">
		        						<label for="insuranceClass" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Insurance Class&nbsp;:</label>
				                       	<select class="form-control form-control-sm MandatoryField" id="insuranceClass">
				                           <option>1st class</option>
				                           <option>2nd class</option>
				                           <option>3rd class</option>
				                       	</select>
		        					</div>
		        					<div class="col-md-2 col-12">
				                       <label for="insuranceType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Insurance Type&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="insuranceType">
				                           <option>T. Care</option>
				                           <option>None T. Care</option>
				                       </select>
				                    </div>
				                    <div class="col-md-2 col-12">
				                       <label for="premiumType" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Premium Type&nbsp;:</label>
				                       <select class="form-control form-control-sm MandatoryField" id="premiumType">
				                           <option>Convini</option>
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
		        						<label for="coverageUntil" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Coverage To Date&nbsp;:</label>
		        						<div class="d-flex flex-row">
		        							<input type="text" class="form-control form-control-sm MandatoryField" id="coverageUntil" maxlength="6">
		        						</div>
		        					</div>
		        					
		        					<div class="col-md-3 col-12">
		        						<label for="policyNo" class="mx-1 my-0">Temp Policy no.&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="tempPolicyNo" disabled>
		        					</div>
		        					<div class="col-md-3 col-12">
		        						<label for="policyNo" class="mx-1 my-0">Policy no.&nbsp;:</label>
		        						<input type="text" class="form-control form-control-sm" id="policyNo" disabled>
		        					</div>
		        					<div class="col-md-6 col-12">
		        						<label for="remark" class="mx-1 my-0">Remark&nbsp;:</label>
		        						<textarea class="form-control" id="remark" rows="3" maxlength="2000"></textarea>
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
		        						<div class="input-group col-12">Personal Delivery&nbsp;:&nbsp;&nbsp;
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="personalDelivery">Dealer</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Customer">
											  <label class="form-check-label" for="personalDelivery">Customer</label>
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
				        						<label for="gender" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Gender&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="gender">
						                           <option>Male</option>
						                           <option>Female</option>
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
				        						<label for="province" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="province">
						                       		<option>Select</option>
						                           	<option>Bangkok</option>
						                           	<option>XXXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="district" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="district">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="subDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="subDistrict">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="zipCode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="zipCode">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="telephone" class="mx-1 my-0">Telephone&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="telephone">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="personalDelivery">Same as address</label>
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
				        						<label for="province" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="province">
						                       		<option>Select</option>
						                           	<option>Bangkok</option>
						                           	<option>XXXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="district" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="district">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="subDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="subDistrict">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="zipCode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="zipCode">
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
		        						<div class="input-group col-12">Company Delivery&nbsp;:&nbsp;&nbsp;
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="personalDelivery">Dealer</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Customer">
											  <label class="form-check-label" for="personalDelivery">Customer</label>
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
				        					<div class="col-4">
				        						<label for="address1" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Name&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="address1">
				        					</div>
				        					<div class="col-4">
				        						<label for="address2" class="mx-1 my-0">Last Name&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm" id="address2">
				        					</div>
				        					<div class="col-4">
				        					</div>
				        				</div>
				        			</div>
				        			
				        			<div class="col-12">
					     				<div class="row">
					     					<div class="col-md-3 col-12">
				        						<label for="province" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="province">
						                       		<option>Select</option>
						                           	<option>Bangkok</option>
						                           	<option>XXXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="district" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="district">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="subDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="subDistrict">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="zipCode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="zipCode">
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="telephone" class="mx-1 my-0">Mobile&nbsp;:</label>
				                       			<input type="text" class="form-control form-control-sm" id="telephone">
				        					</div>
				        				</div>
				        			</div>
				        			<div class="col-12 py-2">
					                       	<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="personalDelivery" value="Dealer" checked="checked">
											  <label class="form-check-label" for="personalDelivery">Same as address</label>
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
				        						<label for="province" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Province&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="province">
						                       		<option>Select</option>
						                           	<option>Bangkok</option>
						                           	<option>XXXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-3 col-12">
				        						<label for="district" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="district">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
					     					<div class="col-md-2 col-12">
				        						<label for="subDistrict" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Sub District&nbsp;:</label>
						                       	<select class="form-control form-control-sm MandatoryField" id="subDistrict">
						                       		<option>Select</option>
						                           	<option>XXX</option>
						                       	</select>
				        					</div>
				        					<div class="col-md-2 col-12">
				        						<label for="zipCode" class="mx-1 my-0"><span class="MandatoryFieldFont">*</span>Zip Code&nbsp;:</label>
		        								<input type="text" class="form-control form-control-sm MandatoryField" id="zipCode">
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
			</div>
		</div>
	</div>
</form>