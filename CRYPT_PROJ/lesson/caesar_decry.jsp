<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
<style type="text/css">
<!--
.style2 {font-size: 24px}
.style29 {font-family: "細明體";
	font-size: 16px;
}
.style32 {font-size: 24px; font-weight: bold; }
.style33 {color: #FF0000}
-->
</style>
</head>

<%!

public String decrypt(String str, int key) {
String decrypted = "";
for(int i = 0; i < str.length(); i++) 
{
	int c = str.charAt(i);
		if (Character.isUpperCase(c)) {
				c = c - (key % 26);
				if (c < 'A')
				c = c + 26;
										}
		 else if (Character.isLowerCase(c)) {
			c = c - (key % 26);
			if (c < 'a')
			c = c + 26;
											}
decrypted += (char) c;
}
return decrypted;
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
	  out.print("<a href = signin.jsp target=_parent>登入 </a>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> 登出 </a>");
	}

  
   
%>
      <span class="style29">||</span> <span class="style29"><a href="../bulletin_news.jsp">相關消息</a> || <a href="../lesson.jsp">課程 </a>|| <a href="../forum.jsp">討論區</a> ||<a href="../message.jsp">留言</a> || <a href="../linkpage.jsp">連結</a></span></div></td>
  </tr>
</table>
<p> </p>
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="caesar_plain.jsp">
  <table width="353" border="1" align="center">
  <tr>
    <th colspan="2" scope="row"><span class="style32">CaesarCipher 古典加解密</span></th>
  </tr>
  <tr>
    <td colspan="2" scope="row"><div align="center">Plain: ABCDEFGHIJKLMNOPQRSTUVWXYZ <br />
    Cipher: DEFGHIJKLMNOPQRSTUVWXYZABC </div></td>
  </tr>
  <tr>
    <td colspan="2" scope="row"><div align="left"><span class="style2">密文-&gt;加<strong>密</strong>-&gt; <strong>解密</strong></span></div></td>
  </tr>
  <tr>
    <td width="141" bgcolor="#FFFF00" scope="row"><%
String aa=request.getParameter("textfieldaa");
int key = 3;
String str = aa;
String decryptedaaa = decrypt(str, key);
out.println(decryptedaaa);
%></td>
    <td width="196" rowspan="2"><span class="style33">把剛剛的資料解密=&gt;原始的資料<br />
    </span></td>
  </tr>
  <tr>
    <td scope="row"><input type="submit" name="Submit" value="重新再來" /></td>
  </tr>
</table>

</form>
<p>&nbsp;</p>
</body>
</html>
