<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../css/index.css" />
</head>
<body>
	<div style="padding: 15px">
		<form class="layui-form" action="/community/save.html"  target="result" 
			method="post" >
			<div class="layui-form-item">
				<label class="layui-form-label"><font size="5px" color="#FF5722">*&nbsp;</font>社区名称</label>
				<div class="layui-input-block">
					<input type="hidden" value="${community.id}" name="id">
					<input class="layui-input" type="text" name="subdistrictName"
						value="${community.subdistrictName}" lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><font size="5px" color="#FF5722">*&nbsp;</font>社区地址</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="subdistrictAddress"
						value="${community.subdistrictAddress}" lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><font size="5px" color="#FF5722">*&nbsp;</font>社区电话</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="subdistrictTel"
						value="${community.subdistrictTel}" lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center">
				<button lay-submit lay-filter="formDemo"
					class="layui-btn layui-btn-normal">提交</button>
				<button id="close" type="button" class="layui-btn layui-btn-normal">返回</button>
			</div>
		</form>
		<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	</div>
</body>
<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../js/jquery-1.5.1.min.js"></script>
<script src="../js/loadSelectCategory.js"></script>
<script>
        var $form;
        var form;
        layui.use(['layer','form','element'],function() {
            var layer = layui.layer,
            element = layui.element(),
            $ = layui.jquery;
            form=layui.form();
            $form=$('form');
					
            $('#close').click(function(){
                var index = parent.layer.getFrameIndex(window.name);
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