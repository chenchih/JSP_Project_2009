<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.style29 {font-family: "細明體";
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
	  out.print("<a href = signin.jsp target=_parent>登入 </a>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> 登出 </a>");
	}

  
   
%>
      <span class="style29">||</span> <span class="style29"><a href="../../bulletin_news.jsp">相關消息</a> || <a href="../../lesson.jsp">課程 </a>|| <a href="../../forum.jsp">討論區</a> ||<a href="../../message.jsp">留言</a> || <a href="../../linkpage.jsp">連結</a></span></div></td>
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
      <input name="button" type="button" onClick="OpenBut()" value="S-DES 架構圖">
    </font></td>
    <td><input name="button1" type="button" onClick="closed()" id="sample" value="結束程式"></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="">
  <p><b><font color="#FF0000">【S-DES的加密方法：IP的反函數】 3/3 
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
  <p>將前一步驟Fk產生的結果<font color="#00CCFF">    <font SIZE="3"><font SIZE="3"><font color="#009966" size="3">
    
    <strong>
    <% out.print(new_fk4); %>
    </strong></strong></font></font></font></font>
    
    <strong><font color="#009966">
    <input name="IP2_1" type="hidden" id="IP2_1" value="<% out.print(new_fk4); %>" size="7" maxlength="8">
    </font></strong><font color="#009966">    </font>    經由IP的反函數&nbsp; IP<span style="vertical-align: super">-1</span>：(4, 1, 3, 5, 
    7, 2, 8, 6) 重新排列<b><font color="#FF0000">
    <%
  String s[] = new String[8];

	String temp;
	for(int i=0;i<8;i++) 
	{ s[i] =new_fk4.substring(i,i+1);	 }
  String  IPneg[]={s[3],s[0],s[2],s[4],s[6],s[1],s[7],s[5]};
	
  %>
  </font></b></p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <strong><font size="5">↓</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </font> <font color="#0000FF">密文</font></strong><font size="5"><strong><font color="#0000FF">:</font>&nbsp;&nbsp;&nbsp;&nbsp; 
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
  <p>　</p>
  <ul>
    <li><font color="#0000FF">S-DES 解密演算法 </font>的輸入是一個8位元的密文區段，以及一把10位元的鑰匙，這把鑰匙與當<br>
      初加密時所使用的鑰匙相同；它的輸出就是原來的8位元的明文區段。</li>
  </ul>
  <ul>
    <li>解密的程序，它其實就是加密程序的逆運算：<br>
      <font color="#0000FF">明文 = IP<span style="vertical-align: super">-1</span>( 
      fk1 ( SW ( fk2 ( IP ( 密文 ) ) ) ) ) </font> </li>
  </ul>
  <ul>
    <li>請按『下一步』，繼續進行解密的方法</li>
  </ul>
  <p>&nbsp; <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></strong></p>
  <p align="right"> <font size="3">
    <input type="button" name="Submit33" value="下一步" onClick="check2()">
  </font> </p>
</form>
<p><b><font color="#FF0000"></font></b></p>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">管理員</a>||<a href="../../term.jsp" class="style5">名詞搜索</a> || <a href="../../contact.jsp" class="style5">意見 </a></span></div></td>
  </tr>
</table>
</body>
</html>
