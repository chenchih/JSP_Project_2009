<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<script type = "text/javascript">
<!--
function sendRequest() {
  var url, qs;
  var search_ty, search;
  xmlhttp = createXMLHttp();
  if (xmlhttp) {
    search_ty = form2.searchtype.value;
    search = form2.search.value;
    url = "fcheck.jsp";
    qs = "searchtype=" + search_ty + "&search=" + search;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg;
    xmlhttp.open("POST", url, true);  // 非同步傳輸 + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //查詢字串
  }
}
function sendRequest1() {
  var url, qs;
  var data;
 re1=/^[1-9]{1,}$/;
 var dd = document.getElementById("total").value;
  xmlhttp = createXMLHttp();
  if(!re1.test(dd))
  {alert("錯誤 請輸入數字(1-9)"); }
  
  else if (xmlhttp) {
    data = form2.total.value;
    
    url = "search_check.jsp";
    qs = "total=" + data;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg1;
    xmlhttp.open("POST", url, true);  // 非同步傳輸 + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //查詢字串
  }
  
}
function createXMLHttp() {
  var xhr;
  try {
    xhr = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (e) {
    try {
      xhr = new ActiveXObject("Microsoft.XMLHTTP");
    } catch (e1) {
      try {
        xhr = new XMLHttpRequest();
      } catch (e2) {
        xhr = null;
      }
    }
  }
  return xhr;
}
function showMsg() {
  var strMsg;
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    strMsg = "<hr><p align=center> <font color=blue> 搜查的會員表列：</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}
function showMsg1() {
  var strMsg;
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    strMsg = "<hr> <p align=center> <font color=blue> 新註冊會員表列：</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}
// -->
</script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	color: #FF0000;
}
.style2 {font-size: 14px}
-->
</style>
<style type="text/css">
<!--
.style1 {color: #333399}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}

-->
</style>
</head>

<body>

	<!-- end #header -->
    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">登出</a> || <a href="all_entry.jsp">使用者資料</a> || <a href="search.jsp">搜索</a> || <a href="add_term.jsp">新增名詞</a> || <a href="news/news.jsp">相關消息</a> || <a href="suggestion.jsp">意見</a> || <a href="forum/forum.jsp">討論區</a> || <a href="message/message.jsp">留言</a></span></div></td>
      </tr>
    </table>
<p align="center" class="style1">&nbsp;</p>
<p align="center" class="style1">搜尋使用者資料</p>
<hr>
<form id="form2">

  <table width="550" border="1" align="center">
    <tr>
      <th colspan="2" scope="row"><span class="style2">會員搜尋</span></th>
    </tr>
    <tr>
      <td scope="row"><div align="left"><span class="style2">搜尋</span>
              <label>
              <select name="searchtype" id="searchtype">
                <option value="0" selected>選擇</option>
                <option value="1">userid</option>
                <option value="2">name</option>
                <option value="3">email</option>
              </select>
              </label>
              <input name="search" type="text" id="search" />
      </div></td>
      <td><div align="center">
          <input name="button" type="button" onClick="sendRequest()" value="查詢">
      </div></td>
    </tr>
    <tr>
      <td scope="row"><div align="left"><span class="style2">最近</span>
              <label>
              <input name="total" type="text" id="total" size="10">
              </label>
              <span class="style2"> 筆新註冊會員</span></div>
          <label></label>
      </td>
      <td><div align="center">
          <input name="button2" type="button" onClick="sendRequest1()" value="查詢">
      </div></td>
    </tr>
  </table>
  <p class="style2"><span class="style2"><label>    </label></span></p>
<div id="disp"> </div>


</form>
</body> </html>
