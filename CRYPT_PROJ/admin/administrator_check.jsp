<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
.style1 {color: #FF0000;
	font-weight: bold;
}
.style2 {color: #000000}
-->
</style>
</head>

<body>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td><p align="center">
      <%
   String userid = request.getParameter("userid2");
   String password = request.getParameter("pwd2");
   
   session.setAttribute("uid",userid);//�Ω�update.jsp��s���A�USQL�Ȫ�����
   
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver");//���J�X�ʵ{�����O
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
       stmt = con.prepareStatement("select * from admin where username=?");
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//����PreparedStatement���󪺤�k����ءA����Select�d�߱ԭz��executeQuery��k�A

	   if (rs.next()) {
	       if (password.equals(rs.getString("password")))
		   	 {
			   response.sendRedirect("all_entry.jsp");
			   //�b���K�X�����T��A���Q�n�J�ܧ�s��
			 }
			  else
			   {
		        out.print("�b���αK�X���ѡI");
				response.setHeader("Refresh","5;URL=admin.jsp");} 	
			   }
			   else {
	   		 out.print("�b���αK�X���ѡI");  response.setHeader("Refresh","5;URL=admin.jsp");
	   				}  		       
     } catch (Exception ex) {
	    ex.printStackTrace();
     } finally {
        if (rs!=null) rs.close();
    	if (stmt!=null) stmt.close();
     } 	   
%>
    </p>
        <p> <span class="style1">(�`�N: ���T���N�b5���۰ʨ�n�J�޲z��) <span class="style2"><a href="http://localhost:8080/acc/bulletin_news.jsp"> �^����</a></span></span><br>
      </p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
