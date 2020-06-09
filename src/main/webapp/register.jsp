<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>读者注册页</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">

</head>

<%
//    String register=null;
//    if (request.getAttribute("registerMessage")!=null){
//        register=(String) request.getAttribute("registerMessage");
//    }

%>

<body>

<div class="register_layout">
    <div class="rg_left">
        <p class="rg_p1">新用户注册</p>
        <p class="rg_p2">User Register</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="RegisterServlet" method="post">
                <table>
                    <tr>
                        <td class="td_left"><label for="UserId">账号</label></td>
                        <td class="td_right"><input id="UserId" name="UserId" type="text" placeholder="请输入账号"></td>
                        <td class="nullInput" id="nullUserId" style="display: none">账号不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="Upsw">密码</label></td>
                        <td class="td_right"><input id="Upsw" name="Upsw" type="text" placeholder="请输入密码"></td>
                        <td class="nullInput" id="nullUpsw" style="display: none">密码不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="cpass">再次输入密码</label></td>
                        <td class="td_right"><input id="cpass" name="cpass" type="text" placeholder="请再次输入密码"></td>
                        <td class="nullInput" id="nullCpass" style="display: none">密码不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right"><input id="username" name="username" type="text" placeholder="请输入用户名"></td>
                        <td class="nullInput" id="nullUsername" style="display: none">用户名不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="idcard">读者卡ID</label></td>
                        <td class="td_right"><input id="idcard" name="idcard" type="text" placeholder="请输入读者卡ID"></td>
                        <td class="nullInput" id="nullIdcard" style="display: none">读者卡ID不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="age">年龄</label></td>
                        <td class="td_right"><input id="age" name="age" type="number" placeholder="请输入年龄"></td>
                        <td class="nullInput" id="nullAge" style="display: none">年龄不能为空</td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="phone">电话号码</label></td>
                        <td class="td_right"><input id="phone" name="phone" type="text" placeholder="请输入电话号码"></td>
                        <td class="nullInput" id="nullPhone" style="display: none">电话号码不能为空</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="align-content: center"><input id="rg_submit" type="submit" value="立即注册" disabled="disabled"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="rg_right">
        <p class="rg_p3">已有账号？<a href="login.jsp">立即登陆</a></p>
    </div>

</div>

<script type="text/javascript" src="js/register.js"></script>

</body>
</html>


