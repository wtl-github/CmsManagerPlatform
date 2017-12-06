<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<form class="layui-form" action="/myFile/fileadd.html"  target="result" 
			enctype="multipart/form-data" method="post" >
			<div class="layui-form-item">
				<label class="layui-form-label">标题:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="title" value=""
						lay-verify="required" />
				</div>
			</div>

			<div class="layui-form-item" id="file">
				<label class="layui-form-label">文件:</label>
				<div class="layui-input-block">
					<input type="file" name="myfiles" lay-verify="files" />
					<button id="addBtn" type="button" class="layui-btn layui-btn-mini"
						style="margin-left: 24px">增加文件</button>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">一级分类:</label>
				<div class="layui-input-block">
					<select name="one" class="" id="one" lay-verify="category"
						lay-filter="firstCategory">
						<option value="">请选择分类</option>
						<c:forEach items="${typelist}" var="user">
							<option value="${user.typeCode}">${user.typeName}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">二级分类:</label>
				<div class="layui-input-block">
					<select name="two" class="" id="two" lay-verify="category"
						lay-filter="secondCategory">
						<option value="">请选择分类</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">三级分类:</label>
				<div class="layui-input-block">
					<select name="three" class="" id="three" lay-verify="category">
						<option value="">请选择分类</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述:</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea" name="des" lay-verify="required"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">关键字:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="keyword"
						lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center">
				<button lay-submit lay-filter="formDemo" id="btn"
					class="layui-btn layui-btn-normal">提交</button>
				<button type="button" id="close" class="layui-btn layui-btn-normal">返回</button>
			</div>
		</form>
		<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	</div>
</body>
 
<script src="../layui/layui.js"></script>
<script src="../js/jquery-1.5.1.min.js"></script>
<script src="../js/loadSelectCategory.js"></script>
<script>
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

						var n = 0;
						$('#addBtn')
								.click(
										function() {
											n++;
											var input = $('<div class="layui-input-block"><input type="file" name="pic'+n+'"/><span>&times;</span></div>');
											$('#file').append(input);
											$('#file').find('span').click(
													function() {
														$(this).parent()
																.remove();
													});
										});
						form.verify({
					        files: function(value){
					            if(value.length<1){
					            return '未选择文件！';
					            }
					        }
					        ,category:function(value){
					            if(value.length<1){
					            return '未选择分类！';
					            }
					        }
					    });
						form.on('select(firstCategory)',function(){
					        get.getSelect(1); //取得联动数据 
					})
					form.on('select(secondCategory)',function(){
					        get.getSelect(2); //取得联动数据
					})

						$('#close').click(
								function() {
									var index = parent.layer
											.getFrameIndex(window.name);
									parent.layer.close(index);
								})
					})
					
		function success(){
			parent.location.reload();
		}
		function failed(){
			alert("新增失败,请核对数据！");
		}
</script>
</html>