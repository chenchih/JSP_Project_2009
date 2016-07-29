<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connections/mynews.jsp" %>
<%request.setCharacterEncoding("big5");%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<% 
  SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");  
  String newsdate=date.format(new Date());
%>
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
// *** Insert Record: set variables

if (request.getParameter("MM_insert") != null && request.getParameter("MM_insert").toString().equals("form1")) {

  MM_editDriver     = MM_mynews_DRIVER;
  MM_editConnection = MM_mynews_STRING;
  MM_editUserName   = MM_mynews_USERNAME;
  MM_editPassword   = MM_mynews_PASSWORD;
  MM_editTable  = "newsdata";
  MM_editRedirectUrl = "news_admin.jsp";
  String MM_fieldsStr = "news_title|value|news_type|value|news_date|value|news_editor|value|news_content|value";
  String MM_columnsStr = "news_title|',none,''|news_type|',none,''|news_date|',none,NULL|news_editor|',none,''|news_content|',none,''";

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
// *** Insert Record: construct a sql insert statement and execute it

if (request.getParameter("MM_insert") != null) {

  // create the insert sql statement
  StringBuffer MM_tableValues = new StringBuffer(), MM_dbValues = new StringBuffer();
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
    MM_tableValues.append((i!=0)?",":"").append(MM_columns[i]);
    MM_dbValues.append((i!=0)?",":"").append(formVal);
  }
  MM_editQuery = new StringBuffer("insert into " + MM_editTable);
  MM_editQuery.append(" (").append(MM_tableValues.toString()).append(") values (");
  MM_editQuery.append(MM_dbValues.toString()).append(")");
  
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增公告頁面</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed Jan 29 10:17:38 GMT+0800 (￥x￥_?D·CRE?!) 2003-->
<style type="text/css">
<!--
a {
	text-decoration: none;
}
a:hover {
	color: #FF0000;
	text-decoration: underline;
}

a:visited {
	font-weight: bold;
	color: #FF9900;
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
.style6 {font-size: 16px;  }
.style14 {	color: #006600;
	font-size: 18px;
}
.style7 {font-size: 18px}
.style15 {color: #006699}
.style17 {
	font-size: 18px;
	font-weight: bold;
	color: #006666;
}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style5 {color: #0000FF}
.style10 {	font-size: 36px;
	color: #000000;
	font-weight: bold;
}
.style18 {font-size: 16px}
body {
	background-color: #FFFFFF;
}
.style19 {color: #000000}
-->
</style>
</head>
<body>

    <table width="623" border="1" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">登出</a> || <a href="all_entry.jsp" class="style5">使用者資料</a> || <a href="search.jsp" class="style5">搜索</a> || <a href="add_term.jsp" class="style5">新增名詞</a> || <a href="news/news.jsp" class="style5">相關消息</a> || <a href="suggestion.jsp" class="style5">意見</a> || <a href="forum/forum.jsp" class="style5">討論區</a> || <a href="message/message.jsp" class="style5">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;    </p>
    <table width="200" border="5" align="center" bordercolor="#339999">
  <tr>
    <td height="498"><table width="200" border="0" align="center">
        <tr>
          <td><table width="498" border="0" align="center">
            <tr>
              <td width="492" valign="top"><div align="center"><span class="style10">相關消息</span></div></td>
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
                        <td width="29%"><img name="news_r1_c11" src="images/icons_1.gif" width="38" height="35" border="0" alt=""></td>
                        <td width="71%" align="right"><div align="right"><span class="style6"><span class="style7">[ </span><span class="style14"><a href="news_admin.jsp"><img src="images/out.gif" width="36" height="35" border="0" align="absmiddle"></a>回系統管理</span> <span class="style7">]</span></span></div></td>
                      </tr>
                  </table></td>
                  <td width="11"><img name="news_r1_c11" src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
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
                        <td style="word-break:break-all"><table width="100%" height="219" border="0" cellpadding="4" cellspacing="0">
                            <tr>
                              <td height="219" align="center"><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1" id="form1">
                                  <table width="100%" border="0" cellpadding="4" cellspacing="1" class="box">
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6 style19">公告標題：</span></td>
                                      <td height="20"><div align="left"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                        <input name="news_title" type="text" id="news_title" size="50" />
                                      </font></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6 style19">公告類別：</span></td>
                                      <td height="20"><label>
                                      <div align="left"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                        <select name="news_type" id="news_type">
                                          <option value="新聞">新聞</option>
                                          <option value="資訊">資訊</option>
                                          <option value="最新消息">最新消息</option>
                                          <option value="公告">公告</option>
                                        </select>
                                      </font></div>
                                      </label></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6 style19">公告日期：</span></td>
                                      <td height="20"><div align="left"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                        <input name="news_date" type="text" id="news_date" value="<%=newsdate%>">                                        
                                      </font></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style6 style19">編輯人：</span></td>
                                      <td height="20"><div align="left"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                        <input name="news_editor" type="text" id="news_editor" />
                                      </font></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" valign="top" bgcolor="#990099"><span class="style6 style19">內容：</span></td>
                                      <td height="20"><div align="left"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">
                                        <textarea name="news_content" cols="50" rows="5" id="news_content"></textarea>
                                      </font></div></td>
                                    </tr>
                                </table>
                                
                                  
                              
                                  <input name="addnews" type="submit" id="addnews" value="新增公告">
                                  <input name="submit2" type="reset" id="submit2" value="重設資料">
                                  <input type="hidden" name="MM_insert" value="form1">
                              </form>
                              </td>
                            </tr>
                          </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td height="13"><div align="center"></div></td>
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
                  <td><div align="center" class="style15"><span class="style17">[ <a href="news.jsp"><img src="images/home.gif" width="35" height="35" border="0" align="absmiddle"></a>回系統公告 ]</span>
                    <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
                  </div></td>
                  <td width="11"><img src="images/icons.jpg" alt="" width="45" height="38" border="0"></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
  </tr>
</table>
</div>
</body>
</html>
