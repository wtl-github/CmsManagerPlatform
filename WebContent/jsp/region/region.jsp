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
		<form action="region.html" method="post" name="regionForm" id="regionForm" class="layui-form">
			<blockquote class="layui-elem-quote">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">小区名称：</label>
						<div class="layui-input-inline">
							<input type="text" name="regionName" autocomplete="off" value="${region.regionName}"
								class="layui-input">
						</div>
						<div class="layui-input-inline lf">
						 	<a href="javascript:search();" class="layui-btn">快速查询</a>
						  	<a href="javascript:reset();" class="layui-btn">清空</a>
						</div>
					</div>
				</div>
			</blockquote>
		
			<table class="layui-table">
				<thead>
					<tr>
						<th><input type="checkbox" name="test" lay-skin="primary"
							lay-filter="allChoose" id="allChoose"></th>
						<th style="display: none">ID</th>
						<th>小区名称</th>
						<th>小区地址</th>
						<th>小区面积(m)</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty regionList}">
							<c:forEach items="${regionList}" var="region"
								varStatus="vs">
								<tr class="main_info">
									<td><input type="checkbox" name="regionIds"
										value="${region.regionId }" lay-skin="primary" lay-filter="choose"/></td>
									<td style="display: none">${region.regionId }</td>
									<td>${region.regionName }</td>
									<td>${region.regionAddress }</td>
									<td>${region.regionAcreage }</td>
									<td style="display: none">${region.regionDescription }</td>
									<td>
										<button type="button"
											class="layui-btn layui-btn-mini layui-btn-normal"
											data-type="see">查看</button>
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
				${region.page.pageStr }
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
                	window.location.href='/region/deletes.html?regionIds='+delsnum;
                })
            }
        })
        
        var action={
       		see:function () {
                   var  that= $(this).parent().parent();
                   layer.open({
                       type: 1,
                       title: ['查看详情', 'color:#fff;font-size:20px'],
                       skin: 'layui-layer-molv',
                       area:'550px',
                       shade: [0.3, '#FFF'],
                       content: '<div style="padding:15px">'
                               + '<table class="layui-table">'
                               + '<tr><td>小区名称</td><td>' +that.find('td:nth-child(3)').text() + '</td></tr>'
                               + '<tr><td>小区地址</td><td>' + that.find('td:nth-child(4)').text() + '</td></tr>'
                               + '<tr><td>小区面积(m)</td><td>' + that.find('td:nth-child(5)').text() + '</td></tr>'
                               + '<tr><td>小区信息</td><td><textarea class="layui-textarea">' + that.find('td:nth-child(6)').text() + '</textarea></td></tr>'
                               + '</table></div>',
                       btn: ['返回'],
                       btnAlign: 'c'
                   });
            },
                	
            edit:function(){
               	var that=$(this).parent().parent();
                layer.open({
                      type:2,
                      title:['修改内容','color:#4BB2FF;font-size:20px'],
                      shade:[0.6,'#ffffff'],
                      area:['610px','500px'],
                      maxmin:true,
                     content:'/region/edit.html?regionId='+that.find("td:nth-child(2)").text()
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
                        window.location.href='/region/delete.html?regionId='+that.find("td:nth-child(2)").text();
                    }
                });
            },
			add:function(){
                layer.open({
                    type:2,
                    title:['添加内容','color:#4BB2FF;font-size:20px'],
                    shade:[0.6,'#FFF'],
                    area:['610px','500px'],
                    maxmin:true,
                    content:'/region/add.html'
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
    function search(){
		$("#regionForm").submit();
	}

	function reset(){
		$("input").attr("value","");
	}
</script>
</html>