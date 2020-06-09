<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="library.domain.BookTypeBean" %>
<%@ page import="library.domain.AdminBean" %>
<%@ page import="library.domain.ManageStockpile" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/mosaic_gallery.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/slider-theme.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/nivo-slider.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<%
	AdminBean admin = (AdminBean) session.getAttribute("admin");
%>
<body>
<div id="header">
	<div class="container">
		<a href="AdminhomeServlet" id="logo"><img src="images/logo.png" alt="Company Logo"/></a>
		<div class="navigation">
			<ul>
				<li class="active"><a href="ManageBooksServlet">图书管理</a>
				</li>
				<li><a href="AdminaboutServlet">借阅信息</a>
					<div class="clear"></div>
				</li>
				<li><a href="ManageUserServlet">用户管理</a>
					<div class="clear"></div>
				</li>
				<li><a href="LogoutServlet">退出登录</a>
					<div class="clear"></div>
				</li>
			</ul>
		</div>
	</div>
</div>
	<div id="intro">
		<div id="top"></div>
		<div class="container">
			<h2>查看图书</h2>

			<a class="login" href="#"><%=admin.getAname()%></a>
			<div class="clear"></div>
		</div>
	</div>

	<div class="container">
		<div class="main">
			<div class="row">
				<%
					List allNames = (List) request.getAttribute("allNames");
					Iterator itBooks = allNames.iterator();
					while (itBooks.hasNext()) {
						BookTypeBean bt = (BookTypeBean) itBooks.next();
						String typeName = bt.getType();
						String typeId = bt.getBtid();
						String editlink = "EdittypeJspServlet?btid=" + typeId + "&typename=" + typeName;
						List<ManageStockpile> listbooks =(List<ManageStockpile>)request.getAttribute(typeId);
						Iterator<ManageStockpile> itBook = listbooks.iterator();
				%>
				<div class="span12">
					<div class="accordion accordion1 ">
						<div class="accordion_header">
							<h3 class="accordion_title">
								<span></span><%=typeName%></h3>
							<div class="media">
								<div class="media_icon">
									<img src="images/icon_heart.png" alt="Photo Icon" />
									<span class="media_count"><a href="<%=editlink%>">修改</a></span>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="accordion_content">
							<div class="container">
								<div id="main">
									<table class="table_black1">
										<thead>
											<tr>
												<th class="column0"><h3>图书编号</h3></th>
												<th><h3>图书名称</h3></th>
												<th><h3>总库存</h3></th>
												<th><h3>剩余数量</h3></th>
												<th><h3>借出数量</h3></th>
												<th><h3>状态</h3></th>
												<th><h3>操作</h3></th>
											</tr>
										</thead>
										<tbody>
											<%
												while (itBook.hasNext()) {
														ManageStockpile book = itBook.next();
														String ISBN = book.getISBN();
														String shelves=book.getShelves();
														String BookName=book.getBookname();
														int all=book.getAllAccount();
														int amount=book.getAmount();

														String delbook = "DeleteBookServlet?btid=" + book.getISBN();
														String buttonStr;
														if(shelves.equals("block")){
															buttonStr="下架";
															shelves="none";
														}else{
															buttonStr="上架";
															shelves="block";
														}
														String onBook="onBookServlet?bookId="+book.getISBN()+"&shelves="+shelves;
											%>
											<tr class="odd">
												<td><%=ISBN%></td>
												<td><%=BookName%></td>
												<td><%=all%></td>
												<td><%=amount%></td>
												<td><%=all-amount%></td>
												<%
													if (buttonStr.equals("上架")){
												%>
												<td><span style="color: #ff0000; ">已下架</span></td>
												<%
													}else{
												%>
												<td>已上架</td>
												<%
													}
												%>
												<td><a class="a-upload" href="<%=onBook%>"><%=buttonStr%></a>&nbsp;&nbsp;<a class="a-upload" href="<%=delbook%>">删除</a></td>
											</tr>
											<%
												}
											%>

										</tbody>
									</table>
									<br />
								</div>
							</div>
						</div>
						<div class="seperator"></div>
					</div>
					<div class="separator"></div>
				</div>
				<%
					}
				%>
				<!--循环结束  -->
				<div class="seperator"></div>

			</div>
		</div>
	</div>
	<br/>
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
	<script src="scripts/jquery.quicksand8d1e.js?ver=1.2.2"
		type="text/javascript"></script>
	<script src="scripts/custom4963.js?ver=1.1" type="text/javascript"></script>

</body>
</html>