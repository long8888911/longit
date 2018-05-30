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
				<h1>店铺管理</h1>
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
					<span>店铺管理</span>
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
										<label class="control-label">店铺名称：</label>
										       
										<input type="text" id="storeName" value="${m.storeName}"; name="storeName" class="form-control " >

									</div>
									  
									<div  class="form-group">
										<label class="control-label">店铺编号：</label>
										       
										<input type="text" id="storeNo" value="${m.storeNo}"; name="storeNo" class="form-control " >

									</div>

									<div  class="form-group">
										<label class="control-label">开票点编码：</label>

										<input type="text" id="orgCode" value="${m.orgCode}"; name="orgCode" class="form-control " >

									</div>
									
									<div class="form-group">
										<button class="btn btn-primary search" title="查询" rel="tooltip">查询</button>
										<button class="btn" onclick="javascript:clearSearch();" title="清空" rel="tooltip">清空</button>
									</div>
								</div>
								<div class="y_tablebtn">

								<shiro:hasPermission name='sysback:storemanage:button:add or sysback:button:*'>
									<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/storemanage/toAdd" title="新增" rel="tooltip">新增</a>
								</shiro:hasPermission>
								<shiro:hasPermission name='sysback:storemanage:button:deletes or sysback:button:*'>
									<button class="btn" onclick="javascript:removes('');" title="删除" rel="tooltip">删除</button>
								</shiro:hasPermission>
								</div>
						</div>
						
						<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
							<thead>		
								<tr>
									<th class='with-checkbox'>
										<input type="checkbox" name="check_all" id="check_all">
									</th>
									 
									<th>店铺名称</th>
									 
									<th>店铺编号</th>

									<th>开票点编码</th>
									
									<th class='hidden-480'>操作</th>
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
</body>
</html>

<script>
function retrieveData(sSource,aoData,fnCallback) { 
	var searchParam = new Array() ;
	
	 
	searchParam.push({ "name": "storeName", "value": $.trim($("#storeName").val())});
	searchParam.push({ "name": "storeName_q", "value":"Like"});
	 
	searchParam.push({ "name": "storeNo", "value": $.trim($("#storeNo").val())});
	searchParam.push({ "name": "storeNo_q", "value":"Like"});

    searchParam.push({ "name": "orgCode", "value": $.trim($("#orgCode").val())});
    searchParam.push({ "name": "orgCode_q", "value":"Like"});
	
	 			
	
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
				                'aTargets': [0,1,2,3,4]
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
										   
											{"mDataProp":"storeName" ,"sTitle": "店铺名称"},
											 
											{"mDataProp":"storeNo" ,"sTitle": "店铺编号"},

									        {"mDataProp":"orgCode" ,"sTitle": "开票点编码"},

										  {
										  	"mDataProp":"operate",
										  	"sDefaultContent":"",
										  	"sTitle": "操作" ,
										 	"fnRender": function(obj) {
                                                var sReturn = "";
													<shiro:hasPermission name='sysback:storemanage:button:edit or sysback:button:*'>
														sReturn += "<a href='${pageContext.servletContext.contextPath}/sysback/storemanage/toUpdate/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='编辑'>编辑</a>" ;
													</shiro:hasPermission>

													<shiro:hasPermission name='sysback:storemanage:button:deletes or sysback:button:*'>
											  			sReturn += "<a href='javascript:removes(\""+obj.aData.uuid+"\");' class='btn' rel='tooltip' title='删除'>删除</a>" ;
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
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/storemanage/queryList" ,
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
	//普通搜索需要清空高级搜索的选项
	clearMoreSearch();
	doSearch('search') ;
})

//高级搜索
$(".moresearch").click(function(){
	//高级搜索需要清空普通搜索的选项
	clearSearch() ;
	doSearch('search') ;
})


function clearSearch() {
	 
	$("#storeName").val("") ;
	 
	$("#storeNo").val("") ;

    $("#orgCode").val("") ;
}

//清空高级搜索的所有选项
function clearMoreSearch() {
	 
}



//删除
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
				bootbox.alert("请您选择所要删除的数据！") ;
				return ;
		} 
		
		bootbox.confirm("您确定删除所选择的数据吗?", function(r){
        	if(r) {
        		//删除
				$.post(
			    	"${pageContext.servletContext.contextPath}/sysback/storemanage/deletes",
			    	{"selectOne":checkIds,ranNum:Math.random()},	
				    function(data) {	       
				       var result = eval("("+data+")") ;	       
				       if(result.rsp) {
							doSearch('search') ;     	
				       }else{
				       		bootbox.alert('对不起，操作失败，请重新操作！') ;
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
	 
	   	 //清空高级查询
	 $(".clearMoreSearch").click(function(e){    	
			clearMoreSearch();
	 });    
	
}) 
</script>
