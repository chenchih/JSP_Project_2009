<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>DES����</title>
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
.style35 {color: #FF0000}
.style36 {color: #000000}
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
	<h2 align="center">&nbsp;</h2>
	<form action="des_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4 align="center" class="style35"><span class="style36">DES ����D</span> <a href="grade.jsp">[<span class="style28">���Z</span>]</a></h4>
      <h4 class="style35">�C�D10��</h4>
      <h4>1. DES�[�K�k�O��إ[�K�Φ��H</h4>
      <p class="style29">
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     ��٦��[�K�k
  <input type="radio" value="2" name="Q1" />
	     �ǲΥ[�K�k
         <input type="radio" value="3" name="Q1" />
	     ���_�[�K�k
	     <input type="radio" value="4" name="Q1" />
	     �H�W�ҬO</p>
	   <h4><strong>2. DES�[�K�k�O���ⶵ�򥻭�z�H�ҿת�(a)�N�O�N�����ഫ����L���ˤl�A��(b)�h�O�����夤������@�Ӥp�a�誺�ܧ󳣱N�X����K�媺�U�����C</strong></h4>
	   <p class="style30"><span class="style29">
       <input type="radio" value="1" name="Q2" checked="checked" />
	   �V�c
	     
       <input name="Q2" type="radio" value="2" />
       ���G
	     
       <input type="radio" value="3" name="Q2" />
       ���R
         
       <input name="Q2" type="radio" value="4" />
       �}��</span></p>
	   <h4><strong>3. DES�[�K�k�C���[�K�����O�X�줸�H</strong></h4>
	   <p class="style29">
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  32 
	  <input type="radio" value="2" name="Q3" />
	  64
	  <input type="radio" value="3" name="Q3" />
	  128      
	  <input type="radio" value="4" name="Q3" />
16 </p>
	  <h4><strong>4. �bDES�[�K�k���A�ѱK���t��k�M�[�K�����ۦP�A�b�ѱK�ɿ�J�����_���줸���ǫ�P�[�K�ɪ����_�H</strong></h4>
	  <p class="style29">
	    <input name="Q4" type="radio" value="1" checked="checked" />
	    <span class="style29">
      �ۦP 
      <input type="radio" value="2" name="Q4" /> 
      �ۤ� 
      <input type="radio" value="3" name="Q4" />
      ���� 
      <input type="radio" value="4" name="Q4" />
      �H�W�ҫD</span></p>
	  <p><strong>5. DES�����m�j�רM�w����ⶵ�]���H</strong></p>
	  <p class="style29">
	    <input name="Q5" type="radio" value="1" checked="checked" />
	    �ǲ� 
	    <input type="radio" value="2" name="Q5" /> 
	    �t��k����
	    <input type="radio" value="3" name="Q5" />
	    �ҨϥΪ�56�줸���_����
	    <input name="Q5" type="radio" value="4" checked="checked" />	    
      �Ʀ�ñ��</p>
	  <h4><strong>6. �H�۬�޶i�B�ιq����sDES�[�K�k�ܱo�H</strong></h4>
	  <p class="style29">
	    <input name="Q6" type="radio" value="1" checked="checked" /> 
	    ��w�� 
	    <input type="radio" value="2" name="Q6" /> 
	    ����h�Q�}�Ѫ��i��   
	    <input type="radio" value="3" name="Q6" /> 
	    �H�W�ҫD<strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>�H�W�ҬO</p>
	  <h4><strong>7. �U�C����DES�ԭz��̥��T?</strong></h4>
	  <p class="style29"><strong>
	    
      <input name="Q7" type="radio" value="1" checked="CHECKED" />
      </strong>DES�O����F���Ҩ�w���q�T�w���зǡC<br />
	    <strong>
	    <input name="Q7" type="radio" value="2" />
	    </strong>DES�O�Ĥ��_�s�X(Public Key Cryptography)�޳N�C<br />
	    <strong>
	    <input name="Q7" type="radio" value="3" />
	    </strong>DES���_��(key)��ڦ��Ī��׬�56�줸�A�C�^�X�ҥ[�K����ưT�����׬�32�줸�C<br />
	    <strong>
	    <input name="Q7" type="radio" value="4" />
      </strong>DES�[�K�L�{�@16�^�X�A�C�^�X�ϥΪ��_�ͧ����ۦP�C</p>
	  <h4>8. DES�O�@�Ӭ۷��M, �y�Ǭ۷�[�����t��k,�{�b�����W�`�Ϊ����ǥ[�K�k���O�H DES ����¦�Ӱ���[�ѱK���ʧ@�H</h4>
	  <p><strong>
	    <span class="style29">
	    <input name="Q8" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">SET 
	    <strong>
        <input type="radio" value="2" name="Q8" />
	    </strong>SSL<strong>
	    <input type="radio" value="3" name="Q8" />
	    </strong>SSH<strong>
        <input type="radio" value="4" name="Q8" />
        </strong>�H�W�ҬO</span></p>
	  <h4><strong>9.����DES�[�K�k�ݭn16�^�X���[�K�H</strong></h4>
	  <p class="style29"><strong>
	    <span class="style29">
	    <input name="Q9" type="radio" value="1" checked="checked" />
	    </span></strong><span class="style29">�]���B��16�^�X�Q�ΦU�ؤ�k�}�ѩһݮɶ���n��μɤO�}�Ѫk�t���h<br />
	    <strong>
	    <input type="radio" value="2" name="Q9" />
	    </strong>17�B18�^�X �i��|�D���ɤO�}�Ѫk����<br />
	    <strong>
	    <input type="radio" value="3" name="Q9" />
	    </strong>14�B15�^�X �w���ʤ���S�o��j<br />
        <strong>
        <input type="radio" value="4" name="Q9" />
        </strong>�H�W�ҬO</span></p>
	  <h4><strong>10. DES�����W��(Data Encryption Standard)�H</strong></h4>
	  <p class="style29">
	    <input name="Q10" type="radio" value="1" checked="checked" />
	    �O
	    <input type="radio" value="2" name="Q10" />
	    �_</p>
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
