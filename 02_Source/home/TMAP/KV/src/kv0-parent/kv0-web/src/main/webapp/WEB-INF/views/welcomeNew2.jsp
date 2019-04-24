<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sc2nav" uri="/WEB-INF/tld/sc2nav.tld"%>
<style>
	.badge1 {
		position:relative;
	}
	
	.badge1[data-badge]:after {
		content:attr(data-badge);
		position:absolute;
		font-family: arial, sans-serif;
		font-weight: bold;
		font-size:.7em;
		right: -10px;
		line-height: 16px;
		height: 16px;width: 30px;
		padding: 0 5px;
		font-family: Arial, sans-serif;
		text-shadow: 0 1px rgba(0, 0, 0, 0.25);
		border: 1px solid;
		border-radius: 10px;
		-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), 0 1px 1px rgba(0, 0, 0, 0.08);
		box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), 0 1px 1px rgba(0, 0, 0, 0.08);
		
		color: white;
		background: #fa623f;
		border-color: #fa5a35;
		background-image: -webkit-linear-gradient(top, #fc9f8a, #fa623f);
		background-image: -moz-linear-gradient(top, #fc9f8a, #fa623f);
		background-image: -o-linear-gradient(top, #fc9f8a, #fa623f);
		background-image: linear-gradient(to bottom, #fc9f8a, #fa623f);
		
	}
</style>

<script type="text/javascript">
</script>
	
<c:if test="${isApplicationUser == false }">
	<script type="text/javascript">
	(function($){
		$(document).ready(function() {
			var realConfirm = window.confirm;
			window.confirm = null;
			
			function UnPopIt()  { /* nothing to return */ }
			
			var dialogOption = {
					width		: 450,
					buttons		: 
						[{
					        text: '<spring:message code="STD.dialog.ok" />' ,
					        click: function() {
					        	var self = $(this);
					        	self.siblings('.ui-dialog-buttonpane').find('input,button').prop('disabled', true);
								self.dialog('close');
								
								window.onbeforeunload = null;
								$("#left-menu-panel").remove();
								var win=open("","_self", "");
								win.close();
					        }
					    }]	
				};
			ST3Lib.dialog.confirm('<spring:message code="MSTD0012AERR" arguments="Employee No. of User login, Employee Master." />', 'MSTD0012AERR', dialogOption);
		});
	})(ST3Lib.$);;
	</script>
</c:if>

<spring:message code="imagepath" var="imagepath" />
<spring:message code="KV0.Activities.Reminder1" var="ActivitiesReminder1" />
<spring:message code="KV0.Activities.Reminder2" var="ActivitiesReminder2" />
<spring:message code="KV0.Activities.Reminder3" var="ActivitiesReminder3" />
<spring:message code="KV0.Activities.Reminder4" var="ActivitiesReminder4" />

<div class="container-fluid">
	<div class="row"> 
	 	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	 		<div class="form-row center">
	 			<sc2nav:menuImage type="groupId" groupId="KV0300" styleColDiv="pt-3 pb-1 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="my-1 textMenuImage"
	 				href="NewCarInsurance" title="${ActivitiesReminder1}" src="${imagepath}images/tim/New_Car_Insurance.png" dataBadge="45" badgeStyle="badge1">
	 			</sc2nav:menuImage>
	 			<sc2nav:menuImage type="groupId" groupId="KV0400" styleColDiv="pt-3 pb-1 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="my-1 textMenuImage"
	 				href="NewCarInsurance" title="${ActivitiesReminder2}" src="${imagepath}images/tim/Insurance_Renewal.png">
	 			</sc2nav:menuImage>
	 			<sc2nav:menuImage type="groupId" groupId="KV0500" styleColDiv="pt-3 pb-1 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="my-1 textMenuImage"
	 				href="NewCarInsurance" title="${ActivitiesReminder3}" src="${imagepath}images/tim/Insurance_Company.png" dataBadge="32" badgeStyle="badge1">
	 			</sc2nav:menuImage>
	 			<sc2nav:menuImage type="groupId" groupId="KV0600" styleColDiv="pt-3 pb-1 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="my-1 textMenuImage"
	 				href="NewCarInsurance" title="${ActivitiesReminder4}" src="${imagepath}images/tim/Management.png" dataBadge="19" badgeStyle="badge1" >
	 			</sc2nav:menuImage>
            </div>
		</div>
	</div>
</div>