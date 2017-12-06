<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/index.css">
</head>
<body>
	<div id="form_user">
		<form action="user.html" method="post" name="userForm" id="userForm"
			class="layui-form">
			<blockquote class="layui-elem-quote">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-inline">
							<input type="text" name="loginname" value="${user.loginname }"
								class="layui-input" />
						</div>

						<label class="layui-form-label">角色：</label>
						<div class="layui-input-inline">
							<select name="roleId" id="roleId">
								<option value="">请选择</option>
								<c:forEach items="${roleList}" var="role">
									<option value="${role.roleId }"
										<c:if test="${user.roleId==role.roleId}">selected</c:if>>${role.roleName }</option>
								</c:forEach>
							</select>
						</div>
						<label class="layui-form-label">登录日期：</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="LAY_demorange_s" name="lastLoginStart"
								lay-verify="date" autocomplete="off" class="layui-input"
								value="<fmt:formatDate value="${user.lastLoginStart}" pattern="yyyy-MM-dd"/>"
								onclick="layui.laydate({elem: this})">
						</div>
						<div class="layui-form-mid">-</div>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="LAY_demorange_e" name="lastLoginEnd"
								lay-verify="date" autocomplete="off" class="layui-input"
								value="<fmt:formatDate value="${user.lastLoginEnd}" pattern="yyyy-MM-dd"/>"
								onclick="layui.laydate({elem: this})">
						</div>
						<a href="javascript:search();" class="layui-btn">查询</a>
					</div>
				</div>
			</blockquote>
			<table class="layui-table">
				<thead>
					<tr>
						<th>序号</th>
						<th>用户名</th>
						<th>名称</th>
						<th>角色</th>
						<th width="160">最近登录</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty userList}">
							<c:forEach items="${userList}" var="user" varStatus="vs">
								<tr class="main_info">
									<td>${vs.index+1}</td>
									<td style="display: none">${user.userId }</td>
									<td>${user.loginname }</td>
									<td>${user.username }</td>
									<td>${user.role.roleName }</td>
									<td><fmt:formatDate value="${user.lastLogin}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>
										<button type="button" class="layui-btn layui-btn-mini"
											data-type="edit">修改</button>
										<button type="button"
											class="layui-btn layui-btn-mini layui-btn-danger"
											data-type="del">删除</button>
										<button type="button"
											class="layui-btn layui-btn-mini layui-btn-normal"
											data-type="editRights">权限</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="7">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="page_and_btn">
				<div class="btn-group">
					<button type="button" class="layui-btn layui-btn-small" id="add"
						data-type="add">
						<i class="layui-icon">&#xe608;</i> 新增
					</button>
				</div>
				<div id="page" style="float: right"></div>
				${user.page.pageStr }
			</div>
		</form>
	</div>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		var datas;
		layui
				.use(
						[ 'layer', 'form', 'element', 'laypage', 'laydate' ],
						function() {
							var layer = layui.layer, form = layui.form(), element = layui
									.element(), laydate = layui.laydate, laypage = layui.laypage, $ = layui.jquery;

							form.on('checkbox(allChoose)', function(data) {
								var child = $(data.elem).parents('table').find(
										'tbody input[type="checkbox"]');
								child.each(function(index, item) {
									item.checked = data.elem.checked;
								});
								form.render('checkbox');
							});

							var start = {
								min : '1900-01-01 23:59:59',
								max : laydate.now(),
								istoday : false,
								choose : function(datas) {
									end.min = datas; //开始日选好后，重置结束日的最小日期
									end.start = datas //将结束日的初始值设定为开始日
								}
							};

							var end = {
								max : laydate.now(1),
								istoday : false,
								choose : function(datas) {
									start.max = datas; //结束日选好后，重置开始日的最大日期
								}
							};

							document.getElementById('LAY_demorange_s').onclick = function() {
								start.elem = this;
								laydate(start);
							}
							document.getElementById('LAY_demorange_e').onclick = function() {
								end.elem = this
								laydate(end);
							}

							var action = {
								edit : function() {
									var that = $(this).parent().parent();
									layer
											.open({
												type : 2,
												title : [ '用户修改',
														'color:#4BB2FF;font-size:20px' ],
												shade : [ 0.6, '#ffffff' ],
												area : [ '360px', '420px' ],
												maxmin : true,
												content : 'user/edit.html?userId='
														+ that
																.find(
																		"td:nth-child(2)")
																.text()
											})
								},
								del : function() {
									var that = $(this).parent().parent();
									layer
											.open({
												title : '提示',
												shade : [ 0.6, '#FFF' ],
												content : '确认要删除本条记录吗？',
												btn : [ '确认', '取消' ],
												yes : function() {
													layer.closeAll();
													window.location.href = 'user/delete.html?userId='
															+ that
																	.find(
																			"td:nth-child(2)")
																	.text();
												}
											});
								},
								editRights : function() {
									var that = $(this).parent().parent();
									layer
											.open({
												type : 2,
												title : [ '权限变更',
														'color:#4BB2FF;font-size:20px' ],
												shade : [ 0.6, '#ffffff' ],
												area : [ '280px', '370px' ],
												content : 'user/auth.html?userId='
														+ that
																.find(
																		"td:nth-child(2)")
																.text(),
												btn : [ '提交', '返回' ],
												yes : function(index, layero) {
													layer.load(2);
													setTimeout(
															function() {
																layer
																		.closeAll('loading');
															}, 300);
													var iframeWin = window[layero
															.find('iframe')[0]['name']];
													iframeWin.editAuth();
												}
											})
								},
								add : function() {
									layer
											.open({
												type : 2,
												title : [ '添加用户',
														'color:#4BB2FF;font-size:20px' ],
												shade : [ 0.6, '#FFF' ],
												area : [ '360px', '420px' ],
												maxmin : true,
												content : '/user/add.html'
											})
								}
							};
							$('.layui-table tbody tr').on(
									'click',
									'button',
									function() {
										var othis = $(this), type = othis
												.data('type');
										action[type] ? action[type].call(this,
												othis) : '';
									});
							$('.btn-group').on(
									'click',
									'button',
									function() {
										var othis = $(this), type = othis
												.data('type');
										action[type] ? action[type].call(this,
												othis) : '';
									});
						});

		function sltAllUser() {
			if ($("#sltAll").attr("checked")) {
				$("input[name='userIds']").attr("checked", true);
			} else {
				$("input[name='userIds']").attr("checked", false);
			}
		}
		function search() {
			$("#userForm").submit();
		}
	</script>
</body>
</html>