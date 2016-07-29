<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body>

<%
String a=request.getParameter("a");
String b=request.getParameter("b");

	 String q5[] = new String[8];
	 String s5[] = new String[8];
	 String xor_str;
	 String back_xor[]=new String [8];
	for(int i=0;i<8;i++) 
	{q5[i] = a.substring(i,i+1);}
	
	for(int j=0;j<8;j++) 
	{s5[i] = b.substring(j,j+1);}

	 int sum_xor[] = new int [8];

	 for(int i=0;i<8;i++) 
  	{
	 int a1=Integer.parseInt(q5[i]);
     int a2=Integer.parseInt(s5[i]);
     int sum=a1^a2;
     xor_str =Integer.toString(sum); 
     back_xor[i]=xor_str;
	}

     	

		
	 %>	
</body>
</html>
