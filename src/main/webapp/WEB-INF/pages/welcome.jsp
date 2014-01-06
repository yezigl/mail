<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link type="image/x-icon" rel="shortcut icon" href="/favicon.ico" />
<script type="text/javascript" src="/js/jquery-1.6.min.js"></script>
<script type="text/javascript">
    function checkform(form) {
        var tip = $("#msg_tip");
        var u = $.trim($("#username").val());
        if (u) {
            tip.text("");
            tip.hide();
        } else {
            tip.text("用户名不能为空");
            tip.show();
            return false;
        }
        var p = $.trim($("#password").val());
        if (p) {
            tip.text("");
            tip.hide();
        } else {
            tip.text("密码不能为空");
            tip.show();
            return false;
        }
        return u & p;
    }
</script>
<title>Web Mail</title>
</head>
<body>
  <div id="wrapper">
    <div id="header">
      <div id="menu"></div>
    </div>
    <!-- #header -->
    <div id="content">
      <div id="section_h">
        <span class="font1">登录邮箱</span>
      </div>
      <!-- #section -->
      <div id="msg_tip" class="clearfix font2"></div>
      <!-- #msgtip -->
      <div id="section_l" class="font2">
        <form action="login" method="post" onsubmit="return checkform(this);">
          <p class="rowl">
            <label class="label" for="username"> 用户名: </label>
            <input type="text" name="login.username" value="" id="username" class="inputl" />
          </p>
          <p class="rowl">
            <label class="label" for="password"> 密码: </label>
            <input type="password" name="login.password" value="" id="password" class="inputl" />
          </p>
          <p class="rowl acts">
            <label for="autologin"><input type="checkbox" name="autologin" id="autologin" />下次自动登录</label>&nbsp;&nbsp;
            <a title="" href="/member/getpassword">忘记密码了?</a>
          </p>
          <p class="rowl acts">
            <input type="submit" class="loginbutton font1" value="登&nbsp;录" />
          </p>
        </form>
      </div>
      <!-- #login -->
      <div id="section_r" class="font2">
        <label class="clearfix font2 label_r">还没有帐号? <a href="#">免费注册</a></label>
      </div>
    </div>
    <!-- #content -->
  </div>
  <!-- #wrapper -->
  <!-- <include page="footer.jsp" /> -->
  <%@include file="footer.jsp" %>
  <!-- #footer -->