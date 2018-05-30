<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
	
<%@ include file="/WEB-INF/jsp/basebusiness/common/import/AddImport.jsp" %>
<!-- datepicker -->
	<link rel="stylesheet" href="/business/static/sysback/css/plugins/datepicker/datepicker.css">
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.datepicker.js"></script>
<!-- datepicker -->
</head>

<body>
	
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>开票公司新增</h1>
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
					<span>开票公司新增</span>
				</li>
			</ul>
		</div>		
				
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">																
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/invoicecompany/add" method="post" class='form-horizontal form-bordered form-validate'>						
					
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="invoicecompany.m.code"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								       
		<input type="text" id="code" value="${m.code}" name="code" class="form-control  " data-rule-required="true" data-rule-maxlength="32"/>
 
							</div>
						</div>
					</div>
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="invoicecompany.m.name"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								       
		<input type="text" id="name" value="${m.name}" name="name" class="form-control  " data-rule-required="true" data-rule-maxlength="100"/>
 
							</div>
						</div>
					</div>
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="invoicecompany.m.orgCode"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								       
		<input type="text" id="orgCode" value="${m.orgCode}" name="orgCode" class="form-control  " data-rule-required="true" data-rule-maxlength="100" onblur="checkOrgCode()"/>
 
							</div>
						</div>
					</div>
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="invoicecompany.m.address"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								       
		<input type="text" id="address" value="${m.address}" name="address" class="form-control  " data-rule-required="true" data-rule-maxlength="100" />
 
							</div>
						</div>
					</div>
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="invoicecompany.m.phone"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								       
		<input type="text" id="phone" value="${m.phone}" name="phone" class="form-control  " data-rule-required="true" data-rule-maxlength="20"/>
 
							</div>
						</div>
					</div>
					     
						<div class="form-actions col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"/>'>
						<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
					</div>	
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	
    $(document).ready(function() {
		$(".cancel").click(function(){
			history.go(-1) ;
		});
    });

    function checkOrgCode(){
        var orgCode = $("#orgCode").val();
        var flag = false;
        if(orgCode){
            $.ajax({
                type: "POST",
                async: false,
                url: "${pageContext.servletContext.contextPath}/sysback/invoicecompany/checkOrgCode",
                data:{
                    "orgCode":orgCode,
                    "uuid":""
                },
                dataType: "json",
                success: function(data){
                    if (data == false) {
                        setError("orgCode","开票点编码重复!");
                        flag =  false;
                    }else{
                        setSuccess("orgCode");
                        flag =  true;
                    }
                }
            });
        }
        return flag;
    }

    function setError(id,message){
        $("#"+id).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
        $("#"+id).closest('.form-group').find(".help-block.has-error").html(message);
    }
    function setSuccess(id){
        $("#"+id).find(".help-block.has-error").addClass('valid').closest('.form-group').removeClass('has-error has-success').addClass('has-success');
        $("#"+id).closest('.form-group').find(".help-block.has-error").html("");
    }
</script>

<aebiz:showErrorMsg></aebiz:showErrorMsg>
