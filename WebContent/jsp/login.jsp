<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGCMS管理系统后台</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css"/>
    <script type="text/javascript">
	 if(top!=self){  
         if(top.location != self.location)  
              top.location=self.location;   
    }  
	</script> 
</head>
<body>
<div class="box">
         <div class="container">
              <h2><img alt="" src="../images/logo.png"></h2> 
           <div class="login">  
                <form action="login.html" method="post" name="loginForm" onsubmit="return check();" class="layui-form">
                    <div class="layui-form-item m-line">
                        <label> 用户名</label>
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 290 36">
                            <line x1="0" y1="36" x2="290" y2="36" class="g-line-path"/>
                        </svg>
                        <input type="text" name="loginname" id="loginname" required  lay-verify="required" value="${loginname }" />
                    </div>
                    <div class="layui-form-item m-line">
                        <label>密码</label>
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 290 36">
                            <line x1="0" y1="36" x2="290" y2="36" class="g-line-path"/>
                        </svg>
                        <input type="password" name="password" id="password" required  lay-verify="required" value="${password }" />
                    </div>
                    <div class="layui-form-item m-line" >
                        <label>验证码</label>
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 290 36">
                            <line x1="0" y1="36" x2="145" y2="36" class="g-line-path"/>
                        </svg>
                        <input type="text" name="code" id="code"  class="verify" required  lay-verify="required" />
                         <div class="verify-img">
                        	<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
                         </div>
                    </div>
                    <div class="layui-form-item">
                        <input type="checkbox" name="remand"  id="tts" lay-skin="primary"/>记住密码
                        &nbsp;<span id="err" style="display:none;color:red;"></span>
                    </div>
                    <div class="layui-form-item">
                        <button class="btn" lay-submit  lay-filter="login_btn" id="cook" >登录</button>
                    </div>
                </form>
            </div>
         </div>
</div>

</body>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script>
    layui.use(['layer', 'form','element'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,element=layui.element()
            ,$ = layui.jquery;
        $('.login input').focus(function(){
            $(this).parent().find('line').addClass('g-line-fill');
        });
        $('.login input').blur(function(){
            $(this).parent().find('line').removeClass('g-line-fill');
        })
        $('.login input.verify').focus(function(){
            $(this).parent().find('line').addClass('g-short-line-fill');
        });
        $('.login input.verify').blur(function(){
            $(this).parent().find('line').removeClass('g-short-line-fill');
        })
        var errInfo = "${errInfo}";
        $(document).ready(function(){
        	changeCode();
        	$("#codeImg").bind("click",changeCode);
        	
        	if(errInfo!=""){
        		$("#err").show();
        		$("#err").html(errInfo);
        	}
        	$("#loginname").focus();
        });

        function genTimestamp(){
        	var time = new Date();
        	return time.getTime();
        }

        function changeCode(){
        	$("#codeImg").attr("src","code.html?t="+genTimestamp());
        }

        function resetErr(){
        	$("#err").hide();
        	$("#err").html("");
        }

        function check(){
        	resetErr();
        	return true;
        }

        $(function() { 
        	 $('[name="loginname"]').focus(function() { 
        		 $("#err").hide();
        		}); 
        	 $('[name="password"]').focus(function() { 
        		 $("#err").hide();
        		}); 
        	 $('[name="code"]').focus(function() { 
        		 $("#err").hide();
        		}); 
        }); 
    });
	//初始化页面时验证是否记住了密码
	$(document).ready(function() {
        if ($.cookie("tts") == "true") {
	        $("#tts").attr("checked", true);
	        $("#loginname").val($.cookie("userName"));
	        $("#password").val($.cookie("passWord"));
	    }
	});
	//保存用户信息
	function saveUserInfo() {
	    if ($("#tts").attr("checked") == true) {
	        var userName = $("#loginname").val();
	        var passWord = $("#password").val();
	        $.cookie("tts", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
	        $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie
	        $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie
	    }
	    else {
	        $.cookie("tts", "false", { expires: -1 });
	        $.cookie("userName", '', { expires: -1 });
	        $.cookie("passWord", '', { expires: -1 });
	    }
	}
	
	$("#cook").click(function(){
		saveUserInfo();
	})

</script>
</html>
