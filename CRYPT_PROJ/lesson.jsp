<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L���D���</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style10 {color: #000000}
.style11 {
	font-family: "�s�ө���";
	color: #000000;
}

.style14 {color: #0000FF}
.style17 {font-family: "�ө���";
	font-size: 16px;
}

body,td,th {
	color: #000000;
}


-->
</style>
</head>
<SCRIPT Language=javascript>
<!--
//�^�� �s��Page.htm ���O���s�����
function sdes()
{
	open("lesson/sdes/1.jsp");
	//�Npage.htm�}�Ҧb�ثe���s������
}
function aes1()
{
	open("lesson/aes/aes1.jsp");
	//�Npage.htm�}�Ҧb�ثe���s������
}
function aes2()
{
	open("lesson/aes/AESDemo.exe");
	//�Npage.htm�}�Ҧb�ثe���s������
}

-->
</SCRIPT>

<body>
<div id="wrapper">
	<div id="header">
	  <div id="logo"></div>
	  <div id="search"></div>
		<!-- end #search -->
	</div>
	<!-- end #header -->
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right"><span class="style17">
          <%
   String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals(""))
	{
	  out.print(""); 
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>�n�J </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  �n�X </a> </font>");
	}

  
   
%>
          ||</span> <span class="style17"><a href="bulletin_news.jsp" class="style14">��������</a> || <a href="lesson.jsp" class="style14">�ҵ{</a> || <a href="forum.jsp" class="style14">�Q�װ�</a> ||<a href="message.jsp" class="style14">�d��</a> || <a href="linkpage.jsp" class="style14">�s��</a></span> l  </div></td>
      </tr>
    </table>
	<!-- end #menu -->
<p>
  <%
	  String name=((String)session.getAttribute("userid")); 
	
     
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
	String sample="�Ҹ�", sample2="�Ҹ�", sample1="�Ҹ�",sample3="�Ҹ�";
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
	stmt=con.prepareStatement("select id, userid, type, score from score where userid='" +name+"'ORDER BY id asc");
		 rs = stmt.executeQuery();
		while(rs.next())
		  {
		 	String unit=rs.getString("score");
	        String type=rs.getString("type");
			int value=Integer.parseInt(unit);
		
			if(type.equals("DES"))
				{	
				sample="���s�Ҹ�";
				
				}
			else if(type.equals("AES"))
				{	
				sample2="���s�Ҹ�";
			
				}
				else if(type.equals("DES2"))
				{	
				sample1="���s�Ҹ�";
			
				}
				else if(type.equals("RSA"))
				{	
				sample3="���s�Ҹ�";
			
				}
					
			}
			
			
		
		%>
</p>
<form id="form1" name="form1" method="post" action="">
  <table width="778" border="1" align="center">
    <tr bgcolor="#FFFF00">
      <th width="170" scope="row"><div align="center" class="style10">���O</div></th>
      <th width="217" scope="row"><div align="center" class="style10">����</div></th>
      <th width="210" scope="row"><div align="center" class="style10">�y�{²��</div></th>
      <th width="153" scope="row"><span class="style10">�{����@</span></th>
      <th width="153" scope="row"><span class="style10">�u�W����</span></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">�䥦</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">�[�ѱK�޳N</div></td>
      <td scope="row"><div align="center">����ʬ�s��</div></td>
      <td scope="row"><div align="center"></div></td>
      <td scope="row"><div align="center"><a href="sdes.jsp" class="style14"></a></div></td>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">��٪��_�[�K</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">DES</div></td>
      <td scope="row"><div align="center"><a href="des_intro.jsp" class="style14">DES²��</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/sdes/1.jsp" class="style14">�}�l</a></div></td>
      <th scope="row"><div align="center">
        <% if(sample.equals("�Ҹ�"))  out.print("<a href = des.jsp target=_parent><font color=blue> �Ҹ� </a></font> "); else if(sample.equals("���s�Ҹ�"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> ���s�Ҹ� </a> </font>"); %>
||
<% if(sample1.equals("�Ҹ�"))  out.print("<a href = sdes.jsp target=_parent><font color=blue> �Ҹ� </a></font> "); else if(sample1.equals("���s�Ҹ�"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> ���s�Ҹ� </a> </font>"); %>
</div></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style10">���}�����_�[�K</div></td>
      <td bgcolor="#FFFFFF" scope="row"><div align="center" class="style10">AES</div></td>
      <td scope="row"><div align="center"><a href="aes_intro.jsp" class="style14">AES²��</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/aes/aes1.jsp" class="style14">�}�l</a>||<a href="AES.jar" class="style14">�}�l</a></div></td>
      <th scope="row"><% if(sample2.equals("�Ҹ�"))  out.print("<a href = aes.jsp target=_parent><font color=blue> �Ҹ� </a></font> "); else if(sample2.equals("���s�Ҹ�"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> ���s�Ҹ� </a> </font>"); %></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11"><span class="style10">�D��٪��_�[�K</span></div></td>
      <td scope="row"><div align="center"><span class="style10">RSA</span></div></td>
      <td scope="row"><div align="center"><a href="aes_intro.jsp" class="style14">RSA²��</a></div></td>
      <td scope="row"><div align="center"><a href="RSA.jar" class="style14">�}�l</a></div></td>
      <th scope="row"><% if(sample3.equals("�Ҹ�"))  out.print("<a href = rsa.jsp target=_parent><font color=blue> �Ҹ� </a></font> "); else if(sample3.equals("���s�Ҹ�"))  out.print("<a href = resettest.jsp target=_parent> <font color=blue> ���s�Ҹ� </a> </font>"); %></th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11">�j��[�K�k</div></td>
      <td scope="row"><div align="center"><span class="style10">Caesar Cipher</span>�ͼ��[�K�k</div></td>
      <td scope="row"><div align="center"><a href="http://en.wikipedia.org/wiki/Caesar_cipher" target="_blank" class="style14">�~���s��</a></div></td>
      <td scope="row"><div align="center"><a href="lesson/caesar_plain.jsp" class="style14">�}�l</a></div></td>
      <th scope="row">&nbsp;</th>
    </tr>
    <tr>
      <td scope="row"><div align="center" class="style11">�j��[�K�k</div></td>
      <td scope="row"><div align="center"><span class="style11"><span class="style10">XOR �[�K </span></span></div></td>
      <td scope="row"><div align="center"><a href="xpr.jsp" class="style14">XOR</a></div></td>
      <td scope="row"><div align="center"><a href="XOR.jar" class="style14">�}�l</a></div></td>
      <th scope="row">&nbsp;</th>
    </tr>
  </table>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
</form>
<!-- end #footer -->
<hr />
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style17"><a href="admin/admin.jsp" target="_blank" class="style14">�޲z��</a>||<span class="style14"><a href="term.jsp" class="style14">�W���j��</a><a href="term.jsp"></a></span> || <a href="contact.jsp" class="style14">�N�� </a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</body>
</html>
