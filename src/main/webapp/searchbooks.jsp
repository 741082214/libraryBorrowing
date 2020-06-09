<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="library.domain.UserInfoBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍详情</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
</head>
<%
	UserInfoBean user = (UserInfoBean) session.getAttribute("user");
	String path = request.getContextPath();
	Map<String,String> shelvesMap=(Map<String,String>)request.getAttribute("shelvesMap");
%>
<body class="portfolio pngfix">
	<div id="header">
		<div class="container">
			<a href="searchbooks.jsp" id="logo"><img src="images/logo.png"
				alt="Company Logo" /></a>
			<div class="navigation">
				<ul>
<%--					<li><a href="userhome.jsp">主页</a>--%>
<%--						<div class="clear"></div></li>--%>
					<li class="active"><a href="#">图书分类</a>
						<div class="clear"></div>
						<ul class="subnavigation">
							<li><a href="#" data-value="cat_1">小说</a></li>
							<li><a href="#" data-value="cat_2">文学</a></li>
							<li><a href="#" data-value="cat_3">历史</a></li>
							<li><a href="#" data-value="cat_4">地理</a></li>
							<li><a href="#" data-value="cat_5">法律</a></li>
							<li><a href="#" data-value="cat_6">军事</a></li>
							<li><a href="#" data-value="cat_7">经济</a></li>
							<li><a href="#" data-value="cat_8">管理</a></li>
							<li><a href="#" data-value="cat_9">计算机</a></li>
						</ul></li>
					<li><a href="DonateServlet">图书捐赠</a>
						<div class="clear"></div></li>
					<li><a href="UserInfoServlet">个人信息</a></li>
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
			<h2>图书分类</h2>
			<div class="search">
				<form action="ReaderSearchServlet" method="post">
					<fieldset>
						<input type="text" name="search" value="搜索图书" onFocus="if(value==defaultValue){value='';}" onBlur="if(!value){value=defaultValue;}"  />
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
				<div class="span12">
					<ul class="subnavigation">
						<li><a href="#" data-value="all">所有</a></li>
						<li><a href="#" data-value="cat_1">小说</a></li>
						<li><a href="#" data-value="cat_2">文学</a></li>
						<li><a href="#" data-value="cat_3">历史</a></li>
						<li><a href="#" data-value="cat_4">地理</a></li>
						<li><a href="#" data-value="cat_5">法律</a></li>
						<li><a href="#" data-value="cat_6">军事</a></li>
						<li><a href="#" data-value="cat_7">经济</a></li>
						<li><a href="#" data-value="cat_8">管理</a></li>
						<li><a href="#" data-value="cat_9">计算机</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="separator4 span12"></div>
			</div>
			<div class="row">
				<div class="span12">
					<div class="gallery gallery1">
						<div class="item cat_1" data-id="item1" style="display: <%=shelvesMap.get("9787020002207")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="<%=path%>/content/images/typeId-1001/hongloumeng.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/hongloumeng.html" target="_blank">红楼梦</a>
							</h4>
							<p>作者：[清] 曹雪芹</p>
							<p>出版社：人民文学出版社</p>
							<p>出版时间：2008-07</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787020002207">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_4" data-id="item2" style="display: <%=shelvesMap.get("9787221138224")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1004/shijiegeju.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/shijiegeju.html" target="_blank">用地图看懂世界格局</a>
							</h4>
							<p>作者：王伟</p>
							<p>出版社：贵州人民出版社</p>
							<p>出版时间：2017-02</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787221138224">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_3" data-id="item3" style="display: <%=shelvesMap.get("9787505723788")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1003/mingchaonaxieshi.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/mingchaonaxieshi.html" target="_blank">明朝那些事儿（肆）</a>
							</h4>
							<p>作者：当年明月</p>
							<p>出版社：中国友谊出版公司</p>
							<p>出版时间：2009-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787505723788">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_8" data-id="item4" style="display: <%=shelvesMap.get("9787508637563")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1008/pingtaizhanlue.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/pingtaizhanlue.html" target="_blank">平台战略</a>
							</h4>

							<p>作者：陈威如、余卓轩</p>
							<p>出版社：中信出版社</p>
							<p>出版时间：2013-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508637563">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_5" data-id="item4" style="display: <%=shelvesMap.get("9787301216132")%>">
							<div class="item_image_wrap">
                                <img class="round_image"
									src="content/images/typeId-1005/xingfageyan.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/xingfageyan.html" target="_blank">刑法格言的展开（第三版）</a>
							</h4>

							<p>作者：张明楷</p>
							<p>出版社：北京大学出版社</p>
							<p>出版时间：2013-03</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787301216132">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_1" data-id="item5" style="display: <%=shelvesMap.get("9787020008728")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1001/sanguoyanyi.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/sanguoyanyi.html" target="_blank">三国演义</a>
							</h4>
							<p>作者：[明] 罗贯中</p>
							<p>出版社：人民文学出版社</p>
							<p>出版时间：1973-12</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787020008728">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_4" data-id="item2" style="display: <%=shelvesMap.get("9787550272743")%>">
							<div class="item_image_wrap">
								<img class="round_image" src="content/images/typeId-1004/ruzangbaxian.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/ruzangbaxian.html" target="_blank">入藏八线</a>
							</h4>
							<p>作者：才华烨</p>
							<p>出版社：北京联合出版公司</p>
							<p>出版时间：2019-03</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787550272743">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_8" data-id="item4" style="display: <%=shelvesMap.get("9787508656359")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1008/chushijianzhuan.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/chushijianzhuan.html" target="_blank">褚时健传</a>
							</h4>

							<p>作者：周桦</p>
							<p>出版社：中信出版社</p>
							<p>出版时间：2016-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508656359">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_3" data-id="item7" style="display: <%=shelvesMap.get("9787514502022")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1003/chongshuozhongguo.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/chongshuozhongguo.html" target="_blank">重说中国近代史</a>
							</h4>
							<p>作者：张鸣</p>
							<p>出版社：中国致公出版社</p>
							<p>出版时间：2012-02</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787514502022">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_5" data-id="item8" style="display: <%=shelvesMap.get("9787301250051")%>">
							<div class="item_image_wrap">
                                <img class="round_image"
									src="content/images/typeId-1005/fazhibentu.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/fazhibentu.html" target="_blank">法治及其本土资源</a>
							</h4>
							<p>作者：苏力</p>
							<p>出版社：北京大学出版社</p>
							<p>出版时间：2015-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787301250051">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_6" data-id="item10" style="display: <%=shelvesMap.get("9787513906128")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1006/shiqudeshengli.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/shiqudeshengli.html" target="_blank">失去的胜利</a>
							</h4>
							<p>作者：[德] 冯·埃里希·曼施泰因</p>
							<p>出版社：民主与建设出版社</p>
							<p>出版时间：2015-09</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787513906128">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_8" data-id="item4" style="display: <%=shelvesMap.get("9787508662718")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1008/yikehuweizhongxin.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/yikehuweizhongxin.html" target="_blank">以客户为中心</a>
							</h4>

							<p>作者：黄卫伟</p>
							<p>出版社：中信出版社</p>
							<p>出版时间：2016-09</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508662718">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>

						<div class="item cat_7" data-id="item10" style="display: <%=shelvesMap.get("9787508689586")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1007/xuezhaofeng.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/xuezhaofeng.html" target="_blank">薛兆丰经济学讲义</a>
							</h4>
							<p>作者：薛兆丰</p>
							<p>出版社：中信出版社</p>
							<p>出版时间：2018-07</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508689586">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_1" data-id="item9" style="display: <%=shelvesMap.get("9787544258609")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1001/baiyexing.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/baiyexing.html" target="_blank">白夜行</a>
							</h4>
							<p>作者：[日] 东野圭吾</p>
							<p>出版社：南海出版公司</p>
							<p>出版时间：2008-09</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787544258609">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_8" data-id="item4" style="display: <%=shelvesMap.get("9787508684031")%>">
							<div class="item_image_wrap"><%--a class="item_image"--%>
								<img class="round_image"
									src="content/images/typeId-1008/yuanze.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/yuanze.html" target="_blank">原则</a>
							</h4>

							<p>作者：[美] 瑞·达利欧</p>
							<p>出版社：中信出版社</p>
							<p>出版时间：2018-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508684031">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>

						<div class="item cat_4" data-id="item10" style="display: <%=shelvesMap.get("9787535299406")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1004/xiboliya.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/xiboliya.html" target="_blank">火车开往西伯利亚</a>
							</h4>
							<p>作者：张永铭</p>
							<p>出版社：湖北科学技术出版社</p>
							<p>出版时间：2018-04</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787535299406">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_4" data-id="item10" style="display: <%=shelvesMap.get("9787550289413")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1004/faxianxizang.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/faxianxizang.html" target="_blank">发现西藏</a>
							</h4>
							<p>作者：李栓科</p>
							<p>出版社：北京联合出版公司</p>
							<p>出版时间：2019-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787550289413">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_6" data-id="item10" style="display: <%=shelvesMap.get("9787510709203")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1006/zhanliejian.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/zhanliejian.html" target="_blank">英国战列舰全史</a>
							</h4>
							<p>作者：江泓</p>
							<p>出版社：中国长安出版社</p>
							<p>出版时间：2015-09</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787510709203">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_4" data-id="item10" style="display: <%=shelvesMap.get("9787500099802")%>">
							<div class="item_image_wrap">
								<img class="round_image" src="content/images/typeId-1004/shijieditu.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/shijieditu.html" target="_blank">伟大的世界地图</a>
							</h4>
							<p>作者：英国DK公司</p>
							<p>出版社：中国大百科全书出版社</p>
							<p>出版时间：2017-03</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787500099802">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_7" data-id="item10" style="display: <%=shelvesMap.get("9787115253699")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1007/congmingdetouzizhe.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/congmingdetouzizhe.html" target="_blank">聪明的投资者</a>
							</h4>
							<p>作者：[美] 本杰明·格雷厄姆</p>
							<p>出版社：人民邮电出版社</p>
							<p>出版时间：2011-07</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787115253699">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_3" data-id="item11" style="display: <%=shelvesMap.get("9787508081519")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1003/fangyanyouji.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/fangyanyouji.html" target="_blank">放言有忌</a>
							</h4>
							<p>作者：虞云国</p>
							<p>出版社：华夏出版社</p>
							<p>出版时间：2014-07</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787508081519">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_5" data-id="item12" style="display: <%=shelvesMap.get("9787301243770")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1005/xingfadesishu.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/xingfadesishu.html" target="_blank">刑法的私塾</a>
							</h4>
							<p>作者：张明楷</p>
							<p>出版社：北京大学出版社</p>
							<p>出版时间：2014-07</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787301243770">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_2" data-id="item12" style="display: <%=shelvesMap.get("9787549529322")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1002/kanjian.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/kanjian.html" target="_blank">看见</a>
							</h4>
							<p>作者：柴静</p>
							<p>出版社：广西师范大学出版社</p>
							<p>出版时间：2013-01</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787549529322">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_5" data-id="item12" style="display: <%=shelvesMap.get("9787511811660")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1005/yaojianshenpan.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/yaojianshenpan.html" target="_blank">要件审判九步法</a>
							</h4>
							<p>作者：邹碧华</p>
							<p>出版社：法律出版社</p>
							<p>出版时间：2010-11</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787511811660">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_7" data-id="item10" style="display: <%=shelvesMap.get("9787301150894")%>">
							<div class="item_image_wrap">
								<img class="round_image"
									src="content/images/typeId-1007/jingjixueyuanli.png" />
							</div>
							<h4>
								<a href="<%=path%>/html/jingjixueyuanli.html" target="_blank">经济学原理（第5版）</a>
							</h4>
							<p>作者：[美] 曼昆</p>
							<p>出版社：北京大学出版社</p>
							<p>出版时间：2009-04</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787301150894">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_2" data-id="item12" style="display: <%=shelvesMap.get("9787506365437")%>">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/typeId-1002/huozhe.png" /></a>
							</div>
							<h4>
								<a href="<%=path%>/html/huozhe.html" target="_blank">活着</a>
							</h4>
							<p>作者：余华</p>
							<p>出版社：作家出版社</p>
							<p>出版时间：2012-08</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="BorrowServlet?isbn=9787506365437">借阅</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_1" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">小说类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1001">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_2" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">文学类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1002">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_3" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">历史类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1003">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_4" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">地理类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1004">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_5" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">法律类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1005">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_6" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">军事类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1006">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_7" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">经济类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1007">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_8" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">管理类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1008">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
						<div class="item cat_9" data-id="item12">
							<div class="item_image_wrap">
								<a class="item_image"><img class="round_image"
									src="content/images/1-4/36.jpg" /></a>
							</div>
							<h4>
								<a href="portfolio_open.html">计算机类</a>
							</h4>
							<p>作者：</p>
							<p>出版社：</p>
							<p>出版时间：</p>
							<div class="button button_shadow">
								<a class="button1 button_arrow_right"
									href="TypeBooksServlet?type=1009">更多</a>
							</div>
							<div class="count hidden">1</div>
						</div>
					</div>
				</div>
			</div>
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
	<script src="scripts/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="scripts/jquery.quicksand8d1e.js?ver=1.2.2"
		type="text/javascript"></script>
	<script src="scripts/custom4963.js?ver=1.1" type="text/javascript"></script>

</body>
</html>