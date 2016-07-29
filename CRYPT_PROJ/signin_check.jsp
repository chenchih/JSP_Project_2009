<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>登入驗証</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5"></head>
<body>
<%
   String userid = request.getParameter("userid");
   String password = request.getParameter("pwd");
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   session.setAttribute("userid",userid);//登入後的招呼
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
       stmt = con.prepareStatement("select * from member where userid=?");
//建立查詢寫入會員資料的SQL字串，並以「？」代替欲運用的執行參數
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//執行PreparedStatement物件的方法有兩種，一為執行Select查詢敘述的executeQuery方法，
//另一種執行記錄修改敘述(Update、Insert或Delete的executeUpdate方法)
	   if (rs.next()) {
	       if (password.equals(rs.getString("pwd"))) {
			   response.sendRedirect("signin_success.jsp");
			   //帳號密碼都正確後，順利登入至奇摩站
		   } else {
		       response.sendRedirect("signin_error.jsp");
		   } 	
	   } else {
	       response.sendRedirect("signin_error.jsp");
	   }  		       
     } catch (Exception ex) {
	    ex.printStackTrace();
     } finally {
        if (rs!=null) rs.close();
    	if (stmt!=null) stmt.close();
     } 	   
%>
</body>
</html>
