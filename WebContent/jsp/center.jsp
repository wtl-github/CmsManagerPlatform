<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css"/>
    <style>
    @media screen and (max-width:980px ) {
          #main .left{
               width: 100%;
              margin-bottom: 10px;
            }
          #main .center{
                width: 100%;
              margin: 0;
             float: left;
            }
          #main .right{
                width: 100%;
              margin-bottom: 10px;
            }
            #main .left_pic img{
                max-width: 76px;
            }
        }
     </style>
</head>
<body>
<section id="main">
    <div class="head">
        <div class="left">
            <h2>用户信息</h2>
            <div class="card">
             <div class="left_pic">
             <img src="../images/person.png" alt=""/>
                </div>
            <ul class="info">
                <li>用户名:<span>管理员</span></li>
                <li>所属角色:<span>超级管理员</span></li>
                <li>注册时间:<span>2016-10-15 17:10:23</span></li>
                <li>上次登录时间:<span>2016-10-29 15:10:23</span></li>
            </ul>
            </div>
        </div>
        <div class="right">
            <h2>今日数据</h2>
            <div class="card">
                <img class="pic" src="../images/data.png" alt=""/>
                <p>暂无数据</p>
            </div>
        </div>
        <div class="center">
            <h2>累计数据</h2>
            <div class="card">
                <div class="left_box">
                    <p>23</p>
                    <span>公共资料</span>
                </div>
                <div class="right_box">
                    <p>35</p>
                    <span>社保照片</span>
                </div>

            </div>
        </div>
    </div>
    <blockquote class="layui-elem-quote layui-quote-nm">
        最近数据统计
    </blockquote>
    <div class="layui-collapse" lay-filter="infodetail">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">
                我的资料
                <a href="#sub8">更多>></a></h2>
            <div class="layui-colla-content layui-show">
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width='200'>
                    <col>
                </colgroup>
                <tr>
                    <th>ID</th>
                    <th>标题</th>
                    <th>类型</th>
                    <th>描述</th>
                    <th>关键字</th>
                    <th>上传时间</th>
                </tr>
                <tr>
                    <td>57</td>
                    <td>输送带</td>
                    <td>0010100</td>
                    <td>输送带</td>
                    <td>输送带</td>
                    <td>2016-04-28 09:26:46</td>
                </tr>
                <tr>
                    <td>57</td>
                    <td>输送带</td>
                    <td>0010100</td>
                    <td>输送带</td>
                    <td>输送带</td>
                    <td>2016-04-28 09:26:46</td>
                </tr>
            </table>
            </div>
         </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">公共资料<a href="#sub9">更多>></a></h2></h2>
            <div class="layui-colla-content layui-show">
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width='200'>
                    <col>
                </colgroup>
                <tr>
                    <th>上传者</th>
                    <th>标题</th>
                    <th>类型</th>
                    <th>描述</th>
                    <th>关键字</th>
                    <th>上传时间</th>
                </tr>
                <tr>
                    <td>超级管理员</td>
                    <td>输送带</td>
                    <td>000001010</td>
                    <td>输送带</td>
                    <td>输送带
                        <input class="file" type="hidden" value="文件"/>
                    </td>
                    <td>2016-06-28 14:36:29</td>
                </tr>
                <tr>
                    <td>超级管理员</td>
                    <td>输送带</td>
                    <td>000001010</td>
                    <td>输送带</td>
                    <td>输送带</td>
                    <td>2016-06-28 14:36:29</td>
                </tr>
            </table>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">社保共享资料<a href="#sub10" >更多>></a></h2></h2>
            <div class="layui-colla-content layui-show">
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width='200'>
                    <col width='300'>
                    <col>
                </colgroup>
                <tr>
                    <th>大小</th>
                    <th>文件名</th>
                    <th>缩略图</th>
                    <th>上传时间</th>
                </tr>
                <tr class="detail">
                    <td>12M</td>
                    <td>djflsjfl.png</td>
                    <td>
                        <div id="photos_box">
                            <img src="../images/bs3.png" alt="麦当劳"/>
                            <img src="../images/tp.png" alt="风景"/>
                        </div>
                    </td>
                    <td>2016-05-06 18:00:28</td>
                </tr>
            </table>
            </div>
        </div>
     </div>
</section>
</body>
<script src="../layui/layui.js"></script>
<script>
    layui.use(['element'],function() {
        var element = layui.element()
                , $ = layui.jquery;

        $('#main .layui-colla-title a').click(function(){
            var id=$(this).attr('href');
            $(id,parent.document).click();
        })
    })
</script>
</html>