<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript">
    function checkform(form) {
        var u = $.trim($("#username").val());
        u ? $("#unerror").text("") : $("#unerror").text("用户名不能为空");
        var p = $.trim($("#password").val());
        p ? $("#pwerror").text("") : $("#pwerror").text("密码不能为空");
        if (u && p) {
            return true;
        } else {
            return false;
        }
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
                <span class="text">登录邮箱</span>
            </div>
            <!-- #section -->
            <div id="msg_tip" class="clearfix err"></div>
            <!-- #msgtip -->
            <div id="section_l">
                <form action="login" method="post" onsubmit="return checkform(this);">
                    <p class="rowl">
                        <label class="label" for="username"> 用户名: </label> <input type="text" name="username" value=""
                            id="username" class="inputl" /> <span id="unerror" class="c" style="color: red"></span>
                    </p>
                    <p class="rowl">
                        <label class="label" for="password"> 密码: </label> <input type="password" name="password"
                            value="" id="password" class="inputl" /> <span id="pwerror" class="c" style="color: red"></span>
                    </p>
                    <p class="rowl acts">
                        <label for="autologin"><input type="checkbox" name="autologin" id="autologin" />下次自动登录</label>&nbsp;&nbsp;
                        <a title="" href="/member/getpassword">忘记密码了?</a>
                    </p>
                    <p class="rowl acts">
                        <input type="submit" class="loginbutton text" value="登&nbsp;录" />
                    </p>
                </form>
            </div>
            <!-- #login -->
            <div id="section_r">
                <label class="clearfix fonth label_r">还没有帐号? <a href="/register">免费注册</a></label>
            </div>
        </div>
        <!-- #content -->
    </div>
    <!-- #wrapper -->
    <!-- <include page="footer.jsp" /> -->
    <%@include file="inc/footer.jsp"%>
    <!-- #footer -->
</body>
</html>