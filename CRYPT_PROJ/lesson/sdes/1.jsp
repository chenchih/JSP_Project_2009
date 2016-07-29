<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<style type="text/css">
<!--
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
<SCRIPT language="javascript">
<!--
function OpenBut()
{
window.open("m1.jsp", "OpenColse", "toolbar=no, member=no, height=620, width=750");

}
function closed()
{
window.close();
}

-->
</script>
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
<p>&nbsp;</p>
<table width="200" border="0" align="right">
  <tr>
    <td width="110
	"><form name="form3" method="post" action="map.jsp">
       <input type="button" value="S-DES 架構圖" onClick="OpenBut()">
    </form></td>
    <td width="70"><form name="form2" method="post" action="">
      <input name="button1" type="button" onClick="closed()" id="sample" value="結束程式">
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="2.jsp">

 
  <p><font color="#FF0000">【簡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    介】</font></p>
  <ul>
    <li><font color="#0000FF">精簡版的 DES(S-DES) : </font>是由 Santa Clara 大學的 Edward Schaefer 教授所發展出來的 [SCHA96。]它並不是一個安全的加密演算法，它的目的是為了方便教學。它與 DES 有相似的特性與結構，但是它需要的參數比 DES 少很多。</li>
  </ul>
  <ul>
    <li><font color="#0000FF">S-DES 加密演算法:</font> 的輸入是一個8位元的明文區段(例如:10111101)，以及一把10位元的鑰匙；它的輸出是一個8位元的密文區段。</li>
  </ul>
  <ul>
    <li>首先，輸入一把10位元的鑰匙，從中產生執行兩次 fk 時所需的子鑰匙K1及K2然後，我們可以將整個加密演算法簡潔地用下列的合成函數來表示： <br>
        <font color="#0000FF">密文 = IP<span style="vertical-align: super">-1</span>( fk2 ( SW ( fk1 ( IP ( 明文 ) ) ) ) )</font> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP：一個啟始的重排函數<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fk1：複雜函數，它會根據子錀匙K1來進行重排與取代的運算 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SW：一個交換資料兩邊的簡單重排函數 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fk2：複雜函數，它會根據子錀匙K2來進行重排與取代的運算 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP<span style="vertical-align: super">-1</span>：重排函數，它是IP的反函數</li>
  </ul>
  <ul>
    <li>本程式的目的是希望藉由 step by step 介紹 S-DES 的每個元素，能有助於同學的學習。</li>
  </ul>
  <ul>
    <li>參考來源：William Stallings,“Cryptography and Network Security,”Third Edition, Prentice Hall, 2003</li>
  </ul>
  <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <p align="right">　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <input type="submit" name="Submit" value="開始">

</form>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">管理員</a>||<a href="../../term.jsp" class="style5">名詞搜索</a> || <a href="../../contact.jsp" class="style5">意見 </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
