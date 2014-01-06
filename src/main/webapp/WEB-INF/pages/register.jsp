<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="/js/validate.js" type="text/javascript"></script>
		<link href="/css/register.css" rel="stylesheet" type="text/css" />
		<link href="/css/style.css" rel="stylesheet" type="text/css" />
		<title>WebMail-注册</title>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<div id="menu">
					<ul>
						<li>
							<a class="ce" href="/">首页</a>
						</li>
						<li class="menuDiv"></li>
						<li>
							<a class="ce" href="/">登录</a>
						</li>
						<li class="menuDiv"></li>
						<li>
							<a class="ce" href="help.html">帮助</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="register">
				<div style="display: block;">
					<div class="r1">
						<h3>
							注册：开通您的账户
						</h3>
					</div>
					<div style="margin-left: 100px">
						电子邮件可以帮助你与你的朋友、同事、同学、家人保持更紧密联系， 你可以及时了解
						<br>
						他们的最新动态；分享你的照片、心情、快乐；结识更多的新朋友
					</div>
				</div>
				<div id="reg" style="display: block;">
					<form action="servlet/RegisterServlet" method="get" name="createaccount" onsubmit="return regform(this);">
						<input type="hidden" value="reg" name="type">
						<div class="r2">
							<div id="r21" class="re">
								<div class="zc1">
									理想的登录帐号：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<span class="itl"> <input name="email" class="it_" id="email" type="text"
											onfocus="emailOnfocus(this)" onblur="emailOnblur(this)" maxLength="100" /> </span>
									<div id="email_tip1" class="zc_cwts" style="display: none;">
									</div>
									<div id="email_tip2" class="tip2" style="display: none;">
									</div>
								</div>
							</div>
							<div id="r22" class="re">
								<div class="zc1">
									设置密码：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<span class="itl"> <input name="password" class="it_" id="password" type="password"
											onfocus="passwordOnfocus(this)" onblur="passwordOnblur(this)" maxLength="100" /> </span>
									<div id="password_tip1" style="display: none;">
									</div>
									<div id="password_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r23" class="re">
								<div class="zc1">
									再输入一遍密码：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<span class="itl"> <input name="repassword" class="it_" id="repassword"
											type="password" onfocus="repasswordOnfocus(this)" onblur="repasswordOnblur(this)" maxLength="100" /> </span>
									<div id="repassword_tip1" style="display: none;">
									</div>
									<div id="repassword_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r24"></div>
							<div id="r25"></div>
							<div id="r26" class="re">
								<div class="zc1">
									你的姓名：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<span class="itl"> <input name="name" class="it_" id="name" type="text"
											onfocus="nameOnfocus(this)" onblur="nameOnblur(this)" maxLength="100" /> </span>
									<div id="name_tip1" style="display: none;">
									</div>
									<div id="name_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r27" class="re">
								<div class="zc1">
									性别：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<input name="gender" id="gender0" onfocus="genderOnfocus(this)" onblur="genderOnblur(this)"
										type="radio" value="男" />
									男&nbsp;&nbsp;&nbsp;
									<input name="gender" id="gender1" onfocus="genderOnfocus(this)" onblur="genderOnblur(this)"
										type="radio" value="女" />
									女
									<div id="gender_tip1" style="display: none;">
									</div>
									<div id="gender_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r28" class="re">
								<div class="zc1">
									安全问题：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<select id="questions" onchange="changeQues(this.value)" onblur="quesOnblur(this)" name="selection"
										style="width: 225px">
										<option value="choosequestion" selected="selected">
											选择问题...
										</option>
										<option value="您主要的帐户编号是多少">
											您主要的帐户编号是多少
										</option>
										<option value="您的借书卡卡号是多少">
											您的借书卡卡号是多少
										</option>
										<option value="您的第一个电话号码是多少">
											您的第一个电话号码是多少
										</option>
										<option value="您的第一位老师的姓名">
											您的第一位老师的姓名
										</option>
										<option value="ownquestion">
											我自己编写问题
										</option>
									</select>
									<div id="question_tip1" style="display: none;">
									</div>
									<div id="question_tip2" class="tip2" style="display: none;"></div>
								</div>
								<div id="ownques" class="ques zc2" style="display: none;">
									<span class="itl"> <input name="ownquestion" class="it_" id="ownquestion"
											type="text" onblur="ownquesOnblur(this)" maxLength="100" /> </span>
								</div>
							</div>
							<div id="r29" class="re">
								<div class="zc1">
									答案：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<span class="itl"> <input name="answer" class="it_" id="answer" type="text"
											onfocus="answerOnfocus(this)" onblur="answerOnblur(this)" maxLength="100" /> </span>
									<div id="answer_tip1" style="display: none;">
									</div>
									<div id="answer_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r24"></div>
							<div id="r25"></div>
							<div id="r2a">
								<div class="zc1">
									验证码：&nbsp;&nbsp;
									<span style="color: #d01e3b;">*</span>
								</div>
								<div class="zc2">
									<div class="itc">
										<input name="code" class="it_" id="code" type="text" onfocus="checkcodeOnfocus(this)"
											onblur="checkcodeOnblur(this)" />
									</div>
									<div style="display: block; margin-left: 90px;">
										<img alt="checkcode" id="codeimg" src="/captcha">
										<br>
										<a title="看不清 换一张" href="javascript:changeCode();">看不清 换一张</a>
									</div>
									<div id="code_tip1" style="display: none;">
									</div>
									<div id="code_tip2" class="tip2" style="display: none;"></div>
								</div>
							</div>
							<div id="r2c">
								<div class="zc2" style="margin-left: 120px; margin-top: 5px; margin-bottom: 10px;">
									<a href="">服务条款</a>
								</div>
							</div>
							<div id="r2b">
								<div class="zc2" style="margin-left: 120px;">
									<input class="ty1" id="btn_ty" type="submit" value="同意条款，立即注册" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="footer">
				<div class="b1">
					<a target="_blank" class="c6" href="about.html">关于我们</a>
					<span>┊</span>
					<a target="_blank" class="c6" href="contact.html">联系方式</a>
					<span>┊</span>
					<a target="_blank" class="c6" href="feedback.html">意见反馈</a>
					<span>┊</span>
					<a target="_blank" class="c6" href="help.html">帮助中心</a>
				</div>
			</div>
		</div>
		<div style="display: none;">
			<div id="html_email1">
				<div class="box-t">
					<div class="box-outer-t">
						<div class="box-inner-t">
							<p class="ps1">
								帐号由6-16个英文字母、数字或下划线组成
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_email2">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								帐号不足6位，请重输！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_email0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请输入你的帐号！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_password1">
				<div class="box-t">
					<div class="box-outer-t">
						<div class="box-inner-t">
							<p class="ps1">
								密码由6-16个英文字母、数字或特殊字符组成
								<br />
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_password2">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								密码不足6位，请重输！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_password0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请您输入密码！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_repassword2">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								两次输入的密码不一样，请重输！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_repassword0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请您再次输入密码以确认！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_gender0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请选定你的性别！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_name1">
				<div class="box-t">
					<div class="box-outer-t">
						<div class="box-inner-t">
							<p class="ps1">
								请输入你的姓名,发送邮件时将显示此名字
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_name0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请输入你的姓名！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_question0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请选定你的安全问题！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_answer0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请输入你的答案！
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_code1">
				<div class="box-t">
					<div class="box-outer-t">
						<div class="box-inner-t">
							<p class="ps1">
								为防止恶意程序自动注册，请输入图中的字符
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="html_code2">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								验证码输入有误，请重输！
							</p>
						</div>
					</div>
				</div>
			</div>
			<br />
			<div id="html_code0">
				<div class="box">
					<div class="box-outer">
						<div class="box-inner">
							<p class="ps2">
								请输入验证码
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>