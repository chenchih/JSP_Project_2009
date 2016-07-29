<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connections/myforum.jsp" %>
<%
// *** Edit Operations: declare variables

// set the form action variable
String MM_editAction = request.getRequestURI();
if (request.getQueryString() != null && request.getQueryString().length() > 0) {
  String queryString = request.getQueryString();
  String tempStr = "";
  for (int i=0; i < queryString.length(); i++) {
    if (queryString.charAt(i) == '<') tempStr = tempStr + "&lt;";
    else if (queryString.charAt(i) == '>') tempStr = tempStr + "&gt;";
    else if (queryString.charAt(i) == '"') tempStr = tempStr +  "&quot;";
    else tempStr = tempStr + queryString.charAt(i);
  }
  MM_editAction += "?" + tempStr;
}

// connection information
String MM_editDriver = null, MM_editConnection = null, MM_editUserName = null, MM_editPassword = null;

// redirect information
String MM_editRedirectUrl = null;

// query string to execute
StringBuffer MM_editQuery = null;

// boolean to abort record edit
boolean MM_abortEdit = false;

// table information
String MM_editTable = null, MM_editColumn = null, MM_recordId = null;

// form field information
String[] MM_fields = null, MM_columns = null;
%>
<%
// *** Delete Record: construct a sql delete statement and execute it

if (request.getParameter("MM_delete") != null &&
    request.getParameter("MM_delete").toString().equals("form1") &&
    request.getParameter("MM_recordId") != null) {

  MM_editDriver     = MM_myforum_DRIVER;
  MM_editConnection = MM_myforum_STRING;
  MM_editUserName   = MM_myforum_USERNAME;
  MM_editPassword   = MM_myforum_PASSWORD;
  MM_editTable = "account.retopic";
  MM_editColumn = "re_id";
  MM_recordId = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "ad_topic.jsp";

  // append the query string to the redirect URL
  if (MM_editRedirectUrl.length() != 0 && request.getQueryString() != null) {
    MM_editRedirectUrl += ((MM_editRedirectUrl.indexOf('?') == -1)?"?":"&") + request.getQueryString();
  }
}
%>
<%
// *** Delete Record: construct a sql delete statement and execute it

