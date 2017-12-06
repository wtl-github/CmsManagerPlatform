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
	<section id="info">
		<form action="myFile.html" method="post" name="myFileForm" id="myFileForm" class="layui-form">
			<table class="layui-table">
				<thead>
					<tr>
						<th><input type="checkbox" name="test" lay-skin="primary"
							lay-filter="allChoose" id="allChoose"></th>
						<th style="display: none">ID</th>
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
									<td><input type="checkbox" name="uploadIds"
										value="${webUpload.uploadId }" lay-skin="primary" lay-filter="choose"/></td>
									<td style="display: none">${webUpload.uploadId }</td>
									<td>${webUpload.title }</td>
									<td>${webUpload.type }</td>
									<td>${webUpload.des }</td>
									<td>${webUpload.keyword }</td>
									<td><fmt:formatDate value="${webUpload.systime}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>
										<button type="button"
											class="layui-btn layui-btn-mini layui-btn-normal"
											data-type="edit">修改</button>
										<button type="button"
											class="layui-btn layui-btn-mini layui-btn-danger"
											data-type="del">删除</button>
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
					<!-- <a href="javascript:addUser();" class="layui-btn layui-btn-small"><i class="layui-icon">&#xe608;</i> 新增</a> -->
					<button type="button"
						class="layui-btn layui-btn-danger layui-btn-small" id="deleteAll">
						<i class="layui-icon">&#xe640;</i> 删除
					</button>
				</div>
				<div id="page" style="float: right"></div>
				${webUpload.page.pageStr }
			</div>
		</form>
	</section>
</body>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<script>
    layui.use(['layer','form','element','laypage'],function() {
        var layer = layui.layer
                , form = layui.form()
                , element = layui.element()
                , laydate = layui.laydate
                , laypage = layui.laypage
                , $ = layui.jquery;
	        form.on('checkbox(allChoose)', function(data){
	            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
	            child.each(function(index, item){
	                item.checked = data.elem.checked;
	            });
	            form.render('checkbox');
	        });
	         form.on('checkbox(choose)',function(data){
            var len= $(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
            var chklen=$(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
            if(len==chklen){              
                $('#allChoose').prop('checked',true);              
            }else{
                $('#allChoose').prop('checked',false);
            }
            form.render('checkbox');
        })
        var delsnum="";
        $('#deleteAll').click(function() {
            var inputChkList=$("tbody input[type='checkbox']:checked");
            var inputList=$("tbody input[type='checkbox']").length;
            var count = inputChkList.length;
            if(count==0&&inputList!=0){
                layer.open({icon:2,title:'提示',content:'请选择后再操作',btnAlign:'c'
            })}
            else if(count==0&&inputList==0){
                layer.msg('没有数据了',{icon:5,time:1500})
            }
            else{
                //layer.confirm('确认要删除ID为'+inputChkList.parent().parent().find('td:nth-child(2)').text()+'所选数据吗?', {icon: 3, title: '提示'}, function (index){
                layer.confirm('确认要删除所选数据吗?', {icon: 3, title: '提示'}, function (index){
                	inputChkList.each(function(index){
                      //  var n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                        if(index==0)
                            delsnum = $(this)[0].getAttribute("value");
                        else
                        	delsnum+=","+$(this)[0].getAttribute("value");
                        //$(".layui-table tbody").find("tr:eq(" + n + ")").remove();
                    })
                    layer.close(index);
                	window.location.href='/myFile/fileDels.html?uploadids='+delsnum;
                })
            }
        })
        
        var action={
                edit:function(){
                	 var that=$(this).parent().parent();
                  layer.open({
                      type:2,
                      title:['修改内容','color:#4BB2FF;font-size:20px'],
                      shade:[0.6,'#ffffff'],
                      area:['610px','400px'],
                      maxmin:true,
                     content:'/myFile/fileUpdateInit.html?uploadid='+that.find("td:nth-child(2)").text()
                  })
              },
				del:function(){
                var that=$(this).parent().parent();
                var index=that.index();
                layer.open({
                    title:'提示',
                    shade:[0.6,'#FFF'],
                    content:'确认要删除本条记录吗？',
                    btn:['确认','取消'],
                    yes:function(){
                        layer.closeAll();
                        window.location.href='/myFile/fileDel.html?uploadid='+that.find("td:nth-child(2)").text();
                    }
                });
            },
			 add:function(){
                layer.open({
                    type:2,
                    title:['添加内容','color:#4BB2FF;font-size:20px'],
                    shade:[0.6,'#FFF'],
                    area:['610px','400px'],
                    maxmin:true,
                    content:'/myFile/fileAddInit.html'
                })
            } 
        };
    $('.layui-table tbody tr').on('click','button',function(){
        var othis = $(this), type = othis.data('type');
        action[type] ? action[type].call(this, othis) : '';
    });
    $('.btn-group').on('click','button',function() {
        var othis = $(this), type = othis.data('type');
        action[type] ? action[type].call(this, othis) : '';
    });
    })
</script>
</html>