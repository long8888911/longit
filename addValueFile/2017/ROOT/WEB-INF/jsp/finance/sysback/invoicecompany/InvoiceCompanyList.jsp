<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/basebusiness/common/import/ListImport.jsp" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
					<span>开票公司管理</span>
				</li>						
			</ul>				
		</div>				
							
		<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-content nopadding y_tableser">
							<div class="y_clear">
								<div class="form-inline table_formnew">
								  
									<div  class="form-group">
										<label class="control-label"><aebiz:showTitle titleId="invoicecompany.m.code"/>：</label>
										       
		<input type="text" id="code" value="${m.code}" name="code" class="form-control " />
 
									</div>
									  
									<div  class="form-group">
										<label class="control-label"><aebiz:showTitle titleId="invoicecompany.m.name"/>：</label>
										       
		<input type="text" id="name" value="${m.name}" name="name" class="form-control "/>
 
									</div>
									  
									<div  class="form-group">
										<label class="control-label"><aebiz:showTitle titleId="invoicecompany.m.orgCode"/>：</label>
										       
		<input type="text" id="orgCode" value="${m.orgCode}" name="orgCode" class="form-control " maxlength="100"/>
 
									</div>

									<div  class="form-group">
										<label class="control-label"><aebiz:showTitle titleId="invoicecompany.m.phone"/>：</label>
										       
		<input type="text" id="phone" value="${m.phone}" name="phone" class="form-control " maxlength="20"/>
 
									</div>
									  
									
									
									<div class="form-group">
										<button class="btn btn-primary search" title="查询" rel="tooltip">查询</button>
										<button class="btn" onclick="javascript:clearSearch();" title="<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
										<button class="btn" id="searchshow" title="高级查询" rel="tooltip" data-toggle="modal" data-target="#modal-user" style="display:none;">高级查询</button>
									</div>
								</div>
								<div class="y_tablebtn">
								<shiro:hasPermission name='sysback:invoicecompany:button:add or sysback:button:*'>
									<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/invoicecompany/toAdd" title="<aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/></a>
								</shiro:hasPermission>
								<shiro:hasPermission name='sysback:invoicecompany:button:delete or sysback:button:*'>
									<button class="btn" onclick="javascript:removes('');" title="<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></button>
								</shiro:hasPermission>
								</div>
						</div>
						
						<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
							<thead>		
								<tr>
									<th class='with-checkbox'>
										<input type="checkbox" name="check_all" id="check_all">
									</th>
									 
									<th><aebiz:showTitle titleId="invoicecompany.m.code"/></th>
									 
									<th><aebiz:showTitle titleId="invoicecompany.m.name"/></th>
									 
									<th><aebiz:showTitle titleId="invoicecompany.m.orgCode"/></th>
									 
									<th><aebiz:showTitle titleId="invoicecompany.m.address"/></th>
									 
									<th><aebiz:showTitle titleId="invoicecompany.m.phone"/></th>
									 
									
									
									<th class='hidden-480'><aebiz:showTitle titleId="basebusiness.showmessage.operate"/></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>		
				</div>
			</div>	
		</div>
	</div>
	
		<!--高级搜索-->
		<div id="modal-user" class="modal fade y_highserch">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="user-infos">高级查询</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							
						 
					</div>													
					<div class="modal-footer">
						<button class="btn moresearch btn-primary" data-dismiss="modal">查询</button>
						<button class="btn clearMoreSearch" ><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
					</div>
				</div>
			</div>
		</div>
		<!--高级搜索-->
</body>
</html>

<script>
function retrieveData(sSource,aoData,fnCallback) { 
	var searchParam = new Array() ;
	
	 
	searchParam.push({ "name": "code", "value": $.trim($("#code").val())});
	searchParam.push({ "name": "code_q", "value":"EQ"});
	 
	searchParam.push({ "name": "name", "value": $.trim($("#name").val())});
	searchParam.push({ "name": "name_q", "value":"EQ"});
	 
	searchParam.push({ "name": "orgCode", "value": $.trim($("#orgCode").val())});
	searchParam.push({ "name": "orgCode_q", "value":"EQ"});

	searchParam.push({ "name": "address", "value": $.trim($("#address").val())});
	searchParam.push({ "name": "address_q", "value":"EQ"});
	 
	searchParam.push({ "name": "phone", "value": $.trim($("#phone").val())});
	searchParam.push({ "name": "phone_q", "value":"EQ"});
	 
	
	
	 			
	
   $.ajax({    	        
  	"dataType": 'json', 
	  "type": "POST", 
	  "url": sSource, 
	  "data": {aoData:JSON.stringify(aoData),searchParam:JSON.stringify(searchParam)}, 
	  "success": fnCallback
  });    
} 
    
