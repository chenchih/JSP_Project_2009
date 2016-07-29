<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Long Beach
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20081210

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Long Beach by Free CSS Templates</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style17 {font-family: "細明體";
	font-size: 16px;
}
.style18 {color: #0000FF}

-->
</style></head>
<body>
<div id="wrapper">
	<div id="header">
	  <div id="logo"></div>
	  <div id="search"></div>
		<!-- end #search -->
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
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style18">相關消息</a> || <a href="lesson.jsp" class="style18">課程</a> || <a href="forum.jsp" class="style18">討論區</a> ||<a href="message.jsp" class="style18">留言</a> || <a href="linkpage.jsp" class="style18">連結</a></span></div></td>
      </tr>
    </table>
	<p>
	  <!-- end #menu -->
  簡介</p>
	<p>&nbsp;</p>
	<hr />
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style18">管理員</a>||<a href="term.jsp" class="style18">名詞搜索</a> || <a href="contact.jsp" class="style18">意見 </a></span></div></td>
      </tr>
    </table>
	<div id="page"><!-- end #content -->
      <!-- end #sidebar -->
<div style="clear: both;">&nbsp;</div>
  </div>
	<!-- end #page -->
	<!-- end #footer -->
</div>
</body>
</html>
