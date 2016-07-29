<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊</title>
</head>
<script language="JavaScript" type="text/JavaScript">

 var xmlHttp;
 
function doSearchMonth() {
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleYearChange;
    xmlHttp.open("GET", "xml_month.jsp", true);
    xmlHttp.send(null);
}
function createXMLHttpRequest() {
  if (window.ActiveXObject) {
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } else if (window.XMLHttpRequest) {
      xmlHttp = new XMLHttpRequest();
  }
}
function handleYearChange() {
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      updateMonth();
	   }
   }	   	   
}
function updateMonth() {
	clearMonthList();
   var c = document.getElementById("month");
   var results = xmlHttp.responseXML.getElementsByTagName("ms");
   var option = null;
   var id;
   var month;
   option = document.createElement("option");
   option.setAttribute("value","0");
   option.appendChild(document.createTextNode("請選擇"));
   c.appendChild(option); 
   for (var i=0;i<results.length;i++)
   {
      id = results[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
	  month = results[i].getElementsByTagName("month")[0].childNodes[0].nodeValue;
      option = document.createElement("option");
	  option.setAttribute("value",id);
	  option.appendChild(document.createTextNode(month));
	  c.appendChild(option);
   }
}
function clearMonthList() {
   var c = document.getElementById("month");
   while (c.childNodes.length > 0) {
       c.removeChild(c.childNodes[0]);
   }  
}
function val_id() {
    var queryString = createIdQueryString();
	if(register.userid.value.length<6)  { 
      alert("您輸入的帳號不得少於6個字元");
    } else {
      createXMLHttpRequest();
      xmlHttp.onreadystatechange = callback;
      xmlHttp.open("GET", queryString, true);
      xmlHttp.send(null);
	}  
}
function createIdQueryString() {
    var id=document.getElementById("userid").value; 
	var queryString="xml_validate.jsp?" + "info=" + id + "&type=1" ;
	return queryString;    
}
function callback() {
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      var source = xmlHttp.responseXML.getElementsByTagName("source")[0].firstChild.nodeValue;
		  var res = xmlHttp.responseXML.getElementsByTagName("res")[0].firstChild.nodeValue;
		  if (source == "1" && res=="f") {
		      alert("使用者帳號已被其他會員註冊");
			  document.getElementById("userid").value="";
		  }	  
	      if (source == "2" && res=="f") {
		       alert("e-mail帳號已存在");
			   document.getElementById("email").value="";
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
function check() {
	register.action = "register_check.jsp";
    egister.submit();
}

</script>

<body>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;	
   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
   															
%>
<table width="80%" align="center" border="1">
  <form name="register" method="post" action="file:///C|/Program%20Files/Apache%20Software%20Foundation/Tomcat%206.0/webapps/cityyear/register_check.jsp">
    <tr> 
      <td align="center"><font size="7">會員註冊(進階)</font></td>
    </tr>
    <tr> 
      <td>會員資料</td>
    </tr>
    <tr> 
      <td>帳號： 
        <input name="userid" type="text"></td>
    </tr>
    <tr> 
      <td>密碼： 
        <input name="pwd" type="password"></td>
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
        <input name="name" type="text"></td>
    </tr>
    <tr> 
      <td>性別： 
        <input name="gender" type="radio" value="1" checked>
        男 
        <input name="gender" type="radio" value="0">
        女</td>
    </tr>
    <tr> 
      <td>出生：年: 
        <select name="year" id="year"  onChange="doSearchMonth()">
          <option value=0 selected>請選擇</option>
          <%
       stmt = con.prepareStatement("select * from years");
       rs = stmt.executeQuery();
	   while (rs.next()) {
%>
          <option value="<%=rs.getInt("id")%>"><%=rs.getInt("year")%></option>
          <%	   
	   }
%>
        </select>
        月: 
        <select name="month" id="month" onChange="doSearchDate()">
        </select></td>
    </tr>
    <tr> 
      <td>住址： 
        <input name="address" type="text" size="40"></td>
    </tr>
    <tr> 
      <td>電子郵件： 
        <input name="email" type="text"></td>
    </tr>
    <tr> 
      <td>聯絡電話： 
        <input name="phone" type="text"></td>
    </tr>
    <tr> 
      <td><strong>請輸入驗証碼：</strong><img src="file:///C|/Program%20Files/Apache%20Software%20Foundation/Tomcat%206.0/webapps/cityyear/varify_image.jsp" border=0 align="absmiddle"> 
        <input type="text" name="rand" maxlength=4 value=""> <label></label></td>
    </tr>
    <tr> 
      <td><input type="button" name="button" value="註冊" onClick="check()"> <input name="reset" type="reset" id="reset3" value="重新填寫"></td>
    </tr>
  </form>
</table>

</body>
</html>
