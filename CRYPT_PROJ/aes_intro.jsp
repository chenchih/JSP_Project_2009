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
  <p align="center" class="style18">AES�t��k</p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="http://zh.wikipedia.org/w/index.php?title=%E5%AF%86%E7%A0%81%E5%AD%A6&amp;variant=zh-tw" title="�K??">�K�X��</a>����<strong>���ť[�K�з�</strong>�]Advanced Encryption Standard�AAES�^�A�S��Rijndael�[�K�k�A�O�����p���F���ĥΪ��@��<a href="http://en.wikipedia.org/wiki/Block_cipher" title="en:Block cipher">�϶��[�K</a>�зǡC�o�ӼзǥΨӴ��N�����<a href="http://zh.wikipedia.org/w/index.php?title=DES&amp;variant=zh-tw" title="DES">DES</a>�A�w�g�Q�h����R�B�s�����@�ɩҨϥΡC�g�L���~���¿�y�{�A���ť[�K�зǥ�<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BE%8E%E5%9C%8B%E5%9C%8B%E5%AE%B6%E6%A8%99%E6%BA%96%E8%88%87%E6%8A%80%E8%A1%93%E7%A0%94%E7%A9%B6%E9%99%A2&amp;action=edit&amp;redlink=1" title="�����a�зǻP�޳N��s�| (�|�����g)">�����a�зǻP�޳N��s�|</a> �]NIST�^��2001�~11��26��o�G��FIPS PUB 197�A�æb2002�~5��26�馨�����Ī��зǡC2006�~�A���ť[�K�зǤw�M������ٱK�_�[�K���̬y�檺<a href="http://zh.wikipedia.org/w/index.php?title=%E6%BC%94%E7%AE%97%E6%B3%95&amp;variant=zh-tw" title="�t��k">�t��k</a>���@�C<br />
    �Ӻt��k��<a href="http://zh.wikipedia.org/w/index.php?title=%E6%AF%94%E5%88%A9%E6%97%B6&amp;variant=zh-tw" title="��Q?">��Q��</a>�K�X�ǮaJoan Daemen�MVincent Rijmen�ҳ]�p�A���X���@�̪��W�r�A�HRijdael���R�W���A��Z���ť[�K�зǪ��¿�y�{�C�]Rijdael���o����� &quot;Rhine doll&quot;�C�^�C<br />
  <strong>�@�B�u�� </strong><br />
    Rijndael�O��Daemen�MRijmen�����ҳ]�p��<a href="http://zh.wikipedia.org/w/index.php?title=Square_%28cipher%29&amp;action=edit&amp;redlink=1" title="Square (cipher) (�|�����g)">Square</a>��}�ӨӡF��Square�h�O��<a href="http://zh.wikipedia.org/w/index.php?title=SHARK&amp;variant=zh-tw" title="SHARK">SHARK</a>�o�i�ӨӡC<br />
    ���P�󥦪��e���з�DES, Rijndael�ϥΪ��O<a href="http://en.wikipedia.org/wiki/substitution-permutation_network" title="en:substitution-permutation network">�m��-�զX�[�c</a>�A�ӫD<a href="http://en.wikipedia.org/wiki/Feistel_network" title="en:Feistel network">Feistel�[�c</a>�CAES�b<a href="http://zh.wikipedia.org/w/index.php?title=%E8%BB%9F%E9%AB%94&amp;variant=zh-tw" title="�n��">�n��</a>��<a href="http://zh.wikipedia.org/w/index.php?title=%E7%A1%AC%E4%BB%B6&amp;variant=zh-tw" title="�w��">�w��</a>�W����ֳt�a�[�ѱK�A�۹�ӻ��������@, �B�u�ݭn�ܤ֪�<a href="http://zh.wikipedia.org/w/index.php?title=%E8%A8%98%E6%86%B6%E9%AB%94&amp;variant=zh-tw" title="�O����">�O����</a>�C �@���@�ӷs���[�K�з�, �ثe���Q���p���Ψ��s�j���d��C<br />
  <strong>�G�B�K�X���� </strong><br />
    �Y��a���AAES�MRijndael�[�K�k�ä������@�ˡ]���M�b������Τ��G�̥i�H�����^�A�]��Rijndael�[�K�k�i�H�䴩��j�d��<a href="http://en.wikipedia.org/wiki/block_size_%28cryptography%29" title="en:block size (cryptography)">�϶�</a>�M<a href="http://en.wikipedia.org/wiki/key_size" title="en:key size">�K�_����</a>�GAES���϶����שT�w��128 <a href="http://zh.wikipedia.org/w/index.php?title=%E4%BD%8D%E5%85%83&amp;variant=zh-tw" title="�줸">�줸</a>�A�K�_���׫h�i�H�O128�A192��256�줸�F��Rijndael�ϥΪ��K�_�M�϶����ץi�H�O32�줸����ƭ��A�H128�줸���U���A256�줸���W���C�[�K�L�{���ϥΪ��K�_�O��<a href="http://en.wikipedia.org/wiki/Rijndael_key_schedule" title="en:Rijndael key schedule">Rijndael�K�_�ͦ����</a>���͡C <br />
    �j�h��AES�p��O�b�@�ӯS�O��<a href="http://zh.wikipedia.org/w/index.php?title=%E6%9C%89%E9%99%90%E5%9F%9F&amp;variant=zh-tw" title="������">������</a>�������C <br />
    AES�[�K�L�{�O�b�@��4��4��<a href="http://zh.wikipedia.org/w/index.php?title=%E5%AD%97%E8%8A%82&amp;variant=zh-tw" title="�r?">�줸��</a>�x�}�W�B�@�A�o�ӯx�}�S�٬��u��]state�^�v�A���ȴN�O�@�ө���϶��]�x�}���@�Ӥ����j�p�N�O����϶������@��Byte�^�C�]Rijndael�[�K�k�]�䴩��j���϶��A��x�}��ƥi�����p�W�[�^�[�K�ɡA�U��AES�[�K�j��]���̫�@���~�^���]�t4�ӨB�J�G </p>
  <ol start="1" type="1">
    <li>AddRoundKey �X �x�}�����C�@�Ӧ줸�ճ��P�Ӧ�<a href="http://zh.wikipedia.org/w/index.php?title=%E8%BF%B4%E5%9C%88%E7%9A%84%E5%AD%90%E5%AF%86%E9%92%A5&amp;action=edit&amp;redlink=1" title="�j�骺�l�K? (�|�����g)">�j�骺�l�K�_</a>�]round key�^��XOR�B��F�C�Ӥl�K�_�ѱK�_�ͦ���ײ��͡C </li>
    <li>SubBytes �X �z�L�@�ӫD�u�ʪ�������ơA��<a href="http://zh.wikipedia.org/w/index.php?title=%E6%9F%A5%E6%89%BE%E8%A1%A8&amp;variant=zh-tw" title="�d���">�d���</a>���覡��C�Ӧ줸�մ������������줸�աC </li>
    <li>ShiftRows �X �N�x�}�����C�Ӿ�C�i��`��������C </li>
    <li>MixColumns �X ���F�R���V�X�x�}���U�Ӫ��檺�ާ@�C�o�ӨB�J�ϥνu���ഫ�ӲV�X�C�椺���|�Ӧ줸�աC </li>
  </ol>
  <p>�̫�@�ӥ[�K�j�餤�ٲ�MixColumns�B�J�A�ӥH�t�@��AddRoundKey���N�C </p>
  <h3><img src="aes_intro_clip_image002.gif" alt="aes1" width="320" height="249" hspace="12" align="left" />(�@)AddRoundKey �B�J</h3>
  <p>AddRoundKey�B�J�A�l�K�_�N�|�P��x�}�X�֡C�b�C�����[�K�j�餤�A���|�ѥD�K�_���ͤ@��l�K�_�]�z�L<a href="http://en.wikipedia.org/wiki/Rijndael_key_schedule" title="en:Rijndael key schedule">Rijndael�K�_�ͦ����</a>���͡^�A�o��l�K�_�j�p�|���x�}�@�ˡA�H�P��x�}���C�ӹ������줸�է@<a href="http://zh.wikipedia.org/w/index.php?title=%E5%BC%82%E6%88%96&amp;variant=zh-tw" title="�ݩ�">����</a>�]��^�[�k�C</p>
  <p>&nbsp;</p>
  <h3>(�G)SubBytes �B�J </h3>
  <p><img src="aes_intro_clip_image004.gif" alt="aes2" width="320" height="166" hspace="12" align="left" />�bSubBytes�B�J���A�x�}�����U�줸�ճz�L�@��8�줸��<a href="http://en.wikipedia.org/wiki/Rijndael_S-box" title="en:Rijndael S-box">S-box</a>�i���ഫ�C�o�ӨB�J���ѤF<a href="http://en.wikipedia.org/wiki/cipher" title="en:cipher">�[�K�k</a>�D�u�ʪ��ܴ���O�C<a href="http://en.wikipedia.org/wiki/Rijndael_S-box" title="en:Rijndael S-box">S-box</a>�P<strong><a href="http://zh.wikipedia.org/w/index.php?title=%E6%9C%89%E9%99%90%E5%9F%9F&amp;variant=zh-tw" title="������">GF</a></strong>(<em>28</em>)�W�����k<a href="http://zh.wikipedia.org/w/index.php?title=%E5%8F%8D%E5%85%83%E7%B4%A0&amp;variant=zh-tw" title="�Ϥ���">�Ϥ���</a>�����A�w���㦳�}�n��<a href="http://zh.wikipedia.org/w/index.php?title=%E9%9D%9E%E7%B7%9A%E6%80%A7&amp;variant=zh-tw" title="�D�u��">�D�u��</a>�S�ʡC���F�קK²��N�Ʃʽ誺�����AS-box���X�F���k�Ϥ����Τ@�ӥi�f��<a href="http://zh.wikipedia.org/w/index.php?title=%E4%BB%BF%E5%B0%84%E5%8F%98%E6%8D%A2&amp;variant=zh-tw" title="��g??">��g�ܴ�</a>�x�}�غc�Ӧ��C  ���~�b�غcS-box�ɡA��N�׶}�F<a href="http://en.wikipedia.org/wiki/fixed_point" title="en:fixed point">�T�w�I</a>�P<a href="http://en.wikipedia.org/wiki/opposite_fixed_point" title="en:opposite fixed point">�ϩT�w�I</a>�A�Y�HS-box�����줸�ժ����G�|�۷����ƪ����G�C</p>
  <h3><img src="aes_intro_clip_image006.gif" alt="aes3" width="320" height="119" hspace="12" align="left" />(�T) ShiftRows �B�J </h3>
  <h3>ShiftRows�O�w��x�}���C�@�Ӿ�C�ާ@���B�J�C �b���B�J���A�C�@�C���V���`���첾�Y��<a href="http://en.wikipedia.org/wiki/Offset_%28computer%29" title="en:Offset (computer)">�����q</a>�C�bAES���]�϶��j�p128�줸�^�A�Ĥ@�C�������ܡA�ĤG�C�̪��C�Ӧ줸�ճ��V���`�����ʤ@��C�P�z�A�ĤT�C�βĥ|�C�V���`���첾�������q�N���O�O2�M3�C128�줸�M192�줸���϶��b���B�J���`���첾�Ҧ����Ҧ��ۦP�C�g�LShiftRows����A�x�}���C�@����A���O�ѿ�J�x�}�����C�Ӥ��P�C���������զ��CRijndael�t��k���������A�����q�MAES���ֳ\���P�F������256�줸���϶��A�Ĥ@�C���M�������ܡA�ĤG�C�B�ĤT�C�B�ĥ|�C�������q���O�O1�줸�աB2�줸�աB4�줸�աC�������~�AShiftRows�ާ@�B�J�bRijndael�MAES�������ۦP�C </h3>
  <p>&nbsp;</p>
  <h3>(�|) MixColumns �B�J </h3>
  <h3><img src="aes_intro_clip_image008.gif" alt="aes4" width="320" height="170" hspace="12" align="left" />�bMixColumns�B�J�A�C�@���檺�|�Ӧ줸�ճz�L<a href="http://zh.wikipedia.org/w/index.php?title=%E7%BA%BF%E6%80%A7%E5%8F%98%E6%8D%A2&amp;variant=zh-tw" title="?��??">�u���ܴ�</a>���۵��X�C�C�@���檺�|�Ӥ������O��@1,<em>x</em>,<em>x</em>2,<em>x</em>3���Y�ơA�X�֧Y��GF(<em>28</em>)�����@�Ӧh�����A���۱N���h�����M�@�өT�w���h����<em>c</em>(<em>x</em>) = 3<em>x</em>3 + <em>x</em>2  + <em>x</em> + 2�bmodulo <em>x</em>4  + 1�U�ۭ��C���B�J��i���� <a href="http://en.wikipedia.org/wiki/Finite_field_arithmetic" title="en:Finite field arithmetic">Rijndael������</a>���U���x�}���k�CMixColumns��Ʊ���4�Ӧ줸�ժ���J�A��X4�Ӧ줸�աA�C�@�ӿ�J���줸�ճ��|���X���|�Ӧ줸�ճy���v�T�C�]��ShiftRows�MMixColumns��B�J���o�ӱK�X�t�δ��ѤF<a href="http://en.wikipedia.org/wiki/diffusion%28cryptograohy%29" title="en:diffusion(cryptograohy)">�X����</a>�C </h3>
  <p>�ѦҸ�ơG<a href="http://zh.wikipedia.org/w/index.php?title=AES&amp;variant=zh-tw">����ʬ�</a></p>
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
