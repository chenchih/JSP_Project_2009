<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
.style9 {font-size: 24px; font-weight: bold; }
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
a:link {
	color: #0000FF;
}
.style5 {color: #0000FF}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
</head>

<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">�n�X</a> || <a href="all_entry.jsp">�ϥΪ̸��</a> || <a href="search.jsp">�j��</a> || <a href="add_term.jsp">�s�W�W��</a> || <a href="news/news.jsp">��������</a> || <a href="suggestion.jsp">�N��</a> || <a href="forum/forum.jsp">�Q�װ�</a> || <a href="message/message.jsp">�d��</a></span></div></td>
      </tr>
    </table>
    <p align="center">&nbsp;</p>
<p align="center">�ϥΪ̯d��</p>
<hr>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>
          <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
        </p>
          <table width="626" border="1" align="center">
            <tr>
              <td width="77" bgcolor="#99FF00">id</td>
              <td width="90" bgcolor="#99FF00">�m�W</td>
              <td width="100" bgcolor="#99FF00">�ϥΪ̱b��</td>
              <td width="57" bgcolor="#99FF00">�D�D</td>
              <td width="86" bgcolor="#99FF00">�q�l�H�c</td>
              <td width="86" bgcolor="#99FF00">�d�����e</td>
              <td width="84" bgcolor="#99FF00">�d���ɶ�</td>
            </tr>
            <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select id, name, username, email,subject, comment,date from message");
		 rs = stmt.executeQuery();
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("name"));
				out.print("</td><td>");
			out.print(rs.getString("username"));
			out.print("</td><td>");
			out.print(rs.getString("subject"));
		out.print("</td><td>");
			out.print(rs.getString("email"));
		out.print("</td><td>");
			out.print(rs.getString("comment"));
		out.print("</td><td>");
		out.print(rs.getString("date"));
		out.print("</td></tr>");
		
		}
		%>
        </table>
          <p>
              <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
          </p>
          <p>&nbsp;          </p></td>
    </tr>
  </table>
  <p>
    <%
	  String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals(""))
	  {
		{response.sendRedirect("admin.jsp");}
 	 }


	  %>
  </p>
</form>
</div>
<p>&nbsp;</p>

</body>
</html>
