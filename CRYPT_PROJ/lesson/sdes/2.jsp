<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.style29 {font-family: "�ө���";
	font-size: 16px;
}
a:hover {
	color: #FF0000;
}
.style5 {color: #0000FF}
-->
</style>
</head>

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
	  out.print("<a href = signin.jsp target=_parent>�n�J </a>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> �n�X </a>");
	}

  
   
%>
      <span class="style29">||</span> <span class="style29"><a href="../../bulletin_news.jsp">��������</a> || <a href="../../lesson.jsp">�ҵ{ </a>|| <a href="../../forum.jsp">�Q�װ�</a> ||<a href="../../message.jsp">�d��</a> || <a href="../../linkpage.jsp">�s��</a></span></div></td>
  </tr>
</table>
<p>
  <script>

function check1() {
	form1.action="1.jsp"
	form1.submit();
}
function OpenBut()
{
window.open("m1.jsp", "OpenColse", "toolbar=no, member=no,  height=620, width=750");
}
function closed()
{
window.close();
}
function checkID(string) {
	re = /^[0-1]{10}$/;
	if (re.test(string))
		form1.submit();//�e�X��椤�����
	else
	
		alert("�yP10�z�п�J10�Ӧ줸���y�G�i��ơz�I");
	//	alert("���ѡI���ŦX�u" + re + "�v���榡�I");
}
</script>
</p>
<table width="200" border="0" align="right">
  <tr>
    <td><input name="button" type="button" onClick="OpenBut()" value="S-DES �[�c��"></td>
    <td><input name="button1" type="button" onClick="closed()" id="sample" value="�����{��"></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="2-1.jsp">
  <p>�i<font color="#FF0000">S-DES���_�Ͳ��ͤ�k</font>�j</p>
  <p><font color="#0000FF"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P10<br>
    (10�줸���_��)�G</b></font> 
    <input name="num" type="text" id="idNumber" value="1010000010" size="10" maxlength="10">
	<input type=button value="�T�w" onClick="checkID(idNumber.value)">
   
  </p>
  <p>&nbsp;&nbsp; <strong><font size="5"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</font></strong> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�NP10(k1, k2, k3, k4, 
    k5, k6, k7, k8, k9, k10)���s<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    �ƦC��P10(k3, k5, k2, k7, k4, k10, k1, k9, k8, k6)<br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </font></strong> 
    <input name="textfield1" type="text" value="          ?" size="10" maxlength="10">
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong></p>
  <p><strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���O��e5�Ӧ줸�P��5�Ӧ줸���`������(LS-1)<br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="textfield2" type="text" value="    ?" size="5" maxlength="5">
    <input name="textfield3" type="text" value="    ?" size="5" maxlength="5">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ���ʧ@(�κ٬�����)&nbsp;&nbsp;&nbsp; </p>
  <p>�@</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp; </font></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;�g�� LS-1 �Ҳ��ͪ����5�줸���r<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  &nbsp;&nbsp;&nbsp;&nbsp;��,�N�o��Ӧr��`��������Ӧ줸</p>
  <p><b>&nbsp;</b><font color="#0000FF"><b>&nbsp; K1:</b>&nbsp;&nbsp; </font>&nbsp; 
    <input name="textfield4" type="text" value="       ?" size="8" maxlength="8">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp; 
    <input name="textfield5" type="text" value="    ?" size="5" maxlength="5">
    <input name="textfield6" type="text" value="    ?" size="5" maxlength="5">
    &nbsp; </p>
  <p>�ޥ�P8(6, 3, 7, 4, 8, 5, 10 ,9)�o<br>
    �ӵ{�� , �q10�Ӧ줸�̨��X��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><font size="5">&nbsp;
    �� </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�A�@���ϥ� P8 �Ӳ��� K2<br>
    ��8�Ӧ줸�ӭ��s�ƦC,���G�|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    ���Ĥ@��l�_��(K1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#0000FF">&nbsp; 
    &nbsp; <b>&nbsp;K2:</b> </font>&nbsp;&nbsp;&nbsp; 
    <input name="textfield7" type="text" value="       ?" size="8" maxlength="8">
    &nbsp;&nbsp;&nbsp;&nbsp; </p>
  <p align="right">�@    <font size="3">
 <input type="button" name="Submit33" value="²��" onClick="check1()">
  </font></p>
</form>

<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">�޲z��</a>||<a href="../../term.jsp" class="style5">�W���j��</a> || <a href="../../contact.jsp" class="style5">�N�� </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
