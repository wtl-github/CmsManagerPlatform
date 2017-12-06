<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../css/index.css" />
</head>
<body>
<div style="padding: 15px">
	<form action="save.html" name="userForm" id="userForm" target="result" method="post" class="layui-form" onsubmit="return checkInfo();">
	<input type="hidden" name="userId" id="userId" value="${user.userId }"/>
	  <div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="loginname" value="${user.loginname }"
						lay-verify="required" />
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">密　码:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="password" name="password"  id="password" value=""
						lay-verify="required" />
				</div>
			</div>
			
						<div class="layui-form-item">
				<label class="layui-form-label">确认密码:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="password" name="chkpwd" id="chkpwd" value=""
						lay-verify="required" />
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">名　称:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="username" value="${user.username }"
						lay-verify="required" />
				</div>
			</div>
			
			
			<div class="layui-form-item">
				<label class="layui-form-label">角　色:</label>
				<div class="layui-input-block">
						<select name="roleId" id="roleId" lay-verify="category" lay-filter="firstCategory">
				<option value="">请选择</option>
			<c:forEach items="${roleList}" var="role">
				<option value="${role.roleId }">${role.roleName }</option>
			</c:forEach>
			</select>
				</div>
			</div>
			
			<div class="layui-form-item" style="text-align: center">
				<button lay-submit lay-filter="formDemo" 
					class="layui-btn layui-btn-normal">提交</button>
				<button type="button" id="close" class="layui-btn layui-btn-normal">返回</button>
			</div>
	</form>
	 <iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	 	</div>
	 	</body>
	 <script src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		var $;
	var $form;
	var form;
	layui
			.use(
					[ 'layer', 'form', 'element' ],
					function() {
						var layer = layui.layer, element = layui.element();
						$ = layui.jquery;
						form = layui.form();
						$form = $('form');

						form.verify({
					       category:function(value){
					            if(value.length<1){
					            return '未选择分类！';
					            }
					        }
					    });

						$('#close').click(
								function() {
									var index = parent.layer
											.getFrameIndex(window.name);
									parent.layer.close(index);
								})
					})
		$(document).ready(function(){
			if($("#userId").val()!=""){
				$("#loginname").attr("readonly","readonly");
				$("#loginname").css("color","gray");
				var roleId = "${user.roleId}";
				if(roleId!=""){
					$("#roleId").val(roleId);
				}
			}
		});
		
		function checkInfo(){
/* 			if($("#loginname").val()==""){
				alert("请输入用户名!");
				$("#loginname").focus();
				return false;
			} */
/* 			if($("#userId").val()=="" && $("#password").val()==""){//新增
				alert("请输入密码!");
				$("#password").focus();
				return false;
			} */
			if($("#password").val()!=$("#chkpwd").val()){
				alert("两次密码不一致!");
				$("#password").focus();
				return false;
			}
	/* 		if($("#username").val()==""){
				alert("请输入名称!");
				$("#username").focus();
				return false;
			} */
			return true;
		}
		
		function success(){
			parent.location.reload();
		}
		
		function failed(){
			alert("新增失败，该用户名已存在！");
			$("#loginname").select();
			$("#loginname").focus();
		}
	</script>
</html>