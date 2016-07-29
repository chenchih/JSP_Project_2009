<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style2 {color: #0000FF}
.style3 {color: #0000FF; font-weight: bold; }
.style17 {font-family: "細明體";
	font-size: 16px;
}
body,td,th {
	color: #000000;
}
a:hover {
	color: #FF0000;
}

-->
</style>
</head>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
</p>
	  <p>&nbsp;      </p>
  </div>
	<!-- end #header -->
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right">
          <%
   String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals(""))
	{
	  out.print(""); 
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>登入 </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  登出 </a> </font>");
	}

  
   
%>
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style2">相關消息</a> || <a href="lesson.jsp" class="style2">課程</a> || <a href="forum.jsp" class="style2">討論區</a> ||<a href="message.jsp" class="style2">留言</a> || <a href="linkpage.jsp" class="style2">連結</a></span></div></td>
      </tr>
    </table>
	</p>
<p>
	  <%	 
	 String userid = (String)session.getAttribute("userid");
	
	 Connection con ;
     PreparedStatement stmt = null;
     ResultSet rs = null;
%>
	  <%
	  String name=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid");  if(name.equals(""))
	  {
		{response.sendRedirect("signin.jsp");}
 	 }


	  %>
  </p>
  </p>
	<table width="300" align="center">
      <tr>
        <td><form name="update" method="post" action="edit_check.jsp">
            <fieldset>
            <legend><font color="#0000FF">會員資料修改</font></legend>
              <% 
	  try {
   	   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");

       stmt = con.prepareStatement("select * from member where userid=?");
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
	   
	  
	    if (rs.next()) {
%>
              帳號：<%= rs.getString("userid")%><br>
              密碼：
              <input name="pwd"  type="text" value="<%= rs.getString("pwd")%>">
              <br>
              姓名：
              <input name="name" type="text" value="<%= rs.getString("name")%>">
              <br>
              住址：
              <input name="address" type="text" id="address" value="<%= rs.getString("address")%>">
              <br>
              電子郵件：
              <input name="email" type="text" id="email" value="<%= rs.getString("email")%>">
              <br>
              <input name="edit_hidden" type="hidden" id="edit_hidden" value="<%=getRecordID()%>">
            </fieldset>
          <%   		
	   }
	} catch (Exception ex) {
       	ex.printStackTrace();
   	} finally {
       	if (stmt!=null) stmt.close();
   } 
%>
            <center>
              <input type="submit" name="submit" value="修改">
            </center>
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p></p>
<!-- end #footer -->
</div>
</body>
</body>
</html>
