<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>註冊Check</title>
</head>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[11];
	  String rand = (String)session.getAttribute("rand");
     String input = request.getParameter("rand");
	  if (rand.equals(input)) {


	 s[0] = getRecordID();
	 s[1] = (String) request.getParameter("userid"); 
	 s[2] = (String) request.getParameter("pwd"); 
	 s[3] = (String) request.getParameter("name");
	 s[4] = (String) request.getParameter("gender");
	 s[5] = (String) request.getParameter("year");
	 s[6] = (String) request.getParameter("month");
	 s[7] = (String) request.getParameter("date");
	 s[8] = (String) request.getParameter("address");
	 s[9] = (String) request.getParameter("email").toLowerCase(); 
	 s[10] = (String) request.getParameter("phone");  

	session.setAttribute("userid",s[1]);
		
	try 
        {
         Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
		 query_stat = "insert into member (id,userid, pwd, name, gender, year, month, date, address, " +
	                     "email, phone) values (?,?,?,?,?,?,?,?,?,?,?)";
//建立查詢寫入會員資料的SQL字串，並以「？」代替欲運用的執行參數
		 stmt=con.prepareStatement(query_stat);
//以SQL敘述為範本，建立PreparedStatement物件
	     for (int i=1; i<=11; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//設定執行參數，「PreparedStatement物件.set型別（索引，參數值）」。
	     stmt.executeUpdate();
//執行PreparedStatement物件的方法有兩種，一為執行Select查詢敘述的executeQuery方法，
//另一種執行記錄修改敘述(Update、Insert或Delete的executeUpdate方法)
	     } catch (Exception ex) {
       ex.printStackTrace();
   		}finally {
	    	if (stmt!=null) stmt.close();
			
		    response.sendRedirect("reg_success.jsp");
	    }
     } else {
	    response.sendRedirect("reg_error.jsp");
	 }		
%>
</body>
</html>
