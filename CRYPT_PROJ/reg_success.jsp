<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="css\eWoo.css" rel="stylesheet" type="text/css">
<title>Registration Success</title>
<style type="text/css">
<!--
body {
	background-color: #66FF99;
}
.style1 {color: #FF0000;
	font-weight: bold;
}
.style2 {color: #000000}
-->
</style></head>
<body>
<p>&nbsp;</p>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td> 註冊成功！
      <p>
          <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "您好！！<br>" +"歡迎登入");
%>
          <%
 response.setHeader("Refresh","5;URL=signin.jsp");
%>
      </p>
    <p><span class="style1">(注意 此訊息將在5秒後自動到登入) <span class="style2"><a href="bulletin_news.jsp">首頁</a></span></span>        </p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>