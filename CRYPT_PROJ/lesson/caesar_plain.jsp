<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
<style type="text/css">
<!--
.style2 {font-size: 24px}
.style29 {font-family: "�ө���";
	font-size: 16px;
}
.style30 {color: #FF0000}
.style32 {font-size: 24px; font-weight: bold; }
-->
</style>
</head>

<body>
<table width="200" border="1" align="center">
  <tr>
    <td><img src="pic1.gif" width="800" height="220" /></td>
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
      <span class="style29">||</span> <span class="style29"><a href="../bulletin_news.jsp">��������</a> || <a href="../lesson.jsp">�ҵ{ </a>|| <a href="../forum.jsp">�Q�װ�</a> ||<a href="../message.jsp">�d��</a> || <a href="../linkpage.jsp">�s��</a></span></div></td>
  </tr>
</table>
<p>  </p>

  <label>
  <label></label>

 <form id="form1" name="form1" method="post" action="caesar_encry.jsp">
<table width="425" border="1" align="center">
  <tr>
    <th colspan="2" scope="row"><span class="style32">CaesarCipher �j��[�ѱK</span></th>
  </tr>
  <tr>
    <td colspan="2" scope="row"><div align="center">Plain: ABCDEFGHIJKLMNOPQRSTUVWXYZ <br />
    Cipher: DEFGHIJKLMNOPQRSTUVWXYZABC </div></td>
  </tr>
  <tr>
    <td colspan="2" scope="row"><div align="left"><span class="style2"><strong>�K��</strong>-&gt;�[�K-&gt; �ѱK</span></div></td>
  </tr>
  <tr>
    <th width="168" scope="row">
      <div align="center">
       
          <p align="left">
            <textarea name="textfield2" cols="25" rows="5"></textarea>
          </p>
    </div></th>
    <td width="241" rowspan="2"><span class="style30">�п�J��r (�Ҧp: abc )�ӥ[�K</span></td>
  </tr>
  <tr>
    <th scope="row"><input type="submit" name="Submit2" value="�e�X"  /></th>
    </tr>
</table>
</form>
<p>&nbsp;</p>

<p>&nbsp;</p>
</body>
</html>
