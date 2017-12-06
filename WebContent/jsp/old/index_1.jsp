<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        body{
            background-color: #e2e2e2;
        }
        /*重写头部layui-head样式*/
        .layui-layout-admin .layui-header {
            background-color:#f2f2f2;
        }
        .layui-layout-admin .layui-main{
            margin: 0;
        }
        .logo{
            float: left;
            width: 240px;
            height: 60px;
            line-height: 60px;
            color:#23262E;
            text-align: center;
            font-size: 30px;
            font-weight: 600;
            background-color: #e2e2e2;
        }
        .logo>a:hover{
            color: #23262E;
        }
        .rt{
            height: 60px;
            line-height: 60px;
            margin-left: 240px;
        }
        .rt>i{
            float: left;
            margin-left: 20px;
            color: #2B2E37 ;
            font-size: 28px;
            cursor: default;
        }
        .rt>a{
            float: right;
            margin-right: 40px;
            font-size: 18px;
        }
        .rt>a>i{
            color: #009688;
            font-size: 34px;
        }
        /*重写layui-side侧边导航样式*/
        .layui-layout-admin .layui-side{
            width: 240px;
        }
        .layui-nav, .layui-bg-black{
            background-color:#2B2E37;
        }
        .layui-nav-tree{
            width: 240px;
        }
        .layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this>a, .layui-nav-tree .layui-this>a:hover{
            background-color:#393D49;
        }
        .layui-side-scroll{
           width: 250px;
        }
        .layui-side-scroll .user{
            width: 240px;
            height: 120px;
            text-align: center;
            padding-top: 35px;
            margin-bottom: 15px;
            color: #ffffff;
        }
        .layui-side-scroll .user a img{
            display: block;
            width: 70px;
            height: 70px;
            margin: 0 auto;
            margin-bottom: 15px;
            border-radius: 50%;
            border: 3px solid #44576B;
        }
        .layui-side .layui-nav-tree .layui-nav-item dd a{
            padding-left: 40px;
        }
        .layui-side .layui-nav-tree .layui-nav-item a i{
            padding-right: 3px;
        }
        .layui-nav-item .layui-icon{
            position: relative;
            font-size: 20px;
        }
        /*重写layui-body部分(主体)样式*/
        .layui-layout-admin .layui-body{
            left:240px;
            top:50px;
            overflow-y: hidden;
        }
        .layui-tab-card>.layui-tab-title{
            background-color: #e2e2e2;
            border-bottom: 1px solid #393D49;
        }
        .layui-tab-card{
            border: none;
            box-shadow: none;
        }
        .layui-tab-card>.layui-tab-title .layui-this{
            background-color:#393D49 ;
            color: #ffffff;
        }
        .layui-tab-card>.layui-tab-title .layui-this:after{
            border: none;
        }

        .layui-tab-content{
            padding: 0;
        }
        /*登录注册*/
        .box{
            position: fixed;
            left:0;
            right:0;
            top:0;
            bottom:0;
            background: rgba(255,255,255,0.6);
            display: none;
        }
        .in_box{
            position: absolute;
            width: 700px;
            height: 500px;
            top:50%;
            left: 50%;
            margin:-250px 0 0 -350px;
            border-radius: 8px;
            box-shadow: 0 0 10px 3px rgba(0,0,0,.3);
        }
        .left{
            width: 350px;
            height: 100%;
            box-sizing:border-box ;
            float: left;
            border-top-left-radius: 8px;
            border-bottom-left-radius:8px ;
            background-color: #06f8b1;
            position: relative;
        }
        .lotus{
            position: absolute;
            width: 280px;
            height: 280px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .right{
            width: 350px;
            height: 100%;
            box-sizing: border-box;
            padding: 30px;
            float: right;
            background-color: #ffffff;
            border-top-right-radius: 8px;
            border-bottom-right-radius:8px ;
        }
        .inner_regist,.inner_login{
            width: 100%;
            color: #07d095;
            font-size: 16px;
        }
        .m-line{
            position: relative;
        }
        .layui-form input{
            width: 100%;
            height: 30px;
            border: 0;
            position: absolute;
            top:25px;
            left:0;
        }
        .inner_regist>div,.inner_login>div{
            text-align: center;
            margin-bottom: 30px;
        }
        .inner_regist>div h2,.inner_login>div h2{
            font-size: 20px;
            font-weight: 600;
        }
        .register{
            width: 90%;
            margin: 0 auto;
            height: 40px;
            margin-top: 50px;
        }
        .btn{
            width: 100%;
            height: 40px;
            line-height: 40px;
            border-radius: 10px;
            background-color:#06f8b1;
            color:#ffffff;
            outline: 0;
            border: 0;
            cursor: pointer;
            background:-webkit-linear-gradient(#06f8b1,#07d095,#04a676);
            background:-moz-linear-gradient(#06f8b1,#07d095,#04a676);
            background:-o-linear-gradient(#06f8b1,#07d095,#04a676);
            background:linear-gradient(#06f8b1,#07d095,#04a676);
        }
        .right p{
            text-align: center;
            font-size: 14px;
            color: #666666;
        }
        .login,.regist{
            color:#07d095 ;
        }
        .login:hover,.regist:hover{
            color:#07d095 ;
        }
        .inner_regist{
            display: none;
        }
        .inner_login{
            box-sizing: border-box;
            padding-top:40px ;
        }
       .box .close{
           width: 26px;
           height: 26px;
           text-align: center;
           line-height: 26px;
            margin:-250px -350px 0 0 ;
            position: absolute;
           right:50%;
           top:50%;
           z-index: 9999;
           cursor: pointer;
        }
       .box .close:hover{
           transition:0.5s;
           border-top-right-radius: 8px;
           background-color:#04a676 ;
       }
       .g-line-path{
           fill: transparent;
           stroke-width:2px;
           stroke:#e2e2e2;
       }
        .g-line-fill{
            animation: lineMove 1s ease forwards;
            -webkit-animation:lineMove 0.5s ease forwards;
        }
        @-webkit-keyframes lineMove {
            0% {
                stroke-dasharray: 0 145;
                stroke-dashoffset: -145;
                stroke-width: 4px;
            }
            100% {
                stroke-dasharray: 290;
                stroke-dashoffset: 0;
                stroke-width: 4px;
                stroke:#07d095;
            }
        }
        @keyframes lineMove {
            0% {
                stroke-dasharray: 0 145;
                stroke-dashoffset: -145;
                stroke-width: 4px;
            }
            100% {
                stroke-dasharray: 290;
                stroke-dashoffset: 0;
                stroke-width: 4px;
                stroke:#07d095;
            }
        }


    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header">
        <div class="layui-main">
            <div class="logo">
                <a href="#">SGCMS</a>
            </div>
            <div class="rt">
<!--                 <i class="mine-icon" style="margin-right: 30px">&#xe6b3;</i>
                今天是 <span></span> -->
                <a href="javascript:;" id="exit">
                    <i class="mine-icon">&#xe603;</i>
                </a>
            </div>
            <div class="box">
                <span class="close">
                    <i class="layui-icon">&#x1006;</i>
                </span>
                <div class="in_box">
                    <div class="left">
                        <div class="lotus">
                            <svg  viewBox="0 0 200 200" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <path d="M100 10Q150 50,100 100Q50 50,100 10Z" id="petal"/>
                                </defs>
                                <g class="svg-lotus">
                                    <animateTransform dur="10s" attributeName="transform" repeatCount="indefinite" type="rotate" from="0,100,100" to="360,100,100"/>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div class="right">
                    
                    </div>
                </div>
            </div>
            <!--<ul class="layui-nav" lay-filter="">-->
                <!--<li class="layui-nav-item"><a href="">最新活动</a></li>-->
                <!--<li class="layui-nav-item layui-this"><a href="">产品</a></li>-->
                <!--<li class="layui-nav-item"><a href="">大数据</a></li>-->
                <!--<li class="layui-nav-item">-->
                    <!--<a href="javascript:;">解决方案</a>-->
                    <!--<dl class="layui-nav-child"> &lt;!&ndash; 二级菜单 &ndash;&gt;-->
                        <!--<dd><a href="">移动模块</a></dd>-->
                        <!--<dd><a href="">后台模版</a></dd>-->
                        <!--<dd><a href="">电商平台</a></dd>-->
                    <!--</dl>-->
                <!--</li>-->
                <!--<li class="layui-nav-item"><a href="">社区</a></li>-->
            <!--</ul>-->
        </div>
    </div>

    <div class="layui-side layui-bg-black" >
        <div class="layui-side-scroll">
            <div class="user">
                <a class="img" href="javascript:;"><img src="../images/bs3.png" alt=""/></a>
                <p><span>${user.username }，您好！</span></p>
            </div>
            
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="person.html" data-id="0">
                        <i class="mine-icon">&#xe817;</i>
                          总览
                    </a>
                </li>
			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.hasMenu}">
				<li class="layui-nav-item "><a><i class="mine-icon">&#xe817;</i>${menu.menuName }</a>
					<dl class="layui-nav-child">
					<c:forEach items="${menu.subMenu}" var="sub">
						<c:if test="${sub.hasMenu}">
						<c:choose>
							<c:when test="${not empty sub.menuUrl}">
							<dd> <a href="javascript:;" data-url="${sub.menuUrl }" data-id="${sub.menuId }"> <i class="mine-icon">&#xe664;</i>${sub.menuName }</a></dd>
							</c:when>
							<c:otherwise>
							<dd><a href="javascript:void(0);" target="mainFrame"><i class="mine-icon">&#xe664;</i>${sub.menuName }</a></dd>
							</c:otherwise>
						</c:choose>
						</c:if>
					</c:forEach>
					</dl>
				</li>	
				</c:if>
			</c:forEach>
		</ul>
		
<!--             <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="time.html" data-id="1">
                        <i class="mine-icon">&#xe817;</i>
                        后台首页
                    </a>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">
                        <i class="mine-icon">&#xe60e;</i>
                        我的面板</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="send.html" data-id="3">
                                <i class="mine-icon">&#xe664;</i>
                               <span> 发布信息</span>
                            </a>
                        </dd>
                        <dd><a href="javascript:;" data-url="inform.html" data-id="4">
                            <i class="mine-icon">&#xe65f;</i>
                            <span> 数据信息</span></a></dd>
                        <dd><a href="javascript:;" data-url="person.html" data-id="5">
                            <i class="mine-icon">&#xe65c;</i>
                            <span> 信息修改</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="mine-icon">&#xe602;</i>
                        解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="sale.html" data-id="6">
                            <i class="mine-icon" >&#xe66a;</i>
                            移动模块</a></dd>
                        <dd><a href="">
                            <i class="mine-icon" style="color: #ffffff">&#xe662;</i>
                            后台模版</a></dd>
                        <dd><a href="">
                            <i class="mine-icon" style="color: #ffffff">&#xe667;</i>
                            电商平台</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">
                    <i class="mine-icon" >&#xe67c;</i>系统设置</a></li>
            </ul> -->
        </div>
    </div>
    <div class="layui-layout-admin">
         <div  class="layui-body">
            <div class="layui-tab layui-tab-card" lay-filter="top_tab" lay-allowclose="true">
                <ul class="layui-tab-title">

                </ul>
                <div class="layui-tab-content">

                </div>
            </div>
        </div>
    </div>
    <div id="mq-footer" class="layui-footer" style="text-align: center; line-height: 44px;">
        Copyright © 2017 SGCMS Powered by sgnbs
    </div>
</div>
</body>
<script src="layui/layui.js"></script>
<script>
    layui.use(['layer','form','element'],function(){
        var layer = layui.layer
                ,form=layui.form()
                ,element=layui.element()
                ,$=layui.jquery;
        $('.rt>a>i').click(function(){
            layer.open({
                title:'提示'
                ,content:'确认要退出吗？'
                ,closeBtn:false
                ,btn:['确认','取消']
            })
        })
            var navfilter  = 'test';
            var nav        = $('.layui-nav[lay-filter='+navfilter+']').eq(0);

            var tabfilter  = 'top_tab';
            var tab        = $('.layui-tab[lay-filter='+tabfilter+']').eq(0);

            var tabcontent = tab.children('.layui-tab-content').eq(0);

            var tabtitle   = tab.children('.layui-tab-title').eq(0);

            /**
             * iframe自适应
             */
            $(window).resize(function() {
                //设置顶部切换卡容器度
                tabcontent.height($(this).height() - 60 - 41 - 20 - 44); //头部高度 顶部切换卡标题高度 顶部切换卡内容padding 底部高度
                //设置顶部切换卡容器内每个iframe高度
                tabcontent.find('iframe').each(function () {
                    $(this).height(tabcontent.height());
                });
            }).resize();
            /**
             * 监听侧边栏导航点击事件
             */
            element.on('nav('+navfilter+')', function(elem) {
                var a         = elem.children('a');
                var title     = a.html();
                var src       = elem.children('a').attr('data-url');
                var id        = elem.children('a').attr('data-id');
                var iframe    = tabcontent.find('iframe[data-id='+id+']').eq(0);
                var tabindex  = tabtitle.children('li').length;
               // var layid=tabtitle.children('li').eq(tabindex).attr('lay-id');
               // console.log(tabtitle.children('li').eq(tabindex));
                if(src != undefined && src != null && id != undefined && id != null) {
                    if(iframe.length) { //存在 iframe
                        //获取iframe身上的tab index
                        tabindex = iframe.attr('data-tabindex');

                    }else{ //不存在 iframe
                        //显示加载层
                        layer.load();
                        setTimeout(function() {
                            layer.closeAll('loading');
                        }, 300);
                        //拼接iframe
                        var iframe = '<iframe';
                        iframe += ' src="'+src+'" data-id="'+id+'" data-tabindex="'+tabindex+'"';
                        iframe += ' style="width: 100%;height: '+tabcontent.height()+'px; border: 0px;"';
                        iframe += '></iframe>';
                        //顶部切换卡新增一个卡片
                        element.tabAdd(tabfilter, {title: title,content: iframe});
                        tabtitle.children('li').eq(tabindex).attr('lay-id',tabindex);
                    }
                    //切换到指定lay-id的卡片
                    element.tabChange(tabfilter, tabindex);
                }
            });
            /**
             * 初始化点击侧边栏第一个导航
             */
           nav.find('li').eq(0).click();
           $('.rt>i').click(function() {
            var sideWidth = $('.layui-side').width();
            if(sideWidth === 240) {
                $('.layui-body').animate({
                    left: '0'
                }); //admin-footer
                $('.layui-footer').animate({
                    left: '0'
                });
                $('.layui-side').animate({
                    width: '0'
                });
            } else {
                $('.layui-body').animate({
                    left: '240px'
                });
                $('.layui-footer').animate({
                    left: '240px'
                });
                $('.layui-side').animate({
                    width: '240px'
                });
            }
        });
       /*  $('#login').click(function(){
            $('.box').show();

        form.on('submit(regist_btn)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
        form.on('submit(login_btn)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
        form.verify({
            username: function(value){
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }

            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,phone:[
                /^1[3,4,5,7,8][\d]{9}/
                ,'11位手机号'
            ]
        });
        $('.right').on('click','.login',function(){
            $('.inner_login').fadeIn();
            $('.inner_regist').hide();

        });
        $('.right').on('click','.regist',function(){
            $('.inner_regist').fadeIn();
            $('.inner_login').hide();
        });
         $('.close').click(function(){
             $('.box').hide();
         });
          $('input').focus(function(){
              $(this).parent().find('line').addClass('g-line-fill');
          });
            $('input').blur(function(){
                $(this).parent().find('line').removeClass('g-line-fill');
            })
        }); */
        function daytime(){
            var timee = new Date();
            var yy= timee.getFullYear();
            var MM= timee.getMonth()+1;
            var rr= timee.getDate();
            var ww= timee.getDay();
            var days= ["日","一","二","三","四","五","六" ]
            var n=yy+"年" +MM +"月" + rr+"日" + "星期"+days[ww];
            setTimeout(daytime,1000);
            $('.rt span').text(n);
        }
        daytime();
      });
   /*  (function() {
        for (var i = 0; i < 360; i += 22.5) {
            // 创建 <use> 标签
            var useElement = document.createElementNS('http://www.w3.org/2000/svg', 'use');

            // 创建命名空间
            useElement.setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#petal');
            useElement.setAttribute('fill', 'rgba(7,208,149,0.3)');
            useElement.setAttribute('transform', 'rotate(' + i + ' 100 100)');

            // 插入 <use>
            document.querySelector('.svg-lotus').appendChild(useElement);
        }

    })(); */


</script>

</html>