<%@ page contentType = "text/html; charset=big5"
    import="java.util.*, java.text.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|���n�J</title>
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
            <legend><font color="#0000FF">�|���n�J</font></legend>
            �b���G
            <input name="userid" type="text" id="userid2">
            <br>
      �K�X�G
      <input type="password" name="pwd">
      <br>
            </fieldset>
            <center>
              <input type="submit" name="Submit" value="�n�J" onClick="check1()">
              <input type="reset" name="reset" value="���s��g">
        (<a href="register.jsp">�ߧY���U</a>)
          </center></td>
        </tr>
      </table>
    </form>    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
