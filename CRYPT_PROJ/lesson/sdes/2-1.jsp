<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
.style29 {font-family: "�ө���";
	font-size: 16px;
}
a:hover {
	color: #FF0000;
}
.style5 {color: #0000FF}
.style30 {color: #FF0000}
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
	form1.action="1.jsp"
	form1.submit();
}

function check2() {
	form1.action="3.jsp"
	form1.submit();
}
	function OpenBut()
{
var numa = document.form1.p10.value;
var numb = document.form1.k1.value;
var numc = document.form1.k2.value;
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
<p>
  <%
	String s[] = new String[10];

	for(int i=0;i<10;i++) {
	 s[i] =  request.getParameter("num").substring(i,i+1);
     	}	
	%>
</p>
<form name="form1" method="post" action="">
  <p>�i<font color="#FF0000">S-DES���_�Ͳ��ͤ�k</font>�j</p>
  <p><font color="#0000FF"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P10<br>
    (10�줸���_��)�G</b></font>
      <input name="p10" type="text" id="p10" value="<%=request.getParameter("num")%>" size="10" maxlength="10">
      <%
	String n1[]={s[2],s[4],s[1],s[6],s[3]};
	String n2[]={s[9],s[0],s[8],s[7],s[5]};
String temp;
temp=n2[0];
n2[0]=n2[1];
n2[1]=temp;

temp=n2[1];
n2[1]=n2[2];
n2[2]=temp;

temp=n2[2];
n2[2]=n2[3];
n2[3]=temp;

temp=n2[3];
n2[3]=n2[4];
n2[4]=temp;
String backup_n2 []=new String [5];
backup_n2=n2;
//----------------
temp=n1[0];
n1[0]=n1[1];
n1[1]=temp;

temp=n1[1];
n1[1]=n1[2];
n1[2]=temp;

temp=n1[2];
n1[2]=n1[3];
n1[3]=temp;

temp=n1[3];
n1[3]=n1[4];
n1[4]=temp;
String backup_n1 []=new String [5];
backup_n1=n1;
String newarr1[]=new String [10]; 

System.arraycopy(backup_n1,0,newarr1,0,5);
System.arraycopy(backup_n2,0,newarr1,5,5);
String SetP8[]={newarr1[5],newarr1[2],newarr1[6],newarr1[3],newarr1[7],newarr1[4],newarr1[9],newarr1[8]};
String k2[]=new String [10];
k2=newarr1;
String k2_1[]={k2[0],k2[1],k2[2],k2[3],k2[4]};
String k2_2[]={k2[5],k2[6],k2[7],k2[8],k2[9]};

	String temp2;
temp2=k2_1[0];
k2_1[0]=k2_1[2];
k2_1[2]=temp2;

temp2=k2_1[2];
k2_1[2]=k2_1[4];
k2_1[4]=temp2;

temp2=k2_1[1];
k2_1[1]=k2_1[3];
k2_1[3]=temp2;

temp2=k2_1[3];
k2_1[3]=k2_1[4];
k2_1[4]=temp2;
String backup_k2_1 []=new String [5];
backup_k2_1=k2_1;
//----------------------

temp2=k2_2[0];
k2_2[0]=k2_2[2];
k2_2[2]=temp2;

temp2=k2_2[2];
k2_2[2]=k2_2[4];
k2_2[4]=temp2;

temp2=k2_2[1];
k2_2[1]=k2_2[3];
k2_2[3]=temp2;

temp2=k2_2[3];
k2_2[3]=k2_2[4];
k2_2[4]=temp2;
String backup_k2_2 []=new String [5];
backup_k2_2=k2_2;
//------------------------
String newarr2[]=new String [10];
System.arraycopy(backup_k2_1,0,newarr2,0,5);
System.arraycopy(backup_k2_2,0,newarr2,5,5);
String SetP8_2[]={newarr2[5],newarr2[2],newarr2[6],newarr2[3],newarr2[7],newarr2[4],newarr2[9],newarr2[8]};
	%>
</p>
  <p>&nbsp;&nbsp; <strong><font size="5"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</font></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�NP10(k1, k2, k3, k4, k5, k6, k7, k8, k9, k10)���s<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ƦC��P10(k3, k5, k2, k7, k4, k10, k1, k9, k8, k6)<br>
<strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong> 
<span class="style30">
<%out.print(s[2]+s[4]+s[1]+s[6]+s[3]+s[9]+s[0]+s[8]+s[7]+s[5]);%>
 <strong>
 <input name="p10_1" type="hidden" id="p10_1" value="<%out.print(s[2]+s[4]+s[1]+s[6]+s[3]+s[9]+s[0]+s[8]+s[7]+s[5]);%>" size="10" maxlength="10">
    </strong></font>    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="5"></font></strong></span></p>
  <p><strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���O��e5�Ӧ줸�P��5�Ӧ줸���`������(LS-1)<br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style30">
    <%for(int i=0;i<5;i++) out.print(n1[i]);%>
    <input name="ls1_1" type="hidden" id="ls1_1" value="<%for(int i=0;i<5;i++) out.print(n1[i]);%>" size="5" maxlength="5">
&nbsp;&nbsp;&nbsp;&nbsp;    
<%for(int i=0;i<5;i++) out.print(n2[i]);%>
    <input name="ls1_2" type="hidden" id="ls1_2" value="<%for(int i=0;i<5;i++) out.print(n2[i]);%>" size="5" maxlength="5">
    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���ʧ@(�κ٬�����)&nbsp;&nbsp;&nbsp; </p>
  <p>�@</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp; </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �g�� LS-1 �Ҳ��ͪ����5�줸���r<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��,�N�o��Ӧr��`��������Ӧ줸</p>
  <p><b>&nbsp;</b><font color="#0000FF"><b>&nbsp; K1:</b>&nbsp;&nbsp; </font>&nbsp;
    <span class="style30">
    <% for(int i=0;i<SetP8.length;i++) out.print(SetP8[i]);  %>
    <input name="k1" type="hidden" id="k1" value="<% for(int i=0;i<SetP8.length;i++) out.print(SetP8[i]);  %>" size="8" maxlength="8">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
<%for(int i=0;i<5;i++) out.print(backup_k2_1[i]);%>
    <input name="ls2_1" type="hidden" id="ls2_1" value="<%for(int i=0;i<5;i++) out.print(backup_k2_1[i]);%>" size="5" maxlength="5">
    <%for(int i=0;i<5;i++) out.print(backup_k2_2[i]);%>
    <input name="ls2_2" type="hidden" id="ls2_2" value="<%for(int i=0;i<5;i++) out.print(backup_k2_2[i]);%>" size="5" maxlength="5">
&nbsp; </span></p>
  <p>�ޥ�P8(6, 3, 7, 4, 8, 5, 10 ,9)�o<br>
    �ӵ{�� , �q10�Ӧ줸�̨��X��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><font size="5">&nbsp;&nbsp; �� </font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�A�@���ϥ� P8 �Ӳ��� K2<br>
    ��8�Ӧ줸�ӭ��s�ƦC,���G�|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
    ���Ĥ@��l�_��(K1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#0000FF">&nbsp; 
    &nbsp; <b>&nbsp;&nbsp;&nbsp;K2:</b> </font>&nbsp;&nbsp;&nbsp;
    <%for(int i=0;i<SetP8_2.length;i++) out.print("<font color=red>"+SetP8_2[i]+"</font>");%>
    <input name="k2" type="hidden" id="k22" value="<%for(int i=0;i<SetP8_2.length;i++) out.print(SetP8_2[i]);%>" size="8" maxlength="8">
&nbsp;&nbsp;&nbsp;&nbsp; </p>
  <p align="right">�@�@<font size="3">
  	<input type="button" name="Submit32" value="²��" onClick="check1()">
  </font><font size="3">
   <input type="button" name="Submit33" value="�U�@�B" onClick="check2()">
  </font></p>
</form>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">�޲z��</a>||<a href="../../term.jsp" class="style5">�W���j��</a> || <a href="../../contact.jsp" class="style5">�N�� </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
