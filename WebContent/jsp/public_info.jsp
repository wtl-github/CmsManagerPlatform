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
	<section id="public">
		<blockquote class="layui-elem-quote">
			<form class="layui-form" action="allFile.html"  name="allFileForm" id="allFileForm"  method="post">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">作者：</label>
						<div class="layui-input-inline">
							<input type="text" name="username" autocomplete="off" value="${webUpload.username}"
								class="layui-input">
						</div>
						<label class="layui-form-label">标题：</label>
						<div class="layui-input-inline">
							<input type="text" name="title" autocomplete="off" value="${webUpload.title}" 
								class="layui-input">
						</div>
						<label class="layui-form-label">关键字：</label>
						<div class="layui-input-inline">
							<input type="text" name="keyword" autocomplete="off" value="${webUpload.keyword}" 
								class="layui-input">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">一级分类:</label>
					<div class="layui-input-inline">
						<select name="one" class="" id="one" lay-verify="category"
							lay-filter="firstCategory">
							<option value="">请选择分类</option>
							<c:forEach items="${typelist}" var="user">
								<option value="${user.typeCode}">${user.typeName}</option>
							</c:forEach>
						</select>
					</div>
					<label class="layui-form-label">二级分类:</label>
					<div class="layui-input-inline">
						<select name="two" class="" id="two" lay-verify="category"
							lay-filter="secondCategory">
							<option value="">请选择分类</option>
						</select>
					</div>

					<label class="layui-form-label">三级分类:</label>
					<div class="layui-input-inline">
						<select name="three" class="" id="three" lay-verify="category">
							<option value="">请选择分类</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">查询时间：</label>
						<%-- 下面的日期字段如果改成name=start,name=end将报string转换date错误 --%>
										<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="LAY_demorange_s" name="startTime"
								lay-verify="date" autocomplete="off" class="layui-input"
								value="<fmt:formatDate value="${webUpload.start}" pattern="yyyy-MM-dd"/>"
								onclick="layui.laydate({elem: this})">
						</div>
						<div class="layui-form-mid">-</div>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="LAY_demorange_e" name="endTime"
								lay-verify="date" autocomplete="off" class="layui-input"
								value="<fmt:formatDate value="${webUpload.end}" pattern="yyyy-MM-dd"/>"
								onclick="layui.laydate({elem: this})">
						</div>
						<div class="layui-input-inline lf">
						 <a href="javascript:search();" class="layui-btn">快速查询</a>
						  <a href="javascript:reset();" class="layui-btn">清空</a>
							<!-- <button type="reset" class="layui-btn">清空</button> -->
						</div>
					</div>
				</div>
		</blockquote>
		<table class="layui-table">
			<thead>
				<tr>
					<th>上传者</th>
					<th>标题</th>
					<th>类型</th>
					<th>描述</th>
					<th>关键字</th>
					<th>上传时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
						<c:when test="${not empty webUploadList}">
							<c:forEach items="${webUploadList}" var="webUpload"
								varStatus="vs">
								<tr class="main_info">
									<td>${webUpload.username }</td>
									<td>${webUpload.title }</td>
									<td>${webUpload.type }</td>
									<td>${webUpload.des }</td>
									<td>${webUpload.keyword }</td>
									<td><fmt:formatDate value="${webUpload.systime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>
									<button type="button"
							class="layui-btn layui-btn-normal layui-btn-mini" data-type="see">查看</button>
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
				<div id="page" style="float: right"></div>
				${webUpload.page.pageStr }
		</div>
		</form>
	</section>
</body>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/loadSelectCategory.js"></script>
<script>
    var $form;
    var form;
    layui.use(['layer','form','element','laypage','laydate'],function() {
        var layer = layui.layer
                , element = layui.element()
                , laydate=layui.laydate
                , laypage=layui.laypage
                , $ = layui.jquery;
        form=layui.form();
        $form=$('form');
        
        form.on('select(firstCategory)',function(){
	        get.getSelect(1);
		})
		form.on('select(secondCategory)',function(){
	        get.getSelect(2);
		})
        var action= {
            see: function () {
                var  that= $(this).parent().parent();
                layer.open({
                    type: 1,
                    title: ['查看详情', 'color:#fff;font-size:20px'],
                    skin: 'layui-layer-molv',
                    area:'550px',
                    shade: [0.3, '#FFF'],
                    content: '<div style="padding:15px">'
                            + '<table class="layui-table">'
                            + '<tr><td>标题</td><td>' +that.find('td:nth-child(2)').text() + '</td></tr>'
                            + '<tr><td>作者</td><td>' + that.find('td:first-child').text() + '</td></tr>'
                            + '<tr><td>上传时间</td><td>' + that.find('td:nth-child(6)').text() + '</td></tr>'
                            + '<tr><td>文件</td><td>图片.png<br/>ddfdf32.docx<br/>英雄联盟.exe</td></tr>'
                            + '<tr><td>一级分类</td><td>生育</td></tr>'
                            + '<tr><td>二级分类</td><td>生育保险</td></tr>'
                            + '<tr><td>三级分类</td><td>生育保险下级</td></tr>'
                            + '<tr><td>描述</td><td>' + that.find('td:nth-child(4)').text() + '</td></tr>'
                            + '<tr><td>关键字</td><td>' + that.find('td:nth-child(5)').text() + '</td></tr>'
                            + '</table></div>',
                    btn: ['返回'],
                    btnAlign: 'c'
                });
            }
        }
        var start = {
            min: '1900-01-01 23:59:59'
            ,max: laydate.now()
            ,istoday: false
            ,choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            max: laydate.now(1)
            ,istoday: false
            ,choose: function(datas){
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        document.getElementById('LAY_demorange_s').onclick = function(){
            start.elem = this;
            laydate(start);
        }
        document.getElementById('LAY_demorange_e').onclick = function(){
            end.elem = this
            laydate(end);
        }
        $('.layui-table tbody tr').on('click','button',function(){
            var othis = $(this), type = othis.data('type');
            action[type] ? action[type].call(this, othis) : '';
        });
    })
    
    function search(){
			$("#allFileForm").submit();
		}
    
    function reset(){
    	$("input").attr("value","");
	}
</script>
</html>