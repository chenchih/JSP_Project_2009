<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<?xml version="1.0" encoding="big5"?>
<validate>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");

   String info = request.getParameter("info");
   String type = request.getParameter("type");

   //String info = "king";
   //String type = "1";

   out.println("<source>" + type + "</source>"); 
   if (type.equals("1")) {  
       stmt = con.prepareStatement("select * from member where userid=?");
   } else {
       stmt = con.prepareStatement("select * from member where email=?");   
   }	   
   stmt.setString(1,info);
   rs = stmt.executeQuery();
   if (rs.next()) {
       out.println("<res>f</res>");
   } else {
       out.println("<res>p</res>");
   } 	   
%>   
</validate> 
