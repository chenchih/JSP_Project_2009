<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body>
<body>
<div align="center">
  <%

	 String search = request.getParameter("search");
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;

	 try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select * from terms where term='"+search+"'");
 		   rs = stmt.executeQuery();
	     if(rs.next()) {
%>
  <table width="430" border="1">
    <tr>
      <td colspan="2"><div align="center">資訊 (網路)安全+(密碼學)專有名詞查核結果</div></td>
    </tr>
    <tr>
      <td width="163">查詢名詞(term)</td>
      <td width="251"><%= rs.getString("term")%></td>
    </tr>
    <tr>
      <td>中文名詞</td>
      <td><%= rs.getString("term_chi")%></td>
    </tr>
    <tr>
      <td>說明解釋 </td>
      <td><%= rs.getString("description")%></td>
    </tr>
    </table>
  <%
    }
	else{response.sendRedirect("notfind.jsp");}
%>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
</div>
</body>
</html>
