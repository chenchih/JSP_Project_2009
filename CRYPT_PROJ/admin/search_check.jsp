<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
</head>

<body>
<%	 
	String result = request.getParameter("total");

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
    <td width="85" bgcolor="#99FF00">�q��--</td>
    <td width="140" bgcolor="#99FF00">���U�ɶ�</td>
  </tr>
  <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		//stmt=con.prepareStatement("select no,username, passw, name from data");
//	stmt=con.prepareStatement("select no,username,passw,name from data where username= userid");
       stmt = con.prepareStatement( "select id, userid, pwd, name, gender, year, month, date, address, email, phone, edit_id from member  order by id desc limit "+result+"");

     rs = stmt.executeQuery();
	 
	  while(rs.next()) {
		
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
		
		
		
		
		
		%>
</table>
<p>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace(); ;
   	  } finally {
	 
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
</p>
<br>


</body>
</html>
