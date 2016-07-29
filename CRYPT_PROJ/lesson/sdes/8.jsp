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
<table width="200" border="1" align="center">
  <tr>
    <td><img src="pic1.gif" width="800" height="220" /></td>
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
      <input name="button" type="button" onclick="OpenBut()" value="S-DES 架構圖" />
    </font></td>
    <td><input name="button1" type="button" onclick="closed()" id="sample" value="結束程式" /></td>
  </tr>
</table>
<p>&nbsp;</p>
<form name="form1" method="post" action="2.jsp">
  <p><strong>【<font color="#FF0000">S-DES的解密方法：IP的反函數】 3/3<b><font color="#FF0000"> 
    <script>
  	function OpenBut()
{

var numa = document.form1.p10_hid.value;
var numb = document.form1.k1_hid15.value;
var numc = document.form1.k1_hid2.value;
var numd = document.form1.new_ip8.value;
var nume = document.form1.new_fk4_1.value;
var numf = document.form1.IP2_18.value;
var numg = document.form1.ip8_num16.value;
var numh = document.form1.fk4_2.value;
var numi = document.form1.textfield110.value;
var numj = document.form1.textfield.value;

window.open("m8.jsp?p10_hid="+numa+"&k1_hid1="+numb+"&k1_hid2="+numc+"&new_ip8="+numd+"&new_fk4_1="+nume+"&IP2_1="+numf+"&ip8_num1="+numg+"&fk4_2="+numh+"&textfield110="+numi+"&textfield="+numj, "OpenColse", "toolbar=no, member=no,  height=620, width=750");
}
function closed()
{
window.close();
}

</script>
    <%
  String new_fk4=request.getParameter("fk4");
  String new_k1=request.getParameter("k1_hid123");
  String new_k2=request.getParameter("k1_hid2");
   String p10_hid=request.getParameter("p10_hid");
	  String new_ip8=request.getParameter("new_ip8");
	    String new_fk4_1=request.getParameter("new_fk4_1");
		 String IP2_1=request.getParameter("IP2_12");
		 String ip8_num1=request.getParameter("ip8_num12");
		   String fk4_2=request.getParameter("fk4_2");
  %>
    </font></b></font></strong><b><font color="#FF0000"> 
    <input name="k1_hid2" type="hidden" id="k1_hid2" value="<%=new_k2%>" />
    <input name="k1_hid15" type="hidden" id="k1_hid22" value="<%=new_k1%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="p10_hid" type="hidden" id="k1_hid1" value="<%=p10_hid%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="new_ip8" type="hidden" id="k1_hid12" value="<%=new_ip8%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="new_fk4_1" type="hidden" id="k1_hid13" value="<%=new_fk4_1%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="IP2_18" type="hidden" id="k1_hid14" value="<%=IP2_1%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="ip8_num16" type="hidden" id="IP2_1" value="<%=ip8_num1%>" />
    </font></b><b><font color="#FF0000"> 
    <input name="fk4_2" type="hidden" id="ip8_num1" value="<%=fk4_2%>" />
    </font></b></p>
  <p>將前一步驟Fk產生的結果<font color="#009966">
    <% out.print(new_fk4);%>
  </font> 
    <input name="textfield110" type="hidden" value="<% out.print(new_fk4);%>" size="7" maxlength="8">
    經由IP的反函數&nbsp; IP<span style="vertical-align: super">-1</span>：(4, 1, 3, 5, 
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
    </font> <font color="#0000FF">密文</font></strong><font size="5"><strong><font color="#0000FF">:</font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#009966"> 
    </font></strong> </font> 
    <font color="#009966">
    <% for(int i=0;i<IPneg.length;i++) out.print(IPneg[i]); %>
    </font>
    <input name="textfield" type="hidden" value="<% for(int i=0;i<IPneg.length;i++) out.print(IPneg[i]); %>" size="6" maxlength="8">
    <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></strong></p>
  <p>　</p>
  <p><font color="#FF0000"><strong>【S-DES的分析】</strong></font></p>
  <blockquote> 用暴力法來破解精簡版的DES是絕對可行的。對於10位元的鑰匙來說，總共只有<br>
    2<span style="vertical-align: super">10</span>= 1024 把可能的鑰匙。對任意的密文而言，攻擊者可以嘗試每一把鑰匙，並<br>
    分析其結果是不是合理的明文。</blockquote>
  <p>&nbsp; <strong><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></strong></p>
  <p align="right">
    <input type="submit" name="Submit" value="重新開始">
  </p>
</form>
<p>&nbsp;</p>
<hr />
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style29"><a href="../../admin/admin.jsp" target="_blank" class="style5">管理員</a>||<a href="../../term.jsp" class="style5">名詞搜索</a> || <a href="../../contact.jsp" class="style5">意見 </a></span></div></td>
  </tr>
</table>
