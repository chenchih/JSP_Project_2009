<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<title>�L���D���</title>
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
.style29 {color: #FF0000}
.style30 {color: #000000}
-->
</style>
</head>

<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
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
	<form action="sdes_check.jsp" method="post" name="Quiz" id="Quiz">
      <h4 align="center" class="style29"><span class="style30">DESII ����D</span> <a href="grade.jsp">[<span class="style28">���Z</span>]</a></h4>
      <h4 class="style29">�C�D10��</h4>
      <h4>1. �аݥH�USDES�Ψ��H�U���@�ئ줸�B��<strong>? </strong></h4>
      <p>
	     <input type="radio" value="1" name="Q1" checked="checked" />
	     binary
  <input type="radio" value="2" name="Q1" />
	     hexadecimal
  <input type="radio" value="3" name="Q1" />
	     octal 
  <input type="radio" value="3" name="Q1" />
	     decimal     </p>
	   <h4><strong>2. �а�IP�O���� �N��	    </strong><strong>? </strong></h4>
	   <p>
        <input type="radio" value="1" name="Q2" checked="checked" />
��l����
<input type="radio" value="2" name="Q2" />
�ϹB��
<input type="radio" value="3" name="Q2" />
�@�ӽ��������
<input type="radio" value="3" name="Q2" />
�@��²�檺����</p>
	
	  <h4><strong>3. �а�SDES�ΥH�U���@���޿�B��ӥ[�ѱK?</strong><strong></strong>      </h4>
	  <p>
	    <input type="radio" value="1" name="Q3" checked="checked" />
	  OR 
	  <input type="radio" value="2" name="Q3" />
	  AND 
	  <input type="radio" value="3" name="Q3" />
	  XOR      
	  <input type="radio" value="3" name="Q3" />
NOT </p>
	  <h4><strong>4. �а�1011001111 ���[�K��O�h��?  </strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q4" />
      01000001 
      <input type="radio" value="2" name="Q4" /> 
      11100001 
      <input type="radio" value="3" name="Q4" /> 
      11100010 
      <input type="radio" value="4" name="Q4" />
      �H�W�ҫD</p>
	  <h4><strong>5. �аݦp�G�[�K����O00110110  ��FK�|�O�h��?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q5" />
	    11001001 
	    <input type="radio" value="2" name="Q5" /> 
	    00011001
	    <input type="radio" value="3" name="Q5" /> 
	    01101001
	    <input type="radio" value="4" name="Q5" /> 
	    01100001</p>
	  <h4><strong>6. �а�SDES�Ϭq�j�p�M���_���׬O�h��?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q6" /> 
	    10, 5 
	    <input type="radio" value="2" name="Q6" /> 
	    6, 8   
	    <input type="radio" value="3" name="Q6" /> 
	    10, 8 <strong>
	    <input type="radio" value="4" name="Q6" />
	    </strong>8 ,10 
	    <input type="radio" value="5" name="Q6" /> 
	    8, 6   
	    <input type="radio" value="6" name="Q6" /> 
	    8, 8 </p>
	  <h4><strong>7. �p�G�[�K������O00110110  ��8�줸���K��O�h��?</strong></h4>
	  <p><strong>
	    <input type="radio" value="1" name="Q7" />
      01000001 </strong>
	    <input type="radio" value="2" name="Q7" />
	    11001100 
	    <input type="radio" value="3" name="Q7" /> 
	    00111001 
	    <input type="radio" value="4" name="Q7" />
	    10100111</p>
	  <h4><strong>8. �p�GFK�O01101001��E/P�O�h��?</strong></h4>
	  <p>
	    <input type="radio" value="4" name="Q8" />
	    00111100? <strong>
	    <input type="radio" value="2" name="Q8" />
	    </strong>	     11000011<strong>?</strong>
	    <input type="radio" value="3" name="Q8" /> 
	    00111001?  
	    <input type="radio" value="4" name="Q8" />
	    10011000</p>
	  <h4><strong>9. �p�G�[�K��FK �O1000100���ϹB��(IP-1)�|�O�h��?</strong></h4>
	  <p>
	    <input type="radio" value="1" name="Q9" />
	    00000110 
	    <input type="radio" value="2" name="Q9" />
	    01000001 
	    <input type="radio" value="3" name="Q9" />
	    10111001 
	    <input type="radio" value="4" name="Q9" />
	    00111100</p>
	  <h4><strong>10. �p�G L=1101R=0100,F(R,SK)=0101�а�FK(L,K)���h��?</strong></h4>
	  <p><strong>
	    <input type="radio" value="1" name="Q10" />  
      </strong>1000100
	    <input type="radio" value="2" name="Q10" />  
      00100001
      <input type="radio" value="3" name="Q10" /> 
      11100110 
      <input type="radio" value="4" name="Q10" />
      01000011</p>
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
