<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/mail.js"></script>
<title>draft</title>
</head>
<body>
<div id="mainframe">
	<div id="title" class="tal">
		<b>草稿箱</b>
	</div>
	<div id="toolbar">
		<div class="titleleft">
			<input name="deldraft" class="" type="button" value="删除草稿" />
			<input name="return" class="" type="button" value="转发" />
			<select name="mark" onchange="">
				<option selected="selected">
					标记为...
				</option>
				<option value="false">
					&nbsp;&nbsp;已读邮件
				</option>
				<option value="true">
					&nbsp;&nbsp;未读邮件
				</option>
			</select>
			<select name="moveto" onchange="">
				<option selected="selected">
					移动到...
				</option>
				<option value="inbox">
					&nbsp;&nbsp;收件箱
				</option>
				<option value="sent">
					&nbsp;&nbsp;已发送
				</option>
			</select>
		</div>
	</div>
	<div style="border: #fff 1px solid;">
		<table cellspacing="0" cellpadding="0" class="tc">
			<tbody>
				<tr style="background-color: #f2f4f6; height: 21px;">
					<td style="padding: 1px 0 1px 5px; width: 22px;">
						<input title="选中/取消选中" type="checkbox" value="on" />
					</td>
					<td class="tcbg" style="width: 130px; padding-left: 12px; padding-top: 2px;">
						<a href="" class="ta">收件人</a>
					</td>
					<td class="tcbg" style="width: 630px; padding-left: 12px; padding-top: 2px;">
						<a href="" class="ta">主题</a>
					</td>
					<td class="tcbg" style="width: 120px; padding-left: 12px; padding-top: 2px;">
						<a href="" class="ta">时间</a>
					</td>
					<td class="tcbg" style="width: 20px; padding-left: 2px;"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="" style="display: none;">
		<table>
			<tr></tr>
		</table>
	</div>
	<div class="nomail" style="display: block;">
		<b>没有邮件</b>
	</div>
	<div id="toolbar">
		<div class="titleleft">
			<input name="deldraft" class="" type="button" value="删除草稿" />
			<input name="return" class="" type="button" value="转发" />
			<select name="mark" onchange="">
				<option selected="selected">
					标记为...
				</option>
				<option value="false">
					&nbsp;&nbsp;已读邮件
				</option>
				<option value="true">
					&nbsp;&nbsp;未读邮件
				</option>
			</select>
			<select name="moveto" onchange="">
				<option selected="selected">
					移动到...
				</option>
				<option value="inbox">
					&nbsp;&nbsp;收件箱
				</option>
				<option value="sent">
					&nbsp;&nbsp;已发送
				</option>
			</select>
		</div>
	</div>
</div>
</body>
</html>