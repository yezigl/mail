<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/mail.js"></script>
<title>compose</title>
<script type="text/javascript" language="javascript">
function Exit() {
location.replace("/inbox");	
}
</script>
</head>
<body style="background: #ecf9ff">
<div id="mainframe">
	<form action="/send" method="post" name="composeform">
		<div id="title" class="tal">
			<b>新邮件</b>
		</div>
		<div id="toolbar">
			<div class="titleleft">
				<input name="sendbtn" class="" type="button"
					onclick="javascript:document.composeform.submit();" value="发送" />
				<input name="savedraftbtn" class="" type="button" value="存草稿" />
				<input name="closebtn" class="" type="button" onclick="Exit()" value="关闭" />
			</div>
		</div>
		<div>
			<div style="clear: left; margin-right: 140px; margin-top: 5px;">
				<div class="add">
					<a id="addcc" href="javascript:addcc(this);">添加抄送</a>-
					<a id="addbcc" href="javascript:addbcc(this);">添加密送</a>
				</div>
				<div class="sh">
					<div class="fl lw">
						收件人
					</div>
					<div class="rw">
						<input name="tc" type="text" style="width: 100%" />
					</div>
				</div>
				<div id="cc" class="sh" style="display: none;">
					<div class="fl lw">
						抄送
					</div>
					<div class="rw">
						<input name="cc" type="text" style="width: 100%" />
					</div>
				</div>
				<div id="bcc" class="sh" style="display: none;">
					<div class="fl lw">
						密送
					</div>
					<div class="rw">
						<input name="bcc" type="text" style="width: 100%" />
					</div>
				</div>
				<div class="sh">
					<div class="fl lw">
						主题
					</div>
					<div class="rw">
						<input name="subject" type="text" style="width: 100%" />
					</div>
				</div>
			</div>
			<div style="height: 11px"></div>
			<div style="clear: both; padding-left: 49px;">
				<a>添加附件</a>
			</div>
			<div style="height: 5px"></div>
			<div style="clear: left; margin-right: 140px;">
				<div class="fl lw">
					正文
				</div>
				<div class="rw">
					<textarea name="_content" id="_content" rows="32"></textarea>
				</div>
			</div>
		</div>
		<div id="toolbar">
			<div class="titleleft">
				<input name="sendbtn" class="" type="button" value="发送" />
				<input name="savedraftbtn" class="" type="button" value="存草稿" />
				<input name="closebtn" class="" type="button" value="关闭" />
			</div>
		</div>
	</form>
</div>
</body>
</html>