<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
</head>

<body>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[6];
	
	 s[0] = request.getParameter("name"); 
	 s[1] = request.getParameter("username"); 
	 s[2] = request.getParameter("email");
	 s[3] = request.getParameter("subject");
	 s[4] = request.getParameter("comment");
	 s[5] = request.getParameter("date_id");

	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
		 query_stat = "insert into message (name, username, email,subject, comment,date_id) values (?,?,?,?,?,?)";
//建立查詢寫入會員資料的SQL字串，並以「？」代替欲運用的執行參數
		 stmt=con.prepareStatement(query_stat);
//以SQL敘述為範本，建立PreparedStatement物件
	     for (int i=1; i<=6; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//設定執行參數，「PreparedStatement物件.set型別（索引，參數值）」。
	     stmt.executeUpdate();
//執行PreparedStatement物件的方法有兩種，一為執行Select查詢敘述的executeQuery方法，
//另一種執行記錄修改敘述(Update、Insert或Delete的executeUpdate方法)
	     } catch (Exception ex) {
       ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
   response.sendRedirect("signin.jsp"); 
%>
</body>
</html>
