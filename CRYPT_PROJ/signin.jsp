<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員登入</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<body bgcolor="#FFFFFF">
<p> 
  <script> 
function check1() {
	form1.action="signin_check.jsp"
	form1.submit();
}

</script>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="70%" height="188" border="1" align="center">
  
  <tr> 
    <td width="51%"><div align="center"><img src="networksec.gif" width="185" height="177"></div></td>
    <td width="49%">
	<form name="form1" method="post" action="">
      <table width="300" align="center">
        <tr>
          <td>
            <fieldset>
            <legend><font color="#0000FF">會員登入</font></legend>
            帳號：
            <input name="userid" type="text" id="userid2">
            <br>
      密碼：
      <input type="password" name="pwd">
      <br>
            </fieldset>
            <center>
              <input type="submit" name="Submit" value="登入" onClick="check1()">
              <input type="reset" name="reset" value="重新填寫">
        (<a href="register.jsp">立即註冊</a>)
          </center></td>
        </tr>
      </table>
    </form>    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
