<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style10 {color: #000000}
.style11 {
	font-family: "新細明體";
	color: #000000;
}

.style14 {color: #0000FF}
.style17 {font-family: "細明體";
	font-size: 16px;
}

body,td,th {
	color: #000000;
}


-->
</style>
</head>
<SCRIPT Language=javascript>
<!--
//回應 瀏覽Page.htm 指令按鈕的函數
function sdes()
{
	open("lesson/sdes/1.jsp");
	//將page.htm開啟在目前的瀏覽器中
}
function aes1()
{
	open("lesson/aes/aes1.jsp");
	//將page.htm開啟在目前的瀏覽器中
}
function aes2()
{
	open("lesson/aes/AESDemo.exe");
	//將page.htm開啟在目前的瀏覽器中
}

-->
</SCRIPT>

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
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style14">相關消息</a> || <a href="lesson.jsp" class="style14">課程</a> || <a href="forum.jsp" class="style14">討論區</a> ||<a href="message.jsp" class="style14">留言</a> || <a href="linkpage.jsp" class="style14">連結</a></span></div></td>
      </tr>
    </table>
	<!-- end #menu -->
<p>
  <%
	  String name=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid");  if(name.equals(""))
	  {
		{response.sendRedirect("pop.jsp");}
 	 }


	  %>
</p>
<form id="form1" name="form1" method="post" action="">
  <table width="778" border="1" align="center">
    <tr bgcolor="#FFFF00">
      <th width="170" scope="row"><div align="center" class="style10">類別</div></th>
      <th width="217" scope="row"><div align="center" class="style10">介紹</div></th>
      <th width="210" scope="row"><div align="center" class="style10">流程簡介</div></th>
      <th width="153" scope="row"><span class="style10">程式實作</span></th>
      <th width="153" scope="row"><span class="style10">線上測驗</span></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">開放式金鑰</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">SDES</div></td>
      <td scope="row"><div align="center"></div></td>
      <td scope="row"><div align="center"><a href="lesson/sdes/1.jsp" class="style14">開始</a></div></td>
      <td scope="row"><div align="center"><a href="sdes.jsp" class="style14">開始</a></div></td>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">開放式金鑰</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">AES</div></td>
      <td scope="row"><div align="center"></div></td>
      <td scope="row"><div align="center"><a href="lesson/aes/aes1.jsp" class="style14">開始</a></div></td>
      <th scope="row">&nbsp;</th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">開放式金鑰</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">RSA</div></td>
      <td scope="row"><div align="center"></div></td>
      <td scope="row">&nbsp;</td>
      <th scope="row">&nbsp;</th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11">開放式金鑰</div></td>
      <td scope="row"><div align="center"></div></td>
      <th scope="row">&nbsp;</th>
      <td scope="row">&nbsp;</td>
      <th scope="row">&nbsp;</th>
    </tr>
  </table>
  
</form>
<!-- end #footer -->
<hr />
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style14">管理員</a>||<span class="style14"><a href="term.jsp" class="style14">名詞搜索</a><a href="term.jsp"></a></span> || <a href="contact.jsp" class="style14">意見 </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</body>
</html>
