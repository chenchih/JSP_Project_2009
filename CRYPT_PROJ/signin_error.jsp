<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="css\eWoo.css" rel="stylesheet" type="text/css">
<title>Registration Success</title>
<style type="text/css">
<!--
body {
	background-color: #9999FF;
}
.style1 {color: #FF0000}
-->
</style></head>
<body>

<p>&nbsp;</p>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td> <div align="center">�b���αK�X���ѡI
      </div>      
      <p><a href="bulletin_news.jsp">�����T��</a> <a href="signin.jsp">�n�J</a> <br>
          <span class="style1">�`�N�G���T���N�b5���۰ʨ쭺��</span></p></td>
  </tr>
</table>
<p>
  <%
session.removeAttribute("userid1");
session.invalidate(); 
    response.setHeader("Refresh","5;URL=bulletin_news.jsp");
%>
</p>
<p>&nbsp;</p>
</body>
</html>