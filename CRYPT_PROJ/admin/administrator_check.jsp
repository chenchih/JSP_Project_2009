<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<style type="text/css">
<!--
.style1 {color: #FF0000;
	font-weight: bold;
}
.style2 {color: #000000}
-->
</style>
</head>

<body>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td><p align="center">
      <%
   String userid = request.getParameter("userid2");
   String password = request.getParameter("pwd2");
   
   session.setAttribute("uid",userid);//用於update.jsp更新欄位，下SQL值的索引
   
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
       stmt = con.prepareStatement("select * from admin where username=?");
//建立查詢寫入會員資料的SQL字串，並以「？」代替欲運用的執行參數
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//執行PreparedStatement物件的方法有兩種，執行Select查詢敘述為executeQuery方法，

	   if (rs.next()) {
	       if (password.equals(rs.getString("password")))
		   	 {
			   response.sendRedirect("all_entry.jsp");
			   //帳號密碼都正確後，順利登入至更新頁
			 }
			  else
			   {
		        out.print("帳號或密碼失敗！");
				response.setHeader("Refresh","5;URL=admin.jsp");} 	
			   }
			   else {
	   		 out.print("帳號或密碼失敗！");  response.setHeader("Refresh","5;URL=admin.jsp");
	   				}  		       
     } catch (Exception ex) {
	    ex.printStackTrace();
     } finally {
        if (rs!=null) rs.close();
    	if (stmt!=null) stmt.close();
     } 	   
%>
    </p>
        <p> <span class="style1">(注意: 此訊息將在5秒後自動到登入管理員) <span class="style2"><a href="http://localhost:8080/acc/bulletin_news.jsp"> 回首頁</a></span></span><br>
      </p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
