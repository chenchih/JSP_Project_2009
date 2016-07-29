<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
</head>

<body>
<p>&nbsp;</p>
<form id="test" name="test" method="post" action="">
  <p>
    <%
int a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0,i=0,j=0, score=0;
String question1=request.getParameter("Q1");
String question2=request.getParameter("Q2");
String question3=request.getParameter("Q3");
String question4=request.getParameter("Q4");
String question5=request.getParameter("Q5");
String question6=request.getParameter("Q6");
String question7=request.getParameter("Q7");
String question8=request.getParameter("Q8");
String question9=request.getParameter("Q9");
String question10=request.getParameter("Q10");
   String userid = (String)session.getAttribute("userid");
if(question1.equals("1"))
	{a=10; out.print("1):答對"+"<img src='check.gif'><br>");}
		else {out.print("1):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question2.equals("1"))
	{b=10; out.print("2):答對"+"<img src='check.gif'><br>");}
		else {out.print("2):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question3.equals("3"))
	{c=10; out.print("3):答對"+"<img src='check.gif'><br>");}
		else {out.print("3):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question4.equals("1"))
	{d=10; out.print("4):答對"+"<img src='check.gif'><br>");}
		else {out.print("4):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
if(question5.equals("3"))
	{e=10; out.print("5):答對"+"<img src='check.gif'><br>");}
		else {out.print("5):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question6.equals("4"))
	{f=10; out.print("6):答對"+"<img src='check.gif'><br>");}
		else {out.print("6):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question7.equals("1"))
	{g=10; out.print("7):答對"+"<img src='check.gif'><br>");}
		else {out.print("7):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question8.equals("2"))
	{h=10; out.print("8):答對"+"<img src='check.gif'><br>");}
		else {out.print("8):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}
		
if(question9.equals("2"))
	{i=10; out.print("9):答對"+"<img src='check.gif'><br>");}
		else {out.print("9):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}

if(question10.equals("1"))
	{j=10; out.print("10):答對"+"<img src='check.gif'><br>");}
	else {out.print("10):<font color=red> 答錯"+"<img src='wrong.gif'><br></font>");	}

score=a+b+c+d+e+f+g+h+i+j;

if(score<=50){out.print("<br>你的測驗成績是:<font color=red>"+score+"<br> </font>");}
else {out.print("<br>你的測驗成績是:"+score+"<br>");}
 

%>
    <input name="textfield" type="hidden" value="score" />
	<%
	String type= "DES2";
	application.setAttribute("score", String.valueOf(score));
	application.setAttribute("type", String.valueOf(type));
	response.setHeader("Refresh","2;URL=inputgrade.jsp");%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;  </p>
</form>
</body>
</html>
