<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style5 {color: #0000FF}
.style18 {font-size: 16px}
.style19 {font-size: 36px}
body {
	background-color: #FFFFFF;
}

-->
</style>
</head>

<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">登出</a> || <a href="all_entry.jsp" class="style5">使用者資料</a> || <a href="search.jsp" class="style5">搜索</a> || <a href="add_term.jsp" class="style5">新增名詞</a> || <a href="news/news.jsp" class="style5">相關消息</a> || <a href="suggestion.jsp" class="style5">意見</a> || <a href="forum/forum.jsp" class="style5">討論區</a> || <a href="message/message.jsp" class="style5">留言</a></span></div></td>
      </tr>
    </table>
    <p align="center">&nbsp;</p>
<p align="center" class="style19">所有名詞</p>
<hr>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>
          <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
        </p>
          <table width="475" border="1" align="center">
            <tr>
              <td width="51" bgcolor="#99FF00">&nbsp;</td>
              <td width="64" bgcolor="#99FF00">名詞</td>
              <td width="75" bgcolor="#99FF00">中文名詞</td>
              <td width="257" bgcolor="#99FF00">解釋</td>
            </tr>
            <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select term, description, term_chi, id from terms");
		 rs = stmt.executeQuery();
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("term"));
			out.print("</td><td>");
			out.print(rs.getString("term_chi"));
			out.print("</td><td>");
		out.print(rs.getString("description"));
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
          </p>
          <p>&nbsp;          </p></td>
    </tr>
  </table>
  <p>
    <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
</p>
</form>
</div>
</body>
</html>
