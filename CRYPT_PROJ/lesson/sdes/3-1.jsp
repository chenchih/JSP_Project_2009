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
.style32 {color: #FF0000}
.style34 {color: #0000FF; font-weight: bold; }
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
<p>&nbsp;</p>
<table width="200" border="0" align="right">
  <tr>
    <td><font size="3">
      <input name="button" type="button" onClick="OpenBut()" value="S-DES 架構圖">
    </font></td>
    <td><input name="button1" type="button" onClick="closed()" id="sample" value="結束程式"></td>
  </tr>
</table>
<p>
  <script>
function check1() {
	form1.action="3.jsp"
	form1.submit();
}

function check2() {
	form1.action="4.jsp"
	form1.submit();
}
function OpenBut()
{
var numa = document.form1.p10_hid.value;
var numb = document.form1.k1_hid1.value;
var numc = document.form1.k1_hid2.value;
var numd = document.form1.fk4.value;
var nume = document.form1.ip8.value;
window.open("m3-1.jsp?p10_hid="+numa+"&k1_hid1="+numb+"&k1_hid2="+numc+"&fk4="+numd+"&ip8="+nume, "OpenColse", "toolbar=no, member=no,  height=620, width=750");

}
function closed()
{
window.close();
}
</script>
</p>
<form name="form1" method="post" action="3-1.jsp">
  <p><font color="#FF0000">【S-DES的加密方法：IP + Fk函數】 1/3</font></p>
  <p><font color="#0000FF"><b>　 <br>
    8位元的明文：</b></font> 
    <input name="ip8" type="text" id="ip8" value="<%=request.getParameter("num2")%>" size="9" maxlength="8">
    <%
	String new_k1=request.getParameter("k1_hid");
	String new_k2=request.getParameter("k1_hid2"); 
	String neww_p10=request.getParameter("p10_hid"); 
	
	String IP[] = new String[8];

	for(int i=0;i<8;i++) {
	 IP[i] =  request.getParameter("num2").substring(i,i+1);
     	}	
		
	%>
    <input name="k1_hid2" type="hidden" id="k1_hid2" value="<%=new_k2%>">
    <input name="k1_hid1" type="hidden" id="k1_hid1" value="<%=new_k1%>">
    <input name="p10_hid" type="hidden" id="p10_hid" value="<%=neww_p10%>">
  </p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong><font size="5">↓</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <font SIZE="3">使用IP(2, 6, 3, 1, 4, 8, 5, 7)對明文重新排列</font>FK: 
    <%
	 String IP_1[] ={IP[1],IP[5],IP[2],IP[0],IP[3],IP[7],IP[4],IP[6]};
	 String backup_ip[]=new String [8];
	  String backup_ip2[]=new String [8];
	 backup_ip=IP_1;
	  backup_ip2=IP_1;
	  
	String L[]={IP[1],IP[5],IP[2],IP[0]};
  	String R[]={IP[3],IP[7],IP[4],IP[6]};
 	
	String backup_R[]=new String[4];
	backup_R=R;
   String EP[]={backup_R[3],backup_R[0],backup_R[1],backup_R[2],backup_R[1],backup_R[2],backup_R[3],backup_R[0]};

	 %>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font color="#0000FF"> FK:</font></font>
    <span class="style32">
    <%out.print(IP[1]+IP[5]+IP[2]+IP[0]+IP[3]+IP[7]+IP[4]+IP[6]); %> 
    </font>
    <input name="fk" type="hidden" id="fk" value="<%out.print(IP[1]+IP[5]+IP[2]+IP[0]+IP[3]+IP[7]+IP[4]+IP[6]); %>" size="8" maxlength="8">
    </span>    <span class="style32"><strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;</font></strong><font size="5">&nbsp;</font></span> 
    <strong><font color="#0000FF">L:</font> </strong> 
    <span class="style32">
    <% for(int i=0;i<4;i++) out.print(L[i]); %>
    <input name="fk_l" type="hidden" id="fk_l" value="<% for(int i=0;i<4;i++) out.print(L[i]); %>" size="4" maxlength="4">
    </span>
    <font SIZE="3">Fk的左邊四個位元 </font></p>
   
  <p><font size="3"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <font color="#0000FF">R: </font></strong>
      <span class="style32">
      <% for(int i=0;i<4;i++) out.print(R[i]); %>
      <input name="fk_r" type="hidden" id="fk_r" value="<% for(int i=0;i<4;i++) out.print(R[i]); %>" size="4" maxlength="4">
      </span>    Fk的右邊四個位元</font> </p>
  <font SIZE="3"><font SIZE="3">
  <p> &nbsp;<font size="5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↓</strong></font></p>
  <font SIZE="3"><strong>Fk(R,SK) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R使用<r 使用p><font size="3">&nbsp;擴充/重排運算：E/P(4, 
  1, 2, 3, 2, 3, 4, 1 )</font></strong></font></font></font> <font SIZE="3"><strong><br>
  </strong>此SK為K1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="3"> 
    <%for(int i=0;i<EP.length;i++) out.print(EP[i]);%>
    <input name="ep" type="hidden" id="ep" value="<%for(int i=0;i<EP.length;i++) out.print(EP[i]);%>" size="7" maxlength="8">
    </font><font size="3"><font size="3">
    <%
	 String k1_new=request.getParameter("k1_hid");
	 String q5[] = new String[8];
	 String xor_str;
	 String back_xor[]=new String [8];
	for(int i=0;i<8;i++) 
	{q5[i] = k1_new.substring(i,i+1);}
	 int sum_xor[] = new int [8];
	 for(int i=0;i<8;i++) 
  	{
	 int a1=Integer.parseInt(q5[i]);
     int a2=Integer.parseInt(EP[i]);
     int sum=a1^a2;
     xor_str =Integer.toString(sum); 
     back_xor[i]=xor_str;
	}

     		

		
	 %>
    </font></font> </font></p>
  <p><font size="3"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ↓</strong> <strong><span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;XOR</span><font color="#FF0000"> 
    K1:</font></strong></font> <font SIZE="3"><font size="3"><font size="3"><font size="3">(<span class="style34"><%=request.getParameter("k1_hid")%></span>)</font></font></font></font> 
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="3">
     <% for(int i=0;i<8;i++) out.print(back_xor[i]);%> 
    </font>
    <input name="textfield5" type="hidden" value=" <% for(int i=0;i<8;i++) out.print(back_xor[i]);%> " size="7" maxlength="8">
    <%
	  String X_1[]={back_xor[0],back_xor[1],back_xor[2],back_xor[3]};
	  String X_2[]={back_xor[4],back_xor[5],back_xor[6],back_xor[7]};
    String s0_1a =(X_1[0]+X_1[3]);
	String s0_1b =(X_1[1]+X_1[2]);
	String s1_2a =(X_2[0]+X_2[3]);
	String s1_2b =(X_2[1]+X_2[2]);
	
    long num = Long.parseLong(s0_1a);
    long rem;
    while(num > 0)
		{
      	rem = num % 10;
      	num = num / 10;
        }
       int ssr= Integer.parseInt(s0_1a,2);
//-----------------------------------------------
long num2 = Long.parseLong(s0_1b);
    long rem2;
    while(num2 > 0)
		{
      	rem2 = num2 % 10;
      	num2 = num2 / 10;
        }
       int ssr2= Integer.parseInt(s0_1b,2);	   
	   
//----------------------------------------------
long num3 = Long.parseLong(s1_2a);
    long rem3;
    while(num3 > 0)
		{
      	rem3 = num3 % 10;
      	num3 = num3 / 10;
        }
       int ssr3= Integer.parseInt(s1_2a,2);	   
	  
//-------------------------------------------------
long num4 = Long.parseLong(s1_2b);
    long rem4;
    while(num4 > 0)
		{
      	rem4 = num4 % 10;
      	num4 = num4 / 10;
        }
       int ssr4= Integer.parseInt(s1_2b,2);
//----------------------------------------------------	   
int s23[][]={{1,0,3,2},{3,2,1,0},{0,2,1,3},{3,1,3,2}};
int s24[][]={{0,1,2,3},{2,0,1,3},{3,0,1,0},{2,1,0,3}};

String str_s00=Integer.toBinaryString(s23[ssr][ssr2]| 0x04 ).substring( 1 );
String str_s11=Integer.toBinaryString(s24[ssr3][ssr4]| 0x04 ).substring( 1 );
String str_s22=(str_s00+str_s11);
String p4_ss[] = new String[4];
	for(int i=0;i<4;i++) 
	{ p4_ss[i] = str_s22.substring(i,i+1);	}
String p4_ss2[]={p4_ss[1],p4_ss[3],p4_ss[2],p4_ss[0]};
String fk_zor[]=new String [4];
 String xor_str2;
  String back_xor2[]=new String [4];
for(int i=0;i<4;i++)
{
	 int back_left=Integer.parseInt(L[i]);
     int back_p4_ss2=Integer.parseInt(p4_ss2[i]);
     int sum2=back_left^back_p4_ss2;
     xor_str2 =Integer.toString(sum2); 
	 back_xor2[i]=xor_str2;
}	
	String newarr[]=new String [8];
System.arraycopy(back_xor2,0,newarr,0,4);
System.arraycopy(R,0,newarr,4,4);
%>
    </font></p>
  <p><font size="3"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    ↓</strong></font></p>
  <p><font size="3"><img border="0" src="s0.bmp" width="111" height="116">前4個位元的第1與第4合成( 
    <input name="s0_1" type="text" id="s0_1" value="<%out.print(X_1[0]+X_1[3]);%>" size="2" maxlength="2">
    )，第2與第3合成( 
    <input name="s0_2" type="text" id="s0_22" value="<%out.print(X_1[1]+X_1[2]);%>" size="2" maxlength="2">
    )，即S0的 
    <input name="s0_3" type="text" id="s0_3" value="<% out.println( ssr);%>" size="2" maxlength="1">
    列 
    <input name="s0_4" type="text" id="s0_4" value="<% out.println( ssr2);%>" size="2" maxlength="1">
    行，即 
    <input name="s0_5" type="text" id="s0_5" value="<%out.print(s23[ssr][ssr2]);%>" size="2" maxlength="1">
    = ( 
    <input name="s0_6" type="text" id="s0_6" value="<% out.print(str_s00);%>" size="2" maxlength="2">
    )</font></p>
  <p><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    前4個位元的第1與第4合成( 
    <input name="s1_1" type="text" id="s1_1" value="<%out.print(X_2[0]+X_2[3]);%>" size="2" maxlength="2">
    )，第2與第3合成( 
    <input name="s1_2" type="text" id="s1_2" value="<%out.print(X_2[1]+X_2[2]);%>" size="2" maxlength="2">
    )，即S0的 
    <input name="s1_3" type="text" id="s1_3" value="<% out.println( ssr3);%>" size="2" maxlength="1">
    列 
    <input name="s1_4" type="text" id="s1_4" value="<% out.println( ssr4);%>" size="2" maxlength="1">
    行，即 
    <input name="s1_5" type="text" id="s1_52" value="<%out.print(s24[ssr3][ssr4]);%>" size="2" maxlength="1">
    = ( 
    <input name="s1_6" type="text" id="s1_6" value="<% out.print(str_s11);%>" size="2" maxlength="2">
    )</font></p>
  <p><font size="3">　<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↓</strong></font> 
  </p>
  <p><font size="3"><img border="0" src="s1.bmp" width="96" height="111"> &nbsp;&nbsp;&nbsp;&nbsp;由S0與S1產生的4個位元 
    <input name="s3_1" type="text" id="s3_1" value="<%out.print(str_s00+str_s11);%>" size="3" maxlength="4">
    經由 P4(2,4,3,1) 重新排列為 
    <input name="s3_2" type="text" id="s3_2" value="<%for(int i=0;i<p4_ss2.length;i++) out.print(p4_ss2[i]);%>" size="3" maxlength="4">
    即為 F(R,SK)</font></p>
  <p><font size="3">　<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↓</strong></font> 
  <p><font color="#0000FF" size="3"><strong>Fk(L,R) = (L⊕F(R,SK),R) =</strong></font><font size="3"><strong><font color="#FFFF00"> 
    <font color="#0000FF">(</font> </font> 
    </strong><font size="3">
    <% for(int i=0;i<4;i++) out.print(L[i]); %>
    </font><strong>
    <input name="fk1" type="hidden" id="fk1" value="<% for(int i=0;i<4;i++) out.print(L[i]); %>" size="3" maxlength="4">
    <font color="#0000FF">⊕</font></strong><font size="3">
    <%for(int i=0;i<p4_ss2.length;i++) out.print(p4_ss2[i]);%>
    </font><strong> 
    <input name="fk2" type="hidden" id="fk2" value="<%for(int i=0;i<p4_ss2.length;i++) out.print(p4_ss2[i]);%>" size="3" maxlength="4">
    <font color="#0000FF">,</font> 
    </strong><font size="3">
    <% for(int i=0;i<4;i++) out.print(R[i]); %>
    </font><strong>
    <input name="fk3" type="hidden" id="fk3" value="<% for(int i=0;i<4;i++) out.print(R[i]); %>" size="3" maxlength="4">
    <font color="#0000FF">) </font></strong><font color="#0000FF"><strong>=</strong></font> 
    <span class="style32"><strong><font size="3">
    <%for(int i=0;i<newarr.length;i++) out.print(newarr[i]); %>
    </font>
    <input name="fk4" type="hidden" id="fk4" value="<%for(int i=0;i<newarr.length;i++) out.print(newarr[i]); %>" size="6" maxlength="8">
    </strong></span></font></p>
  <p align="right"><font size="3">
    <input type="button" name="Submit33" value="下一步" onClick="check2()">
    </font></p>
</form>
<p>　</p>
<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">管理員</a>||<a href="../../term.jsp" class="style5">名詞搜索</a> || <a href="../../contact.jsp" class="style5">意見 </a></span></div></td>
  </tr>
</table>
</body>
</html>
