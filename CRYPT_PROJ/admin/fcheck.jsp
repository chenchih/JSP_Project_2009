<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�s�W�ѥ����</title></head>
<body>
<%
	 String search = request.getParameter("search");
	 String searchtype = request.getParameter("searchtype");
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;

	 
%>
<table width="776" border="1">
  <tr>
    <td width="108" bgcolor="#99FF00">���U�ɶ�</td>
    <td width="71" bgcolor="#99FF00">�ϥΪ̱b��</td>
    <td width="33" bgcolor="#99FF00">�K�X</td>
    <td width="30" bgcolor="#99FF00">�m�W</td>
    <td width="38" bgcolor="#99FF00">�ʧO</td>
    <td width="19" bgcolor="#99FF00">�~</td>
    <td width="19" bgcolor="#99FF00">��</td>
    <td width="19" bgcolor="#99FF00">��</td>
    <td width="38" bgcolor="#99FF00">�a�}</td>
    <td width="74" bgcolor="#99FF00">�q�l�H�c</td>
    <td width="85" bgcolor="#99FF00">�q��</td>
    <td width="140" bgcolor="#99FF00">���U�ɶ�</td>
  </tr>
  <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
	if(searchtype.equals("1") )
	 stmt=con.prepareStatement("select * from member where userid='"+search+"'");
else if(searchtype.equals("2")) 
 stmt=con.prepareStatement("select * from member where name='"+search+"'");
 else if(searchtype.equals("3")) 
 stmt=con.prepareStatement("select * from member where email='"+search+"'");
		 
 		 rs = stmt.executeQuery();
	     if(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("userid"));
			out.print("</td><td>");
			out.print(rs.getString("pwd"));
			out.print("</td><td>");
			out.print(rs.getString("name"));
			out.print("</td><td>");
			out.print(rs.getString("gender"));
			out.print("</td><td>");
			out.print(rs.getString("year"));
			out.print("</td><td>");
			out.print(rs.getString("month"));
			out.print("</td><td>");
			out.print(rs.getString("date"));
			out.print("</td><td>");
			out.print(rs.getString("address"));
			out.print("</td><td>");
			out.print(rs.getString("email"));
			out.print("</td><td>");
			out.print(rs.getString("phone"));
			out.print("</td><td>");
			out.print(rs.getString("edit_id"));
			out.print("</td></tr>");
			}
		else {
		response.sendRedirect("search_fail.jsp");
		}
		%>
</table>
		<%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
</body>
</html>
