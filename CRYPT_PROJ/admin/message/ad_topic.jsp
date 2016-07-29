<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%request.setCharacterEncoding("big5");%>
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
// *** Update Record: set variables

if (request.getParameter("MM_update") != null &&
    request.getParameter("MM_update").toString().equals("form1") &&
    request.getParameter("MM_recordId") != null) {

  MM_editDriver     = MM_myforum_DRIVER;
  MM_editConnection = MM_myforum_STRING;
  MM_editUserName   = MM_myforum_USERNAME;
  MM_editPassword   = MM_myforum_PASSWORD;
  MM_editTable  = "account.message";
  MM_editColumn = "topic_id";
  MM_recordId   = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "admin.jsp";
  String MM_fieldsStr = "topic|value|content|value";
  String MM_columnsStr = "topic|',none,''|content|',none,''";

  // create the MM_fields and MM_columns arrays
  java.util.StringTokenizer tokens = new java.util.StringTokenizer(MM_fieldsStr,"|");
  MM_fields = new String[tokens.countTokens()];
  for (int i=0; tokens.hasMoreTokens(); i++) MM_fields[i] = tokens.nextToken();

  tokens = new java.util.StringTokenizer(MM_columnsStr,"|");
  MM_columns = new String[tokens.countTokens()];
  for (int i=0; tokens.hasMoreTokens(); i++) MM_columns[i] = tokens.nextToken();

  // set the form values
  for (int i=0; i+1 < MM_fields.length; i+=2) {
    MM_fields[i+1] = ((request.getParameter(MM_fields[i])!=null)?(String)request.getParameter(MM_fields[i]):"");
  }

  // append the query string to the redirect URL
  if (MM_editRedirectUrl.length() != 0 && request.getQueryString() != null) {
    MM_editRedirectUrl += ((MM_editRedirectUrl.indexOf('?') == -1)?"?":"&") + request.getQueryString();
  }
}
%>
<%
// *** Update Record: set variables

if (request.getParameter("MM_update") != null &&
    request.getParameter("MM_update").toString().equals("form2") &&
    request.getParameter("MM_recordId") != null) {

  MM_editDriver     = MM_myforum_DRIVER;
  MM_editConnection = MM_myforum_STRING;
  MM_editUserName   = MM_myforum_USERNAME;
  MM_editPassword   = MM_myforum_PASSWORD;
  MM_editTable  = "account.remessage";
  MM_editColumn = "re_id";
  MM_recordId   = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "admin.jsp";
  String MM_fieldsStr = "re_topic|value|re_content|value";
  String MM_columnsStr = "re_topic|',none,''|re_content|',none,''";

  // create the MM_fields and MM_columns arrays
  java.util.StringTokenizer tokens = new java.util.StringTokenizer(MM_fieldsStr,"|");
  MM_fields = new String[tokens.countTokens()];
  for (int i=0; tokens.hasMoreTokens(); i++) MM_fields[i] = tokens.nextToken();

  tokens = new java.util.StringTokenizer(MM_columnsStr,"|");
  MM_columns = new String[tokens.countTokens()];
  for (int i=0; tokens.hasMoreTokens(); i++) MM_columns[i] = tokens.nextToken();

  // set the form values
  for (int i=0; i+1 < MM_fields.length; i+=2) {
    MM_fields[i+1] = ((request.getParameter(MM_fields[i])!=null)?(String)request.getParameter(MM_fields[i]):"");
  }

  // append the query string to the redirect URL
  if (MM_editRedirectUrl.length() != 0 && request.getQueryString() != null) {
    MM_editRedirectUrl += ((MM_editRedirectUrl.indexOf('?') == -1)?"?":"&") + request.getQueryString();
  }
}
%>
<%
// *** Update Record: construct a sql update statement and execute it

