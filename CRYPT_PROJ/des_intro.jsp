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
.style20 {font-size: 36px}


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
  <p align="center"><span class="style20"><strong>DES </strong><strong>�t��k</strong></span></p>
  <hr />
  <p><br />
  &nbsp;&nbsp;&nbsp;&nbsp;�b�ҹ�٪��_�O�K�t��k���A�̼s���ϥΪ��N�ODES(Data Encryption Standard)�F�C���O IBM ���q�b 1970 �~�N�o�i �X���@�ӥ[�K�t��k�A�G�Q�h�~�ӡA���޹q���w��αK�X���R���޳N���o�i��s�벧�A�K�X�ǱM�a��� DES ���w���� �]�ȶȨ�F�y��áz���a�B�A���y�ܻ��A�N�ثe���K�X�}�ѧ޳N�Ө��ADES  ���������@�Ӧw�����K�X�t�ΡC<br />
  &nbsp;&nbsp;&nbsp;&nbsp;DES �b 1977 �~�g�Ѭ����a�зǧ��]NBS�^�ĥά��p���зǡ]FIPS PUB 46-2�^����A�w�������ĬɤΨ�L�U�ز��~  �̼s�x���Ϊ��K�X�t�ΡA�����t��k�i�ѦҤ��}�����A���`�N�K�z��n�I�C<br />
    DES �t�Ϊ��򥻭�z�N�O�V�c�]Confusion�^�δ��G�]Diffusion�^�C�ҿת��V�c�N�O�N�����ഫ����L���ˤl�A�Ӵ��G  �h�O�����夤������@�Ӥp�a�誺�ܧ󳣱N�X����K�媺�U�����C<br />
    �e���X�p�`�ڭ̥�����DES �t��k�ҥ����Ψ쪺�@�Ǥ����A���U�ӦA�������� DES �[�K���t��k�F�C<br />
      <strong>S-BOX</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;�b DES �t��k���A�ΨӰ���V�c�ʧ@���A�N�O S-BOX�AS-BOX�����A�ڭ̥i�H�N�L�ݦ��O�@�� 6 �줸 ��J�A4 �� �� ��X����ơA�b��Ӻt��k���ADES �Ψ�F�K�� S-BOX�C�X�p�U�G<br />
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
  &nbsp;&nbsp;&nbsp;&nbsp;�ݹL�F�Ҧ��� S-BOX ��A���U�Ӫ����D�N�O�p��ϥ� S-BOX �O�H�e�����L�AS-BOX �� 6 �줸 ����J�B4 �줸 ��<br />
    ��X�AS-BOX �D��X�Ȫ���k�N�O�G�N��J�� �줸 ���Y����� �줸 �զX���G�i��Ʀr�]0-3�^��@�C�ơA�����|�� �줸 �զX���G�i��ơ]0-15�^��@��ơA��X S-BOX ���Ӧ�m���Ʀr�Y����X�C�|�Ҧp�U�G<br />
    �N010010 ��J S-BOX1 <br />
    ���X�Y����� �줸 �G 00 = 010&nbsp;<br />
    ���X�����|�� �줸 �G 10012= 910<br />
    S-BOX1���� 0 �C�A�� 9 �檺�Ʀr�O 1010<br />
    �]����X�� 1010 = 10102<br />
      <strong>�ƦC���</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;���F S-BOX �~�ADES �t��k���٥Ψ�F�ƦC��ơC���D�n���@�άO���洲�G���ʧ@�C<br />
    DES �t��k���ϥΤF�\�h���P���ƦC��ơA�C�|�p�U�G<br />
      <br />
      <strong>��l�ƦC�]Initial Permutation�^</strong><br />
    58, 50, 42, 34, 26, ?18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4,<br />
    62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8,<br />
    57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3,<br />
    61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7,<br />
      <br />
      <strong>���_�ƦC�]Key Permutation�^</strong><br />
    57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18,<br />
    10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36,<br />
    63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, ?30, 22,<br />
    14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4,<br />
      <br />
      <strong>�Y��ƦC�]Compression Permutation�^</strong><br />
    14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10,<br />
    23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2,<br />
    41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48,<br />
    44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32,<br />
      <br />
      <strong>�X�W�ƦC�]Expansion Permutation</strong>�^<br />
    32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9,<br />
    8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,<br />
    16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,<br />
    24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1,<br />
      <br />
      <strong>P-BOX </strong><strong>�ƦC�]P-BOX Permutation�^</strong> <br />
    16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10,<br />
    2, 8, 24, 14, 32, 28, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25,<br />
      <br />
      <strong>�׵��ƦC�]Final Permutation�^</strong><br />
    40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31,<br />
    38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29,<br />
    36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27,<br />
    34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25,<br />
  &nbsp;&nbsp;&nbsp;&nbsp;�� ���� S-BOX �A�ƦC��ƪ��p���k�N²�檺�h�F�A�ƦC��Ƥ��������ӼơA�N�O������X�줸�ƥءA�ӨC�Ӥ�  �����ƭȥN���J�줸��C�Ǹ��C�H P-BOX �ƦC���ҡA�����Ĥ@�Ӥ�����  16 �A��ܿ�X���Ĥ@�Ӧ줸�O��J���� 16 �Ӧ줸�F�ĤG�Ӥ����� 7 �A��ܿ�X���� 2 �Ӧ줸�O��J���� 7 �Ӧ줸�A�H�������A�Ҧ����ƦC��Ƥ��D�Ȫk�� �ۦP�C<br />
    <strong>���_�줸���ۦ��</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;�b�y��N�|���쪺 DES �t��k���A�� 16 �Ӧ^�X���ʧ@�A�Ӧb�C�@�Ӧ^�X�ҥΪ����_�������n�g�L�@���줸���ۡA  �C�@�^�X���۪��줸�ƦC�X�p�U�G<br />
    �^�X�� 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16<br />
    ���ۦ줸�� 1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1<br />
      <br />
      <strong>DES </strong><strong>�[�K�y�{</strong><br />
  &nbsp;&nbsp;&nbsp;&nbsp;�e���X�p�`�w�q�F DES �t��k�ҥ����Ψ쪺�@�Ǥ����A���U�ӴN�i�H�������� DES �[�K���t��k�F�C�b�[�K�� �e�A�ڭ̥�������ܤ@�� 56 �줸���H���ܼơA�[�J�K�ӦP���ˬd�줸��Φ� 64 �줸 ��DES Key�A�çQ�γo�Ӫ��_�� �� 16 �Ӥl���_�A��k�p�U�G <br />
    <img src="des_intro_clip_image001.gif" alt="des1" width="524" height="477" /></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;�䤤��J���_�����׬� 64 �줸 �A�h���P��줸��A���������k�ⳡ���A�ϱoKLi�BKRi�����׬Ҭ� 28 �줸�C�Y�� �ƦC����X�� 48 �줸 �A�]�� 16 �Ӥl���_�����׬Ҭ� 48 �줸�C�t�~�A�b�D���P�l���_�ɡA���۪��줸�Ƥ]���ۦP�A �����̷�4-2.3�`�ҭz���W�w�~�i�H�C�D�X�Ҧ��l���_��A�N�i�H�����i��[�K���u�@�F�C<br />
    DES �t��k���[�K�L�{�i�H�ΤU�ϸ����G </p>
  <p><img src="des_intro_clip_image002.gif" alt="des2" width="552" height="695" /></p>
  <p>&nbsp;</p>
  <p>�䤤 f ��ƪ��w�q�p�U�G <br />
      <img src="des_intro_clip_image003.gif" alt="des3" width="457" height="355" /></p>
  <p>	�q�W���t��k�i�H���D�ADES �t�ΨC���[�K�����O  64 �줸 �A�]���b���� DES �[�K���ɭԡA�ڭ̥���������<br />
    ���C 64 �줸 �@�ӰϬq�A�����o�˪��[�K��k�ڭ̺٥L���Ϭq���[�K�]Block Cipher)�C<br />
    �bDES�t�Τ��A�ѱK���t��k�M�[�K�����ۦP�A���O�b�ѱK�ɿ�J�����_���줸���ǫ�P�[�K�ɪ����_�ۤϡC </p>
  <p>�ѦҸ�ơG<a href="http://www.sunzone.com.tw/" class="style14">SUNZone </a></p>
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
