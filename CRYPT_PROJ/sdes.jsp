<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>無標題文件</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<style type="text/css">
<!--

body,td,th {
	color: #000000;
}
.style27 {font-family: "細明體";
	font-size: 16px;
}

h1 {
	color: #000000;
}
h2 {
	color: #000000;
}
h3 {
	color: #000000;
}
.style28 {color: #0000FF}
a:hover {
	color: #FF0000;
}
.style29 {color: #FF0000}
.style30 {color: #000000}
-->
</style>
</head>

<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
</p>
	  <p>&nbsp;</p>
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
          <span class="style27">||</span> <span class="style27"><a href="bulletin_news.jsp" class="style28">相關消息</a> || <a href="lesson.jsp" class="style28">課程</a> || <a href="forum.jsp" class="style28">討論區</a> ||<a href="message.jsp" class="style28">留言</a> || <a href="linkpage.jsp" class="style28">連結</a></span></div></td>
      </tr>
    </table>
	<h2 align="center">&nbsp;</h2>
	<form action="sdes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4 align="center" class="style29"><span class="style30">DESII 選擇題</span> <a href="grade.jsp">[<span class="style28">成績</span>]</a></h4>
      <h4 class="style29">每題10分</h4>
      <h4>1. 請問以下SDES用那以下那一種位元運算<strong>? </strong></h4>
      <p>
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     binary
  <input type="radio" value="2" name="Q1" />
	     hexadecimal
  <input type="radio" value="3" name="Q1" />
	     octal 
  <input type="radio" value="3" name="Q1" />
	     decimal     </p>
	   <h4><strong>2. 請問IP是什麼 意思	    </strong><strong>? </strong></h4>
	   <p>
        <input type="radio" value="1" name="Q2" checked="checked" />
初始重排
<input type="radio" value="2" name="Q2" />
反運算
<input type="radio" value="3" name="Q2" />
一個複雜的函數
<input type="radio" value="3" name="Q2" />
一個簡單的重排</p>
	
	  <h4><strong>3. 請問SDES用以下那一種邏輯運算來加解密?</strong><strong></strong>      </h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  OR 
	  <input type="radio" value="2" name="Q3" />
	  AND 
	  <input type="radio" value="3" name="Q3" />
	  XOR      
	  <input type="radio" value="3" name="Q3" />
NOT </p>
	  <h4><strong>4. 請問1011001111 的加密後是多少?  </strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q4" />
      01000001 
      <input type="radio" value="2" name="Q4" /> 
      11100001 
      <input type="radio" value="3" name="Q4" /> 
      11100010 
      <input type="radio" value="4" name="Q4" />
      以上皆非</p>
	  <h4><strong>5. 請問如果加密明文是00110110  那FK會是多少?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q5" />
	    11001001 
	    <input type="radio" value="2" name="Q5" /> 
	    00011001
	    <input type="radio" value="3" name="Q5" /> 
	    01101001
	    <input type="radio" value="4" name="Q5" /> 
	    01100001</p>
	  <h4><strong>6. 請問SDES區段大小和金鑰長度是多少?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q6" /> 
	    10, 5 
	    <input type="radio" value="2" name="Q6" /> 
	    6, 8   
	    <input type="radio" value="3" name="Q6" /> 
	    10, 8 <strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>8 ,10 
	    <input type="radio" value="5" name="Q6" /> 
	    8, 6   
	    <input type="radio" value="6" name="Q6" /> 
	    8, 8 </p>
	  <h4><strong>7. 如果加密的明文是00110110  那8位元的密文是多少?</strong></h4>
	  <p><strong>
	    <input type="radio" value="1" name="Q7" />
      01000001 </strong>
	    <input type="radio" value="2" name="Q7" />
	    11001100 
	    <input type="radio" value="3" name="Q7" /> 
	    00111001 
	    <input type="radio" value="4" name="Q7" />
	    10100111</p>
	  <h4><strong>8. 如果FK是01101001那E/P是多少?</strong></h4>
	  <p>
	    <input type="radio" value="4" name="Q8" />
	    00111100? <strong>
	    <input type="radio" value="2" name="Q8" />
	    </strong>	     11000011<strong>?</strong>
	    <input type="radio" value="3" name="Q8" /> 
	    00111001?  
	    <input type="radio" value="4" name="Q8" />
	    10011000</p>
	  <h4><strong>9. 如果加密的FK 是1000100那反運算(IP-1)會是多少?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q9" />
	    00000110 
	    <input type="radio" value="2" name="Q9" />
	    01000001 
	    <input type="radio" value="3" name="Q9" />
	    10111001 
	    <input type="radio" value="4" name="Q9" />
	    00111100</p>
	  <h4><strong>10. 如果 L=1101R=0100,F(R,SK)=0101請問FK(L,K)為多少?</strong></h4>
	  <p><strong>
	    <input type="radio" value="1" name="Q10" />  
      </strong>1000100
	    <input type="radio" value="2" name="Q10" />  
      00100001
      <input type="radio" value="3" name="Q10" /> 
      11100110 
      <input type="radio" value="4" name="Q10" />
      01000011</p>
	  <p>
        <input type="submit" value="送出" name="B1" />
        <input type="reset" value="重設" name="B2" />
	  </p>
  </form>
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right"><span class="style27"><a href="admin/admin.jsp" target="_blank" class="style28">管理員</a>||<a href="term.jsp" class="style28">名詞搜索</a> || <a href="contact.jsp" class="style28">意見 </a></span></div></td>
      </tr>
    </table>
	<p> </p>
</div>
</body>
</html>
