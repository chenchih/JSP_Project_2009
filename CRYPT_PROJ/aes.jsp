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
	<h2 align="center">AES ����D  <a href="grade.jsp">[<span class="style28">���Z</span>]</a></h2>
	<form action="aes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4>1. AES�[�K�k�O�ݩ��إ[�K�{�ǡH<strong></strong></h4>
	   <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     ��٦����_
  <input type="radio" value="2" name="Q1" />
	     �ǲΥ[�K�k
         <input type="radio" value="3" name="Q1" />
	     Rijndael�[�K�k
	     <input type="radio" value="4" name="Q1" />
	     �H�W�ҬO</p>
	   <h4><strong>2. �U�C����AES�[�K�k���ԭz��̥��T�H</strong></h4>
	   <p class="style30"><span class="style29">
	     <input type="radio" value="1" name="Q2" checked="checked" />
	   </span>�O�����p���F���ĥΪ��@�ذ϶��[�K�з�<br />
	     <span class="style29">
	     <input type="radio" value="2" name="Q2" />
	     </span>�o�ӼзǥΨӴ��N�����DES<br />
	     <span class="style29">
	     <input type="radio" value="3" name="Q2" />
	     </span>�w�g�Q�h����R�B�s�����@�ɩҨϥ�<br />
         <span class="style29">
         <input type="radio" value="4" name="Q2" />
       </span>�H�W�ҬO</p>
	
	  <h4><strong>3. AES�[�K�k���϶����׬��H</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  32 
	  <input type="radio" value="2" name="Q3" />
	  128 
	  <input type="radio" value="3" name="Q3" />
	  64      
	  <input type="radio" value="4" name="Q3" />
16 </p>
	  <h4><strong>4. AES�[�K�k���K�_���ץi�H���H</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
      128 
      <input type="radio" value="2" name="Q4" /> 
      192 
      <input type="radio" value="3" name="Q4" />
      256 
      <input type="radio" value="4" name="Q4" />
      �H�W�ҬO</p>
	  <h4><strong>5. AES�[�K�L�{�O���ؼƾǤ覡�W�B�@�H</strong></h4>
	  <p class="style30">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    �x�} 
	    <input type="radio" value="2" name="Q5" /> 
	    ��{��
	    <input type="radio" value="3" name="Q5" />
	    �T�����
        <input type="radio" value="4" name="Q5" />	    
        �V�q</p>
	  <h4><strong>6. AES�[�K�k�t���|�ӨB�J�A�U�C��̬��D�H</strong></h4>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    AddRoundKey 
	    <input type="radio" value="2" name="Q6" /> 
	    Rijndael   
	    <input type="radio" value="3" name="Q6" /> 
	    ShiftRows<strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>SubBytes</p>
	  <h4><strong>7. �I��2006�~�A�w��AES�ߤ@�����\�����O��ا����H</strong></h4>
	  <p class="style29"><strong>
	    
      <input name="Q7" type="radio" value="1" checked="checked" />
      </strong>�ɤO�}�� 
	    <input type="radio" value="2" name="Q7" />
	    ���_�j�M�����k
	    <input type="radio" value="3" name="Q7" />
	    �ǹD���� 
	    <input type="radio" value="4" name="Q7" />
	    �H�W�ҫD</p>
	  <h4><strong>8. ����AES�[�K�k�U�C��̹������~�H</strong></h4>
	  <p><strong>
	    <span class="style29">
	    <input name="Q8" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">128�줸�K�_������10�ӥ[�K�j��<br />
	    <strong>
        <input type="radio" value="2" name="Q8" />
	    </strong>192�줸�K�_������12�ӥ[�K�j��<br />
	    <strong>
	    <input type="radio" value="3" name="Q8" />
	    </strong>16�줸�K�_�����h��6�ӥ[�K�j��<br />
        <strong>
        <input type="radio" value="4" name="Q8" />
        </strong>256�줸�K�_�����h��14�ӥ[�K�j��</span></p>
	  <h4><strong>9. AES�[�K�k���P�󥦪��e���з�DES�[�K�k�ϥΪ��O��ج[�c�H</strong></h4>
	  <p class="style29">
	    <input name="Q9" type="radio" value="1" checked="checked" />
	    �m��-�զX�[�c
	    <input type="radio" value="2" name="Q9" />
	    Feistel�[�c 
	    <input type="radio" value="3" name="Q9" />
	    ����[�c 
	    <input type="radio" value="4" name="Q9" />
	    �Ʀ�[�c</p>
	  <h4><strong>10. AES�[�K�k�t���|�ӨB�J�A�U�C�B�J��̦��~�H</strong></h4>
	  <p class="style29">
	    <input name="Q10" type="radio" value="1" checked="checked" />
	    AddRoundKey �X �x�}�����C�@�Ӧ줸�ճ��P�Ӧ��j�骺�l�K�_�]round key�^��XOR�B��F�C�Ӥl�K�_�ѱK�_�ͦ���ײ��͡C<br />
	    <input type="radio" value="2" name="Q10" />
	    SubBytes �X �z�L�@�ӫD�u�ʪ�������ơA�άd����覡��C�Ӧ줸�մ������������줸�աC<br />
	    <input type="radio" value="3" name="Q10" />
	    ShiftRows �X �N�x�}�����C�Ӫ��C�i���@������C<br />
        <input type="radio" value="4" name="Q10" />      
      MixColumns �X ���F�R���V�X�x�}���U�Ӫ��檺�ާ@�C�o�ӨB�J�ϥνu���ഫ�ӲV�X�C�椺���|�Ӧ줸�աC</p>
	  <p>
        <input type="submit" value="�e�X" name="B1" />
        <input type="reset" value="���]" name="B2" />
	  </p>
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
