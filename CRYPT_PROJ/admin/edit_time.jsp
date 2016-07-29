<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<style type="text/css">
<!--
.style9 {font-size: 24px; font-weight: bold; }
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
a:link {
	color: #0000FF;
}
.style5 {color: #0000FF}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
</head>

<body>

</head>
<body>

    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">登出</a> || <a href="all_entry.jsp">使用者資料</a> || <a href="search.jsp">搜索</a> || <a href="add_term.jsp">新增名詞</a> || <a href="news/news.jsp">相關消息</a> || <a href="suggestion.jsp">意見</a> || <a href="forum/forum.jsp">討論區</a> || <a href="message/message.jsp">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <table width="392" height="21" border="1" align="center">
  <tr>
    <td width="135"><div align="center"><span class="style9"><a href="all_entry.jsp">所有資料</a></span></div></td>
    <td width="117"><div align="center"><span class="style9"><a href="part_entry.jsp">資料分頁</a></span></div></td>
    <td width="118" bgcolor="#CC0000"><div align="center"><span class="style9">刪除/更新</span></div></td>
  </tr>
</table>
<hr />
<p>
  <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
</p>
<table width="624" border="1" align="center">
  <tr>
    <td width="115" bgcolor="#99FF00">註冊時間</td>
    <td width="115" bgcolor="#99FF00">使用者帳號</td>
    <td width="96" bgcolor="#99FF00">姓名</td>
    <td width="109" bgcolor="#99FF00">修改時間</td>
    <td width="109" bgcolor="#99FF00">delete</td>
  </tr>
  <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select id, userid, name, edit_id from member");
 		 rs = stmt.executeQuery();
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("userid"));
			out.print("</td><td>");
			out.print(rs.getString("name"));
			out.print("</td><td>");
			out.print(rs.getString("edit_id"));
			out.print("</td><td>");
			out.print("<a href = delete.jsp> delete </a>"); 
			out.print("</td></tr>");
		
		}
		
		%>
</table>

<p>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
  
    <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
</p>
</div>
</body>
</html>
