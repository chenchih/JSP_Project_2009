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
  <p align="center" class="style18">RSA演算法</p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;<strong>RSA加密演算法</strong>是一種<a href="http://zh.wikipedia.org/w/index.php?title=%E9%9D%9E%E5%AF%B9%E7%A7%B0%E5%8A%A0%E5%AF%86%E6%BC%94%E7%AE%97%E6%B3%95&amp;variant=zh-tw" title="非??加密演算法">非對稱加密演算法</a>。在<a href="http://zh.wikipedia.org/w/index.php?title=%E5%85%AC%E9%92%A5%E5%8A%A0%E5%AF%86%E6%A0%87%E5%87%86&amp;action=edit&amp;redlink=1" title="公?加密?准 (尚未撰寫)">公鑰加密標準</a>和<a href="http://zh.wikipedia.org/w/index.php?title=%E7%94%B5%E5%AD%90%E5%95%86%E4%B8%9A&amp;variant=zh-tw" title="?子商?">電子商業</a>中RSA被廣泛使用。RSA是<a href="http://zh.wikipedia.org/w/index.php?title=1977%E5%B9%B4&amp;variant=zh-tw" title="1977年">1977年</a>由<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BD%97%E7%BA%B3%E5%BE%B7%C2%B7%E6%9D%8E%E7%BB%B4%E6%96%AF%E7%89%B9&amp;action=edit&amp;redlink=1" title="??德·李?斯特 (尚未撰寫)">羅納德·李維斯特</a>（Ron  Rivest）、<a href="http://zh.wikipedia.org/w/index.php?title=%E9%98%BF%E8%BF%AA%C2%B7%E8%90%A8%E8%8E%AB%E5%B0%94&amp;action=edit&amp;redlink=1" title="阿迪·?莫? (尚未撰寫)">阿迪·薩莫爾</a>（Adi  Shamir）和<a href="http://zh.wikipedia.org/w/index.php?title=%E4%BC%A6%E7%BA%B3%E5%BE%B7%C2%B7%E9%98%BF%E5%BE%B7%E6%9B%BC&amp;action=edit&amp;redlink=1" title="??德·阿德曼 (尚未撰寫)">倫納德·阿德曼</a>（Leonard  Adleman）一起提出的。當時他們三人都在<a href="http://zh.wikipedia.org/w/index.php?title=%E9%BA%BB%E7%9C%81%E7%90%86%E5%B7%A5%E5%AD%A6%E9%99%A2&amp;variant=zh-tw" title="麻省理工?院">麻省理工學院</a>工作。RSA就是他們三人姓氏開頭字母拼在一起組成的。<br />
  <a href="http://zh.wikipedia.org/w/index.php?title=1973%E5%B9%B4&amp;variant=zh-tw" title="1973年">1973年</a>，在<a href="http://zh.wikipedia.org/w/index.php?title=%E8%8B%B1%E5%9B%BD%E6%94%BF%E5%BA%9C%E9%80%9A%E8%AE%AF%E6%80%BB%E9%83%A8&amp;action=edit&amp;redlink=1" title="英?政府通??部 (尚未撰寫)">英國政府通訊總部</a>工作的數學家<a href="http://zh.wikipedia.org/w/index.php?title=%E5%85%8B%E5%88%A9%E7%A6%8F%E5%BE%B7%C2%B7%E6%9F%AF%E5%85%8B%E6%96%AF&amp;action=edit&amp;redlink=1" title="克利福德·柯克斯 (尚未撰寫)">克利福德·柯克斯</a>（Clifford  Cocks）在一個內部文件中提出了一個相應的演算法，但他的發現被列入機密，一直到1997年才被發表。<br />
