<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%!
private String adjust_Msg(String adj_str) {
   //--- 轉換留言資料中的Carriage Return[chr(13)]及
   //--- Line Feed字元[chr(10)]為空字串與空白
   String final_str = ""; 
   int i;
   String charA;
   //
   adj_str = adj_str.trim();
   if (adj_str.length() > 0 ) {
      for (i = 0; i < adj_str.length(); i++) {
          //--- 每次取一個字元出來 ---
          if (i == (adj_str.length() - 1))
             charA = adj_str.substring(i);
          else
             charA = adj_str.substring(i, i+1);
          if (charA.equals("\n")) {
             final_str += " ";
          } else if (charA.equals("'")) {  //若為單引號，則改為兩個單引號
             final_str += "''";
          } else {  //若為其他字元
             final_str += charA;
          }
      }
   }
   return final_str;
}
%>
<%
  int i = 0, rec_no = 10, intNo;
  String sql;
  String strUrl1 = "jdbc:mysql://localhost:3306/account?user=root&characterEncoding=big5";
  String JDBCDriver1 = "com.mysql.jdbc.Driver";
  // 1.載入JDBC驅動程式
  Class.forName(JDBCDriver1);
  // 2.透過DriverManager類別建立Connection物件
  Connection con = DriverManager.getConnection(strUrl1);
  // 3.透過Connection物件建立Statement物件
  Statement stmt = con.createStatement();

  //--- get field content ---
  String term, sb1; 
  term = new String(request.getParameter("term").getBytes("ISO-8859-1"));
  //term = request.getParameter("term").trim();
  term = adjust_Msg(term.trim());

  sql = "select term from terms where term like '" 
  			+ term  + "%' order by term;";

  StringBuffer sb = new StringBuffer();
  sb.append("{\"Results\": { \"books\": [");

  ResultSet rs = stmt.executeQuery(sql);
  while ( (rs.next()) && (i < rec_no) ) {
  sb.append("{\"term\":\"" + rs.getString("term")+"\"}");
   // sb.append("{\"bookno\":\"" + rs.getString("bookno") + " " + rs.getString("bookname") + "\"}");
     //sb.append("{\"entity\":\"" + rs.getString("entity") + "\"}");
     sb.append(",");
     i++;
	}
	if (i > 0) {
		intNo = sb.toString().length() - 1;
	  sb1 = sb.toString().substring(0, intNo);
	  sb1 += "]}}";
	} else {
		sb1 = "";
	}

  // 7.關閉Statement物件
  if (stmt != null) stmt.close();
  // 8.關閉Connection物件
  if (con != null) con.close();

  out.println(sb1);
%>
