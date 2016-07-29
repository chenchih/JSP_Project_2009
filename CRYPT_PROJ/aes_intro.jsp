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
.style18 {
	font-size: 36px;
	font-weight: bold;
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
  <p align="center" class="style18">AES演算法</p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://zh.wikipedia.org/w/index.php?title=%E5%AF%86%E7%A0%81%E5%AD%A6&amp;variant=zh-tw" title="密??">密碼學</a>中的<strong>高級加密標準</strong>（Advanced Encryption Standard，AES），又稱Rijndael加密法，是美國聯邦政府採用的一種<a href="http://en.wikipedia.org/wiki/Block_cipher" title="en:Block cipher">區塊加密</a>標準。這個標準用來替代原先的<a href="http://zh.wikipedia.org/w/index.php?title=DES&amp;variant=zh-tw" title="DES">DES</a>，已經被多方分析且廣為全世界所使用。經過五年的甄選流程，高級加密標準由<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BE%8E%E5%9C%8B%E5%9C%8B%E5%AE%B6%E6%A8%99%E6%BA%96%E8%88%87%E6%8A%80%E8%A1%93%E7%A0%94%E7%A9%B6%E9%99%A2&amp;action=edit&amp;redlink=1" title="美國國家標準與技術研究院 (尚未撰寫)">美國國家標準與技術研究院</a> （NIST）於2001年11月26日發佈於FIPS PUB 197，並在2002年5月26日成為有效的標準。2006年，高級加密標準已然成為對稱密鑰加密中最流行的<a href="http://zh.wikipedia.org/w/index.php?title=%E6%BC%94%E7%AE%97%E6%B3%95&amp;variant=zh-tw" title="演算法">演算法</a>之一。<br />
    該演算法為<a href="http://zh.wikipedia.org/w/index.php?title=%E6%AF%94%E5%88%A9%E6%97%B6&amp;variant=zh-tw" title="比利?">比利時</a>密碼學家Joan Daemen和Vincent Rijmen所設計，結合兩位作者的名字，以Rijdael之命名之，投稿高級加密標準的甄選流程。（Rijdael的發音近於 &quot;Rhine doll&quot;。）。<br />
  <strong>一、沿革 </strong><br />
    Rijndael是由Daemen和Rijmen早期所設計的<a href="http://zh.wikipedia.org/w/index.php?title=Square_%28cipher%29&amp;action=edit&amp;redlink=1" title="Square (cipher) (尚未撰寫)">Square</a>改良而來；而Square則是由<a href="http://zh.wikipedia.org/w/index.php?title=SHARK&amp;variant=zh-tw" title="SHARK">SHARK</a>發展而來。<br />
    不同於它的前任標準DES, Rijndael使用的是<a href="http://en.wikipedia.org/wiki/substitution-permutation_network" title="en:substitution-permutation network">置換-組合架構</a>，而非<a href="http://en.wikipedia.org/wiki/Feistel_network" title="en:Feistel network">Feistel架構</a>。AES在<a href="http://zh.wikipedia.org/w/index.php?title=%E8%BB%9F%E9%AB%94&amp;variant=zh-tw" title="軟體">軟體</a>及<a href="http://zh.wikipedia.org/w/index.php?title=%E7%A1%AC%E4%BB%B6&amp;variant=zh-tw" title="硬件">硬體</a>上都能快速地加解密，相對來說較易於實作, 且只需要很少的<a href="http://zh.wikipedia.org/w/index.php?title=%E8%A8%98%E6%86%B6%E9%AB%94&amp;variant=zh-tw" title="記憶體">記憶體</a>。 作為一個新的加密標準, 目前正被部署應用到更廣大的範圍。<br />
  <strong>二、密碼說明 </strong><br />
    嚴格地說，AES和Rijndael加密法並不完全一樣（雖然在實際應用中二者可以互換），因為Rijndael加密法可以支援更大範圍的<a href="http://en.wikipedia.org/wiki/block_size_%28cryptography%29" title="en:block size (cryptography)">區塊</a>和<a href="http://en.wikipedia.org/wiki/key_size" title="en:key size">密鑰長度</a>：AES的區塊長度固定為128 <a href="http://zh.wikipedia.org/w/index.php?title=%E4%BD%8D%E5%85%83&amp;variant=zh-tw" title="位元">位元</a>，密鑰長度則可以是128，192或256位元；而Rijndael使用的密鑰和區塊長度可以是32位元的整數倍，以128位元為下限，256位元為上限。加密過程中使用的密鑰是由<a href="http://en.wikipedia.org/wiki/Rijndael_key_schedule" title="en:Rijndael key schedule">Rijndael密鑰生成方案</a>產生。 <br />
    大多數AES計算是在一個特別的<a href="http://zh.wikipedia.org/w/index.php?title=%E6%9C%89%E9%99%90%E5%9F%9F&amp;variant=zh-tw" title="有限域">有限域</a>完成的。 <br />
    AES加密過程是在一個4×4的<a href="http://zh.wikipedia.org/w/index.php?title=%E5%AD%97%E8%8A%82&amp;variant=zh-tw" title="字?">位元組</a>矩陣上運作，這個矩陣又稱為「體（state）」，其初值就是一個明文區塊（矩陣中一個元素大小就是明文區塊中的一個Byte）。（Rijndael加密法因支援更大的區塊，其矩陣行數可視情況增加）加密時，各輪AES加密迴圈（除最後一輪外）均包含4個步驟： </p>
  <ol start="1" type="1">
    <li>AddRoundKey — 矩陣中的每一個位元組都與該次<a href="http://zh.wikipedia.org/w/index.php?title=%E8%BF%B4%E5%9C%88%E7%9A%84%E5%AD%90%E5%AF%86%E9%92%A5&amp;action=edit&amp;redlink=1" title="迴圈的子密? (尚未撰寫)">迴圈的子密鑰</a>（round key）做XOR運算；每個子密鑰由密鑰生成方案產生。 </li>
    <li>SubBytes — 透過一個非線性的替換函數，用<a href="http://zh.wikipedia.org/w/index.php?title=%E6%9F%A5%E6%89%BE%E8%A1%A8&amp;variant=zh-tw" title="查找表">查找表</a>的方式把每個位元組替換成對應的位元組。 </li>
    <li>ShiftRows — 將矩陣中的每個橫列進行循環式移位。 </li>
    <li>MixColumns — 為了充分混合矩陣中各個直行的操作。這個步驟使用線性轉換來混合每行內的四個位元組。 </li>
  </ol>
  <p>最後一個加密迴圈中省略MixColumns步驟，而以另一個AddRoundKey取代。 </p>
  <h3><img src="aes_intro_clip_image002.gif" alt="aes1" width="320" height="249" hspace="12" align="left" />(一)AddRoundKey 步驟</h3>
  <p>AddRoundKey步驟，子密鑰將會與原矩陣合併。在每次的加密迴圈中，都會由主密鑰產生一把子密鑰（透過<a href="http://en.wikipedia.org/wiki/Rijndael_key_schedule" title="en:Rijndael key schedule">Rijndael密鑰生成方案</a>產生），這把子密鑰大小會跟原矩陣一樣，以與原矩陣中每個對應的位元組作<a href="http://zh.wikipedia.org/w/index.php?title=%E5%BC%82%E6%88%96&amp;variant=zh-tw" title="异或">異或</a>（⊕）加法。</p>
  <p>&nbsp;</p>
  <h3>(二)SubBytes 步驟 </h3>
  <p><img src="aes_intro_clip_image004.gif" alt="aes2" width="320" height="166" hspace="12" align="left" />在SubBytes步驟中，矩陣中的各位元組透過一個8位元的<a href="http://en.wikipedia.org/wiki/Rijndael_S-box" title="en:Rijndael S-box">S-box</a>進行轉換。這個步驟提供了<a href="http://en.wikipedia.org/wiki/cipher" title="en:cipher">加密法</a>非線性的變換能力。<a href="http://en.wikipedia.org/wiki/Rijndael_S-box" title="en:Rijndael S-box">S-box</a>與<strong><a href="http://zh.wikipedia.org/w/index.php?title=%E6%9C%89%E9%99%90%E5%9F%9F&amp;variant=zh-tw" title="有限域">GF</a></strong>(<em>28</em>)上的乘法<a href="http://zh.wikipedia.org/w/index.php?title=%E5%8F%8D%E5%85%83%E7%B4%A0&amp;variant=zh-tw" title="反元素">反元素</a>有關，已知具有良好的<a href="http://zh.wikipedia.org/w/index.php?title=%E9%9D%9E%E7%B7%9A%E6%80%A7&amp;variant=zh-tw" title="非線性">非線性</a>特性。為了避免簡單代數性質的攻擊，S-box結合了乘法反元素及一個可逆的<a href="http://zh.wikipedia.org/w/index.php?title=%E4%BB%BF%E5%B0%84%E5%8F%98%E6%8D%A2&amp;variant=zh-tw" title="仿射??">仿射變換</a>矩陣建構而成。  此外在建構S-box時，刻意避開了<a href="http://en.wikipedia.org/wiki/fixed_point" title="en:fixed point">固定點</a>與<a href="http://en.wikipedia.org/wiki/opposite_fixed_point" title="en:opposite fixed point">反固定點</a>，即以S-box替換位元組的結果會相當於錯排的結果。</p>
  <h3><img src="aes_intro_clip_image006.gif" alt="aes3" width="320" height="119" hspace="12" align="left" />(三) ShiftRows 步驟 </h3>
  <h3>ShiftRows是針對矩陣的每一個橫列操作的步驟。 在此步驟中，每一列都向左循環位移某個<a href="http://en.wikipedia.org/wiki/Offset_%28computer%29" title="en:Offset (computer)">偏移量</a>。在AES中（區塊大小128位元），第一列維持不變，第二列裡的每個位元組都向左循環移動一格。同理，第三列及第四列向左循環位移的偏移量就分別是2和3。128位元和192位元的區塊在此步驟的循環位移模式的模式相同。經過ShiftRows之後，矩陣中每一直行，都是由輸入矩陣中的每個不同列中的元素組成。Rijndael演算法的版本中，偏移量和AES有少許不同；對於長度256位元的區塊，第一列仍然維持不變，第二列、第三列、第四列的偏移量分別是1位元組、2位元組、4位元組。除此之外，ShiftRows操作步驟在Rijndael和AES中完全相同。 </h3>
  <p>&nbsp;</p>
  <h3>(四) MixColumns 步驟 </h3>
  <h3><img src="aes_intro_clip_image008.gif" alt="aes4" width="320" height="170" hspace="12" align="left" />在MixColumns步驟，每一直行的四個位元組透過<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BA%BF%E6%80%A7%E5%8F%98%E6%8D%A2&amp;variant=zh-tw" title="?性??">線性變換</a>互相結合。每一直行的四個元素分別當作1,<em>x</em>,<em>x</em>2,<em>x</em>3的係數，合併即為GF(<em>28</em>)中的一個多項式，接著將此多項式和一個固定的多項式<em>c</em>(<em>x</em>) = 3<em>x</em>3 + <em>x</em>2  + <em>x</em> + 2在modulo <em>x</em>4  + 1下相乘。此步驟亦可視為 <a href="http://en.wikipedia.org/wiki/Finite_field_arithmetic" title="en:Finite field arithmetic">Rijndael有限域</a>之下的矩陣乘法。MixColumns函數接受4個位元組的輸入，輸出4個位元組，每一個輸入的位元組都會對輸出的四個位元組造成影響。因此ShiftRows和MixColumns兩步驟為這個密碼系統提供了<a href="http://en.wikipedia.org/wiki/diffusion%28cryptograohy%29" title="en:diffusion(cryptograohy)">擴散性</a>。 </h3>
  <p>參考資料：<a href="http://zh.wikipedia.org/w/index.php?title=AES&amp;variant=zh-tw">維基百科</a></p>
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
