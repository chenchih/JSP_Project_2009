<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>AES測驗</title>
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
.style29 {font-size: 14px}
.style30 {font-size: 14}
-->
</style>
</head>

<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
        <%
	  String name=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid");  if(name.equals(""))
	  {
		{response.sendRedirect("signin.jsp");}
 	 }


	  %>
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
	<p></p>
	<h2 align="center">RSA 選擇題  <a href="grade.jsp">[<span class="style28">成績</span>]</a></h2>
	<form action="aes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4>1. RSA加密演算法是哪種類的加密法？(10分)</h4>
	   <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     對稱式加密
	     <input type="radio" value="2" name="Q1" />
	     非對稱式加密
	     <input type="radio" value="3" name="Q1" />
	     傳統加密
	     <input type="radio" value="4" name="Q1" />
	     單鑰加密</p>
	   <h4><strong>2. RSA加密系統可以分為三部份，下列何者有誤？(10<span class="style30"><strong>分</strong></span>)</strong></h4>
	   <p class="style30"><span class="style29">
	     <input type="radio" value="1" name="Q2" checked="checked" />
	   </span>私密金鑰	     <span class="style29">
	     <input type="radio" value="2" name="Q2" />
       </span>使用者金鑰 
	     <span class="style29">
	     <input type="radio" value="3" name="Q2" />
	     </span>加密演算法         <span class="style29">
         <input type="radio" value="4" name="Q2" />
       </span>解密演算法</p>
	
	  <h4><strong>3. 比起DES以及其他對稱演算法，RSA加密系統顯著較？(10<span class="style30"><strong>分</strong></span>)</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  快
	  <input type="radio" value="2" name="Q3" />
	  慢
	  <input type="radio" value="3" name="Q3" />
	  一樣快
	  </p>
	  <h4><strong>4. 針對RSA最流行的攻擊一般是何種攻擊？(10<span class="style30"><strong>分</strong></span>)</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
      暴力破解
      <input type="radio" value="2" name="Q4" /> 
      金鑰搜尋攻擊法
      <input type="radio" value="3" name="Q4" />
      旁道攻擊
      <input type="radio" value="4" name="Q4" />
      基於大數因數分解</p>
	  <h4><strong>5. 假設Alice想要通過一個不可靠的媒體接收Bob的一條私人訊息，下列步驟何者有誤？(30<span class="style30"><strong>分</strong></span>)</strong></h4>
	  <p class="style30">
	    <span class="style29">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    </span>p和q，p不等於q，計算N=pq<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="2" />
	    </span>根據歐拉函數,不大於N且與N互質的整數個數為(p-1)(q-1)<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="3" />
	    </span>選擇一個整數e與(p-1)(q-1)互質,並且e小於(p-1)(q-1)<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="1" />
      </span>用以下這個公式計算d：d× e ≡ 1 (mod (p-1)(q-1))(5)將p和q的記錄保存</p>
	  <p class="style30">        <strong>6. 依據公式，假設Bob想給Alice送一個消息m，他知道Alice產生的N和e。他使用起先與Alice約好的格式將m轉換為一個小於N的整數n，他如何將消息m轉換為數字以傳遞消息？(30分)</strong></p>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    EBCDIC
	    <input type="radio" value="2" name="Q6" /> 
	    Unicode
	    <input type="radio" value="3" name="Q6" />
      BCDIC<strong>
      <input type="radio" value="4" name="Q6" />
      </strong>8086</p>
	  <h4>&nbsp;	  </h4>
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
