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
		<form class="layui-form" action="/region/save.html"  target="result" 
			method="post" >
			<div class="layui-form-item">
				<label class="layui-form-label">小区名称:</label>
				<div class="layui-input-block">
					<input type="hidden" value="${region.regionId}" name="regionId">
					<input class="layui-input" type="text" name="regionName"
						value="${region.regionName}" lay-verify="required" />
				</div>

			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">小区地址:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="regionAddress"
						value="${region.regionAddress}" lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">小区面积（m）:</label>
				<div class="layui-input-block">
					<input class="layui-input" type="text" name="regionAcreage"
						value="${region.regionAcreage}" lay-verify="required" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">小区信息:</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea" name="regionDescription" lay-verify="required">${region.regionDescription}</textarea>
				</div>
			</div>
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">文件:</label>
				<div class="layui-input-block">
					<c:choose>
						<c:when test="${not empty scanFileList}">
							<c:forEach items="${scanFileList}" var="scanlist">
								<a href="${scanlist.showUrl }" target="_blank">${scanlist.name }</a>
								<br>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="7">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</div>
			</div> --%>
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
            var layer = layui.layer
            , element = layui.element()
            , $ = layui.jquery;
            form=layui.form();
            $form=$('form');
        
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
							  get.getSelect(1)
					})
					form.on('select(secondCategory)',function(){
						  get.getSelect(2)
					})
					
/* 					form.on('submit(formDemo)', function(data){
						  	var index = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index); 
						 });  */
					
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