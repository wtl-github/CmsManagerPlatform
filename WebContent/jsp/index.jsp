<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/index.css" />
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="logo">
				<img src="../images/bianm.png" alt="" />
			</div>
			<div class="rt">
				<!-- 	<div class="msg" id="mg">
					<i class="layui-icon"> &#xe60b;</i>
					<sapn>这里是提示信息。。。</sapn>
					<i class="layui-icon close">&#x1006;</i>
				</div> -->
				<ul class="layui-nav my-nav" lay-filter="alone">
					<span>欢迎你,${user.username }</span>
					<li class="layui-nav-item"><a href="javascript:;"> <img
							class="my-img" src="../images/user.png" alt="" />
					</a>
						<dl class="layui-nav-child my-box">
							<dd>
								<a href="javascript:;" class="personal" data-id="-1"
									data-url="/user/person.html?userId=1"><i class="mine-icon">&#xe85f;</i>&nbsp;个人信息</a>
							</dd>
							<dd>
								<a href="javascript:;" id="exit"><i class="mine-icon">&#xe601;</i>&nbsp;安全退出</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-this"><a href="javascript:;"
						data-url="center.html" data-id="0"> <i class="mine-icon">&#xe602;</i>
							后台总览
					</a></li>
					<c:forEach items="${menuList}" var="menu">
						<c:if test="${menu.hasMenu}">
							<li class="layui-nav-item "><a> <i class="mine-icon">${menu.menuIcon }</i>${menu.menuName }</a>
								<dl class="layui-nav-child">
									<c:forEach items="${menu.subMenu}" var="sub">
										<c:if test="${sub.hasMenu}">
											<c:choose>
												<c:when test="${not empty sub.menuUrl}">
													<dd id="sub${sub.menuId }">
														<a href="javascript:;" data-url="${sub.menuUrl }"
															data-id="${sub.menuId }"> <i class="mine-icon">${sub.menuIcon }</i>
															${sub.menuName }
														</a>
													</dd>
												</c:when>
												<c:otherwise>
													<dd>
														<a href="javascript:void(0);" target="mainFrame"><i
															class="mine-icon">${sub.menuIcon }</i>${sub.menuName }</a>
													</dd>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</dl></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="layui-body">
			<div class="layui-tab layui-tab-brief" lay-filter="top_tab"
				lay-allowclose="true">
				<ul class="layui-tab-title">

				</ul>
				<div class="layui-tab-content"></div>
			</div>
		</div>
		<div class="layui-footer"
			style="text-align: center; line-height: 44px;">Copyright © 2017
			Powered by 松果科技</div>
</body>
<script src="../layui/layui.js"></script>
<script>
    layui.use(['element','layer'],function() {
        var layer = layui.layer
                , element = layui.element()
                , $ = layui.jquery;
        var navfilter = 'test';
        var nav = $('.layui-nav[lay-filter=' + navfilter + ']').eq(0);
        var tabfilter = 'top_tab';
        var tab = $('.layui-tab[lay-filter=' + tabfilter + ']').eq(0);
        var tabcontent = tab.children('.layui-tab-content').eq(0);
        var tabtitle = tab.children('.layui-tab-title').eq(0);
        /**
         * iframe自适应
         */
        $(window).resize(function () {
            //设置顶部切换卡容器度
            tabcontent.height($(this).height() - 60 - 41 - 20 - 44); //头部高度 顶部切换卡标题高度 顶部切换卡内容padding 底部高度
            //设置顶部切换卡容器内每个iframe高度
            tabcontent.find('iframe').each(function () {
                $(this).height(tabcontent.height());
            });
        }).resize();
        
        //监听侧边栏导航点击事件
        var method=function(elem){
                var a = elem.children('a');
                var title = a.html();
                var src = elem.children('a').attr('data-url');
                var id = elem.children('a').attr('data-id');
                var iframe = tabcontent.find('iframe[data-id=' + id + ']').eq(0);
                var tabindex = tabtitle.children('li').length;
                if (src != undefined && src != null && id != undefined && id != null) {
                    if (iframe.length) { //存在 iframe
                        //获取iframe身上的tab index
                        id = iframe.attr('data-id');
                    } else { //不存在 iframe
                        //显示加载层
                        layer.load();
                        setTimeout(function () {
                            layer.closeAll('loading');
                        }, 300);
                        //拼接iframe
                        var iframe = '<iframe';
                        iframe += ' src="' + src + '" data-id="' + id + '" data-tabindex="' + tabindex + '"';
                        iframe += ' style="width:100%;height: ' + tabcontent.height() + 'px; border: 0px;"';
                        iframe += '></iframe>';
                        //顶部切换卡新增一个卡片
                        element.tabAdd(tabfilter, {title: title, content: iframe});
                        tabtitle.children('li').eq(tabindex).attr('lay-id', id);
                    }
                }
                //切换到指定lay-id的卡片
                element.tabChange(tabfilter, id);
         };
        element.on('nav(' + navfilter + ')',method);
        element.on('nav(alone)',method);
//      初始化点击侧边栏第一个导航
        nav.find('li').eq(0).click();
        //      初始化侧边栏第一个导航删除按钮隐藏
       tabtitle.children('li').eq(0).find('i:nth-child(2)').hide();
//          初始化点击侧边栏第一个导航
//         nav.find('li').eq(0).click();
        $('#exit').click(function(){
            layer.open({
                title:'提示'
                ,content:'确认要退出吗？'
                ,closeBtn:false
                ,btn:['确认','取消']
                ,yes:function(){
                	window.location.href='logout.html';
                }
            })
        })
    })
</script>
</html>