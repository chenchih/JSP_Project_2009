<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
 <script language="JavaScript" type="text/JavaScript">


function check()
 {
  var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;
	if (form1.email.value == "" )
		{ alert("�п�J�z���q�l�l��");	}
			else if (!re.test(email))
				{ alert("�п�J���T��e-mail");}

				else 											
					{
					 form1.action = "contact_check.jsp";
					 form1.submit();									
					}
	}
   
</script>

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style2 {color: #FF0000}
.style4 {color: #000000}
.style17 {font-family: "�ө���";
	font-size: 16px;
}
.style18 {color: #0000FF}
a:hover {
	color: #FF0000;
}



-->
</style>
</head>
<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
</p>
	  <p>&nbsp;      </p>
  </div>
	<!-- end #header -->
	<!-- end #menu -->
    <body bgcolor="#99FFCC">
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
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style18">��������</a> || <a href="lesson.jsp" class="style18">�ҵ{</a> || <a href="forum.jsp" class="style18">�Q�װ�</a> ||<a href="message.jsp" class="style18">�d��</a> || <a href="linkpage.jsp" class="style18">�s��</a></span></div></td>
      </tr>
    </table>
    <p align="center" class="style12 style2">&nbsp;</p>
    <form name="form1" method="post" action="">
      <p align="center"><span class="style12 style2"><font size="+5">�N���P�^��</font></span></p>
      <table width="70%" border="1" align="center">
    <tr>
      <td width="92" bgcolor="#669933"><span class="style4 style11"><strong>�m�W�G</strong></span></td>
      <td width="361"><input name="name" type="text" id="name"></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>�b���G</strong></span></td>
      <td><input name="username" type="text" id="username">
      <span class="style2">      (�p�G�A��)</span></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>�q�l�l��G</strong></span></td>
	  
      <td><input name="email" type="text" id="email" )">
        <span class="style2">
      (�@�w�n��_�h�L�k�^�H)</span></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>�D�D</strong></span></td>
      <td><input name="subject" type="text" id="subject"></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>�d���G</strong></span></td>
      <td><textarea name="comment" cols="35" rows="10" id="comment"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
          <input name="date_id" type="hidden" id="date_id" value="<%=getRecordID()%>">
          <input type="button" name="button2" value="�e�X" onClick="check()">
          <input name="reset2" type="reset" id="reset2" value="���s��g">
      </div></td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  </form>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style18">�޲z��</a>||<a href="term.jsp" class="style18">�W���j��</a> || <a href="contact.jsp" class="style18">�N�� </a></span></div></td>
  </tr>
</table>
</div>
</body>
<!-- end #footer -->
</div>
</body>
</html>