if (request.getParameter("MM_delete") != null &&
    request.getParameter("MM_recordId") != null) {

  // create the delete sql statement
  MM_editQuery = new StringBuffer("delete from ").append(MM_editTable);
  MM_editQuery.append(" where ").append(MM_editColumn).append(" = ").append(MM_recordId);
  
  if (!MM_abortEdit) {
    // finish the sql and execute it
    Driver MM_driver = (Driver)Class.forName(MM_editDriver).newInstance();
    Connection MM_connection = DriverManager.getConnection(MM_editConnection,MM_editUserName,MM_editPassword);
    PreparedStatement MM_editStatement = MM_connection.prepareStatement(MM_editQuery.toString());
    MM_editStatement.executeUpdate();
    MM_connection.close();

    // redirect with URL parameters
    if (MM_editRedirectUrl.length() != 0) {
      response.sendRedirect(response.encodeRedirectURL(MM_editRedirectUrl));
      return;
    }
  }
}
%>
<%
String recdel__MMColParam = "1";
if (request.getParameter("re_id") !=null) {recdel__MMColParam = (String)request.getParameter("re_id");}
%>
<%
Driver Driverrecdel = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrecdel = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrecdel = Connrecdel.prepareStatement("SELECT * FROM account.retopic WHERE re_id = " + recdel__MMColParam + "");
ResultSet recdel = Statementrecdel.executeQuery();
boolean recdel_isEmpty = !recdel.next();
boolean recdel_hasData = !recdel_isEmpty;
Object recdel_data;
int recdel_numRows = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>刪除回應主題</title>
<style type="text/css">
<!--
.box {border: 3px solid #658A19;
}
.fixbox {	border: 0px none;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: top;
}
.style21 {font-size: 12px}
.style22 {
	color: #FF0000;
	font-weight: bold;
	font-size: 18px;
}
.style24 {font-size: 14}
.style25 {font-size: 14px}
.style29 {	font-size: 14px;
	color: #990000;
	font-weight: bold;
}
.style36 {	color: #0000FF;
	font-size: 14px;
}
.style37 {color: #0000FF}
.style42 {color: #000000}
.style43 {color: #000000; font-size: 14px; }
.style44 {color: #FF0000}
.style45 {
	font-size: 16px;
	font-weight: bold;
}
.style46 {font-size: 18px; color: #FF0000;}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
a:link {
	color: #0000FF;
}
.style57 {	font-size: 36px;
	font-weight: bold;
}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
</head>

<body>
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="../signout.jsp" class="style37">登出 </a>|| <a href="../all_entry.jsp" class="style37">使用者資料</a> || <a href="../search.jsp" class="style37">搜索 </a>|| <a href="../add_term.jsp" class="style37">新增名詞</a> || <a href="../news/news.jsp" class="style37">相關消息</a> ||<a href="../suggestion.jsp" class="style37"> 意見</a> || <a href="forum.jsp" class="style37">討論區</a> ||<a href="../message/message.jsp" class="style37"> 留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
    <table width="836" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00">
  <tr>
    <td width="828" valign="top"><table width="200" border="3" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td valign="top"><table width="326" border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td valign="top"><div align="center"><img src="images/forum_pic.jpg" width="750" height="110" /></div></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" background="images/admin_board.jpg" class="fixbox">
        <tr>
          <td height="68" colspan="3" align="center" valign="middle"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("http://localhost:8080/acc/admin/admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td width="25%" height="54" align="center" valign="middle">&nbsp;</td>
          <td width="47%" align="center" valign="middle"><img src="images/admin_title.gif" width="236" height="35"></td>
          <td width="28%" align="center" valign="middle"><div align="right"></div></td>
        </tr>
        <tr>
          <td height="220" colspan="3" align="center" valign="top"><div align="center">
              <form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1">
                <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#F5F5F5" class="box">
                  <tr>
                    <td width="212" valign="top" bgcolor="#FFFFFF">
                      <div align="center"> <span class="style46"><span class="style45">你確定要刪除這筆記錄嗎??</span></span><span class="style22"><br>
                        </span><strong><img src="images/face/<%=(((recdel_data = recdel.getObject("re_face"))==null || recdel.wasNull())?"":recdel_data)%>" alt="表情" name="reface" width="100" height="120" id="reface"></strong><br>
                        <font face="Verdana, 新細明體" size="2"></font> </div></td>
                    <td width="538" valign="top">
                      <table width="100%" height="42" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#CCCCCC">
                        <tr>
                         
                          <td width="45%" class="style21"><div align="left"><span class="style36">張 貼 者 ： </span><span class="style44"><span class="style43"><span class="style25"></span></span></span><%=(((recdel_data = recdel.getObject("re_poster"))==null || recdel.wasNull())?"":recdel_data)%></div></td>
                          <td width="48%" rowspan="2"><span class="style21"><span class="style25"><span class="style29"><%=(((recdel_data = recdel.getObject("re_topic"))==null || recdel.wasNull())?"":recdel_data)%></span></span></span></td>
                        </tr>
                        <tr>
                          <td class="style24"><div align="left"><span class="style25"><span class="style37">張貼時間<strong>：</strong></span><span class="style42"></span></span><%=(((recdel_data = recdel.getObject("re_posttime"))==null || recdel.wasNull())?"":recdel_data)%></div></td>
                        </tr>
                      </table>
                      <hr noshade size="1">
                      <span class="style25"></span>
                      <table width="100%" height="90" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#F5F5F5">
                        <tr>
                          <td valign="top"> <span class="style21"> <span class="style24"> <span class="style25"></span></span></span> <span class="style25"></span> <%=(((recdel_data = recdel.getObject("re_content"))==null || recdel.wasNull())?"":recdel_data)%></td>
                        </tr>
                      </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5">
                        <tr>
                          <td>
                            <div align="center">                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr valign="top" bgcolor="#FFFFFF">
                    <td colspan="2"><hr noshade size="1"></td>
                  </tr>
                </table>
              
                <input name="Submit3" type="submit" value="確定刪除">
                <input name="Submit22" type="button" onClick="MM_goToURL('parent','forum_admin.jsp');return document.MM_returnValue" value="回上一頁">
<input type="hidden" name="MM_delete" value="form1">
                <input type="hidden" name="MM_recordId" value="<%=(((recdel_data = recdel.getObject("re_id"))==null || recdel.wasNull())?"":recdel_data)%>">
              </form>
          </div>          </td>
        </tr>
    </table></td>
  </tr>
</table>
</div>
</body>

</html>
<%
recdel.close();
Statementrecdel.close();
Connrecdel.close();
%>
