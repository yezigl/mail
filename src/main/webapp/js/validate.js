var g_reg_submit = false;
var g_reg_submited = false;
var showerror = false;
var reg_elements = new Array("email", "password", "repassword", "name", "gender", "question",
		"ownquestion", "answer", "code");
var reg_verify = new Array(0, 0, 0, 0, 0, 0, 1, 0, 0);

function regform(form)
{
	for ( var i = 0; i < reg_verify.length; i++)
	{	
		if(reg_verify[i] == 0 || reg_verify[i] == 2) {			
			if(reg_verify[i] == 0) {
				showtip(reg_elements[i], false, "html_"+reg_elements[i]+"0");
			}else if(reg_verify[i] == 2) {
				showtip(reg_elements[i], false, "html_"+reg_elements[i]+"2");
			}
			return false;
		}
	}
	return true;
}

function tipWarn()
{
	return '&nbsp;<img src="img/error.gif" width="18" height="24"/>';
}

function tipOk()
{
	return '&nbsp;<img src="img/good.gif" width="17" height="13"/>';
}

function showtip_warn(v_tipname, v_hide)
{
	var tip1 = document.getElementById(v_tipname + "_tip1");
	tip1.className = "zc_cwts";
	tip1.innerHTML = tipWarn();
	tip1.style.display = v_hide ? "none" : "block";
}

function showtip_ok(v_tipname, v_hide)
{
	var tip1 = document.getElementById(v_tipname + "_tip1");
	tip1.className = "zc_cwts";
	tip1.innerHTML = tipOk();
	tip1.style.display = v_hide ? "none" : "block";
}

function changeCode()
{
	var timenow = new Date().getTime();
	var code = document.getElementById("codeimg");

	code.src = "imagecode.jsp?d=" + timenow;

	setTimeout( function()
	{
		code.src = "imagecode.jsp?d=" + timenow;
	}, 20);
}

function changeQues(value)
{
	var ownQuestionValue = "ownquestion";
	var ownQuestionName = "ownquestion";
	
	if (value != "choosequestion")
	{
		hidetip("question");
		reg_verify[5] = 1;
	} else {
		reg_verify[5] = 0;
	}

	var ownQuestionField = document.getElementById("ownques");
	if (value == ownQuestionValue)
	{
		ownQuestionField.style.display = 'block';
		ownQuestionField.focus();

	} else
	{
		ownQuestionField.style.display = 'none';
	}
}

function showtip(tipname, error, tipcode)
{
	if (!error)
	{
		var tip = document.getElementById(tipname + "_tip2");
		var info = document.getElementById(tipcode);
		tip.innerHTML = info.innerHTML;
		tip.style.display = "block";
	}
}

function hidetip(tipname)
{
	var tip2 = document.getElementById(tipname + "_tip2");
	tip2.innerHTML = "";
	tip2.style.display = "none";
}

function emailOnfocus(obj)
{
	if (0 == obj.value.length)
	{
		showtip("email", false, "html_email1");
	}
	if (showerror)
	{
		if (obj.value.length != 0 && obj.value.length < 6)
		{
			showtip("email", false, "html_email2");
		}
	}
}
function emailOnblur(obj)
{
	hidetip("email");
	if(obj.value.length == 0) {
		reg_verify[0] = 0;
	}else if (obj.value.length != 0 && obj.value.length < 6)
	{
		showtip_warn("email", false);
		showerror = true;

		reg_verify[0] = 2;
	} else if (obj.value.length >= 6)
	{
		hidetip("email");
		showtip_ok("email", false);
		showerror = false;

		reg_verify[0] = 1;
	}
}

function passwordOnfocus(obj)
{
	if (0 == obj.value.length)
	{
		showtip("password", false, "html_password1");
	}
	if (showerror)
	{
		if (obj.value.length != 0 && obj.value.length < 6)
		{
			showtip("password", false, "html_password2");
		}
	}
}
function passwordOnblur(obj)
{
	hidetip("password");
	if(obj.value.length == 0) {
		reg_verify[1] = 0;
	}else if (obj.value.length != 0 && obj.value.length < 6)
	{
		showtip_warn("password", false);
		showerror = true;

		reg_verify[1] = 2;
	} else if (obj.value.length >= 6)
	{
		hidetip("password");
		showtip_ok("password", false);
		showerror = false;

		reg_verify[1] = 1;
	}
}

function repasswordOnfocus(obj)
{
	var pwd = document.getElementById("password");
	if (obj.value.length != 0)
	{
		if (pwd.value != obj.value)
		{
			showtip("repassword", false, "html_repassword2");
		}
	}
}
function repasswordOnblur(obj)
{
	hidetip("repassword");

	var pwd = document.getElementById("password");
	if (obj.value.length == 0)
	{
		reg_verify[2] = 0;
	} else if (obj.value != 0 && obj.value.length >= 6 && pwd.value == obj.value)
	{
		hidetip("repassword");
		showtip_ok("repassword", false);
		showerror = false;

		reg_verify[2] = 1;
	} else
	{
		showtip_warn("repassword", false);
		showerror = true;

		reg_verify[2] = 2;
	}
}

function nameOnfocus(obj)
{
	if (0 == obj.value.length)
	{
		showtip("name", false, "html_name1");
	}
}
function nameOnblur(obj)
{
	hidetip("name");
	if (obj.value.length != 0)
	{
		reg_verify[3] = 1;
	} else {
		reg_verify[3] = 0;
	}
}

function genderOnfocus(obj)
{
	hidetip("gender");
	showtip_ok("gender", false);
	reg_verify[4] = 1;
}
function genderOnblur(obj)
{
	hidetip("gender");
}

function quesOnblur(obj)
{
	hidetip("question");
}

function ownquesOnblur(obj)
{
	if (obj.value.length != 0)
	{
		reg_verify[6] = 1;
	} else {
		reg_verify[6] = 0;
	}
}

function answerOnfocus(obj)
{

}
function answerOnblur(obj)
{
	if (obj.value.length != 0)
	{
		reg_verify[7] = 1;
	} else {
		reg_verify[7] = 0;
	}
}

function checkcodeOnfocus(obj)
{
	if (0 == obj.value.length)
	{
		showtip("code", false, "html_code1");
	}
	if (showerror)
	{
		showtip("code", false, "html_code2");
	}
}
function checkcodeOnblur(obj)
{
	hidetip("code");

	if (obj.value.length != 0)
	{
		verifycode(obj.value);
	} else {
		reg_verify[8] = 0;
	}
}

function verifycode(code)
{
	var xmlRequest = createRequest();
	xmlRequest.open("get", "servlet/RegisterServlet?type=vc&code=" + code, true);
	xmlRequest.onreadystatechange = function()
	{
		if (xmlRequest.readyState == 4)
		{
			if (xmlRequest.status == 200)
			{
				var verify = xmlRequest.responseText;
				if (verify == 1)
				{
					showtip_ok("code", false);
					showerror = false;

					reg_verify[8] = 1;
				} else
				{
					showtip_warn("code", false);
					showerror = true;

					reg_verify[8] = 2;
				}
			}
		}
	};
	xmlRequest.send(null);
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
