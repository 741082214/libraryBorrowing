<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="library.domain.UserInfoBean" %>
<%@ page import="library.domain.BorrowBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Info</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
.container #main .row .span4.sidebar.right_sidebar #aa {
	
}

.container #main .row .span8.blog.blog1 .blog_post form table tr td #button
	{
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	border-top-color: #F33;
	border-right-color: #F33;
	border-bottom-color: #F33;
	border-left-color: #F33;
}
</style>
</head>
<%
	UserInfoBean user = (UserInfoBean) session.getAttribute("user");
    List list=(List)request.getAttribute("listborrowrecord");
    Iterator it=list.iterator();
    Iterator its=list.iterator();
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
					<li><a href="SearchBookServlet">图书分类</a>
						<div class="clear"></div>
					<li><a href="DonateServlet">图书捐赠</a>
						<div class="clear"></div>
					<li class="active"><a href="UserInfoServlet">个人信息</a>
						<div class="clear"></div>
						<ul>
							<li><a href="#jie">查看借书情况</a></li>
							<li><a href="#huan">还书情况</a></li>
							<li><a href="#updatepsw">更改密码</a></li>
							<li><a href="#update">更改资料</a></li>
						</ul></li>
					<li><a href="ContactServlet">联系我们</a>
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
			<h2>个人信息</h2>
			<div class="search">
				<form action="ReaderSearchServlet" method="post">
					<fieldset>
						<input type="text" name="search" value="搜索图书"  onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;}"  />
						<input type="submit" name="submit" value="" />
					</fieldset>
				</form>
				<div class="clear"></div>
			</div>
			<a class="login" href="#"><%=user.getUname()%></a>
			<div class="clear"></div>
		</div>
	</div>
	<div class="container">
		<div id="main">
			<div class="row">
				<div class="span8 blog blog1">
					<div class="blog_post">
						<a class="post_head" id="jie">查看借书情况</a>

						<div class="clear"></div>
						<div>
							<table class="table_black1">
								<thead>
									<tr>
										<th width="23%" class="column0"><h3>图书编号</h3></th>
										<th width="15%"><h3>书名</h3></th>
										<th width="23%">
											<h3>超期信息</h3>
										</th>
										<th width="15%" class="column0">
											<h3>操作</h3>
										</th>

									</tr>
								</thead>
								<tbody>
								 <%
                  
									while(it.hasNext()){
										BorrowBean b=(BorrowBean)it.next();
										String back="BackBookServlet?userid="+b.getUserId()+"&bookid="+b.getBookISBN();
										String renew="RenewBookServlet?userid="+b.getUserId()+"&bookid="+b.getBookISBN();
                    	
                   				 %>
									<tr class="odd2">
										<td><%=b.getBookISBN() %></td>
										<td><%=b.getBookName() %></td>
										<td>0</td>
										
										<td><a class="a-upload" href="<%=back%>">归还</a>&nbsp;&nbsp;
										<a class="a-upload" href="<%=renew%>">续借</a></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>

					</div>
					<div class="separator"></div>
					<div class="blog_post">
						<a class="post_head" id="huan">未还书情况</a>
						<div class="clear"></div>
						<div>
							<table class="table_black1">
								<thead>
									<tr>
										<th width="25%" class="column0">
											<h3>书籍编号</h3>
										</th>
										<th width="15%">
											<h3>书名</h3>
										</th>
										<th width="30%">
											<h3>借书日期</h3>
										</th>
										<th width="30%">
											<h3>还书日期</h3>
										</th>
									</tr>
								</thead>
								<tbody>
								 <%
                  
                    while(its.hasNext()){
						BorrowBean b1=(BorrowBean)its.next();
                    %>
									<tr class="odd2">
										<td><%=b1.getBookISBN() %></td>
										<td><%=b1.getBookName() %></td>
										<td><%=b1.getBorrowDate() %></td>
										<td><%=b1.getBackDate() %></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>

					</div>
					<div class="separator"></div>
					<div class="blog_post">
						<a class="post_head" id="updatepsw">更改密码</a>
						<div class="clear"></div>
						<form action="UpdatePswServlet" method="post">
							<table width="270" border="1">
								<tr>
									<td width="70"><span  class="uiput" style="font-size: 14px">原密码：</span></td>
									<td width="171"><input name="oldpsw" type="password" class="uiput" /></td>
								</tr>
								<tr>
									<td width="83"><span class="uiput" style="font-size: 14px">新密码：</span></td>
									<td width="171"><input name="newpsw" type="password" /></td>
								</tr>
								<tr>
									<td><span class="uiput" style="font-size: 14px">确认密码：</span></td>
									<td><input name="conforim" type="password" class="uiput" /></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</table>
						
						<br />

						<div class="button button_shadow">
							<!--  <a class="button1 button_arrow_right" href="#">确定更改</a>-->
							<input class="button1 button_arrow_right" type="submit" name="Submit" value="确定更改" />
						</div>
						</form>
					</div>
					<div class="separator"></div>
					<div class="blog_post">
						<a class="post_head" id="update">更改资料</a>
						<div class="clear"></div>
						<form action="UpdateInfoServlet" method="post">
							<table width="270" border="1">
								<tr>
									<td width="83"><span  class="uiput" style="font-size: 14px">姓名：</span></td>
									<td width="171"><input class="uiput" name="newname" type="text" /></td>
								</tr>
								<tr>
									<td><span  class="uiput" style="font-size: 14px">电话号码：</span></td>
									<td><input class="uiput" name="newtel" type="text" /></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</table>
						
						<br />
						<div class="button button_shadow">
						<!-- <a class="button1 button_arrow_right" href="UpdateInfoServlet">确定更改</a>-->
						<input class="button1 button_arrow_right" type="submit" name="Submit" value="确定更改" />
						</div>
						</form>
					</div>
				</div>
				<div class="span4 sidebar right_sidebar">
					<br /> <br /> <span class="title_box icon_list">操作</span>
					<div class="widget blog_category sidebar_pad">
						<ul>
							<li><a href="#jie">查看借书情况</a></li>
							<li><a href="#huan">还书情况</a></li>
							<li><a href="#updatepsw">更改密码</a></li>
							<li><a href="#update">更改资料</a></li>
						</ul>
					</div>

					<br /> <br />
					<br /> <br />
					<br /> <br />
					<br /> <br />
					<br /> <br />
					<br /> <br />


					<div class="sidebar_flickr">
						<div class="widget flickr_widget">
							<div class="flickr_container">

								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
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
	<script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="scripts/superfish.js" type="text/javascript"></script>
	<script src="scripts/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="scripts/custom4963.js?ver=1.1" type="text/javascript"></script>

</body>
</html>