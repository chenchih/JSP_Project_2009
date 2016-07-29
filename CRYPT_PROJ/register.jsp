<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊</title>
</head>
<script language="JavaScript" type="text/JavaScript">

 var xmlHttp;

function val_id() {
	var messageArea = document.getElementById("divAccount");
	messageArea.innerHTML = "<font color=red></font>";
    var queryString = createIdQueryString();

//	if(register.userid.value.length<6)  { 
	var uid = document.register.userid.value;
	re1=/^[a-zA-Z0-9]{4,}$/
	if (!re1.test(uid)){
      alert("您輸入的帳號不得少於6~9個字元");
    } else {
      createXMLHttpRequest();
      xmlHttp.onreadystatechange = callback;
      xmlHttp.open("GET", queryString, true);
      xmlHttp.send(null);
	}  
}
function createXMLHttpRequest() {
  if (window.ActiveXObject) {
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } else if (window.XMLHttpRequest) {
      xmlHttp = new XMLHttpRequest();
  }
}

function createIdQueryString() {
    var id=document.register.userid.value; 
	var queryString="xml_validate.jsp?" + "info=" + id + "&type=1" ;
	return queryString;    
}
function callback() {
var messageArea = document.getElementById("divAccount");
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      var source = xmlHttp.responseXML.getElementsByTagName("source")[0].firstChild.nodeValue;
		  var res = xmlHttp.responseXML.getElementsByTagName("res")[0].firstChild.nodeValue;
		  if (source == "1" && res=="f") {
		      //alert("使用者帳號已被其他會員註冊");
messageArea.innerHTML = "<font color=red>使用者帳號已被其他會員註冊</font>";
			  document.register.userid.value=""; 
		  }	
		  else  
		 { messageArea.innerHTML = "<font color=green>ok,帳號可以用</font>"; }
	      if (source == "2" && res=="f") {
		       alert("e-mail帳號已存在");
			   document.register.email.value="" ;
		  }
	   }
   }	   	   
}
function val_email() {
   var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;
   if (!re.test(email)) {
   		alert("請輸入正確的e-mail");
	}else {
   		var queryString = createEmailQueryString(); 
   		createXMLHttpRequest();
   		xmlHttp.onreadystatechange = callback;
   		xmlHttp.open("GET", queryString, true);
   		xmlHttp.send(null);
	}
}
function createEmailQueryString() {
    var email=document.getElementById("email").value; 
	var queryString="xml_validate.jsp?" + "info=" + email + "&type=2";
	return queryString;    
}
function check()
 {
  var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;

		
	if (register.userid.value == "" )
		{ alert("請輸入您的使用者帳號");	}
			else if (register.pwd.value == "" ) 
			{alert("請輸入您的密碼");}
				else if (register.pwd.value != register.rpwd.value ) 
				{alert("您輸入的確認密碼與密碼不符");}
					else if(register.name.value == "" ) 
					{alert("請輸入您的名子");}
						else if(register.gender.value == "" ) 
						{alert("請輸入您的性別");}
							else if (register.year.value=="0" ) 
							{alert("請選擇年");	}
								else if (register.month.value=="0" ) 
								{alert("請選擇月");	}
									else if (register.date.value=="" ) 
									{alert("請輸入日");}
										else if (register.email.value == "" ) 
										{alert("請輸入您的電子郵件")}
												else 
													{
												register.action = "register_check.jsp";
 												register.submit();
												}
}   
function show(o){
 var timenow = new Date().getTime();
 o.src="varify_image.jsp?d="+timenow;

}

</script>

<body>
<p>&nbsp;</p>
<table width="950" align="center" border="1">
  <form name="register" method="post" action="register_check.jsp">
    <tr>
      <td align="center"><font size="7">會員註冊</font></td>
    </tr>
    <tr bgcolor="#999966">
      <td>會員資料</td>
    </tr>
    <tr>
      <td>帳號：
          <input name="userid" id="userid3" type="text" onChange="val_id()">
 <div id="divAccount">Applying an account...</div>
      </td>
    </tr>
    <tr>
      <td>密碼：
          <input name="pwd" type="password" id="pwd">
      </td>
    </tr>
    <tr>
      <td>確認密碼：
          <input name="rpwd" type="password"></td>
    </tr>
    <tr bgcolor="#999966">
      <td>個人資料</td>
    </tr>
    <tr>
      <td>姓名：
          <input name="name" type="text">
          <font color="#FF0000">（必填）</font></td>
    </tr>
    <tr>
      <td>性別：
          <input name="gender" type="radio" value="1" checked>
        男
        <input name="gender" type="radio" value="0">
        女 （必填）</td>
    </tr>
    <tr>
      <td>住址：
          <input name="address" type="text" size="40"></td>
    </tr>
    <tr>
      <td>出生：
        
        年:
          
        <select name="year" id="year">
          <%
	for(int i=1950;i<=1998;i++) {
%>
          <option value="<%= i%>"><%= i%>年</option>
          <%
	}
%>
        </select>
        月:
        <select name="month" id="month">
          <%
	for(int j=1;j<=12;j++) {
%>
          <option value="<%= j%>"><%= j%>月</option>
          <%
	}
%>
        </select>
        日:
        <input name="date" type="text" id="date" size="3">
      <font color="#FF0000">（必填） </font></td>
    </tr>
    <tr>
      <td>電子郵件：
          <input name="email" id="email3" type="text" onChange="val_email()">
        <font color="#FF0000">（必填）</font></td>
    </tr>
    <tr>
      <td>聯絡電話：
          <input name="phone" type="text"></td>
    </tr>
    <tr>
      <td><strong>請輸入驗證碼：</strong><a href="javascript:show(document.getElementById('random'))"><img src="varify_image.jsp" border=0 align="absmiddle"id="random"></a>
        <input type="text" name="rand" maxlength=4 value="">
          <label><font color="#FF0000">（必填）看不清楚驗證碼請點一下圖</font></label></td>
    </tr>
    <tr>
      <td><input type="button" name="button2" value="註冊" onClick="check()">
          <input name="reset2" type="reset" id="reset2" value="重新填寫"></td>
    </tr>
  </form>
</table>
<p>&nbsp;</p>
</body>
</html>
