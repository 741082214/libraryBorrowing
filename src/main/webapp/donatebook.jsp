<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.text.*"%>
<%@ page import="library.domain.UserInfoBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐赠图书</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
  <%
	UserInfoBean user = (UserInfoBean) session.getAttribute("user");
%>    
    <body class="portfolio pngfix">
        <div id="header">
            <div class="container">
                <a href="SearchBookServlet" id="logo"><img src="images/logo.png" alt="Company Logo" /></a>
                <div class="navigation">
                    <ul>
<%--                        <li>--%>
<%--                            <a href="userhome.jsp">主页</a>--%>
<%--                            <div class="clear"></div>--%>
<%--                        </li>--%>
                        <li>
                            <a href="SearchBookServlet">图书分类</a>
                            
                        </li>
                        <li class="active">
                            <a href="DonateServlet">图书捐赠</a>
                            <div class="clear"></div>
                           
                        </li>
                        <li>
                            <a href="UserInfoServlet">个人信息</a>
                            
                        </li>
                        <li>
                            <a href="ContactServlet">联系我们</a>
                            <div class="clear"></div>
                        </li>
                        <li><a href="LogoutServlet">退出登录</a>
						<div class="clear"></div></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="intro">
            <div id="top"></div>
            <div class="container">
                <h2>图书捐赠</h2>
                <div class="search">
                    <form action="ReaderSearchServlet" method="post">
                        <fieldset>
                            <input type="text" name="search" value="搜索图书"  onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;}"  />
                            <input type="submit" name="submit" value="" />
                        </fieldset>
                    </form>
                    <div class="clear"></div>
                </div>
                <a class="login" ><%=user.getUname() %> </a>
                <div class="clear"></div>
            </div>
        </div>
            </div>
<div class="container">
    <div id="main">
                <h2></h2>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
			<form action="DonateBookServlet" method="post">
                <table class="table_black1">
                    <thead>
                        <tr>
                            <th width="20%">
                                <h3>图书名称</h3>                            </th>
							<th width="10%">
                                <h3>类别</h3>                            </th>
                            <th width="10%">
                                <h3>编号</h3>                            </th>
                            <th width="10%">
                                <h3>作者</h3>                            </th>
                            <th width="20%">
                                <h3>出版社</h3>                          </th>
                            <th width="20%">
                            <h3>出版时间</h3>                            </th>
                            <th width="10%">
                            <h3>价格</h3>                            </th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td><input name="bookname" type="text" size="18" value=""/></td>
                            <td><select name="typeId" id="select">
                              <option value="1001">小说</option>
                              <option value="1002">文学</option>
                              <option value="1003">历史</option>
                              <option value="1004">地理</option>
                              <option value="1005">法律</option>
                              <option value="1006">军事</option>
                              <option value="1007">经济</option>
                              <option value="1008">管理</option>
                              <option value="1009">计算机</option>
                            </select></td>
                            <td><input name="ISBN" type="text" size="15" value=""/></td>
                            <td><input name="writer" type="text" size="10" value=""/></td>
                            <td><input name="publisher" type="text" size="15" value=""/></td>
                            <td><input name="date" type="text" size="14" value=""/></td>
                            <td><input name="price" type="text" size="10" value=""/></td>
                        </tr>
                        <tr class="even">
                            <th></th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                             <td></td>
                            <td><div class="table_foot odd">
                            <div class="button">
                            <input class="button1"  type="submit" name="Submit" value="提交" />
                            </div>
                            </div></td>
                        </tr>
                    </tbody>
      </table>
      </form>
                <br />
                <br />
                <br />
				<br/>
				<br/>
				<br/><br/>
  </div>
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