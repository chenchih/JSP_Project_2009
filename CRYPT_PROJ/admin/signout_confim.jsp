<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
</head>

<body bgcolor="#99FFFF">
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td><p>�z�w�g�S�X�F</p>
      <p><a href="admin.jsp">�����T��</a><br />
            <font color="#999999">�`�N�G���T���N�b5���۰�����</font></p></td>
  </tr>
</table>
<%

    response.setHeader("Refresh","5;URL=admin.jsp");
%>
</body>
</html>
