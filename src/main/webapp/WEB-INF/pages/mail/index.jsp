<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mail.css" rel="stylesheet" type="text/css" />
<script src="js/mail.js" type="text/javascript"></script>
<title>Web Mail</title>
<script type="text/javascript" language="javascript">
    
</script>
</head>
<body>
    <div id="container">
        <div id="header">
            <div class="topdata">
                <div class="logo"></div>
                <div class="topbg">
                    <div id="user">
                        ${username} | <a href="/config" target="_mainframe" class="ce">设置</a> | <a
                            href="/help.html" target="_mainframe" class="ce">帮助</a> | <a href="/"
                            target="" class="ce">退出</a>
                    </div>
                    <div class="search">
                        <div style="margin-left: 5px;">
                            <input class="input_subject" type="text" /> <input class="" type="button" value="查找邮件" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="banner">
            <div class="topline fl"></div>
        </div>
        <div id="content">
            <div id="sidebar">
                <div class="sidebg">
                    <div style="width: 160px; height: 107px;">
                        <ul class="navbar">
                            <li class="sul1"><a class="ce" href="compose" target="_mainframe">新邮件 </a></li>
                            <li class="sul2"><a class="ce" href="inbox" target="_mainframe">收邮件 </a></li>
                            <li class="sul3"><a class="ce" href="addrlist" target="_mainframe">联系人 </a></li>
                        </ul>
                    </div>
                    <div class="list">
                        <ul class="listbar">
                            <li class="fs"><a href="inbox" target="_mainframe" class="cl">收件箱</a></li>
                            <li class="fs"><a href="sent" target="_mainframe" class="cl">已发送</a></li>
                            <li class="fs"><a href="draft" target="_mainframe" class="cl">草稿箱</a></li>
                            <li class="fs"><a href="spam" target="_mainframe" class="cl">垃圾箱</a></li>
                            <li class="fs"><a href="trash" target="_mainframe" class="cl">已删除</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="main">
                <iframe title="main" class="tbody" id="_mainframe" name="_mainframe" scrolling="auto" align="top"
                    src="inbox" frameborder="0" width="100%" height="100%"
                    onload="this.height = document.body.offsetHeight;"></iframe>
            </div>
        </div>
    </div>
</body>
</html>