<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<style type="text/css">
<!--
.style1 {color: #FF0000}
.style3 {color: #000000}
.style4 {color: #0000FF}
.style6 {color: #000000; font-family: "Times New Roman", Times, serif; }

.style16 {color: #000000; font-weight: bold; }
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
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
	<div id="header">
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
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style4">相關消息</a> || <a href="lesson.jsp" class="style4">課程</a> || <a href="forum.jsp" class="style4">討論區</a> ||<a href="message.jsp" class="style4">留言</a> || <a href="linkpage.jsp" class="style4">連結</a></span></div></td>
      </tr>
    </table>
	<!-- end #menu -->


<p align="center" class="style16">&nbsp;</p>
<p align="center" class="style16"><font size="+6">資訊安全教學網</font></p>
<table width="660" border="1" align="center">
  <tr>
    <td width="250" bgcolor="#FFFF00"><div align="center" class="style3">網站</div></td>
    <td width="218" bgcolor="#FFFF00"><div align="center" class="style3">內容</div></td>
    </tr>
  <tr>
    <td height="29"><a href="http://home.pchome.com.tw/education/tsnien/book-3/Intro.html" class="style1 style4">資訊與網路安全技術 </a> <span class="style3">(中文)</span></td>
    <td><span class="style6">資安教學網</span></td>
    </tr>
  <tr>
    <td><a href="http://sna.csie.ndhu.edu.tw/~cnyang/RecentCrypto/sld005.htm" class="style4">AES  </a><span class="style3">(英文/中文)</span></td>
    <td><span class="style6">AES教學網</span></td>
  </tr>
  <tr>
    <td><a href="http://crypto.nknu.edu.tw/textbook/context_updateFrameset.html" class="style4">密碼學</a> <span class="style3">(中文)</span></td>
    <td><span class="style6">密碼學教學網</span></td>
  </tr>
  <tr>
    <td height="25"><a href="http://www.quadibloc.com/crypto/co040401.htm" class="style4">AES </a> <span class="style3">(英文)</span></td>
    <td><span class="style6">AES教學網</span></td>
  </tr>
  <tr>
    <td height="25"><a href="http://www.garykessler.net/library/crypto.html" class="style1"><span class="style4">密碼學<span class="style3">(英文)</span></span></a></td>
    <td><span class="style6">Overview of Cryptography</span></td>
  </tr>
</table>
<p align="left"><a href="http://home.pchome.com.tw/education/tsnien/book-3/Intro.html" class="style1"></a></p>
<hr>
<!-- end #footer -->
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style4">管理員</a>||<a href="term.jsp" class="style4">名詞搜索</a> || <a href="contact.jsp" class="style4">意見 </a></span></div></td>
  </tr>
</table>
</div>
</div>
</body>
</html>
