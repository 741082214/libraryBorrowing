<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="library.domain.UserInfoBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系我们</title>
<link rel='stylesheet' type='text/css'>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
</head>
 <%
	 UserInfoBean user = (UserInfoBean)session.getAttribute("user");
 %>
<body>
	<div id="header">
		<div class="container">
			<a href="SearchBookServlet" id="logo"><img src="images/logo.png"
				alt="Company Logo" /></a>
			<div class="navigation">
				<ul>
<%--					<li><a href="userhome.jsp">主页</a>--%>
<%--						<div class="clear"></div></li>--%>
					<li><a href="SearchBookServlet">图书分类</a></li>
					<li><a href="DonateServlet">图书捐赠</a>
						<div class="clear"></div></li>
					<li><a href="UserInfoServlet">个人信息</a></li>
					<li class="active"><a href="DonateServlet">联系我们</a>
						<div class="clear"></div></li>
						<li><a href="LogoutServlet">退出登录</a>
						<div class="clear"></div></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="intro">
		<div id="top"></div>
		<div class="container">
			<h2>Contact us</h2>
			<div class="search">
				<form action="ReaderSearchServlet" method="post">
					<fieldset>
						<input type="text" name="search" value="搜索图书"  onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;}"  />
						<input type="submit" name="submit" value="" />
					</fieldset>
				</form>
				<div class="clear"></div>
			</div>
			<a class="login" href="#"><%=user.getUname() %></a>
			<div class="clear"></div>
		</div>
	</div>
	<div class="container">
		<div id="main">
			<div class="row">
				<div class="span8">
					<div class="separator2 separator_title">

					</div>
					<br />
					<div id="respond_wrap">
						<div id="respond">
							<h4>留言:</h4>
							<br /> <a class="cancel_reply" href="#">Click here to cancel
								reply</a>
							<div class="clear"></div>
							<form id="comment_form" method="post" action="MessageServlet" class="contact">
								<fieldset>
									<div style="float: left; margin-right: 33px;">
										<div class="text_input">
											<input type="text" name="name" value=""
												placeholder="Your Name" onfocus="this.placeholder=''" onblur="this.placeholder='Your Name'"/>
										</div>
										<div class="text_input">
											<input type="text" name="email" value=""
												placeholder="Email address" onfocus="this.placeholder=''" onblur="this.placeholder='Email address'" />
										</div>
										<div class="text_input2">
											<input type="text" name="url" value=""
												data-default="下面可以输入你想对作者说的话：" disabled  />
										</div>
									</div>
									<ul class="form_errors">
										<li class="nameError hidden">请留下您的尊姓大名</li>
										<li class="emailError hidden">请留下您的联系邮箱</li>
										<li class="commentError hidden">请留下您想对作者说的话</li>
									</ul>
									<div class="clear"></div>
									<div class="textarea_input">
										<textarea tabindex="1" rows="10" cols="58" name="comment"></textarea>
									</div>
									<div class="submit_wrap">
										<div class="button_submit">
												<a class="button2 button_arrow_right" href="#"><input type="submit" value="" />提交</a>
										</div>
										<div class="clear"></div>
									</div>
									<input type="hidden" name="parent" value="0" />
								</fieldset>
							</form>
						</div>
					</div>
				</div>
					<div class="span4 sidebar right_sidebar">
					<span class="title_box icon_calendar">联系我们</span> <br />
					<p>Name:徐悦佳</p>
					<p>Address:广东海洋大学</p>
					<p>Phone: 17827221363</p>
					<p>
						Email: <a href="mailto:info@domain.com">741082214@qq.com</a>
					</p>
						<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<br /> <br />
					</form>
					<br />
					<p>&nbsp;</p>
					<br />
					<span class="right_sidebar_after"></span>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
	   <br/>
		<div class="container">
			<div class="foot">
				<ul class="social_icons">
					<li><img src="images/social_facebook_hover.png" alt="facebook"
						class="hover" /></li>
					<li><img src="images/social_twitter_hover.png" alt="twitter"
						class="hover" /></li>
					<li><img src="images/social_google_hover.png" alt="google"
						class="hover" /></li>
					<li><img src="images/social_lastfm_hover.png" alt="lastfm"
						class="hover" /></li>
					<li><img src="images/social_rss_hover.png" alt="rss"
						class="hover" /></li>
				</ul>
			</div>
			<%
				Date date=new Date();
				SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy");
				String nowYear=simpleDate.format(date);
			%>
			<div class="copyright">Copyright &copy; 2018-<%=nowYear%> 徐悦佳. All rights reserved.</div>
		</div>
	</div>
	<a id="top_button" href="#top"></a>
	<script type="text/javascript">
		var gmapSettings = {
			markers : [ {
				address : 'london'
			} ],
			zoom : 14
		};
	</script>
	<script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="scripts/superfish.js" type="text/javascript"></script>
	<script src="scripts/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="scripts/jquery.gmap-1.1.0-min.js" type="text/javascript"></script>
	<script src="scripts/custom4963.js?ver=1.1" type="text/javascript"></script>

</body>
</html>