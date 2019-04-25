<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="views" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<views:script src="json2.js"/>

<views:style src="tim/WKV05110.css"/>
<script>
	mappingPath = '${_mappingPath}';
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate pattern = "yyyyMMddmmss"  value="${now}" var="currentTimestamp" />

<views:script src="tim/WKV05110.js?t=${currentTimestamp}"/>
<div class="container-fluid" style="width: 85%;">
	<div class="row mt-3"> 
    	<div class="col-12">
			<div class="card px-4 py-4">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
			  		<li class="nav-item">
			    		<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Template</a>
			  		</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Import</a>
				  	</li>
			  		<li class="nav-item">
			    		<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Export</a>
			  		</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div class="row">
					  		<div class="pt-4 pb-2 col-12 input-group">
								<label class="control-label" for="importType"><span class="MandatoryFieldFont">*</span>Excel Template Type &nbsp;:&nbsp;</label>
							    <select class="form-control form-control-sm MandatoryField" id="importType">
			                    	<option>1st year INS Sales Premium (Normal/TLT Exclusive and etc.)</option>
			                        <option>Import Transfer Premium</option>
			                        <option>No Claim Bonus Premium(NCB)</option>
			                        <option>Status of issued INS Policy</option>
			                    </select>
					        </div>  
							<div class="col-12" style="text-align: right;"> 
		                    	<sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110DownloadTemplate"
										type="button" value="Download"
										styleClass="button" secured="false" onClick=""/>
							</div> 
						</div>
				  	</div>
				  	<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				  		<div class="row">
				  			<div class="pt-4 col-12 input-group">
								<label class="control-label" for="importType"><span class="MandatoryFieldFont">*</span>Excel Template Type &nbsp;:&nbsp;</label>
						    	<select class="form-control form-control-sm MandatoryField" id="importType">
		                        	<option>1st year INS Sales Premium (Normal/TLT Exclusive and etc.)</option>
		                           	<option>Import Transfer Premium</option>
		                           	<option>No Claim Bonus Premium(NCB)</option>
		                           	<option>Status of issued INS Policy</option>
		                       	</select> 
				           	</div> 
				            <div class="py-2 col-12 input-group"> 
				            	<spring:message code="KV0.WKV01110.Label.BtnBrowse" var="WKV05110Browse" />
				            	<label class="control-label" for="importFile"><span class="MandatoryFieldFont">*</span>Excel File Upload &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;</label>					
								<sc2:button functionId="KV0511" screenId="WKV05110"
											buttonId="WKV05110Browse" type="file" value="${WKV05110Browse}"
											styleClass="button form-control form-control-sm form-control-sm-file MandatoryField"
											onClick="" /> 
							</div> 
							<div class="col-12" style="text-align: right;"> 
							   <spring:message code="KV0.WKV01110.Label.BtnUpload" var="WKV05110Upload" />
		                       <sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110Upload"
									type="button" value="${WKV05110Upload}"
									styleClass="button" secured="false" onClick=""/>
							</div>
						</div>
				  	</div>
				  	<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
				  		<div class="row">
				  			<div class="pt-4 pb-2 col-12 input-group"> 
				        		<label class="control-label" for="importType"><span class="MandatoryFieldFont">*</span>Excel Template Type &nbsp;:&nbsp;</label>
								<select class="form-control form-control-sm MandatoryField" id="exportType">
					            	<option>1st year INS Sales Daily</option>
					                <option>Renewal Insurance Sales Daily</option>
					            </select>
							</div> 
							<div class="col-12" style="text-align: right;"> 
				            	<sc2:button functionId="KV0511"  screenId="WKV05110" buttonId="WKV05110Export"
											type="button" value="Export"
											styleClass="button" secured="false" onClick=""/>
							</div> 
						</div>
				  </div>
				</div>
		  	</div>
		</div>
	</div>
</div>