<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.style29 {font-family: "�ө���";
	font-size: 16px;
}
a:hover {
	color: #FF0000;
}
.style5 {color: #0000FF}
-->
</style>
</head>

<body>
<table width="200" border="1" align="center">
  <tr>
    <td><img src="pic1.gif" width="800" height="220"></td>
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
      <span class="style29">||</span> <span class="style29"><a href="../../bulletin_news.jsp">��������</a> || <a href="../../lesson.jsp">�ҵ{ </a>|| <a href="../../forum.jsp">�Q�װ�</a> ||<a href="../../message.jsp">�d��</a> || <a href="../../linkpage.jsp">�s��</a></span></div></td>
  </tr>
</table>
<p>
  <script>
function check1() {
	form1.action="2.jsp"
	form1.submit();
}


function OpenBut()
{
var numa = document.form1.p10_hid.value;
var numb = document.form1.k1_hid.value;
var numc = document.form1.k1_hid2.value;
window.open("m2.jsp?p10="+numa+"&k1="+numb+"&k2="+numc, "OpenColse", "toolbar=no, member=no,  height=620, width=750");

}
function closed()
{
window.close();
}
</script>
</p>
<table width="200" border="0" align="right">
  <tr>
    <td><font size="3">
      <input name="button" type="button" onClick="OpenBut()" value="S-DES �[�c��">
    </font></td>
    <td><input name="button1" type="button" onClick="closed()" id="sample" value="�����{��"></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="3-1.jsp">
  <p><font color="#FF0000">�iS-DES���[�K��k�GIP + Fk��ơj 1/3</font></p>
  <p><font color="#0000FF"><b>�@   <br>
    8�줸������G</b></font>
    <input name="num2" type="text" id="num2" value="11110011" size="9" maxlength="8">
    <input type="submit" name="Submit" value="�T�w">
	<%
	String new_k1=request.getParameter("k1");
	String new_k2=request.getParameter("k2");
	String neww_p10=request.getParameter("p10");

	%>
    <input name="k1_hid" type="hidden" id="k1_hid" value="<%=new_k1%>">
    <input name="k1_hid2" type="hidden" id="k1_hid2" value="<%=new_k2%>">
	<input name="p10_hid" type="hidden" id="p10_hid" value="<%=neww_p10%>">

</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <strong><font size="5">��</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <font SIZE="3">�ϥ�IP(2, 6, 3, 1, 4, 8, 5, 7)����孫�s�ƦC</font><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp; </font><font color="#0000FF"> FK<font size="5">:</font></font><font size="5"> 
    </font></strong> 
    <input name="textfield1" type="text" value="       ?" size="8" maxlength="8">
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;</font></strong><font color="#0000FF" size="5">&nbsp;&nbsp;&nbsp;&nbsp; 
    </font><strong><font color="#0000FF">L:</font> </strong> 
    <input name="textfield2" type="text" value="   ?" size="4" maxlength="4">
    <font SIZE="3">Fk������|�Ӧ줸</font></p>
  <font SIZE="3"> 
  <p><strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </font><font color="#0000FF">R: </font></strong> 
    <input name="textfield3" type="text" value="   ?" size="4" maxlength="4">
    <font SIZE="3">Fk���k��|�Ӧ줸</font></p>
  <font SIZE="3"> 
  <p> &nbsp;<font size="5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</strong></font></p>
  &nbsp;<font SIZE="3"><strong>Fk(R,SK) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R�ϥ�<r �ϥ�p><font size="3">&nbsp;�X�R/���ƹB��GE/P(4, 
  1, 2, 3, 2, 3, 4, 1 )</font></strong></font></font></font> <font SIZE="3"><strong><br>
  </strong>��SK��K1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input name="textfield4" type="text" value="     ?" size="7" maxlength="8">
    </font></p>
  <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��</strong> <strong><span class="style5">XOR</span><font color="#FF0000"> 
      K1:</font></strong>  
  </font>
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <input name="textfield5" type="text" value="     ?" size="7" maxlength="8">
    </font></p>
  <p><font size="3"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ��</strong></font></p>
  <p><font size="3"><img border="0" src="s0.bmp" width="111" height="116">�e4�Ӧ줸����1�P��4�X��( 
    <input name="textfield6" type="text" value="  ?" size="3" maxlength="8">
    )�A��2�P��3�X��( 
    <input name="textfield7" type="text" value="  ?" size="3" maxlength="8">
    )�A�YS0�� 
    <input name="textfield10" type="text" value="  ?" size="3" maxlength="8">
    �C 
    <input name="textfield22" type="text" value="  ?" size="3" maxlength="8">
    ��A�Y 
    <input name="textfield14" type="text" value="  ?" size="3" maxlength="8">
    = ( 
    <input name="textfield12" type="text" value="  ?" size="3" maxlength="8">
    )</font></p>
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    �e4�Ӧ줸����1�P��4�X��( 
    <input name="textfield8" type="text" value="  ?" size="3" maxlength="8">
    )�A��2�P��3�X��( 
    <input name="textfield9" type="text" value="  ?" size="3" maxlength="8">
    )�A�YS0�� 
    <input name="textfield11" type="text" value="  ?" size="3" maxlength="8">
    �C 
    <input name="textfield23" type="text" value="  ?" size="3" maxlength="8">
    ��A�Y 
    <input name="textfield15" type="text" value="  ?" size="3" maxlength="8">
    = ( 
    <input name="textfield13" type="text" value="  ?" size="3" maxlength="8">
    )</font></p>
  <p><font size="3">�@<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</strong></font> 
  </p>
  <p><font size="3"><img border="0" src="s1.bmp" width="96" height="111">&nbsp;��S0�PS1���ͪ�4�Ӧ줸 
    <input name="textfield16" type="text" value="  ?" size="3" maxlength="8">
    �g�� P4(2,4,3,1) ���s�ƦC�� 
    <input name="textfield17" type="text" value="  ?" size="3" maxlength="8">
    �Y�� F(R,SK)</font></p>
  <p><font size="3">�@<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</strong></font> 
  </p>
  <p><font color="#0000FF" size="3"><strong>Fk(L,R) = (L��F(R,SK),R) =</strong></font><font size="3"><strong><font color="#FFFF00"> 
    <font color="#0000FF">(</font> </font> 
    <input name="textfield18" type="text" value="  ?" size="3" maxlength="8">
    <font color="#0000FF">��</font> 
    <input name="textfield19" type="text" value="  ?" size="3" maxlength="8">
    <font color="#0000FF">,</font> 
    <input name="textfield20" type="text" value="  ?" size="3" maxlength="8">
    <font color="#0000FF">) </font></strong><font color="#0000FF"><strong>=</strong></font> 
    <input name="textfield21" type="text" value="  ?" size="3" maxlength="8">
    </font></p>
  <p align="right">&nbsp;</p>
</form>
<p>�@</p>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">�޲z��</a>||<a href="../../term.jsp" class="style5">�W���j��</a> || <a href="../../contact.jsp" class="style5">�N�� </a></span></div></td>
  </tr>
</table>
</body>
</html>
