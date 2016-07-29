<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--

.style14 {color: #0000FF}
.style17 {font-family: "細明體";
	font-size: 16px;
}

body,td,th {
	color: #000000;
}
a:link {
	color: #0000FF;
}
a:hover {
	color: #FF0000;
}
.style20 {font-size: 36px}


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
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="">
  <p align="center"><span class="style20"><strong>DES </strong><strong>演算法</strong></span></p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;在所對稱金鑰保密演算法中，最廣為使用的就是DES(Data Encryption Standard)了。它是 IBM 公司在 1970 年代發展 出的一個加密演算法，二十多年來，儘管電腦硬體及密碼分析的技術的發展日新月異，密碼學專家對於 DES 的安全性 也僅僅到了『質疑』的地步，換句話說，就目前的密碼破解技術而言，DES  仍不失為一個安全的密碼系統。<br />
  &nbsp;&nbsp;&nbsp;&nbsp;DES 在 1977 年經由美國國家標準局（NBS）採用為聯邦標準（FIPS PUB 46-2）之後，已成為金融界及其他各種產業  最廣泛應用的密碼系統，它的演算法可參考公開的文件，本節將摘述其要點。<br />
    DES 系統的基本原理就是混淆（Confusion）及散佈（Diffusion）。所謂的混淆就是將明文轉換成其他的樣子，而散佈  則是指明文中的任何一個小地方的變更都將擴散到密文的各部份。<br />
    前面幾小節我們先說明DES 演算法所必須用到的一些元件後，接下來再正式介紹 DES 加密的演算法了。<br />
      <strong>S-BOX</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;在 DES 演算法中，用來執行混淆動作的，就是 S-BOX，S-BOX本身，我們可以將他看成是一個 6 位元 輸入，4 位 元 輸出的函數，在整個演算法中，DES 用到了八個 S-BOX列出如下：<br />
    <br />
    S-BOX 1:<br />
    14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7,<br />
    0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8, <br />
    4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,<br />
    15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13,<br />
      <br />
    S-BOX 2:<br />
    15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10,<br />
    3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5,<br />
    0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15,<br />
    13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9,<br />
      <br />
    S-BOX 3:<br />
    10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8,<br />
    13, 7, ??0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1,<br />
    13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7,<br />
    1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12,<br />
      <br />
    S-BOX 4:<br />
    7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15,<br />
    13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9,<br />
    10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4,<br />
    3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14,<br />
      <br />
    S-BOX 5:<br />
    2, 12, 4, 1, 8, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9,<br />
    14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6,<br />
    4, 2, 1, 11, 10, 13, 7, 8, 15, ?9, 12, 5, 6, 3, 0, 14,<br />
    11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3,<br />
      <br />
    S-BOX 6:<br />
    12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11,<br />
    10, 15, 4, 2, 7, 12, 9, 5, 6, ?1, 13, 14, 0, 11, 3, 8,<br />
    9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6,<br />
    4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13,<br />
      <br />
    S-BOX 7:<br />
    4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9,7, 5, 10, 6, 1,<br />
    13, 0, 11, 8, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6,<br />
    1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2,<br />
    6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12,<br />
      <br />
    S-BOX 8:<br />
    13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7,<br />
    1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2,<br />
    7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8,<br />
    2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11,<br />
      <br />
  &nbsp;&nbsp;&nbsp;&nbsp;看過了所有的 S-BOX 後，接下來的問題就是如何使用 S-BOX 呢？前面提過，S-BOX 有 6 位元 的輸入、4 位元 的<br />
    輸出，S-BOX 求輸出值的方法就是：將輸入六 位元 的頭尾兩個 位元 組合的二進位數字（0-3）當作列數，中間四個 位元 組合的二進位數（0-15）當作行數，找出 S-BOX 中該位置的數字即為輸出。舉例如下：<br />
    將010010 輸入 S-BOX1 <br />
    取出頭尾兩個 位元 ： 00 = 010&nbsp;<br />
    取出中間四個 位元 ： 10012= 910<br />
    S-BOX1中第 0 列，第 9 行的數字是 1010<br />
    因此輸出為 1010 = 10102<br />
      <strong>排列函數</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;除了 S-BOX 外，DES 演算法中還用到了排列函數。它主要的作用是執行散佈的動作。<br />
    DES 演算法中使用了許多不同的排列函數，列舉如下：<br />
      <br />
      <strong>初始排列（Initial Permutation）</strong><br />
    58, 50, 42, 34, 26, ?18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4,<br />
    62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8,<br />
    57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3,<br />
    61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7,<br />
      <br />
      <strong>金鑰排列（Key Permutation）</strong><br />
    57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18,<br />
    10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36,<br />
    63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, ?30, 22,<br />
    14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4,<br />
      <br />
      <strong>縮減排列（Compression Permutation）</strong><br />
    14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10,<br />
    23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2,<br />
    41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48,<br />
    44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32,<br />
      <br />
      <strong>擴增排列（Expansion Permutation</strong>）<br />
    32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9,<br />
    8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,<br />
    16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,<br />
    24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1,<br />
      <br />
      <strong>P-BOX </strong><strong>排列（P-BOX Permutation）</strong> <br />
    16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10,<br />
    2, 8, 24, 14, 32, 28, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25,<br />
      <br />
      <strong>終結排列（Final Permutation）</strong><br />
    40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31,<br />
    38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29,<br />
    36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27,<br />
    34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25,<br />
  &nbsp;&nbsp;&nbsp;&nbsp;相 較於 S-BOX ，排列函數的計算方法就簡單的多了，排列函數中元素的個數，就是它的輸出位元數目，而每個元  素的數值代表輸入位元串列序號。以 P-BOX 排列為例，它的第一個元素為  16 ，表示輸出的第一個位元是輸入的第 16 個位元；第二個元素為 7 ，表示輸出的第 2 個位元是輸入的第 7 個位元，以此類推，所有的排列函數之求值法皆 相同。<br />
    <strong>金鑰位元左旋位數</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;在稍後將會提到的 DES 演算法中，有 16 個回合的動作，而在每一個回合所用的金鑰都必須要經過一次位元左旋，  每一回合左旋的位元數列出如下：<br />
    回合數 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16<br />
    左旋位元數 1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1<br />
      <br />
      <strong>DES </strong><strong>加密流程</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;前面幾小節定義了 DES 演算法所必須用到的一些元件後，接下來就可以正式介紹 DES 加密的演算法了。在加密之 前，我們必須先選擇一個 56 位元的隨機變數，加入八個同位檢查位元後形成 64 位元 的DES Key，並利用這個金鑰產 生 16 個子金鑰，方法如下： <br />
    <img src="des_intro_clip_image001.gif" alt="des1" width="524" height="477" /></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;其中輸入金鑰的長度為 64 位元 ，去掉同位位元後，均分成左右兩部份，使得KLi、KRi的長度皆為 28 位元。縮減 排列的輸出為 48 位元 ，因此 16 個子金鑰的長度皆為 48 位元。另外，在求不同子金鑰時，左旋的位元數也不相同， 必須依照4-2.3節所述的規定才可以。求出所有子金鑰後，就可以正式進行加密的工作了。<br />
    DES 演算法的加密過程可以用下圖解釋： </p>
  <p><img src="des_intro_clip_image002.gif" alt="des2" width="552" height="695" /></p>
  <p>&nbsp;</p>
  <p>其中 f 函數的定義如下： <br />
      <img src="des_intro_clip_image003.gif" alt="des3" width="457" height="355" /></p>
  <p>	從上面演算法可以知道，DES 系統每次加密的單位是  64 位元 ，因此在執行 DES 加密的時候，我們必須把明文分<br />
    成每 64 位元 一個區段，類似這樣的加密方法我們稱他為區段式加密（Block Cipher)。<br />
    在DES系統中，解密的演算法和加密完全相同，但是在解密時輸入的金鑰的位元順序恰與加密時的金鑰相反。 </p>
  <p>參考資料：<a href="http://www.sunzone.com.tw/" class="style14">SUNZone </a></p>
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
