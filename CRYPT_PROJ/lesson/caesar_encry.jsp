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
.style32 {font-size: 24px; font-weight: bold; }
.style30 {color: #FF0000}
-->
</style>
</head>
<%!
public  String encrypt(String str, int key) {
String encrypted = "";
for(int i = 0; i < str.length(); i++) {
int c = str.charAt(i);
if (Character.isUpperCase(c)) {
c = c + (key % 26);
if (c > 'Z')
c = c - 26;
} else if (Character.isLowerCase(c)) {
c = c + (key % 26);
if (c > 'z')
c = c - 26;
}
encrypted += (char) c;
}
return encrypted;
}
%>

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
<p><span class="style2">
  <label></label>
  <label></label>
</span></p>
<form id="form1" name="form1" method="post" action="caesar_decry.jsp">
<table width="497" border="1" align="center">
  <tr>
    <th colspan="3" scope="row"><span class="style32">CaesarCipher �j��[�ѱK</span></th>
  </tr>
  <tr>
    <td colspan="3" scope="row"><div align="center">Plain: ABCDEFGHIJKLMNOPQRSTUVWXYZ <br />
    Cipher: DEFGHIJKLMNOPQRSTUVWXYZABC </div></td>
  </tr>
  <tr>
    <td colspan="3" scope="row"><div align="left" class="style2">�K��-&gt;<strong>�[�K</strong>-&gt; �ѱK</div></td>
  </tr>
  <tr>
    <th colspan="2" bgcolor="#FFFF00" scope="row">
      <p class="style2">
        <%
String aa=request.getParameter("textfield2");

String str = aa;
int key = 3;

String encrypted = encrypt(str, key);
out.println(encrypted);


%>
        <input name="textfieldaa" type="hidden" id="textfieldaa" value="<%out.print(encrypted);%>" />
      </p>
      
    <td width="314" rowspan="2"><span class="style2">
      <label></label>
      </span><span class="style30">�����J����ƥ[�K</span><span class="style2"><span class="style30"><br />
      </span></span></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><span class="style2">
      <input type="submit" name="Submit" value="�ѱK"  />
    </span></th>
  </tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
