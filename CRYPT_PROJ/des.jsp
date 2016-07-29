<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>DES測驗</title>
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
.style35 {color: #FF0000}
.style36 {color: #000000}
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
	<h2 align="center">&nbsp;</h2>
	<form action="des_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4 align="center" class="style35"><span class="style36">DES 選擇題</span> <a href="grade.jsp">[<span class="style28">成績</span>]</a></h4>
      <h4 class="style35">每題10分</h4>
      <h4>1. DES加密法是何種加密形式？</h4>
      <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     對稱式加密法
  <input type="radio" value="2" name="Q1" />
	     傳統加密法
         <input type="radio" value="3" name="Q1" />
	     單鑰加密法
	     <input type="radio" value="4" name="Q1" />
	     以上皆是</p>
	   <h4><strong>2. DES加密法是哪兩項基本原理？所謂的(a)就是將明文轉換成其他的樣子，而(b)則是指明文中的任何一個小地方的變更都將擴散到密文的各部份。</strong></h4>
	   <p class="style30"><span class="style29">
       <input type="radio" value="1" name="Q2" checked="checked" />
	   混淆
	     
       <input name="Q2" type="radio" value="2" />
       散佈
	     
       <input type="radio" value="3" name="Q2" />
       分析
         
       <input name="Q2" type="radio" value="4" />
       破解</span></p>
	   <h4><strong>3. DES加密法每次加密的單位是幾位元？</strong></h4>
	   <p class="style29">
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  32 
	  <input type="radio" value="2" name="Q3" />
	  64
	  <input type="radio" value="3" name="Q3" />
	  128      
	  <input type="radio" value="4" name="Q3" />
16 </p>
	  <h4><strong>4. 在DES加密法中，解密的演算法和加密完全相同，在解密時輸入的金鑰的位元順序恰與加密時的金鑰？</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
	    <span class="style29">
      相同 
      <input type="radio" value="2" name="Q4" /> 
      相反 
      <input type="radio" value="3" name="Q4" />
      互斥 
      <input type="radio" value="4" name="Q4" />
      以上皆非</span></p>
	  <p><strong>5. DES的防禦強度決定於哪兩項因素？</strong></p>
	  <p class="style29">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    傳統 
	    <input type="radio" value="2" name="Q5" /> 
	    演算法本身
	    <input type="radio" value="3" name="Q5" />
	    所使用的56位元金鑰長度
	    <input name="Q5" type="radio" value="4" checked="checked" />	    
      數位簽章</p>
	  <h4><strong>6. 隨著科技進步及電腦更新DES加密法變得？</strong></h4>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    更安全 
	    <input type="radio" value="2" name="Q6" /> 
	    有更多被破解的可能   
	    <input type="radio" value="3" name="Q6" /> 
	    以上皆非<strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>以上皆是</p>
	  <h4><strong>7. 下列關於DES敘述何者正確?</strong></h4>
	  <p class="style29"><strong>
	    
      <input name="Q7" type="radio" value="1" checked="CHECKED" />
      </strong>DES是美國政府所制定的通訊安全標準。<br />
	    <strong>
	    <input name="Q7" type="radio" value="2" />
	    </strong>DES是採公鑰編碼(Public Key Cryptography)技術。<br />
	    <strong>
	    <input name="Q7" type="radio" value="3" />
	    </strong>DES的鑰匙(key)實際有效長度為56位元，每回合所加密之資料訊息長度為32位元。<br />
	    <strong>
	    <input name="Q7" type="radio" value="4" />
      </strong>DES加密過程共16回合，每回合使用的鑰匙均不相同。</p>
	  <h4>8. DES是一個相當普遍, 流傳相當久遠的演算法,現在網路上常用的哪些加密法都是以 DES 為基礎來執行加解密的動作？</h4>
	  <p><strong>
	    <span class="style29">
	    <input name="Q8" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">SET 
	    <strong>
        <input type="radio" value="2" name="Q8" />
	    </strong>SSL<strong>
	    <input type="radio" value="3" name="Q8" />
	    </strong>SSH<strong>
        <input type="radio" value="4" name="Q8" />
        </strong>以上皆是</span></p>
	  <h4><strong>9.為何DES加密法需要16回合的加密？</strong></h4>
	  <p class="style29"><strong>
	    <span class="style29">
	    <input name="Q9" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">因為運算16回合利用各種方法破解所需時間剛好跟用暴力破解法差不多<br />
	    <strong>
	    <input type="radio" value="2" name="Q9" />
	    </strong>17、18回合 可能會遭受暴力破解法攻擊<br />
	    <strong>
	    <input type="radio" value="3" name="Q9" />
	    </strong>14、15回合 安全性比較沒這麼強<br />
        <strong>
        <input type="radio" value="4" name="Q9" />
        </strong>以上皆是</span></p>
	  <h4><strong>10. DES的全名為(Data Encryption Standard)？</strong></h4>
	  <p class="style29">
	    <input name="Q10" type="radio" value="1" checked="checked" />
	    是
	    <input type="radio" value="2" name="Q10" />
	    否</p>
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
