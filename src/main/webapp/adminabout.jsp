<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="library.domain.AdminBean" %>
<%@ page import="library.domain.BorrowBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理用户</title>
    <link href="css/style1.css" rel="stylesheet" type="text/css" media="screen"/>
</head>
<% AdminBean admin = (AdminBean)session.getAttribute("admin"); %>
<body class="portfolio pngfix">
<div id="header">
    <div class="container">
        <a href="AdminhomeServlet" id="logo"><img src="images/logo.png" alt="Company Logo"/></a>
        <div class="navigation">
            <ul>
                <li>
                    <a href="ManageBooksServlet">图书管理</a>

                </li>
                <li class="active">
                    <a href="AdminaboutServlet">借阅信息</a>
                    <div class="clear"></div>
                </li>
                <li>
                    <a href="ManageUserServlet">用户管理</a>
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
        <h2>借阅信息</h2>

        <a class="login"><%=admin.getAname() %>
        </a>
        <div class="clear"></div>
    </div>
</div>
<br />
<br />
<div class="container">
    <div id="main">
        <h2>未归还图书</h2>
        <table class="table_black1">
            <thead>
            <tr>
                <th class="column0">
                    <h3>图书编号</h3>                            </th>
                <th>
                    <h3>图书名称</h3>                            </th>
                <th><h3>借阅人账号</h3>                            </th>
                <th>
                    <h3>借阅日期</h3>                          </th>
                <th>
                    <h3>应归还日期</h3>                            </th>
            </tr>
            </thead>
            <tbody>
            <%
                List allBorrowUsers=(List)request.getAttribute("allBorrowUsers");
                Iterator User=allBorrowUsers.iterator();
                while(User.hasNext()){
                    BorrowBean u=(BorrowBean)User.next();
            %>
            <tr class="odd">
                <td><%=u.getBookISBN()%></td>
                <td><%=u.getBookName() %></td>
                <td><%=u.getUserId()%></td>
                <td><%=u.getBorrowDate() %></td>
                <td><%=u.getBackDate() %></td>
            </tr>
            <%}%>
            <tr class="even">
                <th></th>
                <td></td>
                <td></td>
                <td>上一页</td>
                <td>下一页</td>
            </tr>
            </tbody>
        </table>
        <br />

    </div>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</div>
<div id="footer">
    <br/>
    <div class="container">
        <div class="foot">
            <ul class="social_icons">
                <li><img src="images/social_facebook_hover.png" alt="facebook" class="hover" /></li>
                <li><img src="images/social_twitter_hover.png" alt="twitter" class="hover" /></li>
                <li><img src="images/social_google_hover.png" alt="google" class="hover" /></li>
                <li><img src="images/social_lastfm_hover.png" alt="lastfm" class="hover" /> </li>
                <li><img src="images/social_rss_hover.png" alt="rss" class="hover" /> </li>
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