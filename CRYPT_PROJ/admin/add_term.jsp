<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
.style1 {font-size: 24px}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style18 {font-size: 16px}
.style19 {color: #000000}
.style5 {color: #0000FF}
body {
	background-color: #FFFFFF;
}
-->
</style>
<script >
function check()
{
if (form1.term.value == "" )
		{ alert("�п�J�W��");	}
			else if (form1.description.value == "" )
				{ alert("�п�J����");	}
						else 
								{			
								form1.action= "term_check_add.jsp";					
								form1.submit();
								}
											}
</script>
</head>

<body>

	<!-- end #header -->
	<table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">�n�X </a>|| <a href="all_entry.jsp" class="style5">�ϥΪ̸��</a> || <a href="search.jsp" class="style5">�j�� </a>|| <a href="add_term.jsp" class="style5">�s�W�W��</a> || <a href="news/news.jsp" class="style5">��������</a> ||<a href="suggestion.jsp" class="style5"> �N��</a> || <a href="forum/forum.jsp" class="style5">�Q�װ�</a> ||<a href="message/message.jsp" class="style5"> �d��</a></span></div></td>
      </tr>
    </table>
	<p>&nbsp;</p>
<form name="form1" method="post" action="">
  <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
  <table width="375" border="1" align="center">
    <tr>
      <td colspan="2"><div align="center" class="style1 style3">�s�W�W��</div></td>
    </tr>
    <tr>
      <td width="45"><span class="style19">�W��</span></td>
      <td width="314"><input name="term" type="text" id="term"></td>
    </tr>
    <tr>
      <td><span class="style19">����</span></td>
      <td><input name="adv" type="text" id="adv"></td>
    </tr>
    <tr>
      <td><span class="style19">����</span></td>
      <td><textarea name="description" cols="35" rows="10" id="description"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
          <input type="button" name="button2" value="�e�X" onClick="check()">      
          <input type="reset" name="Submit" value="���]">
          <a href="term_result.jsp" class="style5">�Ҧ��W��</a></div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  </div>
</form>

</body>
</html>
