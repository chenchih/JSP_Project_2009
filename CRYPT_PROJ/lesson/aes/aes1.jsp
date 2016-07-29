<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	font-weight: bold;
}
.style29 {font-family: "細明體";
	font-size: 16px;
}
a:hover {
	color: #FF0000;
}
.style5 {color: #0000FF}
-->
</style>
</head>

<body>

<table width="200" border="1" align="center">
  <tr>
    <td><img src="pic1.gif" width="800" height="220"></td>
  </tr>
</table>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right">
      <%
   String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals(""))
	{
	  out.print(""); 
	  out.print("<a href = signin.jsp target=_parent>登入 </a>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> 登出 </a>");
	}

  
   
%>
      <span class="style29">||</span> <span class="style29"><a href="../../bulletin_news.jsp">相關消息</a> || <a href="../../lesson.jsp">課程 </a>|| <a href="../../forum.jsp">討論區</a> ||<a href="../../message.jsp">留言</a> || <a href="../../linkpage.jsp">連結</a></span></div></td>
  </tr>
</table>
<p align="center" class="style1">&nbsp;</p>
<p align="center" class="style1">AES </p>
<p align="center" class="style1">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="662" height="514">
    <param name="movie" value="aes_final.swf">
    <param name="quality" value="high">
    <embed src="aes_final.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="662" height="514"></embed>
  </object>
</p>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">管理員</a>||<a href="../../term.jsp" class="style5">名詞搜索</a> || <a href="../../contact.jsp" class="style5">意見 </a></span></div></td>
  </tr>
</table>
<p align="center" class="style1">&nbsp;</p>
</body>
</html>
