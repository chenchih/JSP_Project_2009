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
        <td width="437"><div align="right"><span class="style17">
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
          ||</span> <span class="style17"><a href="bulletin_news.jsp" class="style14">相關消息</a> || <a href="lesson.jsp" class="style14">課程</a> || <a href="forum.jsp" class="style14">討論區</a> ||<a href="message.jsp" class="style14">留言</a> || <a href="linkpage.jsp" class="style14">連結</a></span> l  </div></td>
      </tr>
    </table>
	<!-- end #menu -->
<p>
  <%
	  String name=((String)session.getAttribute("userid")); 
	
     
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
	String sample="考試", sample2="考試", sample1="考試",sample3="考試";
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
	stmt=con.prepareStatement("select id, userid, type, score from score where userid='" +name+"'ORDER BY id asc");
		 rs = stmt.executeQuery();
		while(rs.next())
		  {
		 	String unit=rs.getString("score");
	        String type=rs.getString("type");
			int value=Integer.parseInt(unit);
		
			if(type.equals("DES"))
				{	
				sample="重新考試";
				
				}
			else if(type.equals("AES"))
				{	
				sample2="重新考試";
			
				}
				else if(type.equals("DES2"))
				{	
				sample1="重新考試";
			
				}
				else if(type.equals("RSA"))
				{	
				sample3="重新考試";
			
				}
					
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
      <td scope="row"><div align="center" class="style10">其它</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">加解密技術</div></td>
      <td scope="row"><div align="center">維基百科連結</div></td>
      <td scope="row"><div align="center"></div></td>
      <td scope="row"><div align="center"><a href="sdes.jsp" class="style14"></a></div></td>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">對稱金鑰加密</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">DES</div></td>
      <td scope="row"><div align="center"><a href="des_intro.jsp" class="style14">DES簡介</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/sdes/1.jsp" class="style14">開始</a></div></td>
      <th scope="row"><div align="center">
        <% if(sample.equals("考試"))  out.print("<a href = des.jsp target=_parent><font color=blue> 考試 </a></font> "); else if(sample.equals("重新考試"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> 重新考試 </a> </font>"); %>
||
<% if(sample1.equals("考試"))  out.print("<a href = sdes.jsp target=_parent><font color=blue> 考試 </a></font> "); else if(sample1.equals("重新考試"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> 重新考試 </a> </font>"); %>
</div></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">公開式金鑰加密</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">AES</div></td>
      <td scope="row"><div align="center"><a href="aes_intro.jsp" class="style14">AES簡介</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/aes/aes1.jsp" class="style14">開始</a>||<a href="AES.jar" class="style14">開始</a></div></td>
      <th scope="row"><% if(sample2.equals("考試"))  out.print("<a href = aes.jsp target=_parent><font color=blue> 考試 </a></font> "); else if(sample2.equals("重新考試"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> 重新考試 </a> </font>"); %></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11"><span class="style10">非對稱金鑰加密</span></div></td>
      <td scope="row"><div align="center"><span class="style10">RSA</span></div></td>
      <td scope="row"><div align="center"><a href="aes_intro.jsp" class="style14">RSA簡介</a></div></td>
      <td scope="row"><div align="center"><a href="RSA.jar" class="style14">開始</a></div></td>
      <th scope="row"><% if(sample3.equals("考試"))  out.print("<a href = rsa.jsp target=_parent><font color=blue> 考試 </a></font> "); else if(sample3.equals("重新考試"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> 重新考試 </a> </font>"); %></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11">古典加密法</div></td>
      <td scope="row"><div align="center"><span class="style10">Caesar Cipher</span>凱撒加密法</div></td>
      <td scope="row"><div align="center"><a href="http://en.wikipedia.org/wiki/Caesar_cipher" target="_blank" class="style14">外部連結</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/caesar_plain.jsp" class="style14">開始</a></div></td>
      <th scope="row">&nbsp;</th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11">古典加密法</div></td>
      <td scope="row"><div align="center"><span class="style11"><span class="style10">XOR 加密 </span></span></div></td>
      <td scope="row"><div align="center"><a href="xpr.jsp" class="style14">XOR</a></div></td>
      <td scope="row"><div align="center"><a href="XOR.jar" class="style14">開始</a></div></td>
      <th scope="row">&nbsp;</th>
    </tr>
  </table>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
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
