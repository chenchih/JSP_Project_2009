<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/myforum.jsp" %>
<%request.setCharacterEncoding("big5");%>
<%@ include file="Connections/userinfo.jsp" %>
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
  MM_editTable  = "account.member";
  MM_editColumn = "id";
  MM_recordId   = "'" + request.getParameter("MM_recordId") + "'";
  MM_editRedirectUrl = "add_delete.jsp";
  String MM_fieldsStr = "account|value|name|value|year|value|month|value|date|value|address|value|email|value|phone|value";
  String MM_columnsStr = "userid|',none,''|name|',none,''|year|',none,''|month|',none,''|date|',none,''|address|',none,''|email|',none,''|phone|',none,''";

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
String newsupd__MMColParam = "1";
if (request.getParameter("id") !=null) {newsupd__MMColParam = (String)request.getParameter("id");}
%>
<%
Driver Drivernewsupd = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connnewsupd = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementnewsupd = Connnewsupd.prepareStatement("SELECT * FROM account.member WHERE id = '" + newsupd__MMColParam + "'");
ResultSet newsupd = Statementnewsupd.executeQuery();
boolean newsupd_isEmpty = !newsupd.next();
boolean newsupd_hasData = !newsupd_isEmpty;
Object newsupd_data;
int newsupd_numRows = 0;
%>
<%request.setCharacterEncoding("big5");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>更新公告頁面</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed Jan 29 10:17:38 GMT+0800 (￥x￥_?D·CRE?!) 2003-->
<style type="text/css">
<!--
a {
	text-decoration: none;
}


a:visited {
	font-weight: bold;
}
.box {
	border: 1px solid #990066;
}
-->
</style>
<style type="text/css">
<!--
form {
	margin: 0px;
}
.style6 {font-size: 16px; font-weight: bold; }
.style15 {color: #006699}
.style17 {font-size: 18px;
	font-weight: bold;
	color: #006666;
}
.style19 {color: #006600}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style18 {font-size: 16px}
.style20 {color: #000000; font-size: 36px;}
.style21 {color: #0000FF}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
.style22 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style21">登出 </a>|| <a href="all_entry.jsp" class="style21">使用者資料</a> || <a href="search.jsp" class="style21">搜索 </a>|| <a href="add_term.jsp" class="style21">新增名詞</a> || <a href="news/news.jsp" class="style21">相關消息</a> ||<a href="suggestion.jsp" class="style21"> 意見</a> || <a href="forum/forum.jsp" class="style21">討論區</a> ||<a href="message/message.jsp" class="style21"> 留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
    <table width="200" border="5" align="center" bordercolor="#339999">
  <tr>
    <td width="774" height="498"><table width="200" border="0" align="center">
        <tr>
          <td><table width="498" border="0" align="center">
            <tr>
              <td width="492" valign="top"><div align="center" class="style20">相關消息</div></td>
            </tr>
          </table></td>
        </tr>
      </table>
        <table width="750" border="8" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFCC00">
          <tr>
            <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td width="45" height="34"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                  <td valign="bottom" background="images/news_r1_c10.gif"><table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="71%" align="right">&nbsp;</td>
                      </tr>
                  </table></td>
                  <td width="11">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="11">&nbsp;</td>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="7" height="8">&nbsp;</td>
                        <td><div align="right"></div></td>
                      </tr>
                      <tr>
                        <td height="8">&nbsp;</td>
                        <td style="word-break:break-all"><table width="100%" height="129" border="0" cellpadding="4" cellspacing="0">
                            <tr>
                              <td height="129" align="center"><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1" id="form1">
                                  <table width="100%" border="0" cellpadding="4" cellspacing="1" class="box">
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td width="22%" height="20" align="right" bgcolor="#990099"><span class="style6"><font color="#FFFFFF">帳號：</font></span></td>
                                      <td width="78%" height="20"><div align="left">
                                        <label>
                                        <input name="account" type="text" id="account" value="<%=(((newsupd_data = newsupd.getObject("userid"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                                        </label>
                                      </div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6"><font color="#FFFFFF">姓名：</font></span></td>
                                      <td height="20"><div align="left">
                                        <input name="name" type="text" id="name" value="<%=(((newsupd_data = newsupd.getObject("name"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                                      </div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6"><font color="#FFFFFF">生日：</font></span></td>
                                      <td height="20"><div align="left">
                                        <input name="year" type="text" id="year" value="<%=(((newsupd_data = newsupd.getObject("year"))==null || newsupd.wasNull())?"":newsupd_data)%>" size="4" maxlength="10">
                                        年-
                                        <input name="month" type="text" id="month" value="<%=(((newsupd_data = newsupd.getObject("month"))==null || newsupd.wasNull())?"":newsupd_data)%>" size="2" maxlength="10">
                                        月-
                                        <input name="date" type="text" id="date" value="<%=(((newsupd_data = newsupd.getObject("date"))==null || newsupd.wasNull())?"":newsupd_data)%>" size="2" maxlength="10">
日</div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" valign="top" bgcolor="#990099"><span class="style6"><font color="#FFFFFF">地址：</font></span></td>
                                      <td height="20"><div align="left">
                                        <input name="address" type="text" id="address" value="<%=(((newsupd_data = newsupd.getObject("address"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                                      </div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" valign="top" bgcolor="#990099"><span class="style22">電子郵件</span></td>
                                      <td height="20"><div align="left">
                                        <input name="email" type="text" id="email" value="<%=(((newsupd_data = newsupd.getObject("email"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                                      </div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" valign="top" bgcolor="#990099"><strong><font color="#FFFFFF">聯絡電話</font></strong></td>
                                      <td height="20"><div align="left">
                                        <input name="phone" type="text" id="phone" value="<%=(((newsupd_data = newsupd.getObject("phone"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                                      </div></td>
                                    </tr>
                                  </table>
                                  <input type="submit" name="Submit3" value="更新資料">
                                  <input name="Submit" type="reset" id="Submit" value="重設資料">
                                  <input type="hidden" name="MM_update" value="form1">
                                  <input type="hidden" name="MM_recordId" value="<%=(((newsupd_data = newsupd.getObject("id"))==null || newsupd.wasNull())?"":newsupd_data)%>">
                              </form>
                              </td>
                            </tr>
                          </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><div align="center"></div></td>
                              </tr>
                          </table></td>
                      </tr>
                  </table></td>
                  <td width="11">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                  <td><div align="center"><span class="style15">
                    <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
                  </span></div></td>
                  <td width="11"><img name="news_r1_c11" src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
  </tr>
</table>

<p>&nbsp;</p>
</div>
</body>
</html>
<%
newsupd.close();
Statementnewsupd.close();
Connnewsupd.close();
%>
