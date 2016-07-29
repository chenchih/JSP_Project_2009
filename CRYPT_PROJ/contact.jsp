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
<title>無標題文件</title>
 <script language="JavaScript" type="text/JavaScript">


function check()
 {
  var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;
	if (form1.email.value == "" )
		{ alert("請輸入您的電子郵件");	}
			else if (!re.test(email))
				{ alert("請輸入正確的e-mail");}

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
.style17 {font-family: "細明體";
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
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>登入 </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  登出 </a> </font>");
	}

  
   
%>
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style18">相關消息</a> || <a href="lesson.jsp" class="style18">課程</a> || <a href="forum.jsp" class="style18">討論區</a> ||<a href="message.jsp" class="style18">留言</a> || <a href="linkpage.jsp" class="style18">連結</a></span></div></td>
      </tr>
    </table>
    <p align="center" class="style12 style2">&nbsp;</p>
    <form name="form1" method="post" action="">
      <p align="center"><span class="style12 style2"><font size="+5">意見與回應</font></span></p>
      <table width="70%" border="1" align="center">
    <tr>
      <td width="92" bgcolor="#669933"><span class="style4 style11"><strong>姓名：</strong></span></td>
      <td width="361"><input name="name" type="text" id="name"></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>帳號：</strong></span></td>
      <td><input name="username" type="text" id="username">
      <span class="style2">      (如果你有)</span></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>電子郵件：</strong></span></td>
	  
      <td><input name="email" type="text" id="email" )">
        <span class="style2">
      (一定要填否則無法回信)</span></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>主題</strong></span></td>
      <td><input name="subject" type="text" id="subject"></td>
    </tr>
    <tr>
      <td bgcolor="#669933"><span class="style4 style11"><strong>留言：</strong></span></td>
      <td><textarea name="comment" cols="35" rows="10" id="comment"></textarea></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
          <input name="date_id" type="hidden" id="date_id" value="<%=getRecordID()%>">
          <input type="button" name="button2" value="送出" onClick="check()">
          <input name="reset2" type="reset" id="reset2" value="重新填寫">
      </div></td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  </form>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style18">管理員</a>||<a href="term.jsp" class="style18">名詞搜索</a> || <a href="contact.jsp" class="style18">意見 </a></span></div></td>
  </tr>
</table>
</div>
</body>
<!-- end #footer -->
</div>
</body>
</html>
