<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mail.css" rel="stylesheet" type="text/css" />
<title>AddrList</title>
<script type="text/javascript">
window.onload = function() {
    console.log(111);
    
};

function del() {
    var list = document.getElementsByName("check");
    for (var i = 0; i < list.length; i++) {
        var ch = list[i];
        if (ch.checked) {
            ch.parentElement.style.display = "none";
        }
        
    }
}
</script>
</head>
<body>
<div id="mainframe">
	<form action="" method="post">
		<div id="title" class="tal">
			<b>联系人</b>
		</div>
		<div id="toolbar">
			<div class="titleleft">
				<input name="" class="" type="button" value="新建" />
				<input name="" class="" type="button" value="编辑" />
                <input name="" class="" type="button" onclick="del" value="删除" />
			</div>
		</div>
		<div style="">
			<table cellspacing="0" cellpadding="0" class="tc">
				<tbody>
					<tr style="border: #fff 1px solid; background-color: #f2f4f6; height: 21px;">
						<td style="padding: 1px 0 1px 5px; width: 22px;">
							
						</td>
						<td class="tcbg" style="width: 200px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">姓名</a>
						</td>
						<td class="tcbg" style="width: 300px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">邮箱</a>
						</td>
						<td class="tcbg" style="width: 120px; padding-left: 12px; padding-top: 2px;">
							<a href="" class="ta">备注</a>
						</td>
					</tr>
                    <tr onmouseover="">
                        <td style="padding: 1px 0 1px 5px;"><input title="选中/取消选中" type="checkbox" value="on" name="check" /></td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;">爱的代价</td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;">263056528@qq.com</td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;"></td>
                    </tr>
                    <tr onmouseover="">
                        <td style="padding: 1px 0 1px 5px;"><input title="选中/取消选中" type="checkbox" value="on" name="check" /></td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;">八杯水?</td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;">568418157@qq.com</td>
                        <td style="padding: 2px 1px 2px 6px; overflow: hidden;"></td>
                    </tr>
				</tbody>
			</table>
		</div>
        
	</form>
</div>
</body>
</html>