var oTable = null; 
function doSearch(operact) {	
	if(oTable == null) {		 
    if ($('.dataTable').length > 0) {
        $('.dataTable').each(function() {            
                var opt = {
				            "sPaginationType": "full_numbers",
				            "oLanguage": {
				            		"sProcessing": "加载中..",
				                "sSearch": "<span>查询:</span> ",
				                "sInfo": "从第 <span>_START_</span> 条到 <span>_END_</span> 条,总计: <span>_TOTAL_</span> 条",
				                "sLengthMenu": "_MENU_ <span>条/页</span>" ,
				                "oPaginate": {
				                 	"sFirst": "首页",
				                  "sPrevious": "上一页",
				                  "sNext": "下一页",
				                  "sLast": "末页"
				                }
				            },
				            
				            //'sDom': "lfrtip",
				            'sDom': "rtlip",
				            //"sDom": '<"top"l>rt<"bottom"ip><"clear">',            
				            'aoColumnDefs': [{
				                'bSortable': false,
				                'aTargets': [0,6]                
				            }],
				            "bSort": true, //排序功能            
					         	"aoColumns": [
										  {
										  	"mDataProp":"checkbox" ,
										  	"sDefaultContent":"",
										  	"fnRender": function(obj) {
										      var sReturn = "<input type='checkbox' name='check' value='"+obj.aData.uuid+"' />";						      
										      return sReturn;
										 		}
										  },
										   
											{"mDataProp":"code" ,"sTitle": "<aebiz:showTitle titleId="invoicecompany.m.code"/>"},
											 
											{"mDataProp":"name" ,"sTitle": "<aebiz:showTitle titleId="invoicecompany.m.name"/>"},
											 
											{"mDataProp":"orgCode" ,"sTitle": "<aebiz:showTitle titleId="invoicecompany.m.orgCode"/>"},
											 
											{"mDataProp":"address" ,"sTitle": "<aebiz:showTitle titleId="invoicecompany.m.address"/>"},
											 
											{"mDataProp":"phone" ,"sTitle": "<aebiz:showTitle titleId="invoicecompany.m.phone"/>"},
											 
											
										  {
										  	"mDataProp":"operate",
										  	"sDefaultContent":"",
										  	"sTitle": "<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>" ,
										 	"fnRender": function(obj) {
												var sReturn = "";
													<shiro:hasPermission name='sysback:invoicecompany:button:edit or sysback:button:*'>
														  sReturn = "<a href='${pageContext.servletContext.contextPath}/sysback/invoicecompany/toUpdate/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='编辑'>编辑</a>" ;
													</shiro:hasPermission>
													<shiro:hasPermission name='sysback:invoicecompany:button:delete or sysback:button:*'>
															sReturn += "<a href='javascript:removes(\""+obj.aData.uuid+"\");' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>'><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></a>" ;
													</shiro:hasPermission>
											    return sReturn;
											 }			
										  }
										],
										
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/invoicecompany/queryList" ,
										"fnServerData":retrieveData,           //获取数据的处理函数  
				        };
				        
                		if ($(this).hasClass("dataTable-reorder")) {
		                    opt.sDom = "R" + opt.sDom;
		                }
		                oTable = $(this).dataTable(opt);
        	});
   		}         
	}
	//刷新Datatable，会自动激发retrieveData  		
  	if('inittable' != operact) {  			
		oTable.fnDraw(); 	
	}  
}

$(".search").click(function(){	
	//普通搜索需要<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>高级搜索的选项
	clearMoreSearch();
	doSearch('search') ;
})

//高级搜索
$(".moresearch").click(function(){
	//高级搜索需要<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>普通搜索的选项
	clearSearch() ;
	doSearch('search') ;
})


function clearSearch() {
	 
	$("#code").val("") ;
	 
	$("#name").val("") ;
	 
	$("#orgCode").val("") ;

	$("#address").val("") ;
	 
	$("#phone").val("") ;
	 
	
}

//<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>高级搜索的所有选项
function clearMoreSearch() {
	 
}



//<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>
function removes(delId) {
		var checkIds="";
		if( delId.trim() != "") {
			checkIds = delId ;
		}else{
			$("input[name='check']:checkbox").each(function(){				
        if($(this).is(":checked")){        	
            checkIds += $(this).val()+"," ;  
        }
    	})	
		}
		
		if(checkIds.trim() == "") {
				//提示为空
				bootbox.alert("请您选择所要<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>的数据！") ;
				return ;
		} 
		
		bootbox.confirm("您确定<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>所选择的数据吗?", function(r){
        	if(r) {
        		//<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>
				$.post(
			    	"${pageContext.servletContext.contextPath}/sysback/invoicecompany/deletes",
			    	{"selectOne":checkIds,ranNum:Math.random()},	
				    function(data) {	       
				       var result = eval("("+data+")") ;	       
				       if(result.rsp) {
							doSearch('search') ;     	
				       }else{
				       		bootbox.alert('对不起，<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>失败，请重新<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>！') ;
				       }
				    }
				);		
        	}   
    });   
}



$(document).ready(function() {
	 //初始化表格
  	 doSearch('inittable') ;
  	 //复选框全选
	 $("#check_all").click(function(e) {
	 		$('input', oTable.fnGetNodes()).prop('checked', this.checked);
	 });   
	 
	   	 //<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>高级查询
	 $(".clearMoreSearch").click(function(e){    	
			clearMoreSearch();
	 });    
	
}) 
</script>
