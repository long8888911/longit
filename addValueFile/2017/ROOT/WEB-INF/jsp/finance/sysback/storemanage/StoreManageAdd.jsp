<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
	
<%@ include file="/WEB-INF/jsp/basebusiness/common/import/AddImport.jsp" %>

</head>

<body>
	
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>店铺新增</h1>
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<span>财务管理</span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span>店铺管理</span>
					<i class="fa fa-angle-right"></i>							
				</li>		
				<li>
					<span>店铺管理新增</span>
				</li>
			</ul>
		</div>		
				
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">																
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/storemanage/add" method="post" class='form-horizontal form-bordered form-validate1'>
					
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">店铺名称</label>
						<div class="col-sm-10">
							       
		<input type="text" id="storeName" value="${m.storeName}"; name="storeName" class="form-control  " data-rule-required="true" onblur="checkStoreName()">

						</div>
					</div>
					     
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">店铺编号</label>
						<div class="col-sm-10">
							       
		<input type="text" id="storeNo" value="${m.storeNo}"; name="storeNo" class="form-control  "  data-rule-required="true"  onblur="checkStoreNo()">

						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2">开票点编码</label>
						<div class="col-sm-10">

							<input type="text" id="orgCode" value="${m.orgCode}"; name="orgCode" class="form-control  "  data-rule-required="true">

						</div>
					</div>
					     
						<div class="form-actions col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value='保存'>
						<button type="button" class="btn cancel">取消</button>
					</div>	
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	
    function checkStoreName(){
        var storeName = $("#storeName").val();
        var flag = false;

        if(storeName){
			$.ajax({
				type: "POST",
				async: false,
				url: "${pageContext.servletContext.contextPath}/sysback/storemanage/checkStoreName",
				data:{
					"storeName":storeName,
					"uuid":""
				},
				dataType: "json",
				success: function(data){
					if (data == false) {
                        setError("storeName","店铺名称重复!");
                        flag =  false;
					}else{
                        setSuccess("storeName");
                        flag =  true;
                    }
				}
			});
		}
		return flag;
	}
	function checkStoreNo(){
        var storeNo = $("#storeNo").val();
        var flag = false;
        if(storeNo){
        	$.ajax({
                type: "POST",
                async: false,
                url: "${pageContext.servletContext.contextPath}/sysback/storemanage/checkStoreNo",
                data:{
                    "storeNo":storeNo,
                    "uuid":""
                },
                dataType: "json",
                success: function(data){
                    if (data == false) {
                        setError("storeNo","店铺编号重复!");
                        flag =  false;
                    }else{
                        setSuccess("storeNo");
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

    function saveStore(form){
        var checkStoreNameFlag = checkStoreName();
        if(!checkStoreNameFlag){
            return;
		}
        var checkStoreNoFlag = checkStoreNo();
        if(!checkStoreNoFlag){
            return;
		}

        var errorMsg = $(".has-error").text();
        if(errorMsg===""){
            form.submit();

        }
	}

    $(document).ready(function() {
		$(".cancel").click(function(){
			history.go(-1) ;
		});
    });

    $(function(){
        if ($('.form-validate1').length > 0) {
            $('.form-validate1').each(function() {
                var id = $(this).attr('id');  //获取表单的id
                $("#" + id).validate({   //验证表单
                    errorElement: 'span',  //输入错误时的提示标签
                    errorClass: 'help-block has-error',  //输入错误时的提示标签类名
                    errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
                        if(element.parents(".input-group").length > 0){
                            element.parents(".input-group").after(error);
                        }else if(element.parents(".y_validatainput").length > 0){
                            element.parents(".y_validatainput").after(error);
                        }
                        else if(element.parents("label").length > 0) {
                            element.parents("label").after(error);
                        }else {
                            element.after(error);
                        }
                    },
                    highlight: function(label) {   //输入错误时执行的事件
                        $(label).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
                    },
                    success: function(label) {   //输入正确时执行的事件
                        label.addClass('valid').closest('.form-group').removeClass('has-error has-success').addClass('has-success');
                    },
                    onkeyup: function(element) {   //验证元素输入值时按钮松开执行的事件
                        $(element).valid();
                    },
                    onfocusout: function(element) {   //验证元素失去焦点时进行验证
                        $(element).valid();
                    },
                    submitHandler: function(form){
                        saveStore(form) ;
                    }
                });
            });
        }
    })


</script>

<aebiz:showErrorMsg></aebiz:showErrorMsg>
