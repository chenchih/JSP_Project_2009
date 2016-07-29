<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body>

<%
String userid = (String)session.getAttribute("userid");

String type = (String) application.getAttribute("type");

 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
	 
	 try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
		 query_stat = "delete from score where userid='" +userid+"'AND type='" +type+"'";
		 stmt=con.prepareStatement(query_stat);
stmt.executeUpdate();


	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
  if(type.equals("DES"))
  { response.sendRedirect("des.jsp");}
  else if(type.equals("AES"))
  { response.sendRedirect("aes.jsp");}
   else if(type.equals("DES2"))
  { response.sendRedirect("sdes.jsp");}
    else if(type.equals("RSA"))
  { response.sendRedirect("rsa.jsp");}
%>
</body>
</html>
