<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
</style>

<script type="text/javascript">
	$(function(){
		$('#ui-accordion-menu-header-0').click();
		$('#ui-accordion-menu-header-0').attr('tabindex','-1');
	});
</script>

<div class="container-fluid">
	<div class="row pt-2"> 
		 <div class="col-12">
	   		<h3 class="display-5" style="color: red;">This Month - Summary</h3>
	 	</div>
	</div>
	<div class="row px-4"> 
	 	<div class="col-12 border">
	 		<div class="row"> 
	 			<div class="col-3"><a href="${pageContext.request.contextPath}/NewCarInsurance">New</a></div>
	 			<div class="col-9">: <a href="${pageContext.request.contextPath}/NewCarInsurance">15</a></div>
	 			<div class="col-3"><a href="${pageContext.request.contextPath}/NewCarInsurance">Waiting activate</a></div>
	 			<div class="col-9">: <a href="${pageContext.request.contextPath}/NewCarInsurance">10</a></div>
	 			<div class="col-3"><a href="${pageContext.request.contextPath}/NewCarInsurance">Need more information</a></div>
	 			<div class="col-9">: <a href="${pageContext.request.contextPath}/NewCarInsurance">20</a></div>
	 			<div class="col-3"><a href="${pageContext.request.contextPath}/NewCarInsurance">Activated</a></div>
	 			<div class="col-9">: <a href="${pageContext.request.contextPath}/NewCarInsurance">1,100</a></div>
	 		</div>
		</div>
	</div>
</div>