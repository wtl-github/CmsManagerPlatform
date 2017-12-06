<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<link rel="stylesheet" href="../layui/css/layui.css">
 <style>
          body{
            padding:10px;
        }
 </style>
</head>
<body>
	<table class="layui-table" >
	    <thead>
        <tr>
			<th>序号</th>
			<th>信息一</th>
			<th>信息二</th>
			<th>信息三</th>
        </tr>
        </thead>
		<c:choose>
			<c:when test="${not empty infoList }">
				<c:forEach items="${infoList }" var="info">
					<tr class="main_info">
						<td>${info.infoId }</td>
						<td>${info.info1 }</td>
						<td>${info.info2 }</td>
						<td>${info.info3 }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="4">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		${page.pageStr }
	</div>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<!-- 	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
	</script> -->
</body>
</html>