if (request.getParameter("MM_update") != null &&
    request.getParameter("MM_recordId") != null) {

  // create the update sql statement
  MM_editQuery = new StringBuffer("update ").append(MM_editTable).append(" set ");
  for (int i=0; i+1 < MM_fields.length; i+=2) {
    String formVal = MM_fields[i+1];
    String elem;
    java.util.StringTokenizer tokens = new java.util.StringTokenizer(MM_columns[i+1],",");
    String delim    = ((elem = (String)tokens.nextToken()) != null && elem.compareTo("none")!=0)?elem:"";
    String altVal   = ((elem = (String)tokens.nextToken()) != null && elem.compareTo("none")!=0)?elem:"";
    String emptyVal = ((elem = (String)tokens.nextToken()) != null && elem.compareTo("none")!=0)?elem:"";
    if (formVal.length() == 0) {
      formVal = emptyVal;
    } else {
      if (altVal.length() != 0) {
        formVal = altVal;
      } else if (delim.compareTo("'") == 0) {  // escape quotes
        StringBuffer escQuotes = new StringBuffer(formVal);
        for (int j=0; j < escQuotes.length(); j++)
          if (escQuotes.charAt(j) == '\'') escQuotes.insert(j++,'\'');
        formVal = "'" + escQuotes + "'";
      } else {
        formVal = delim + formVal + delim;
      }
    }
    MM_editQuery.append((i!=0)?",":"").append(MM_columns[i]).append(" = ").append(formVal);
  }
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
// *** Logout the current user.
String MM_Logout = request.getRequestURI() + "?MM_Logoutnow=1";
if (request.getParameter("MM_Logoutnow") != null && request.getParameter("MM_Logoutnow").equals("1")) {
  session.putValue("MM_Username", "");
  session.putValue("MM_UserAuthorization", "");
  String MM_logoutRedirectPage = "message.jsp";
  // redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage.equals("")) MM_logoutRedirectPage = request.getRequestURI();
  if (MM_logoutRedirectPage.indexOf("?") == -1 && request.getQueryString() != null) {
    String MM_newQS = request.getQueryString();
    String URsearch = "MM_Logoutnow=1";
    int URStart = MM_newQS.indexOf(URsearch);
    if (URStart >= 0) {
      MM_newQS = MM_newQS.substring(0,URStart) + MM_newQS.substring(URStart + URsearch.length());
    }
    if (MM_newQS.length() > 0) MM_logoutRedirectPage += "?" + MM_newQS;
  }
  response.sendRedirect(response.encodeRedirectURL(MM_logoutRedirectPage));
  return;
}
%>
<%
String recupdtopic__MMColParam = "1";
if (request.getParameter("topic_id") !=null) {recupdtopic__MMColParam = (String)request.getParameter("topic_id");}
%>
<%
Driver Driverrecupdtopic = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrecupdtopic = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrecupdtopic = Connrecupdtopic.prepareStatement("SELECT *  FROM message  WHERE topic_id = " + recupdtopic__MMColParam + "");
ResultSet recupdtopic = Statementrecupdtopic.executeQuery();
boolean recupdtopic_isEmpty = !recupdtopic.next();
boolean recupdtopic_hasData = !recupdtopic_isEmpty;
Object recupdtopic_data;
int recupdtopic_numRows = 0;
%>
<%
String recupdre__MMColParam = "1";
if (request.getParameter("topic_id") !=null) {recupdre__MMColParam = (String)request.getParameter("topic_id");}
%>
<%
Driver Driverrecupdre = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrecupdre = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrecupdre = Connrecupdre.prepareStatement("SELECT *  FROM remessage  WHERE topic_id = " + recupdre__MMColParam + "  ORDER BY re_posttime DESC");
ResultSet recupdre = Statementrecupdre.executeQuery();
boolean recupdre_isEmpty = !recupdre.next();
boolean recupdre_hasData = !recupdre_isEmpty;
Object recupdre_data;
int recupdre_numRows = 0;
%>
<%
int Repeat1__numRows = 10;
int Repeat1__index = 0;
recupdre_numRows += Repeat1__numRows;
%>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int recupdre_first = 1;
int recupdre_last  = 1;
int recupdre_total = -1;

if (recupdre_isEmpty) {
  recupdre_total = recupdre_first = recupdre_last = 0;
}

//set the number of rows displayed on this page
if (recupdre_numRows == 0) {
  recupdre_numRows = 1;
}
%>
<%
// *** Recordset Stats: if we don't know the record count, manually count them

if (recupdre_total == -1) {

  // count the total records by iterating through the recordset
    for (recupdre_total = 1; recupdre.next(); recupdre_total++);

  // reset the cursor to the beginning
  recupdre.close();
  recupdre = Statementrecupdre.executeQuery();
  recupdre_hasData = recupdre.next();

  // set the number of rows displayed on this page
  if (recupdre_numRows < 0 || recupdre_numRows > recupdre_total) {
    recupdre_numRows = recupdre_total;
  }

  // set the first and last displayed record
  recupdre_first = Math.min(recupdre_first, recupdre_total);
  recupdre_last  = Math.min(recupdre_first + recupdre_numRows - 1, recupdre_total);
}
%>
<% String MM_paramName = ""; %>
<%
// *** Move To Record and Go To Record: declare variables

ResultSet MM_rs = recupdre;
int       MM_rsCount = recupdre_total;
int       MM_size = recupdre_numRows;
String    MM_uniqueCol = "";
          MM_paramName = "";
int       MM_offset = 0;
boolean   MM_atTotal = false;
boolean   MM_paramIsDefined = (MM_paramName.length() != 0 && request.getParameter(MM_paramName) != null);
%>
<%
// *** Move To Record: handle 'index' or 'offset' parameter

if (!MM_paramIsDefined && MM_rsCount != 0) {

  //use index parameter if defined, otherwise use offset parameter
  String r = request.getParameter("index");
  if (r==null) r = request.getParameter("offset");
  if (r!=null) MM_offset = Integer.parseInt(r);

  // if we have a record count, check if we are past the end of the recordset
  if (MM_rsCount != -1) {
    if (MM_offset >= MM_rsCount || MM_offset == -1) {  // past end or move last
      if (MM_rsCount % MM_size != 0)    // last page not a full repeat region
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  //move the cursor to the selected record
  int i;
  for (i=0; recupdre_hasData && (i < MM_offset || MM_offset == -1); i++) {
    recupdre_hasData = MM_rs.next();
  }
  if (!recupdre_hasData) MM_offset = i;  // set MM_offset to the last possible record
}
%>
<%
// *** Move To Record: if we dont know the record count, check the display range

if (MM_rsCount == -1) {

  // walk to the end of the display range for this page
  int i;
  for (i=MM_offset; recupdre_hasData && (MM_size < 0 || i < MM_offset + MM_size); i++) {
    recupdre_hasData = MM_rs.next();
  }

  // if we walked off the end of the recordset, set MM_rsCount and MM_size
  if (!recupdre_hasData) {
    MM_rsCount = i;
    if (MM_size < 0 || MM_size > MM_rsCount) MM_size = MM_rsCount;
  }

  // if we walked off the end, set the offset based on page size
  if (!recupdre_hasData && !MM_paramIsDefined) {
    if (MM_offset > MM_rsCount - MM_size || MM_offset == -1) { //check if past end or last
      if (MM_rsCount % MM_size != 0)  //last page has less records than MM_size
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  // reset the cursor to the beginning
  recupdre.close();
  recupdre = Statementrecupdre.executeQuery();
  recupdre_hasData = recupdre.next();
  MM_rs = recupdre;

  // move the cursor to the selected record
  for (i=0; recupdre_hasData && i < MM_offset; i++) {
    recupdre_hasData = MM_rs.next();
  }
}
%>
<%
// *** Move To Record: update recordset stats

// set the first and last displayed record
recupdre_first = MM_offset + 1;
recupdre_last  = MM_offset + MM_size;
if (MM_rsCount != -1) {
  recupdre_first = Math.min(recupdre_first, MM_rsCount);
  recupdre_last  = Math.min(recupdre_last, MM_rsCount);
}

// set the boolean used by hide region to check if we are on the last record
MM_atTotal  = (MM_rsCount != -1 && MM_offset + MM_size >= MM_rsCount);
%>
<%
// *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

String MM_keepBoth,MM_keepURL="",MM_keepForm="",MM_keepNone="";
String[] MM_removeList = { "index", MM_paramName };

// create the MM_keepURL string
if (request.getQueryString() != null) {
  MM_keepURL = '&' + request.getQueryString();
  for (int i=0; i < MM_removeList.length && MM_removeList[i].length() != 0; i++) {
  int start = MM_keepURL.indexOf(MM_removeList[i]) - 1;
    if (start >= 0 && MM_keepURL.charAt(start) == '&' &&
        MM_keepURL.charAt(start + MM_removeList[i].length() + 1) == '=') {
      int stop = MM_keepURL.indexOf('&', start + 1);
      if (stop == -1) stop = MM_keepURL.length();
      MM_keepURL = MM_keepURL.substring(0,start) + MM_keepURL.substring(stop);
    }
  }
}

// add the Form variables to the MM_keepForm string
if (request.getParameterNames().hasMoreElements()) {
  java.util.Enumeration items = request.getParameterNames();
  while (items.hasMoreElements()) {
    String nextItem = (String)items.nextElement();
    boolean found = false;
    for (int i=0; !found && i < MM_removeList.length; i++) {
      if (MM_removeList[i].equals(nextItem)) found = true;
    }
    if (!found && MM_keepURL.indexOf('&' + nextItem + '=') == -1) {
      MM_keepForm = MM_keepForm + '&' + nextItem + '=' + java.net.URLEncoder.encode(request.getParameter(nextItem));
    }
  }
}

String tempStr = "";
for (int i=0; i < MM_keepURL.length(); i++) {
  if (MM_keepURL.charAt(i) == '<') tempStr = tempStr + "&lt;";
  else if (MM_keepURL.charAt(i) == '>') tempStr = tempStr + "&gt;";
  else if (MM_keepURL.charAt(i) == '"') tempStr = tempStr +  "&quot;";
  else tempStr = tempStr + MM_keepURL.charAt(i);
}
MM_keepURL = tempStr;

tempStr = "";
for (int i=0; i < MM_keepForm.length(); i++) {
  if (MM_keepForm.charAt(i) == '<') tempStr = tempStr + "&lt;";
  else if (MM_keepForm.charAt(i) == '>') tempStr = tempStr + "&gt;";
  else if (MM_keepForm.charAt(i) == '"') tempStr = tempStr +  "&quot;";
  else tempStr = tempStr + MM_keepForm.charAt(i);
}
MM_keepForm = tempStr;

// create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL + MM_keepForm;
if (MM_keepBoth.length() > 0) MM_keepBoth = MM_keepBoth.substring(1);
if (MM_keepURL.length() > 0)  MM_keepURL = MM_keepURL.substring(1);
if (MM_keepForm.length() > 0) MM_keepForm = MM_keepForm.substring(1);
%>
<%
// *** Move To Record: set the strings for the first, last, next, and previous links

String MM_moveFirst,MM_moveLast,MM_moveNext,MM_movePrev;
{
  String MM_keepMove = MM_keepBoth;  // keep both Form and URL parameters for moves
  String MM_moveParam = "index=";

  // if the page has a repeated region, remove 'offset' from the maintained parameters
  if (MM_size > 1) {
    MM_moveParam = "offset=";
    int start = MM_keepMove.indexOf(MM_moveParam);
    if (start != -1 && (start == 0 || MM_keepMove.charAt(start-1) == '&')) {
      int stop = MM_keepMove.indexOf('&', start);
      if (start == 0 && stop != -1) stop++;
      if (stop == -1) stop = MM_keepMove.length();
      if (start > 0) start--;
      MM_keepMove = MM_keepMove.substring(0,start) + MM_keepMove.substring(stop);
    }
  }

  // set the strings for the move to links
  StringBuffer urlStr = new StringBuffer(request.getRequestURI()).append('?').append(MM_keepMove);
  if (MM_keepMove.length() > 0) urlStr.append('&');
  urlStr.append(MM_moveParam);
  MM_moveFirst = urlStr + "0";
  MM_moveLast  = urlStr + "-1";
  MM_moveNext  = urlStr + Integer.toString(MM_offset+MM_size);
  MM_movePrev  = urlStr + Integer.toString(Math.max(MM_offset-MM_size,0));
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系統管理--討論主題管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<script language="JavaScript" type="text/JavaScript">
<!--

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
<style type="text/css">
<!--
.box {border: 3px solid #FFFFFF;
}
.fixbox {	border: 0px none;
	background-attachment: fixed;
	background-repeat: repeat-y;
}
.style20 {font-size: 12px}
.fixbox1 {
	border: 1px solid #07849D;
	background-attachment: fixed;
	background-repeat: repeat-y;
	background-position: center top;
	text-align: center;
}
.style24 {font-size: 14}
.style33 {color: #9900FF; font-size: 18px; font-weight: bold; }
.style35 {
	color: #FF0000;
	font-weight: bold;
}
.style37 {font-size: 12px; font-family: Arial, Helvetica, sans-serif; }
.style39 {
	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
}
.style42 {color: #0000FF}
.style44 {font-size: 12px; color: #FF0000; }
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
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
</head>
<body text="#000000">

    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="../signout.jsp" class="style42">登出</a> || <a href="../all_entry.jsp" class="style42">使用者資料</a> || <a href="../search.jsp" class="style42">搜索</a> || <a href="../add_term.jsp" class="style42">新增名詞</a> || <a href="../news/news.jsp" class="style42">相關消息</a> || <a href="../suggestion.jsp" class="style42">意見</a> || <a href="../forum/forum.jsp" class="style42">討論區</a> || <a href="message.jsp" class="style42">留言</a></span></div></td>
      </tr>
  </table>
    <p>&nbsp;</p>
    <table width="761" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00">
  <tr>
    <td height="72"><div align="center">
      <table width="200" border="3" align="center" cellpadding="0" cellspacing="2">
        <tr>
          <td valign="top"><table width="326" border="0" align="center" cellpadding="0" cellspacing="2">
              <tr>
                <td valign="top"><img src="images/message.jpg" width="750" height="110" /></td>
              </tr>
          </table></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td height="585" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" background="images/admin_board.jpg" class="fixbox">
        <tr>
          <td height="70" align="center" valign="middle"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("http://localhost:8080/acc/admin/admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td height="50" align="center" valign="middle"><div align="center"> <img src="images/admin_title.gif" width="236" height="35"></div></td>
        </tr>
        <tr>
          <td height="455" align="center" valign="top"><div align="center"> </div>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr>
                  <td><div align="center">
                    <table width="100%" height="48" border="0" align="center" cellpadding="2" cellspacing="0" background="images/table_title.gif" class="fixbox1">
                      <tr>
                        <td width="119" height="30">&nbsp;</td>
                        <td width="392" valign="middle"><div align="left"><span class="style20"><span class="style24"><span class="style33"><%=(((recupdtopic_data = recupdtopic.getObject("topic"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%></span></span></span> </div></td>
                        <td width="123" valign="middle"><div align="center" class="style35">
                          <div align="center"><%=(recupdre_total)%></div>
                        </div></td>
                      </tr>
                    </table>
                    </div></td>
                  <td width="15%"><a href="<%= MM_Logout %>"></a></td>
                </tr>
              </table>              
              <table border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" class="box">
                <tr>
                  <td height="461" valign="top">                        <table border="0" align="center" cellpadding="0" cellspacing="0" background="images/line02.gif">
                          <tr>
                            <td width="760"><img src="images/line01.gif" width="760" height="15"></td>
                          </tr>
                          <tr>
                            <td valign="top">                              <form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1">
                                <table width="95%" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#DFDFDF" class="boxRed">
                                  <tr>
                                    <td width="123" valign="top">
                                      <div align="center">                                        
                                        <p><span class="style42"><br />
                                        發表著:</span> <br>
                                          <%=(((recupdtopic_data = recupdtopic.getObject("poster"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%></p>
                                        <table width="112%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="10">&nbsp;</td>
                                            <td width="110" valign="baseline"><div align="left"><font face="新細明體"><a href="forum_admin.jsp" class="style20 style42">回管理主畫面</a></font></div></td>
                                          </tr>
                                        </table>
                                        <p>&nbsp;</p>
                                    </div></td>
                                    <td width="583" valign="top"><br />
                                  <table width="95%" border="0" cellspacing="0" cellpadding="5" align="center"  bgcolor="#FFFFFF">
                                        <tr>
                                          <td height="12" colspan="2"> 
                                            <div align="left"><font face="Arial, Helvetica, sans-serif"><span class="style39">主題: </span></font><font size="1" face="Arial, Helvetica, sans-serif">                                          
                                            <input name="topic" type="text" id="topic" value="<%=(((recupdtopic_data = recupdtopic.getObject("topic"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%>" />
                                            </font><font face="Arial, Helvetica, sans-serif">
                                            </font></div>
                                            <div align="left"><font face="Arial, Helvetica, sans-serif">
                                            </font></div>
                                            <font face="Arial, Helvetica, sans-serif"><hr align="left" size="1" noshade>	
                                            <div align="left"><span class="style39">內容:</span> </div>
                                            </font>
                                            <div align="left"><font color="#0066CC" size="-1">
                                            <textarea name="content" cols="74" rows="6" id="content"><%=(((recupdtopic_data = recupdtopic.getObject("content"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%></textarea>
                                            </font> </div></td>
                                        </tr>
                                        <tr>
                                          <td width="55%" height="13"> <div align="left"><span class="style37">(time:</span><span class="style37"><%=(((recupdtopic_data = recupdtopic.getObject("posttime"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%></span></div></td>
                                          <td width="45%"><div align="left"><font face="Arial, Helvetica, sans-serif"><span class="style20">ip:</span></font><span class="style20"><%=(((recupdtopic_data = recupdtopic.getObject("ip"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%></span><font face="Arial, Helvetica, sans-serif"><span class="style20">) </span></font></div></td>
                                        </tr>
                                    </table>
                                      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td><input type="submit" name="Submit4" value="更新">
                                              <input type="reset" name="Submit23" value="重設">
                                              <input type="hidden" name="MM_recordId" value="<%=(((recupdtopic_data = recupdtopic.getObject("topic_id"))==null || recupdtopic.wasNull())?"":recupdtopic_data)%>">
<input type="hidden" name="MM_update" value="form1"></td>
                                        </tr>
                                    </table></td></tr>
                              </table>
                                                                <br>
                                                                <table border="0" width="50%" align="center">
                                                                  <tr>
                                                                    <td width="23%" align="center">
                                                                      <% if (MM_offset !=0) { %>
                                                                      <a href="<%=MM_moveFirst%>">第一頁</a>
                                                                      <% } /* end MM_offset != 0 */ %>
                                                                    </td>
                                                                    <td width="31%" align="center">
                                                                      <% if (MM_offset !=0) { %>
                                                                      <a href="<%=MM_movePrev%>">上一頁</a>
                                                                      <% } /* end MM_offset != 0 */ %>
                                                                    </td>
                                                                    <td width="23%" align="center">
                                                                      <% if (!MM_atTotal) { %>
                                                                      <a href="<%=MM_moveNext%>">下一頁</a>
                                                                      <% } /* end !MM_atTotal */ %>
                                                                    </td>
                                                                    <td width="23%" align="center">
                                                                      <% if (!MM_atTotal) { %>
                                                                      <a href="<%=MM_moveLast%>">最後一頁</a>
                                                                      <% } /* end !MM_atTotal */ %>
                                                                    </td>
                                                                  </tr>
                              </table>
                                                        
                                                                </form>
<form ACTION="<%=MM_editAction%>" METHOD="POST" name="form2" id="form2">
  <% while ((recupdre_hasData)&&(Repeat1__numRows-- != 0)) { %>
    <% if (!recupdre_isEmpty ) { %>
      <table width="95%" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#CCFFCC" class="boxGray">
        <tr>
          <td width="123" valign="top"><div align="center">
            <p><br />
                <span class="style42">回應者:</span><br>
              <%=(((recupdre_data = recupdre.getObject("re_poster"))==null || recupdre.wasNull())?"":recupdre_data)%></p>
            <table width="93%" height="14" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="center"><font size="2" face="新細明體"><a href="ad_delre.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "re_id=" + (((recupdre_data = recupdre.getObject("re_id"))==null || recupdre.wasNull())?"":recupdre_data) %>">刪除留言</a> | <a href="forum_admin.jsp">回主畫面</a></font></div></td>
                </tr>
            </table>
            <p><font face="Verdana, 新細明體" size="2"></font> <font size="2"></font> </p>
          </div></td>
          <td width="580" valign="top"><br />
          <table width="95%" border="0" cellspacing="0" cellpadding="5" align="center"  bgcolor="#FFFFFF">
              <tr>
                <td height="12" colspan="2">
                  <div align="left"><font face="Arial, Helvetica, sans-serif">  <span class="style44"><strong>主題</strong>:</span></font><font size="1" face="Arial, Helvetica, sans-serif">
                      <input name="re_topic" type="text" id="re_topic" value="<%=(((recupdre_data = recupdre.getObject("re_topic"))==null || recupdre.wasNull())?"":recupdre_data)%>" />
                    </font>
                  </div>
                  <hr noshade size="1"> <div align="left"><font face="Arial, Helvetica, sans-serif"><span class="style39">內容:</span> </font>
                      <font color="#0066CC" size="-1">
                      <textarea name="re_content" cols="74" rows="6" id="re_content"><%=(((recupdre_data = recupdre.getObject("re_content"))==null || recupdre.wasNull())?"":recupdre_data)%></textarea>
                    </font> </div></td>
              </tr>
              <tr>
                <td width="54%" height="13"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif"> </font><font face="Arial, Helvetica, sans-serif"><span class="style20"> (time:<%=(((recupdre_data = recupdre.getObject("re_posttime"))==null || recupdre.wasNull())?"":recupdre_data)%></span></font></div></td>
                <td width="46%"><div align="left"><font face="Arial, Helvetica, sans-serif"><span class="style20">ip:<%=(((recupdre_data = recupdre.getObject("re_ip"))==null || recupdre.wasNull())?"":recupdre_data)%>)</span></font></div></td>
              </tr>
            </table>
              <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><input type="submit" name="Submit32" value="更新">
                    <input type="reset" name="Submit222" value="重設"></td>
                  </tr>
              </table></td></tr>
        <tr>
          <td colspan="2" valign="top"><hr width="95%" size="1" noshade color="#FFAF2C"></td>
        </tr>
      </table>
      <% } /* end !recupdre_isEmpty */ %>
    <input type="hidden" name="MM_update" value="form2">
    <input type="hidden" name="MM_recordId" value="<%=(((recupdre_data = recupdre.getObject("re_id"))==null || recupdre.wasNull())?"":recupdre_data)%>">
    <%
  Repeat1__index++;
  recupdre_hasData = recupdre.next();
}
%>
</form>
</td>
                          </tr>
                          <tr>
                            <td><img src="images/line01.gif" width="760" height="15"></td>
                          </tr>
                  </table>                  </td></tr>
          </table>
            <p>&nbsp;</p></td>
        </tr>
    </table></td>
  </tr>
</table>
    <div class="bottom"></div>
</div>
</body>
</html>
<%
recupdtopic.close();
Statementrecupdtopic.close();
Connrecupdtopic.close();
%>
<%
recupdre.close();
Statementrecupdre.close();
Connrecupdre.close();
%>
