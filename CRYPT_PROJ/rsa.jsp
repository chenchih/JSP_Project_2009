<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>AES����</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<style type="text/css">
<!--

body,td,th {
	color: #000000;
}
.style27 {font-family: "�ө���";
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
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>�n�J </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  �n�X </a> </font>");
	}

  
   
%>
          <span class="style27">||</span> <span class="style27"><a href="bulletin_news.jsp" class="style28">��������</a> || <a href="lesson.jsp" class="style28">�ҵ{</a> || <a href="forum.jsp" class="style28">�Q�װ�</a> ||<a href="message.jsp" class="style28">�d��</a> || <a href="linkpage.jsp" class="style28">�s��</a></span></div></td>
      </tr>
    </table>
	<p></p>
	<h2 align="center">RSA ����D  <a href="grade.jsp">[<span class="style28">���Z</span>]</a></h2>
	<form action="aes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4>1. RSA�[�K�t��k�O���������[�K�k�H(10��)</h4>
	   <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     ��٦��[�K
	     <input type="radio" value="2" name="Q1" />
	     �D��٦��[�K
	     <input type="radio" value="3" name="Q1" />
	     �ǲΥ[�K
	     <input type="radio" value="4" name="Q1" />
	     ���_�[�K</p>
	   <h4><strong>2. RSA�[�K�t�Υi�H�����T�����A�U�C��̦��~�H(10<span class="style30"><strong>��</strong></span>)</strong></h4>
	   <p class="style30"><span class="style29">
	     <input type="radio" value="1" name="Q2" checked="checked" />
	   </span>�p�K���_	     <span class="style29">
	     <input type="radio" value="2" name="Q2" />
       </span>�ϥΪ̪��_ 
	     <span class="style29">
	     <input type="radio" value="3" name="Q2" />
	     </span>�[�K�t��k         <span class="style29">
         <input type="radio" value="4" name="Q2" />
       </span>�ѱK�t��k</p>
	
	  <h4><strong>3. ��_DES�H�Ψ�L��ٺt��k�ARSA�[�K�t����۸��H(10<span class="style30"><strong>��</strong></span>)</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  ��
	  <input type="radio" value="2" name="Q3" />
	  �C
	  <input type="radio" value="3" name="Q3" />
	  �@�˧�
	  </p>
	  <h4><strong>4. �w��RSA�̬y�檺�����@��O��ا����H(10<span class="style30"><strong>��</strong></span>)</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
      �ɤO�}��
      <input type="radio" value="2" name="Q4" /> 
      ���_�j�M�����k
      <input type="radio" value="3" name="Q4" />
      �ǹD����
      <input type="radio" value="4" name="Q4" />
      ���j�Ʀ]�Ƥ���</p>
	  <h4><strong>5. ���]Alice�Q�n�q�L�@�Ӥ��i�a���C�鱵��Bob���@���p�H�T���A�U�C�B�J��̦��~�H(30<span class="style30"><strong>��</strong></span>)</strong></h4>
	  <p class="style30">
	    <span class="style29">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    </span>p�Mq�Ap������q�A�p��N=pq<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="2" />
	    </span>�ھڼکԨ��,���j��N�B�PN���誺��ƭӼƬ�(p-1)(q-1)<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="3" />
	    </span>��ܤ@�Ӿ��e�P(p-1)(q-1)����,�åBe�p��(p-1)(q-1)<br />
	    <span class="style29">
	    <input name="Q5" type="radio" value="1" />
      </span>�ΥH�U�o�Ӥ����p��d�Gd�� e �� 1 (mod (p-1)(q-1))(5)�Np�Mq���O���O�s</p>
	  <p class="style30">        <strong>6. �̾ڤ����A���]Bob�Q��Alice�e�@�Ӯ���m�A�L���DAlice���ͪ�N�Me�C�L�ϥΰ_���PAlice���n���榡�Nm�ഫ���@�Ӥp��N�����n�A�L�p��N����m�ഫ���Ʀr�H�ǻ������H(30��)</strong></p>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    EBCDIC
	    <input type="radio" value="2" name="Q6" /> 
	    Unicode
	    <input type="radio" value="3" name="Q6" />
      BCDIC<strong>
      <input type="radio" value="4" name="Q6" />
      </strong>8086</p>
	  <h4>&nbsp;	  </h4>
  </form>
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right"><span class="style27"><a href="admin/admin.jsp" target="_blank" class="style28">�޲z��</a>||<a href="term.jsp" class="style28">�W���j��</a> || <a href="contact.jsp" class="style28">�N�� </a></span></div></td>
      </tr>
    </table>
	<p> </p>
</div>
</body>
</html>
