<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<style type="text/css">
<!--
body {
	background-color: #00FFFF;
}
.style1 {	color: #FF0000;
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
    <td><p align="center">
        <%
  String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals("")){
  out.print("<font size=6> 你還沒登入，請先登入。 </font>");
  response.setHeader("Refresh","5;URL=signin.jsp");
  }

%> 
    </p>
     <p align="left"><span class="style1"> (注意 此訊息將在5秒後自動到登入) <span class="style2"><a href="bulletin_news.jsp">回首頁</a></span></span></p></td>
  </tr>
</table>
</body>
</html>
