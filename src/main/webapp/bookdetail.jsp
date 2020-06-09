<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="library.domain.BookInfoBean" %>
<%@ page import="library.domain.UserInfoBean" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>种类书籍详情</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<%
	UserInfoBean user = (UserInfoBean) session.getAttribute("user");
%>
<%
	String path = request.getContextPath();
	PrintWriter out1=response.getWriter();
%>
<body class="portfolio pngfix">
	<div id="header">
		<div class="container">
			<a href="SearchBookServlet" id="logo"><img src="images/logo.png"
				alt="Company Logo" /></a>
			<div class="navigation">
				<ul>
					<li class="active"><a href="SearchBookServlet">图书分类</a></li>
					<li><a href="DonateServlet">图书捐赠</a>
						<div class="clear"></div></li>
					<li><a href="UserInfoServlet">个人信息</a></li>
					<li><a href="ContactServlet">联系</a>
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
			<h2>图书分类</h2>
			<div class="search">
				<form action="ReaderSearchServlet">
					<fieldset>
						<input type="text" name="search"/>
						<input type="submit" name="submit"/>
					</fieldset>
				</form>
				<div class="clear"></div>
			</div>
			<a class="login" href="#"><%=user.getUname() %></a>
			<div class="clear"></div>
		</div>
	</div>
	</div>
	<div class="container">
		<div id="main">
		<br/>
		<br/>
		
			<%
				String name = (String) request.getAttribute("typename");
			%>
			<h2><%=name%></h2>
			<table class="table_black1">
				<thead>
					<tr>
						<th class="column0">
							<h3>图书名称</h3>
						</th>
						<th>
							<h3>编号</h3>
						</th>
						<th>
							<h3>作者</h3>
						</th>
						<th>
							<h3>出版社</h3>
						</th>
						<th>
							<h3>出版时间</h3>
						</th>
						<th>
							<h3>操作</h3>
						</th>
					</tr>
				</thead>
				<%
					Integer pageTotal = (Integer) request.getAttribute("pageTotal"); // 总的页数
					List list = (List) request.getAttribute("choosebooks");
					Iterator it = list.iterator();
					SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy-MM");
					while (it.hasNext()) {
						BookInfoBean b = (BookInfoBean) it.next();
						String borrow="BorrowServlet?isbn="+b.getISBN();
				%>
				<tbody>
					<tr class="odd">
						<td><%=b.getBookname()%></td>
						<td><%=b.getISBN()%></td>
						<td><%=b.getWriter()%></td>
						<td><%=b.getPublisher()%></td>
						<td><%=simpleDate.format(b.getDate())%></td>
						<td><a class="a-upload" href="<%=borrow%>">借阅</a></td>
					</tr>
					<%
						}
					%>
					<tr class="even">
						<th></th>
						<td></td>
						<td></td>
						<td colspan="3">
						<%
								// 显示页码
								if (pageTotal != null) {
									out1.print("页数：");
									for (int i = 1; i <= pageTotal; i++) { //根据总的页数做循环显示
										out1.println("<a href='" + path
												+ "/TypeBooksServlet?page=" + i + "'>" + i
												+ "</a>&nbsp;");
									}
								}
							%>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br /> <br /> <br />
		</div>
	</div>
	<div id="footer">
		<br />
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
				Date date2=new Date();
				SimpleDateFormat simpleDate0=new SimpleDateFormat("yyyy");
				String nowYear=simpleDate0.format(date2);
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