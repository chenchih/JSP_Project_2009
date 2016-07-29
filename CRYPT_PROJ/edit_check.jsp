<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>註冊Check</title>
</head>
<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[6];
	 
	 s[0] = (String)session.getAttribute("userid");
	 s[1] = request.getParameter("pwd"); 
	 s[2] = request.getParameter("name");
	 s[3] = request.getParameter("address");
	 s[4] = request.getParameter("email");
	 s[5] = request.getParameter("edit_hidden");
	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線

		 query_stat = "update member set pwd=?,name=?,address=?,email=?,edit_id=? where userid=?";
		 stmt=con.prepareStatement(query_stat);

	     stmt.setString(1, s[1]);
		 stmt.setString(2, s[2]);
		 stmt.setString(3, s[3]);
		 stmt.setString(4, s[4]);
		 stmt.setString(5, s[5]);
		 stmt.setString(6, s[0]);//第三個「？」的值，我要用s[2]的值代替
		 
	     stmt.executeUpdate();

	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
     response.sendRedirect("bulletin_news.jsp"); 
%>
<%
	  String name=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid");  if(name.equals(""))
	  {
		{response.sendRedirect("signin.jsp");}
 	 }


	  %>
</body>
</html>
