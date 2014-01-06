function loginform()
{
	var xmlRequest = createRequest();
	xmlRequest.open("post", "servlet/LoginServlet?username=" + $("username").value
			+ "&password=" + $("password").value, true);
	xmlRequest.onreadystatechange = function()
	{
		if (xmlRequest.readyState == 4)
		{
			if (xmlRequest.status == 200)
			{
				var verify = xmlRequest.responseText;
				if(verify == 1) {
					window.location.href="../Mail/mail/index.jsp";
				} else {
					alert("用户名或密码错误");
				}
			}
		}
	};
	xmlRequest.send(null);
	return false;
}

function createRequest()
{
	var xmlRequest;
	if (typeof XMLHttpRequest != "undefined")
	{
		return new XMLHttpRequest();
	} else if (window.ActiveXObject)
	{
		try
		{
			xmlRequest = new ActiveXObject("MSXML2.XMLHttp.6.0");
		} catch (e)
		{

		}
		try
		{
			xmlRequest = new ActiveXObject("MSXML2.XMLHttp.3.0");
		} catch (e)
		{

		}
	}
	return xmlRequest;
}
