<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/SuccessImport.jsp" %>

</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>开票公司管理</h1>
			</div>
		</div>
		
		<div class="breadcrumbs">
			<ul>
				<li>
					<span><aebiz:showTitle titleId="invoicecompany.menu1"/></span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span><aebiz:showTitle titleId="invoicecompany.menu2"/></span>
					<i class="fa fa-angle-right"></i>							
				</li>							
				<li>
					<span>操作开票公司成功</span>
				</li>						
			</ul>					
		</div>
		
		<div class="y_masuccess">
			<span class="y_succpic text-success"><img src="/static/sysback/img/text-success.png" alt=""></span>
			<div class="y_succms">
				<h2 class="text-success" style="padding:11px 0px 0px 0px">
					<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>成功
				</h2>
			</div>
				<p class="y_successtext">
					<a class="btn btn-primary" href="#">恭喜您<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>成功!</a>  <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/sysback/invoicecompany/toList">返回</a>
				</p>	
		</div>
	</div>
</body>

</html>
