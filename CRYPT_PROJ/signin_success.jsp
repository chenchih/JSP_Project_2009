<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>�n�J���\</title>
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
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td> 
      <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "�z�n�I�I<br>");
  
  
%>
      �n�J���\�I 
      <p><a href="signout.jsp">�n�X</a> <a href="edit.jsp">�s��</a> <a href="bulletin_news.jsp">����</a></p>
      <p class="style1">�`�N�G���T���N�b5���۰ʨ쭺��</p></td>
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
