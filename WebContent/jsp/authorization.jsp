<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<link type="text/css" rel="stylesheet" href="../js/zTree/zTreeStyle.css"/>
</head>
<body>
	<div>
		<ul id="tree" class="tree" style="overflow:auto;"></ul>
		<button type="button" id="save" style="display: none;">提交</button>
	</div>
	<script src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/zTree/jquery.ztree-2.6.min.js"></script>
	<script type="text/javascript">
	var layer;
	var $;
	layui.use(['layer'],function() {		    		                		                	                		               
	                 $ = layui.jquery;
	                layer = layui.layer;
	      })
		 $("#save").click(function(){
            var nodes = zTree.getCheckedNodes();
            var tmpNode;
            var ids = "";
            for(var i=0; i<nodes.length; i++){
                tmpNode = nodes[i];
                if(i!=nodes.length-1){
                    ids += tmpNode.id+",";
                }else{
                    ids += tmpNode.id;
                }
            }
            var userId = "${userId}";
            var roleId = "${roleId}";
            var url = "auth/save.html";
            var postData;
            if(userId!=""){
                postData = {"userId":userId,"menuIds":ids};
            }else{
                postData = {"roleId":roleId,"menuIds":ids};
            }
            $.post(url,postData,function(data){
                if(data && data=="success"){
                layer.msg('权限变更成功！',{icon:1,time:1000},function(){
                	 parent.location.reload();
                });
            }else
            	 layer.msg(data,{icon:2,time:2000});
            });
        });
        var setting = {
            showLine: true,
            checkable: true
        };
        var zn = '${zTreeNodes}';
        var zTreeNodes = eval(zn);
        var zTree = $("#tree").zTree(setting, zTreeNodes);

      function editAuth(){
           $('#save').click();
     }
	</script>
</body>
</html>