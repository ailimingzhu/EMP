<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {

      $("#tab").datagrid({
    	  url:"getEmp",
    	  method:"post",
    	  pagination:true,
    	  toolbar:"#bar",
    	
    	  queryParams:{
    		 ename:$("#ename").val(),
    		 esex:$("#esex").val(),
    		 startSale:$("#startSale").val(),
    		 endSale:$("#endSale").val()
    		  
    	  }
      });
	}
	function formatterCaozuo(value,row,index) {
		return "<a href='javascript:void(0) ' onclick='edit("+index+")'>修改</a> <a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a> <a href='javascript:void(0)' onclick='del("+index+")'>刪除</a>";
	}
	
	function   edit(index) {
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
		$("#editFrm").form("load",row);
		$("#editDialog").dialog("open");
	}
	function saveEdit() {
		$.post("updateEmp",{
			 id:$("#editid").val(),
			 ename:$("#editename").val(),
	   		 esex:$("#editesex").val(),
	   		 eage:$("#editeage").val(),
	   		 sale:$("#editsale").val()
	   		  
		},function(res){
			if(res>0){
				$("#tab").datagrid("reload");
				$("#editDialog").dialog("close");
				$.messager.alert("提示","修改成功");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json");
	}
	function closeEdit() {
		$("#editDialog").dialog("close");
	}
	function del(index) {
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm("提示","确定删除吗?",function(r){
			if(r){
				$.post("deleteEmp",{
					id:row.id
				},function(res){
					if(res>0){
						$("#tab").datagrid("reload");
						$.messager.alert("提示","删除成功");
						
					}else{
						$.messager.alert("提示","删除失败");

					}
				},"json");
			}
		})
		
	}
	function chakan(index) {
		var data=$("#tab").datagrid("getData");
		var row=data.rows[index];
	    $("#lookFrm").form("load",row);
	    $("#lookDialog").dialog("open");
	}
	function closeChakan() {
		$("#lookDialog").dialog("close");
	}
	
	function add() {
		$("#addDialog").dialog("open");
	}
	function saveAdd() {
		$.post("addEmp",{
			 ename:$("#addename").val(),
	   		 esex:$("#addesex").val(),
	   		 eage:$("#addeage").val(),
	   		 sale:$("#addsale").val()
		},function(res){
			if(res>0){
				$("#tab").datagrid("reload");
				$("#addDialog").dialog("close");
				$.messager.alert("提示","添加成功");
			}else{
				$.messager.alert("提示","添加失败");

			}
		},"json");
	}
	function closeAdd() {
		$("#addDialog").dialog("close");
	}
</script>


<body>
	<div id="bar">
	  <form id="ff" class="easyui-form">   
		     <a href="javascript:void(0) " class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加</a>
		        <label for="name">Name:</label>   
		        <input class="easyui-validatebox" type="text" id="ename" data-options="required:true" />   
		<label for="name">sex:</label>   
		        <input class="easyui-validatebox" type="text" id="esex" data-options="required:true" />   
		   <label for="name">startSale:</label>   
		        <input class="easyui-validatebox" type="text" id="startSale" data-options="required:true" />     
	   <label for="name">endSale:</label>   
		        <input class="easyui-validatebox" type="text" id="endSale" data-options="required:true" />   
	   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="init()">搜索</a>
	    </form> 
	</div>
	<table id="tab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id',title:'ID',width:100"></th>
				<th data-options="field:'ename',title:'姓名',width:100"></th>
				<th data-options="field:'esex',title:'性别',width:100"></th>
				<th data-options="field:'eage',title:'年龄',width:100"></th>
				<th data-options="field:'sale',title:'工资',width:100"></th>
				<th data-options="field:'caozuo',width:100,title:'操作',formatter:formatterCaozuo"></th>
			</tr>
		</thead>
	</table>
	<!-- 修改的对话框 -->
	<div id="editDialog" class="easyui-dialog" style="width:400px;height:250px;padding:10px;" data-options="modal:true,title:'修改',closed:true">
		<form class="easyui-form" id="editFrm">
			<table cellpadding="5" >
				<tr>
					<td>
						<label for="name">ID:</label>
					</td>
					<td>
						 <input disabled="disabled" class="easyui-validatebox" type="text" id="editid" name="id" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editename" name="ename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性別:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editesex" name="esex" data-options="required:true" />
					</td>
				</tr>
				<!-- <tr>
					<td>
						<label for="name">出生日期:</label>
					</td>
					<td>
						<input class="easyui-datebox" type="text" id="editbir" name="bir" data-options="required:true" />
					</td>
				</tr> -->
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editeage" name="eage" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editsale" name="sale" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="saveEdit()">保存</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeEdit()">取消</a>
					
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	
	<!-- 查看的对话框 -->
	<div id="lookDialog" class="easyui-dialog" style="width:400px;height:250px;padding:10px;" data-options="modal:true,title:'修改',closed:true">
		<form class="easyui-form" id="lookFrm">
			<table cellpadding="5" >
				<tr>
					<td>
						<label for="name">ID:</label>
					</td>
					<td>
						 <input disabled="disabled" class="easyui-validatebox" type="text" id="editid" name="id" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editename" name="ename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性別:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editesex" name="esex" data-options="required:true" />
					</td>
				</tr>
				<!-- <tr>
					<td>
						<label for="name">出生日期:</label>
					</td>
					<td>
						<input class="easyui-datebox" type="text" id="editbir" name="bir" data-options="required:true" />
					</td>
				</tr> -->
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editeage" name="eage" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="editsale" name="sale" data-options="required:true" />
					</td>
				</tr>
				<tr>
					
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeChakan()">取消</a>
					
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	
	<!-- 添加的对话框 -->
	<div id="addDialog" class="easyui-dialog" style="width:400px;height:250px;padding:10px;" data-options="modal:true,title:'修改',closed:true">
		<form class="easyui-form" id="addFrm">
			<table cellpadding="5" >
				<tr>
					<td>
						<label for="name">ID:</label>
					</td>
					<td>
						 <input class="easyui-validatebox" type="text" id="addid" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="addename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性別:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="addesex" data-options="required:true" />
					</td>
				</tr>
				<!-- <tr>
					<td>
						<label for="name">出生日期:</label>
					</td>
					<td>
						<input class="easyui-datebox" type="text" id="editbir" name="bir" data-options="required:true" />
					</td>
				</tr> -->
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="addeage" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="addsale" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="saveAdd()">保存</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeAdd()">取消</a>
					
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
</body>
</html>