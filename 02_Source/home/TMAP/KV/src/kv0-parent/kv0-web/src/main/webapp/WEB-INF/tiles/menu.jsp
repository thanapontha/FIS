<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sc2" uri="/WEB-INF/tld/sc2.tld"%>

<div id="left-menu-panel">

	<!-- Declare variables for EL use -->
	<spring:message code="imagepath" var="rootimagepath" />
	<spring:message code="ST3.menu.group.master" var="groupMaster" />
	<spring:message code="ST3.menu.master.item.system" var="itemSystemMaster" />
	<spring:message code="ST3.menu.master.item.batch" var="itemBatchMaster" />
	<spring:message code="ST3.menu.group.common" var="groupCommon" />
	<spring:message code="ST3.menu.sub.group.monitoring" var="subGroupMonitoring" />
	<spring:message code="ST3.menu.common.item.log" var="itemLogMonitoring" />
	<spring:message code="ST3.menu.common.item.excelDownloadMonitoring" var="itemExcelDownloadMonitoring"/>
	<spring:message code="ST3.menu.common.item.batchstatus" var="itemBatchStatusMonitoring" />
	<spring:message code="ST3.menu.sub.group.download" var="subGroupDownload" />
	<spring:message code="ST3.menu.common.item.excelDownload" var="itemExcelDownload" />
	<spring:message code="ST3.menu.group.help" var="groupHelp" />
	<spring:message code="ST3.menu.help.item.applicationAbout" var="itemApplicationAbout" />

	<spring:message code="KV0.menu.group.NewCar" var="groupNewCar" />
	<spring:message code="KV0.menu.sub.group.common.InsCompany" var="subGroupInsCompany" />

	<spring:message code="KV0.menu.NewCar.item.NewCarInquiryScreen" var="itemNewCarInquiry" />
	<spring:message code="KV0.menu.item.InsCompImportExportScreen" var="itemInsCompImportExport" />
	
	<!-- Create the Menu -->
	<sc2:menu idContainer="menu-container" idMenu="menu"
		onClick="ST3Lib.menu.toggleLock()?[$('> #unpin' ,this).hide(),$('> #pin' ,this).show() ]:[$('> #pin' ,this).hide(),$('> #unpin' ,this).show() ];"
		srcImgUnpin="${pageContext.request.contextPath}${rootimagepath}icons/unpin.png"
		srcImgPin="${pageContext.request.contextPath}${rootimagepath}icons/pin.png">
		
		<!-- Application module -->
		<sc2:menuGroup groupId="KV0100" title="${groupNewCar}">
			<!-- Define Menu Item -->
			<sc2:menuItem screenId="WKV03110" href="${pageContext.request.contextPath}/NewCarInsurance" target="WKV03110">${itemNewCarInquiry}</sc2:menuItem>
		</sc2:menuGroup>
		
		<sc2:menuGroup groupId="KV0500" title="${subGroupInsCompany}">
			<!-- Define Menu Item -->
			<sc2:menuItem screenId="WKV05110" href="${pageContext.request.contextPath}/InsuranceCompany" target="WKV05110">${itemInsCompImportExport}</sc2:menuItem>
		</sc2:menuGroup>

		<!-- Define the Group Menu -->
		<sc2:menuGroup groupId="ST3001" title="${groupMaster}">
			<!-- Define Menu Item -->
			<sc2:menuItem screenId="WST33060" href="${pageContext.request.contextPath}/master/systemMaster" target="WST33060">${itemSystemMaster}</sc2:menuItem>
			<!--
			<sc2:menuItem screenId="WST33040" href="${pageContext.request.contextPath}/master/batchMaster" target="WST33040">${itemBatchMaster}</sc2:menuItem>

			<sc2:menuSubGroup subGroupId="ST30011" title="${subGroupKaikiengMaster}">
				<sc2:menuItem screenId="WKV04110" href="${pageContext.request.contextPath}/master/vehiclePlant" target="WKV04110">${itemVehiclePlant}</sc2:menuItem>
				<sc2:menuItem screenId="WKV04120" href="${pageContext.request.contextPath}/master/unitPlant" target="WKV04120">${itemUnitPlant}</sc2:menuItem>
				<sc2:menuItem screenId="WKV04130" href="${pageContext.request.contextPath}/master/vehicleUnitRelation" target="WKV04130">${itemVehicleUnitRelation}</sc2:menuItem>
			</sc2:menuSubGroup>
			<sc2:menuSubGroup subGroupId="ST30012" title="${subGroupRundownandUnitMaster}">
				<sc2:menuItem screenId="WKV04210" href="${pageContext.request.contextPath}/master/calendar" target="WKV04210">${itemCalendar}</sc2:menuItem>
				<sc2:menuItem screenId="WKV04230" href="${pageContext.request.contextPath}/master/standardStock" target="WKV04230">${itemStandardStock}</sc2:menuItem>
				<sc2:menuItem screenId="WKV04240" href="${pageContext.request.contextPath}/master/unitPlantCapacity" target="WKV04240">${itemUnitPlantCapacity}</sc2:menuItem>
			</sc2:menuSubGroup>
			-->
		</sc2:menuGroup>
		
		<sc2:menuGroup groupId="ST3002" title="${groupCommon}">
			<sc2:menuSubGroup subGroupId="ST30021" title="${subGroupMonitoring}">
				<sc2:menuItem screenId="WST33010" href="${pageContext.request.contextPath}/common/logMonitoring" target="WST33010">${itemLogMonitoring}</sc2:menuItem>
				<sc2:menuItem screenId="WST33020" href="${pageContext.request.contextPath}/common/excelDownloadMonitoring" target="WST33020">${itemExcelDownloadMonitoring}</sc2:menuItem>
				<!--<sc2:menuItem screenId="WST33050" href="${pageContext.request.contextPath}/common/batchStatus" target="WST33050">${itemBatchStatusMonitoring}</sc2:menuItem> -->
			</sc2:menuSubGroup>
			
			<!--
 			<sc2:menuSubGroup subGroupId="ST30022" title="${subGroupDownload}">
				<sc2:menuItem screenId="WST30900" href="${pageContext.request.contextPath}/common/excelDownload" target="WST30900">${itemExcelDownload}</sc2:menuItem>
			</sc2:menuSubGroup>
			-->
			
		</sc2:menuGroup>
		<!--
		<sc2:menuGroup groupId="ST3003" title="${groupHelp}">
			<sc2:menuItem screenId="WST30300" href="${pageContext.request.contextPath}/common/about" target="WST30300">${itemApplicationAbout}</sc2:menuItem>
			<sc2:menuItem screenId="WST30070" href="${pageContext.request.contextPath}/common/test" target="WST3007Test">API Test</sc2:menuItem>  
		</sc2:menuGroup>
		-->
	</sc2:menu>
</div>