RSA演算法的可靠性基於分解極大的整數是很困難的。假如有人找到一種很快的分解因子的演算法的話，那麼用RSA加密的信息的可靠性就肯定會極度下 降。但找到這樣的演算法的可能性是非常小的。今天只有短的RSA鑰匙才可能被強力方式解破。到2008年為止，世界上還沒有任何可靠的攻擊RSA演算法的 方式。只要其鑰匙的長度足夠長，用RSA加密的信息實際上是不能被解破的。</p>
  <h3>一、公鑰和私鑰的產生</h3>
  <p>假設Alice想要通過一個不可靠的媒體接收Bob的一條私人訊息。她可以用以下的方式來產生一個<strong>公鑰</strong>和一個<strong>密鑰</strong>： </p>
  <ol start="1" type="1">
    <li>隨意選擇兩個大的<a href="http://zh.wikipedia.org/w/index.php?title=%E8%B4%A8%E6%95%B0&amp;variant=zh-tw" title="??">質數</a><em>p</em>和<em>q</em>，<em>p</em>不等於<em>q</em>，計算<em>N</em>=<em>pq</em>。 </li>
    <li>根據<a href="http://zh.wikipedia.org/w/index.php?title=%E6%AC%A7%E6%8B%89%E5%87%BD%E6%95%B0&amp;variant=zh-tw" title="?拉函?">歐拉函數</a>,不大於<em>N</em>且與<em>N</em>互質的整數個數為(<em>p</em>-1)(<em>q</em>-1)</li>
    <li>選擇一個整數<em>e</em>與(<em>p</em>-1)(<em>q</em>-1)互質,並且e小於(<em>p</em>-1)(<em>q</em>-1)</li>
    <li>用以下這個公式計算<em>d</em>：<em>d× e</em> ≡ 1 (mod (<em>p</em>-1)(<em>q</em>-1))</li>
    <li>將<em>p</em>和<em>q</em>的記錄銷毀。 </li>
  </ol>
  <p><em>e</em>是公鑰，<em>d</em>是私鑰。<em>d</em>是秘密的，而<em>N</em>是公眾都知道的。Alice將她的公鑰傳給Bob，而將她的私鑰藏起來。 </p>
  <h3>二、加密消息</h3>
  <p>假設Bob想給Alice送一個消息<em>m</em>，他知道Alice產生的<em>N</em>和<em>e</em>。他使用起先與Alice約好的格式將<em>m</em>轉換為一個小於<em>N</em>的整數<em>n</em>，比如他可以將每一個字轉換為這個字的<a href="http://zh.wikipedia.org/w/index.php?title=Unicode&amp;variant=zh-tw" title="Unicode">Unicode</a>碼，然後將這些數字連在一起組成一個數字。假如他的信息非常長的話，他可以將這個信息分為幾段，然後將每一段轉換為<em>n</em>。用下面這個公式他可以將<em>n</em>加密為<em>c</em>： <br />
      <img border="0" width="140" height="23" src="aes_intro_clip_image001.gif" alt=" n^e \equiv c\ (\mathrm{mod}\ N) " /><br />
    計算<em>c</em>並不複雜。Bob算出<em>c</em>後就可以將它傳遞給Alice。 </p>
  <h3>三、解密消息</h3>
  <p>Alice得到Bob的消息<em>c</em>後就可以利用她的密鑰<em>d</em>來解碼。她可以用以下這個公式來將<em>c</em>轉換為<em>n</em>： <br />
      <img border="0" width="142" height="25" src="aes_intro_clip_image002_0000.gif" alt=" c^d \equiv n\ (\mathrm{mod}\ N) " /><br />
    得到<em>n</em>後，她可以將原來的信息<em>m</em>重新複原。 <br />
    解碼的原理是 <br />
  <img border="0" width="160" height="25" src="aes_intro_clip_image003.gif" alt=" c^d \equiv n^{e \cdot d}\ (\mathrm{mod}\ N)" /><br />
    以及<em>ed</em> ≡ 1 (mod <em>p</em>-1)和<em>ed</em> ≡ 1 (mod <em>q</em>-1)。<a href="http://zh.wikipedia.org/w/index.php?title=%E8%B4%B9%E9%A9%AC%E5%B0%8F%E5%AE%9A%E7%90%86&amp;variant=zh-tw" title="??小定理">費馬小定理</a>證明 <br />
  <img border="0" width="147" height="25" src="aes_intro_clip_image004_0000.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ p) " />&nbsp;&nbsp;&nbsp;  和 &nbsp;&nbsp;&nbsp; <img border="0" width="147" height="25" src="aes_intro_clip_image005.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ q) " /><br />
    這說明（因為<em>p</em>和<em>q</em>是<em>不同</em>的質數） <br />
  <img border="0" width="157" height="25" src="aes_intro_clip_image006_0000.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ pq) " /></p>
  <p>&nbsp;</p>
  <p>參考資料：<a href="http://zh.wikipedia.org/w/index.php?title=RSA加密演算法&amp;variant=zh-tw">維基百科</a></p>
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
