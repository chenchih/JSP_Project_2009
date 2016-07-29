<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body bgcolor="#99FFFF">
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td><p>您已經豋出了</p>
      <p><a href="admin.jsp">關閉訊息</a><br />
            <font color="#999999">注意：此訊息將在5秒後自動關閉</font></p></td>
  </tr>
</table>
<%

    response.setHeader("Refresh","5;URL=admin.jsp");
%>
</body>
</html>
