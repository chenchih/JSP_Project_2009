<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
body {
	background-color: #00FFFF;
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
    <td><p align="center">
        <%
  String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals("")){
  out.print("<font size=6> �A�٨S�n�J�A�Х��n�J�C </font>");
  response.setHeader("Refresh","2;URL=signin.jsp");
  }
  else {
  response.sendRedirect("lesson.jsp"); 
   }
   
%>      
    </p>
    </td>
  </tr>
</table>
</body>
</html>
