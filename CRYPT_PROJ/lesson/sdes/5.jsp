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
	form1.action="4.jsp"
	form1.submit();
}

function check2() {
	form1.action="6.jsp"
	form1.submit();
}
	function OpenBut()
{

var numa = document.form1.p10_hid.value;
var numb = document.form1.k1_hid1.value;
var numc = document.form1.k1_hid2.value;
var numd = document.form1.new_fk4_1.value;
var nume = document.form1.IP2_1.value;
var numf = document.form1.IP2_2.value;
var numg = document.form1.new_ip8.value;

window.open("m5.jsp?p10_hid="+numa+"&k1_hid1="+numb+"&k1_hid2="+numc+"&new_fk4_1="+numd+"&IP2_1="+nume+"&IP2_2="+numf+"&new_ip8="+numg, "OpenColse", "toolbar=no, member=no,  height=620, width=750");

//form1.action="m5.jsp"
////form1.submit();
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
<form name="form1" method="post" action="">
  <p><b><font color="#FF0000">�iS-DES���[�K��k�GIP���Ϩ�ơj 3/3 
    <%
  String new_fk4=request.getParameter("fk4");
  String new_k1=request.getParameter("k1_hid1");
  String new_k2=request.getParameter("k1_hid2");
  String new_fk4_1=request.getParameter("textfield110");
    String neww_p10=request.getParameter("p10_hid");
	  String new_ip8=request.getParameter("new_ip8");
  
  %>
    <input name="k1_hid2" type="hidden" id="k1_hid2" value="<%=new_k2%>">
    <input name="k1_hid1" type="hidden" id="k1_hid22" value="<%=new_k1%>">
    <input name="p10_hid" type="hidden" id="p10_hid" value="<%=neww_p10%>">
    <input name="new_ip8" type="hidden" id="new_ip8" value="<%=new_ip8%>">
    <input name="new_fk4_1" type="hidden" id="new_fk4_1" value="<%=new_fk4_1%>">
    </font></b></p>
  <p>�N�e�@�B�JFk���ͪ����G<font color="#00CCFF">    <font SIZE="3"><font SIZE="3"><font color="#009966" size="3">
    
    <strong>
    <% out.print(new_fk4); %>
    </strong></strong></font></font></font></font>
    
    <strong><font color="#009966">
    <input name="IP2_1" type="hidden" id="IP2_1" value="<% out.print(new_fk4); %>" size="7" maxlength="8">
    </font></strong><font color="#009966">    </font>    �g��IP���Ϩ��&nbsp; IP<span style="vertical-align: super">-1</span>�G(4, 1, 3, 5, 
    7, 2, 8, 6) ���s�ƦC<b><font color="#FF0000">
    <%
  String s[] = new String[8];

	String temp;
	for(int i=0;i<8;i++) 
	{ s[i] =new_fk4.substring(i,i+1);	 }
  String  IPneg[]={s[3],s[0],s[2],s[4],s[6],s[1],s[7],s[5]};
	
  %>
  </font></b></p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <strong><font size="5">��</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </font> <font color="#0000FF">�K��</font></strong><font size="5"><strong><font color="#0000FF">:</font>&nbsp;&nbsp;&nbsp;&nbsp; 
    </strong> </font> 
    <font SIZE="3"><font SIZE="3"><font size="3"><font size="3"><font SIZE="3"><font size="3">
    <font color="#00FF00"><font color="#000000">
    <font color="#00CCFF">
    <font color="#009966">
    <strong>
    <% for(int i=0;i<IPneg.length;i++) out.print(IPneg[i]); %>
    </strong></font></font></font></font></font></font></font></font></font></font><strong><font color="#009966">
    <input name="IP2_2" type="hidden" id="IP2_2" value="<% for(int i=0;i<IPneg.length;i++) out.print(IPneg[i]); %>" size="6" maxlength="8">
    </font></strong><font color="#009966">    </font><font color="#009966" size="5">&nbsp;&nbsp;</font><font color="#00CCFF" size="5"> <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong></font></p>
  <p>�@</p>
  <ul>
    <li><font color="#0000FF">S-DES �ѱK�t��k </font>����J�O�@��8�줸���K��Ϭq�A�H�Τ@��10�줸���_�͡A�o���_�ͻP��<br>
      ��[�K�ɩҨϥΪ��_�ͬۦP�F������X�N�O��Ӫ�8�줸������Ϭq�C</li>
  </ul>
  <ul>
    <li>�ѱK���{�ǡA�����N�O�[�K�{�Ǫ��f�B��G<br>
      <font color="#0000FF">���� = IP<span style="vertical-align: super">-1</span>( 
      fk1 ( SW ( fk2 ( IP ( �K�� ) ) ) ) ) </font> </li>
  </ul>
  <ul>
    <li>�Ы��y�U�@�B�z�A�~��i��ѱK����k</li>
  </ul>
  <p>&nbsp; <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></strong></p>
  <p align="right"> <font size="3">
    <input type="button" name="Submit33" value="�U�@�B" onClick="check2()">
  </font> </p>
</form>
<p><b><font color="#FF0000"></font></b></p>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">�޲z��</a>||<a href="../../term.jsp" class="style5">�W���j��</a> || <a href="../../contact.jsp" class="style5">�N�� </a></span></div></td>
  </tr>
</table>
</body>
</html>
