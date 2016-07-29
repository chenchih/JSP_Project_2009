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
	<h2 align="center">AES 選擇題  <a href="grade.jsp">[<span class="style28">成績</span>]</a></h2>
	<form action="aes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4>1. AES加密法是屬於何種加密程序？<strong></strong></h4>
	   <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     對稱式金鑰
  <input type="radio" value="2" name="Q1" />
	     傳統加密法
         <input type="radio" value="3" name="Q1" />
	     Rijndael加密法
	     <input type="radio" value="4" name="Q1" />
	     以上皆是</p>
	   <h4><strong>2. 下列關於AES加密法的敘述何者正確？</strong></h4>
	   <p class="style30"><span class="style29">
	     <input type="radio" value="1" name="Q2" checked="checked" />
	   </span>是美國聯邦政府採用的一種區塊加密標準<br />
	     <span class="style29">
	     <input type="radio" value="2" name="Q2" />
	     </span>這個標準用來替代原先的DES<br />
	     <span class="style29">
	     <input type="radio" value="3" name="Q2" />
	     </span>已經被多方分析且廣為全世界所使用<br />
         <span class="style29">
         <input type="radio" value="4" name="Q2" />
       </span>以上皆是</p>
	
	  <h4><strong>3. AES加密法的區塊長度為？</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  32 
	  <input type="radio" value="2" name="Q3" />
	  128 
	  <input type="radio" value="3" name="Q3" />
	  64      
	  <input type="radio" value="4" name="Q3" />
16 </p>
	  <h4><strong>4. AES加密法的密鑰長度可以為？</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
      128 
      <input type="radio" value="2" name="Q4" /> 
      192 
      <input type="radio" value="3" name="Q4" />
      256 
      <input type="radio" value="4" name="Q4" />
      以上皆是</p>
	  <h4><strong>5. AES加密過程是哪種數學方式上運作？</strong></h4>
	  <p class="style30">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    矩陣 
	    <input type="radio" value="2" name="Q5" /> 
	    方程式
	    <input type="radio" value="3" name="Q5" />
	    三角函數
        <input type="radio" value="4" name="Q5" />	    
        向量</p>
	  <h4><strong>6. AES加密法含有四個步驟，下列何者為非？</strong></h4>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    AddRoundKey 
	    <input type="radio" value="2" name="Q6" /> 
	    Rijndael   
	    <input type="radio" value="3" name="Q6" /> 
	    ShiftRows<strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>SubBytes</p>
	  <h4><strong>7. 截至2006年，針對AES唯一的成功攻擊是何種攻擊？</strong></h4>
	  <p class="style29"><strong>
	    
      <input name="Q7" type="radio" value="1" checked="checked" />
      </strong>暴力破解 
	    <input type="radio" value="2" name="Q7" />
	    金鑰搜尋攻擊法
	    <input type="radio" value="3" name="Q7" />
	    旁道攻擊 
	    <input type="radio" value="4" name="Q7" />
	    以上皆非</p>
	  <h4><strong>8. 關於AES加密法下列何者對應有誤？</strong></h4>
	  <p><strong>
	    <span class="style29">
	    <input name="Q8" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">128位元密鑰版本有10個加密迴圈<br />
	    <strong>
        <input type="radio" value="2" name="Q8" />
	    </strong>192位元密鑰版本有12個加密迴圈<br />
	    <strong>
	    <input type="radio" value="3" name="Q8" />
	    </strong>16位元密鑰版本則有6個加密迴圈<br />
        <strong>
        <input type="radio" value="4" name="Q8" />
        </strong>256位元密鑰版本則有14個加密迴圈</span></p>
	  <h4><strong>9. AES加密法不同於它的前任標準DES加密法使用的是何種架構？</strong></h4>
	  <p class="style29">
	    <input name="Q9" type="radio" value="1" checked="checked" />
	    置換-組合架構
	    <input type="radio" value="2" name="Q9" />
	    Feistel架構 
	    <input type="radio" value="3" name="Q9" />
	    雜湊架構 
	    <input type="radio" value="4" name="Q9" />
	    數位架構</p>
	  <h4><strong>10. AES加密法含有四個步驟，下列步驟何者有誤？</strong></h4>
	  <p class="style29">
	    <input name="Q10" type="radio" value="1" checked="checked" />
	    AddRoundKey — 矩陣中的每一個位元組都與該次迴圈的子密鑰（round key）做XOR運算；每個子密鑰由密鑰生成方案產生。<br />
	    <input type="radio" value="2" name="Q10" />
	    SubBytes — 透過一個非線性的替換函數，用查找表的方式把每個位元組替換成對應的位元組。<br />
	    <input type="radio" value="3" name="Q10" />
	    ShiftRows — 將矩陣中的每個直列進行單一式移位。<br />
        <input type="radio" value="4" name="Q10" />      
      MixColumns — 為了充分混合矩陣中各個直行的操作。這個步驟使用線性轉換來混合每行內的四個位元組。</p>
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
