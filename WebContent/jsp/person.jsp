<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css">
</head>
<body>
<section id="wrap">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th colspan="2">个人信息</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>基本资料</td>
                <td>
                     <div class="person">
                        <img src="../images/person.png" alt=""/>
                    </div>
                    <ul class="info">
                        <li>用户名 <span>${user.username }</span></li>
                        <li>注册时间 <span>2016-10-15 17:10:23</span></li>
                        <li>上次登录时间 <span><fmt:formatDate value="${user.lastLogin }" pattern="yyyy-MM-dd HH:mm:ss"/></span></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>所属角色</td>
                <td>系统管理员</td>
            </tr>
            <tr>
                <td>密码设置</td>
                <td>
                    <form action="" class="layui-form">
                        <div class="layui-form-item">
                            <label for="" class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="psw" class="layui-input" placeholder="请输入当前密码"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="" class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="psw" class="layui-input" placeholder="请输入新密码"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="" class="layui-form-label">确认新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="psw" class="layui-input" placeholder="请再次输入新密码"/>
                            </div>
                        </div>

                            <button type="button" id="keep" class="layui-btn">保存</button>

                    </form>
                </td>
            </tr>
            </tbody>
        </table>
</section>
</div>
<script src="../layui/layui.js"></script>
<script>
    layui.use(['layer','form','element','upload'],function() {
        var layer = layui.layer
                    ,form = layui.form()
                    , element = layui.element()
                    , $ = layui.jquery;
        layui.upload({
            url: '' //上传接口
            ,success: function(res){ //上传成功后的回调
                console.log(res)
            }
        });
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
       // $('.person').find('span.layui-upload-icon').html('<i class="layui-icon">&#xe61f;</i>修改头像');
    })
</script>
</body>
</html>