<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色</title>
<link type="text/css" rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/index.css">
<style>
.layui-form-label {
	padding: 6px 15px 0;
}

.layui-input {
	height: 32px;
	line-height: 32px;
}

.layui-form-item {
	margin-bottom: 0;
	margin-top: 15px;
}
</style>
</head>
<body>
	<section id="role">
	<table class="layui-table">
		<thead>
			<tr>
				<th>序号</th>
				<th>角色名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty roleList}">
				<c:forEach items="${roleList}" var="role" varStatus="vs">
					<tr class="main_info">
						<td>${vs.index+1}</td>
						<td id="roleNameTd${role.roleId }">${role.roleName }</td>
						<td>
							<a href="javascript:editRole(${role.roleId });"
							class="layui-btn layui-btn-mini">修改</a>
							<a href="javascript:deleteRight(${role.roleId });"
							class="layui-btn layui-btn-mini layui-btn-danger">删除</a>
							<a href="javascript:editRights(${role.roleId });"
							class="layui-btn layui-btn-mini layui-btn-normal">权限</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="3">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addRole();" class="layui-btn layui-btn-small"><i
				class="layui-icon">&#xe608;</i> 新增</a>
		</div>
		<div id="page" style="float: right"></div>
		${page.pageStr }
	</div>
	</section>
	<script src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript"
		src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var layer;
		var $;
		var form;
		var element;
		layui.use([ 'layer', 'form', 'element', 'laypage' ], function() {
			element = layui.element()
			$ = layui.jquery;
			layer = layui.layer;
			form = layui.form();
		})
		function addRole() {
			layer
					.open({
						type : 1,
						title : [ '新增角色', 'color:#4BB2FF;font-size:20px' ],
						shade : [ 0.6, '#FFF' ],
						area : [ '340px', '155px' ],
						resize : false,
						content : '<form class="layui-form"><div class="layui-form-item"><label class="layui-form-label">角色名称：</label><div class="layui-input-inline"><input class="layui-input" type="text" name="roleName" id="roleName"/></div></div></form>',
						btn : [ '确定', '取消' ],
						yes : function() {
							var url = "role/save.html";
							var postData = {
								roleName : $("#roleName").val()
							};
							console.log(postData.roleName);
							if (postData.roleName == "")
								layer.msg('角色名称不能为空！', {
									icon : 5,
									time : 1500
								});
							else {
								$.post(url, postData, function(data) {
									if (data == 'success') {
										location.reload();
									} else {
										layer.msg('角色名重复，保存失败！', {
											icon : 5,
											time : 1500
										});
										$("#roleName").focus();
										$("#roleName").select();
									}
								});
							}
						}
					})
		}
		function editRole(roleId) {
			var roleName = $("#roleNameTd" + roleId).text();
			layer
					.open({
						type : 1,
						title : [ '修改角色', 'color:#4BB2FF;font-size:20px' ],
						shade : [ 0.6, '#FFF' ],
						area : [ '340px', '155px' ],
						resize : false,
						content : '<form class="layui-form"><div class="layui-form-item"><label class="layui-form-label">角色名称：</label><div class="layui-input-inline"><input class="layui-input" type="text" name="roleName" value="'+roleName+'" id="roleName"/></div></div></form>',
						btn : [ '确定', '取消' ],
						yes : function() {
							var url = "role/save.html";
							var postData = {
								roleName : $("#roleName").val()
							};
							if (postData.roleName == "")
								layer.msg('角色名称不能为空！', {
									icon : 5,
									time : 1500
								});
							else {
								$.post(url, postData, function(data) {
									if (data == 'success') {
										location.reload();
									} else {
										layer.msg('角色名重复，保存失败！', {
											icon : 5,
											time : 1500
										});
										$("#roleName").focus();
										$("#roleName").select();
									}
								});
							}
						}
					})
		}
		function editRights(roleId) {
			layer.open({
				type : 2,
				title : [ '权限变更', 'color:#4BB2FF;font-size:20px' ],
				shade : [ 0.6, '#FFF' ],
				area : [ '280px', '370px' ],
				content : 'role/auth.html?roleId=' + roleId,
				btn : [ '提交', '返回' ],
				yes : function(index, layero) {
					layer.load(2);
					setTimeout(function() {
						layer.closeAll('loading');
					}, 300);
					var iframeWin = window[layero.find('iframe')[0]['name']];
					iframeWin.editAuth();
				}
			})
		}
		function deleteRight(roleId){
			layer.open({
				title : '提示 ',
				shade : [ 0.6, '#FFF' ],
				content : '确认要删除本条记录吗？',
				btn : [ '确定', '返回' ],
				yes : function(index, layero) {
					layer.closeAll();
					window.location.href='/role/delete.html?roleId='+roleId;
				}
			})
		}
	</script>
</body>
</html>