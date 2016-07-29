<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>Term </TITLE>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style27 {font-family: "細明體";
	font-size: 16px;
}
body,td,th {
	color: #000000;
}


-->
</style>
<script type = "text/javascript">
<!--
var strUrl = "search_sql.jsp?term=";
var xmlhttp;

function showDiv(divId) {
  if (document.layers)
		document.layers[divId].visibility = "show";
  else
    document.getElementById(divId).style.visibility = "visible";
}
function hideDiv(divId) {
  if (document.layers)
		document.layers[divId].visibility = "hide";
  else
  	document.getElementById(divId).style.visibility = "hidden";
}
function loadBody() {
	hideDiv("divResults");
	document.aForm.search.focus();
}
function clearResults() {
	var findDiv = document.getElementById("divResults");
	var counter = findDiv.childNodes.length;
	for (var i = counter - 1; i >= 0; i--) {
		findDiv.removeChild(findDiv.childNodes[i]);
	}
}
function getNames(term) {
  if (term.length > 0) {
		var url = strUrl + term;
  	xmlhttp = createXMLHttp();
	  if (xmlhttp) {
	    xmlhttp.onreadystatechange = showResult;
	    xmlhttp.open("GET", url, true);
	    xmlhttp.send("");
	  }
	} else {
		// clear div if empty
		clearResults();
		hideDiv("divResults");
	}
}
function createXMLHttp() {
  try {
    return new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e) {
    try {
      return new XMLHttpRequest();
    } catch (e) {
      return null;
    }
  }
  return null;
}
function replaceInput(tblCell) {
  var inputName = document.getElementById("search");
  inputName.value = tblCell.firstChild.nodeValue;
sumbit("");
	clearResults();
	hideDiv("divResults");
}

function sumbit()
{
 var url, qs;
  var search;
  xmlhttp = createXMLHttp();
  if (xmlhttp) {
    search = aForm.search.value;

    url = "term_check.jsp";
    qs = "search=" + search;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg;
    xmlhttp.open("POST", url, true);  // 非同步傳輸 + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //查詢字串
  }
}
function showResult() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
  	var msg1 = xmlhttp.responseText;

  	//alert(msg1.length + ": " + msg1);

  	//--- length = 8 even empty --- //
  	if (msg1.length > 8) {
			showDiv("divResults");
			clearResults();
			//--- create table ---
			var findDiv = document.getElementById("divResults");
			var tblTable = document.createElement("table");
			var tblBody = document.createElement("tbody");
			var tblRow, tblCell, tblNode;
			//---
			  		
	  	eval("var objResults = " + msg1);
	  	//var msg = "";
		//----------------------------------------------------------
	  	for (var i = 0; i < objResults.Results.books.length; i++) {
	  		var currentItem = objResults.Results.books[i].term;
	  		tblRow = document.createElement("tr");
	  		tblCell = document.createElement("td");
	  		tblCell.onmouseover = function() {this.className = 'mouseOver';};
	  		tblCell.onmouseout = function() {this.className = 'mouseOut';};
	  		tblCell.setAttribute("border", "0");
	  		tblCell.onclick = function() {replaceInput(this);};
	  		
	  		tblNode = document.createTextNode(currentItem);
	  		tblCell.appendChild(tblNode);
	  		tblRow.appendChild(tblCell);
	  		tblBody.appendChild(tblRow);
	  	}
	  	//alert(msg);
	
	  	tblTable.appendChild(tblBody);
	    findDiv.appendChild(tblTable);
		} else {
			clearResults();
			hideDiv("divResults");
		}
	}
	//http://www.pt.ntu.edu.tw/hmchai/PTcomputer03_2/hCSS/CSSadvanced.htm
}
// -->
//--------------------asychronization--------------------------
</script> 
<script>
<!--
function sendRequest() {
  var url, qs;
  var search;
  xmlhttp = createXMLHttp();
  if (xmlhttp) {
    search = aForm.search.value;

    url = "term_check.jsp";
    qs = "search=" + search;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg;
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
    strMsg = "<hr><p align=center> <font color=blue> 搜查的資料：</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}





// -->
</script>
<style type="text/css">
	.mouseOut {
		background: #ccccff; color: #000000;
		width:500px; cursor:default;
	}
	.mouseOver {
		background: #fffafa; color: #000000;
		width:500px; cursor:hand;
	}
		.hide {
		display:none;
	}
	.show {
		display:block;
		width:170px;
	}
#divResults {		background-color:#ccccff;
}

.style28 {color: #0000FF}
a:hover {
	color: #FF0000;
}
</style>
</HEAD>
<BODY >
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
</p>
	  <p>&nbsp;      </p>
  </div>
    <table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right">
          <%
   String userid1=((String)session.getAttribute("userid")==null)?"":(String)session.getAttribute("userid"); 

  if(userid1.equals(""))
	{
	  out.print(""); 
	  out.print("<a href = signin.jsp target=_parent> <font color=blue>登入 </a> </font>"); 
	   
	}

   else  
	{
	out.print("<font color=red>"+userid1+":"+"</font>");
	 out.print("<a href = signout.jsp target=_parent> <font color=blue >  登出 </a> </font>");
	}

  
   
%>
          <span class="style27">||</span> <span class="style27"><a href="bulletin_news.jsp" class="style28">相關消息</a> || <a href="lesson.jsp" class="style28">課程</a> || <a href="forum.jsp" class="style28">討論區</a> ||<a href="message.jsp" class="style28">留言</a> || <a href="linkpage.jsp" class="style28">連結</a></span></div></td>
      </tr>
    </table>
    <P>

<form name="aForm"><div>
  <table width="200" border="1" align="center">
    <tr>
      <td><div align="center">名詞搜尋</div></td>
    </tr>
    <tr>
      <td><div id="div">
        <input name="search" type="text" id="search" onKeyUp="getNames(this.value);" autocomplete="off">
        <div id="divResults"></div>
      </div></td>
    </tr>
    <tr>
      <td><div align="center">
        <input name="button2" type="button" onClick="sendRequest()" value="Submit">
        <label>
        <input type="reset" name="Submit" value="Reset">
        </label>
      </div></td>
    </tr>
  </table>
<div id="disp"> </div>
</form>

<form method=get action="http://www.google.com/search"  target="_blank">
  <table align="center" bgcolor="#FFFFFF">
    <tr>
      <td><a href="http://www.google.com" target="_blank"> <img src="http://www.google.com/logos/Logo_40wht.gif" border="0" 
alt="Google" align="absmiddle"></a>
          <input type=text name=q size=31 maxlength=255 value="">
          <input type=hidden name=ie value=Big5>
          <input type=hidden name=oe value=Big5>
          <input type=hidden name=hl value=zh-TW>
          <input type=submit name=btnG value="Google搜尋" >
      </td>
    </tr>
  </table>
</form>

<hr>
<table width="683" height="28" border="0" align="center">
  <tr>
    <td width="437"><div align="right"><span class="style27"><a href="admin/admin.jsp" target="_blank" class="style28">管理員</a>||<a href="term.jsp" class="style28">名詞搜索</a> || <a href="contact.jsp" class="style28">意見 </a></span></div></td>
  </tr>
</table>
<center>
  <!-- Search Google -->
</center>
</div>
</BODY>
</HTML>
