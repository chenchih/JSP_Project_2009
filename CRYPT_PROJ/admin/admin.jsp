<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
  <script> 
function check2() {
	form1.action="administrator_check.jsp"
	form1.submit();
}

</script>
<body bgcolor="#FFFFFF">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="70%" height="188" border="1" align="center">
  
  <tr> 
    <td width="55%"><div align="center"><img src="networksec.gif" width="185" height="177"></div></td>
    <td width="45%"><form name="form1" method="post" action="">
      <table width="300" align="center">
        <tr>
          <td><fieldset>
            <legend><font color="#0000FF">管理員</font></legend>
            帳號：
            <input name="userid2" type="text" id="userid22">
            <br>
            密碼：
            <input type="password" name="pwd2">
            <br>
            </fieldset>
              <center>
                <font size="3"> </font>
                <input type="submit" name="Submit2" value="登入" onClick="check2()">
                <input type="reset" name="reset2" value="重新填寫">
                <font size="3"> </font>
            </center></td>
        </tr>
      </table>
        </form>    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
