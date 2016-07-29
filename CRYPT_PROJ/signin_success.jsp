<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>登入成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
body {
	background-color: #9999FF;
}
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style></head>
<body>


<p>&nbsp;</p>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td> 
      <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "您好！！<br>");
  
  
%>
      登入成功！ 
      <p><a href="signout.jsp">登出</a> <a href="edit.jsp">編輯</a> <a href="bulletin_news.jsp">關閉</a></p>
      <p class="style1">注意：此訊息將在5秒後自動到首頁</p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>
  <%
 response.setHeader("Refresh","5;URL=bulletin_news.jsp");
%>
<%
String name=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid");
 if(name.equals(""))
{response.sendRedirect("signin.jsp");}
%>
</p>
<p>&nbsp;</p>
</body>
</html>
