<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--

.style14 {color: #0000FF}
.style17 {font-family: "�ө���";
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
//�^�� �s��Page.htm ���O���s�����
function sdes()
{
	open("lesson/sdes/1.jsp");
	//�Npage.htm�}�Ҧb�ثe���s������
}
function aes1()
{
	open("lesson/aes/aes1.jsp");
	//�Npage.htm�}�Ҧb�ثe���s������
}
function aes2()
{
	open("lesson/aes/AESDemo.exe");
	//�Npage.htm�}�Ҧb�ثe���s������
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
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>�n�J </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  �n�X </a> </font>");
	}

  
   
%>
          ||</span> <span class="style17"><a href="bulletin_news.jsp" class="style14">��������</a> || <a href="lesson.jsp" class="style14">�ҵ{</a> || <a href="forum.jsp" class="style14">�Q�װ�</a> ||<a href="message.jsp" class="style14">�d��</a> || <a href="linkpage.jsp" class="style14">�s��</a></span> l  </div></td>
      </tr>
    </table>
	<!-- end #menu -->
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="">
  <p align="center" class="style18">RSA�t��k</p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;<strong>RSA�[�K�t��k</strong>�O�@��<a href="http://zh.wikipedia.org/w/index.php?title=%E9%9D%9E%E5%AF%B9%E7%A7%B0%E5%8A%A0%E5%AF%86%E6%BC%94%E7%AE%97%E6%B3%95&amp;variant=zh-tw" title="�D??�[�K�t��k">�D��٥[�K�t��k</a>�C�b<a href="http://zh.wikipedia.org/w/index.php?title=%E5%85%AC%E9%92%A5%E5%8A%A0%E5%AF%86%E6%A0%87%E5%87%86&amp;action=edit&amp;redlink=1" title="��?�[�K?�� (�|�����g)">���_�[�K�з�</a>�M<a href="http://zh.wikipedia.org/w/index.php?title=%E7%94%B5%E5%AD%90%E5%95%86%E4%B8%9A&amp;variant=zh-tw" title="?�l��?">�q�l�ӷ~</a>��RSA�Q�s�x�ϥΡCRSA�O<a href="http://zh.wikipedia.org/w/index.php?title=1977%E5%B9%B4&amp;variant=zh-tw" title="1977�~">1977�~</a>��<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BD%97%E7%BA%B3%E5%BE%B7%C2%B7%E6%9D%8E%E7%BB%B4%E6%96%AF%E7%89%B9&amp;action=edit&amp;redlink=1" title="??�w�P��?���S (�|�����g)">ù�Ǽw�P�������S</a>�]Ron  Rivest�^�B<a href="http://zh.wikipedia.org/w/index.php?title=%E9%98%BF%E8%BF%AA%C2%B7%E8%90%A8%E8%8E%AB%E5%B0%94&amp;action=edit&amp;redlink=1" title="���}�P?��? (�|�����g)">���}�P�Ĳ���</a>�]Adi  Shamir�^�M<a href="http://zh.wikipedia.org/w/index.php?title=%E4%BC%A6%E7%BA%B3%E5%BE%B7%C2%B7%E9%98%BF%E5%BE%B7%E6%9B%BC&amp;action=edit&amp;redlink=1" title="??�w�P���w�� (�|�����g)">�ۯǼw�P���w��</a>�]Leonard  Adleman�^�@�_���X���C��ɥL�̤T�H���b<a href="http://zh.wikipedia.org/w/index.php?title=%E9%BA%BB%E7%9C%81%E7%90%86%E5%B7%A5%E5%AD%A6%E9%99%A2&amp;variant=zh-tw" title="�¬ٲz�u?�|">�¬ٲz�u�ǰ|</a>�u�@�CRSA�N�O�L�̤T�H�m��}�Y�r�����b�@�_�զ����C<br />
  <a href="http://zh.wikipedia.org/w/index.php?title=1973%E5%B9%B4&amp;variant=zh-tw" title="1973�~">1973�~</a>�A�b<a href="http://zh.wikipedia.org/w/index.php?title=%E8%8B%B1%E5%9B%BD%E6%94%BF%E5%BA%9C%E9%80%9A%E8%AE%AF%E6%80%BB%E9%83%A8&amp;action=edit&amp;redlink=1" title="�^?�F���q??�� (�|�����g)">�^��F���q�T�`��</a>�u�@���ƾǮa<a href="http://zh.wikipedia.org/w/index.php?title=%E5%85%8B%E5%88%A9%E7%A6%8F%E5%BE%B7%C2%B7%E6%9F%AF%E5%85%8B%E6%96%AF&amp;action=edit&amp;redlink=1" title="�J�Q�ּw�P�_�J�� (�|�����g)">�J�Q�ּw�P�_�J��</a>�]Clifford  Cocks�^�b�@�Ӥ�����󤤴��X�F�@�Ӭ������t��k�A���L���o�{�Q�C�J���K�A�@����1997�~�~�Q�o��C<br />
RSA�t��k���i�a�ʰ����ѷ��j����ƬO�ܧx�����C���p���H���@�ثܧ֪����Ѧ]�l���t��k���ܡA�����RSA�[�K���H�����i�a�ʴN�֩w�|���פU ���C�����o�˪��t��k���i��ʬO�D�`�p���C���ѥu���u��RSA�_�ͤ~�i��Q�j�O�覡�ѯ}�C��2008�~����A�@�ɤW�٨S������i�a������RSA�t��k�� �覡�C�u�n���_�ͪ����ר������A��RSA�[�K���H����ڤW�O����Q�ѯ}���C</p>
  <h3>�@�B���_�M�p�_������</h3>
  <p>���]Alice�Q�n�q�L�@�Ӥ��i�a���C�鱵��Bob���@���p�H�T���C�o�i�H�ΥH�U���覡�Ӳ��ͤ@��<strong>���_</strong>�M�@��<strong>�K�_</strong>�G </p>
  <ol start="1" type="1">
    <li>�H�N��ܨ�Ӥj��<a href="http://zh.wikipedia.org/w/index.php?title=%E8%B4%A8%E6%95%B0&amp;variant=zh-tw" title="??">���</a><em>p</em>�M<em>q</em>�A<em>p</em>������<em>q</em>�A�p��<em>N</em>=<em>pq</em>�C </li>
    <li>�ھ�<a href="http://zh.wikipedia.org/w/index.php?title=%E6%AC%A7%E6%8B%89%E5%87%BD%E6%95%B0&amp;variant=zh-tw" title="?�Ԩ�?">�کԨ��</a>,���j��<em>N</em>�B�P<em>N</em>���誺��ƭӼƬ�(<em>p</em>-1)(<em>q</em>-1)</li>
    <li>��ܤ@�Ӿ��<em>e</em>�P(<em>p</em>-1)(<em>q</em>-1)����,�åBe�p��(<em>p</em>-1)(<em>q</em>-1)</li>
    <li>�ΥH�U�o�Ӥ����p��<em>d</em>�G<em>d�� e</em> �� 1 (mod (<em>p</em>-1)(<em>q</em>-1))</li>
    <li>�N<em>p</em>�M<em>q</em>���O���P���C </li>
  </ol>
  <p><em>e</em>�O���_�A<em>d</em>�O�p�_�C<em>d</em>�O���K���A��<em>N</em>�O���������D���CAlice�N�o�����_�ǵ�Bob�A�ӱN�o���p�_�ð_�ӡC </p>
  <h3>�G�B�[�K����</h3>
  <p>���]Bob�Q��Alice�e�@�Ӯ���<em>m</em>�A�L���DAlice���ͪ�<em>N</em>�M<em>e</em>�C�L�ϥΰ_���PAlice���n���榡�N<em>m</em>�ഫ���@�Ӥp��<em>N</em>�����<em>n</em>�A��p�L�i�H�N�C�@�Ӧr�ഫ���o�Ӧr��<a href="http://zh.wikipedia.org/w/index.php?title=Unicode&amp;variant=zh-tw" title="Unicode">Unicode</a>�X�A�M��N�o�ǼƦr�s�b�@�_�զ��@�ӼƦr�C���p�L���H���D�`�����ܡA�L�i�H�N�o�ӫH�������X�q�A�M��N�C�@�q�ഫ��<em>n</em>�C�ΤU���o�Ӥ����L�i�H�N<em>n</em>�[�K��<em>c</em>�G <br />
      <img border="0" width="140" height="23" src="aes_intro_clip_image001.gif" alt=" n^e \equiv c\ (\mathrm{mod}\ N) " /><br />
    �p��<em>c</em>�ä������CBob��X<em>c</em>��N�i�H�N���ǻ���Alice�C </p>
  <h3>�T�B�ѱK����</h3>
  <p>Alice�o��Bob������<em>c</em>��N�i�H�Q�Φo���K�_<em>d</em>�ӸѽX�C�o�i�H�ΥH�U�o�Ӥ����ӱN<em>c</em>�ഫ��<em>n</em>�G <br />
      <img border="0" width="142" height="25" src="aes_intro_clip_image002_0000.gif" alt=" c^d \equiv n\ (\mathrm{mod}\ N) " /><br />
    �o��<em>n</em>��A�o�i�H�N��Ӫ��H��<em>m</em>���s�ƭ�C <br />
    �ѽX����z�O <br />
  <img border="0" width="160" height="25" src="aes_intro_clip_image003.gif" alt=" c^d \equiv n^{e \cdot d}\ (\mathrm{mod}\ N)" /><br />
    �H��<em>ed</em> �� 1 (mod <em>p</em>-1)�M<em>ed</em> �� 1 (mod <em>q</em>-1)�C<a href="http://zh.wikipedia.org/w/index.php?title=%E8%B4%B9%E9%A9%AC%E5%B0%8F%E5%AE%9A%E7%90%86&amp;variant=zh-tw" title="??�p�w�z">�O���p�w�z</a>�ҩ� <br />
  <img border="0" width="147" height="25" src="aes_intro_clip_image004_0000.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ p) " />&nbsp;&nbsp;&nbsp;  �M &nbsp;&nbsp;&nbsp; <img border="0" width="147" height="25" src="aes_intro_clip_image005.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ q) " /><br />
    �o�����]�]��<em>p</em>�M<em>q</em>�O<em>���P</em>����ơ^ <br />
  <img border="0" width="157" height="25" src="aes_intro_clip_image006_0000.gif" alt=" n^{e \cdot d} \equiv n\ (\mathrm{mod}\ pq) " /></p>
  <p>&nbsp;</p>
  <p>�ѦҸ�ơG<a href="http://zh.wikipedia.org/w/index.php?title=RSA�[�K�t��k&amp;variant=zh-tw">����ʬ�</a></p>
</form>
<!-- end #footer -->
<hr />
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style14">�޲z��</a>||<span class="style14"><a href="term.jsp" class="style14">�W���j��</a><a href="term.jsp"></a></span> || <a href="contact.jsp" class="style14">�N�� </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</body>
</html>
