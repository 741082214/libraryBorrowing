<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
<title>Library</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-panels.min.js"></script>
<script src="js/init.js"></script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-noscript.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
</head>
<body class="homepage">
	<div id="header">
		<!-- Inner -->
		<div class="inner">
			<header>
				<h1>
					<a href="#" id="logo">Library</a>
				</h1>
				<br />
				<span class="byline">欢迎来到在线图书馆</span>
			</header>
			<footer>
				<a href="#banner" class="button circled scrolly">Start</a>
			</footer>
		</div>

	</div>
	<FORM action="LoginServlet" method="post" id="loginForm" >
		<div id="banner">
			<h3>
				<strong>用户名:</strong> <input type="text" name="userid" id="userid" size="20">
				<span id="span1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</h3>

			<br>
			<h3>
				<strong>密&nbsp;&nbsp;&nbsp;码: </strong> <input type="password" name="password" id="password">
				<span id="span2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</h3>

			<br>
			<h5 id="radio1">
				<input name="type" type="radio" value="1" checked>读者
				<input name="type" type="radio" value="2">管理员
			</h5>
			<div id="relogin1">
				<a href="register.jsp">点击注册 </a>
				<input name="LOG IN"
					   type="submit"
					   style="width:100px;background-color:#FF6666;
                  font-size:18px;color:white;font-weight: bold"
					   value="登 录" >
			</div>
		</div>
	</FORM>
	<%
		Date date=new Date();
		SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy");
		String nowYear=simpleDate.format(date);

	%>
	<div class="copyrights">Copyright &copy; 2018-<%=nowYear%> 徐悦佳. All rights reserved.</div>

	<script type="text/javascript" src="js/login.js"></script>
</body>
</html>