<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style10 {
	color: #000000;
	font-size: 36px;
	font-weight: bold;
}
.style14 {color: #000000; font-size: 14; font-weight: bold; }

body,td,th {
	color: #000000;
}
.style17 {font-family: "�ө���";
	font-size: 16px;
}
.style18 {color: #0000FF}
a:hover {
	color: #FF0000;
}

-->
</style>
</head>

<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
      </p>
	  <p>&nbsp;    </p>
  </div>
	<!-- end #header -->
	<!-- end #menu -->
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right">
          <%
   String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals(""))
	{
	  out.print(""); 
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>�n�J </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  �n�X </a> </font>");
	}

  
   
%>
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style18">��������</a> || <a href="lesson.jsp" class="style18">�ҵ{</a> || <a href="forum.jsp" class="style18">�Q�װ�</a> ||<a href="message.jsp" class="style18">�d��</a> || <a href="linkpage.jsp" class="style18">�s��</a></span></div></td>
      </tr>
    </table>
	<p align="center" class="style10">�Ҹզ��Z</p>
<hr>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>
          <%
		      String name = (String)session.getAttribute("userid");
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
	 
%>
        </p>
          <table width="397" border="1" align="center">
            <tr>
              <td width="140" bgcolor="#99FF00"><div align="center" class="style14">id</div></td>
              <td width="54" bgcolor="#99FF00"><div align="center" class="style14">�m�W</div></td>
              <td width="56" bgcolor="#99FF00"><div align="center" class="style14">���O</div></td>
              <td width="119" bgcolor="#99FF00"><div align="center" class="style14">���n</div></td>
            </tr>
            <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
	stmt=con.prepareStatement("select id, userid, type, score from score where userid='" +name+"'ORDER BY id asc");
		 rs = stmt.executeQuery();
		
	     while(rs.next()) {
		 String unit=rs.getString("score");
		 String type=rs.getString("type");
		int value=Integer.parseInt(unit);
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("userid"));
			out.print("</td><td>");
			out.print("<font color=#0000FF>" +type+"</font>");
			out.print("</td><td>");
			if(value<=50) {
							out.print("<p align=center><font color=red>" +value+"</font>");
							out.print("<br>");
						  }
				else	{
						out.print("<p align=center>"+unit);
						out.print("<br>");
						}
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
    <!-- end #footer -->
</p>
</form>

<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style18">�޲z��</a>||<a href="term.jsp" class="style18">�W���j��</a> || <a href="contact.jsp" class="style18">�N�� </a></span></div></td>
  </tr>
</table>
</div>
<p>&nbsp;</p>

</body>
</html>
