<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
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
<p>&nbsp;</p>
<table width="200" border="0" align="right">
  <tr>
    <td width="110
	"><form name="form3" method="post" action="map.jsp">
       <input type="button" value="S-DES �[�c��" onClick="OpenBut()">
    </form></td>
    <td width="70"><form name="form2" method="post" action="">
      <input name="button1" type="button" onClick="closed()" id="sample" value="�����{��">
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="2.jsp">

 
  <p><font color="#FF0000">�i²&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    ���j</font></p>
  <ul>
    <li><font color="#0000FF">��²���� DES(S-DES) : </font>�O�� Santa Clara �j�Ǫ� Edward Schaefer �б©ҵo�i�X�Ӫ� [SCHA96�C]���ä��O�@�Ӧw�����[�K�t��k�A�����ت��O���F��K�оǡC���P DES ���ۦ����S�ʻP���c�A���O���ݭn���ѼƤ� DES �֫ܦh�C</li>
  </ul>
  <ul>
    <li><font color="#0000FF">S-DES �[�K�t��k:</font> ����J�O�@��8�줸������Ϭq(�Ҧp:10111101)�A�H�Τ@��10�줸���_�͡F������X�O�@��8�줸���K��Ϭq�C</li>
  </ul>
  <ul>
    <li>�����A��J�@��10�줸���_�͡A�q�����Ͱ���⦸ fk �ɩһݪ��l�_��K1��K2�M��A�ڭ̥i�H�N��ӥ[�K�t��k²��a�ΤU�C���X����ƨӪ�ܡG <br>
        <font color="#0000FF">�K�� = IP<span style="vertical-align: super">-1</span>( fk2 ( SW ( fk1 ( IP ( ���� ) ) ) ) )</font> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP�G�@�ӱҩl�����ƨ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fk1�G������ơA���|�ھڤl�C��K1�Ӷi�歫�ƻP���N���B�� <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SW�G�@�ӥ洫��ƨ��䪺²�歫�ƨ�� <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fk2�G������ơA���|�ھڤl�C��K2�Ӷi�歫�ƻP���N���B�� <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP<span style="vertical-align: super">-1</span>�G���ƨ�ơA���OIP���Ϩ��</li>
  </ul>
  <ul>
    <li>���{�����ت��O�Ʊ��ǥ� step by step ���� S-DES ���C�Ӥ����A�঳�U��P�Ǫ��ǲߡC</li>
  </ul>
  <ul>
    <li>�ѦҨӷ��GWilliam Stallings,��Cryptography and Network Security,��Third Edition, Prentice Hall, 2003</li>
  </ul>
  <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <p align="right">�@&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <input type="submit" name="Submit" value="�}�l">

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
