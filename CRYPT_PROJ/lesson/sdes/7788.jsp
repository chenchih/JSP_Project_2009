<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
</head>

<body>
<script>
function OpenBut()
{
var num = document.form1.num2.value;
var num2 = document.form1.pwd.value;
window.open("8899.jsp?num2="+num+"&pwd="+num2, "OpenColse", "toolbar=no, member=no, left=100, top=100");

}
function closed()
{
window.close();
}

</script>
<table width="200" border="0" align="right">
  <tr>
    <td width="110
	"><form name="form3" method="post" action="map.jsp">
        <input name="button" type="button" onClick="OpenBut()" value="sumbit2">
    </form></td>
    <td width="70"><form name="form2" method="post" action="">
        <input name="button1" type="button" onClick="closed()" id="sample" value="結束程式">
    </form></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="8899.jsp">
  <p>
    名字
      <input name="num2" type="text" id="num2" size="20" maxlength="8">    
    <input type="submit" name="Submit" value="確定">
  </p>
  <p>
    <input name="pwd" type="text" id="pwd" size="20" maxlength="8">
  </p>
</form>
<p>&nbsp;</p>
</body>
</html>
