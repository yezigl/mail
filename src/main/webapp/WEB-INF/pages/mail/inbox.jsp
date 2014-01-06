<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mail.css" rel="stylesheet" type="text/css" />
<title>Inbox</title>
</head>
<body>
<div id="mainframe">
	<form action="" method="post">
		<div id="title" class="tal">
			<b>收件箱</b>
		</div>
		<div id="toolbar">
			<div class="titleleft">
				<input name="delbtn" class="" type="button" value="删除" />
				<input name="deldelbtn" class="" type="button" value="彻底删除" />
				<input name="return" class="" type="button" value="转发" />
				<select name="mark" onchange="">
					<option selected="selected">
						标记为...
					</option>
					<option value="false">
						&nbsp;已读邮件
					</option>
					<option value="true">
						&nbsp;未读邮件
					</option>
				</select>
				<select name="moveto" onchange="">
					<option selected="selected">
						移动到...
					</option>
					<option value="inbox">
						&nbsp;收件箱
					</option>
					<option value="sent">
						&nbsp;已发送
					</option>
				</select>
			</div>
		</div>
		<div style="">
			<table cellspacing="0" cellpadding="0" class="tc">
				<tbody>
					<tr style="border: #fff 1px solid; background-color: #f2f4f6; height: 21px;">
						<td style="padding: 1px 0 1px 5px; width: 22px;">
							<input title="选中/取消选中" type="checkbox" value="on" />
						</td>
						<td class="tcbg" style="width: 160px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">发件人</a>
						</td>
						<td class="tcbg" style="width: 500px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">主题</a>
						</td>
						<td class="tcbg" style="width: 120px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">时间</a>
						</td>
						<td class="tcbg" style="width: 20px; padding-left: 2px;"></td>
					</tr>
                    <c:forEach items="${mailList }" var="item">
                    <tr onmouseover="">
                        <td style="padding: 1px 0 1px 5px;"><input title="选中/取消选中" type="checkbox" value="on" /></td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;"><c:out value="${item.from }" /></td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;"><c:out value="${item.subject }" /></td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;"><c:out value="${item.sentDate }" /></td>
                    </tr>
                    </c:forEach>
                    <c:if test="${empty mailList }">
                    <tr class="nomail" style="display: block;">
                        <td colspan="4"><b>没有邮件</b></td>
                    </tr>
                    </c:if>
				</tbody>
			</table>
		</div>
        
		<div id="toolbar">
			<div class="titleleft">
				<input name="delbtn" class="" type="button" value="删除" />
				<input name="deldelbtn" class="" type="button" value="彻底删除" />
				<input name="return" class="" type="button" value="转发" />
				<select name="mark" onchange="">
					<option selected="selected">
						标记为...
					</option>
					<option value="false">
						&nbsp;已读邮件
					</option>
					<option value="true">
						&nbsp;未读邮件
					</option>
				</select>
				<select name="moveto" onchange="">
					<option selected="selected">
						移动到...
					</option>
					<option value="inbox">
						&nbsp;收件箱
					</option>
					<option value="sent">
						&nbsp;已发送
					</option>
				</select>
			</div>
		</div>
	</form>
</div>
</body>
</html>