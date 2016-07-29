<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="Connections/mynews.jsp" %>
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

  MM_editDriver     = MM_mynews_DRIVER;
  MM_editConnection = MM_mynews_STRING;
  MM_editUserName   = MM_mynews_USERNAME;
  MM_editPassword   = MM_mynews_PASSWORD;
  MM_editTable = "newsdata";
  MM_editColumn = "news_id";
  MM_recordId = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "news_admin.jsp";

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
String newsdel__MMColParam = "1";
if (request.getParameter("news_id") !=null) {newsdel__MMColParam = (String)request.getParameter("news_id");}
%>
<%
Driver Drivernewsdel = (Driver)Class.forName(MM_mynews_DRIVER).newInstance();
Connection Connnewsdel = DriverManager.getConnection(MM_mynews_STRING,MM_mynews_USERNAME,MM_mynews_PASSWORD);
PreparedStatement Statementnewsdel = Connnewsdel.prepareStatement("SELECT * FROM newsdata WHERE news_id = " + newsdel__MMColParam + "");
ResultSet newsdel = Statementnewsdel.executeQuery();
boolean newsdel_isEmpty = !newsdel.next();
boolean newsdel_hasData = !newsdel_isEmpty;
Object newsdel_data;
int newsdel_numRows = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>刪除公告頁面</title>
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
.style2 {
	font-size: 16px;
	font-weight: bold;
}
.style14 {color: #006600;
	font-size: 18px;
}
.style7 {	font-size: 18px;
	color: #006666;
}
.style8 {font-size: 18px}
.style40 {
	color: #FF0000;
	font-size: 16px;
}
.style41 {font-size: 14px; color: #000066; }
.style42 {font-size: 16}
.style43 {color: #000066; font-size: 16; }
.style15 {color: #006699}
.style17 {font-size: 18px;
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
.style44 {font-size: 16px; color: #0000FF; }
.style45 {color: #FF0000}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
</head>
<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="../signout.jsp" class="style5">登出</a> || <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索</a> || <a href="../add_term.jsp" class="style5">新增名詞 </a>|| <a href="news.jsp" class="style5">相關消息</a> || <a href="../suggestion.jsp" class="style5">意見</a> || <a href="../forum/forum.jsp" class="style5">討論區</a> || <a href="message/message.jsp" class="style5">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <table width="200" border="5" align="center" bordercolor="#339999">
  <tr>
    <td width="772"><table width="200" border="0" align="center">
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
                        <td width="29%"><img src="images/icons_1.gif" width="38" height="35" border="0" alt=""><img src="images/news_board.jpg" width="150" height="35" border="0" alt=""></td>
                        <td width="71%" align="right"><div align="right"><span class="style7"><span class="style2"><span class="style8">[ </span><span class="style14"><a href="news_admin.jsp"><img src="images/out.gif" width="36" height="35" border="0" align="absmiddle"></a>回系統管理</span> <span class="style8">]</span></span></span></div></td>
                      </tr>
                  </table></td>
                  <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
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
                        <td><div align="left" class="style2"><font color="#FF0000">** 您確定要刪除下列資料？</font></div></td>
                      </tr>
                      <tr>
                        <td height="8">&nbsp;</td>
                        <td style="word-break:break-all"><table width="100%" height="129" border="0" cellpadding="4" cellspacing="0">
                            <tr>
                              <td height="129" align="center"><form action="<%=MM_editAction%>" method="POST" name="form1" id="form1">
                                  <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="box">
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td width="20%" height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">新聞標題：</font></span></td>
                                      <td width="80%" height="20"><div align="left"><span class="style42 style40"><span class="style44"><%=(((newsdel_data = newsdel.getObject("news_title"))==null || newsdel.wasNull())?"":newsdel_data)%></span></span></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">新聞類別：</font></span></td>
                                      <td height="20"><div align="left"><span class="style43 style45"><%=(((newsdel_data = newsdel.getObject("news_type"))==null || newsdel.wasNull())?"":newsdel_data)%></span></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">公告日期：</font></span></td>
                                      <td height="20"><div align="left"><span class="style43"><%=(((newsdel_data = newsdel.getObject("news_date"))==null || newsdel.wasNull())?"":newsdel_data)%></span></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">編輯人：</font></span></td>
                                      <td height="20"><div align="left"><span class="style43 style45"><%=(((newsdel_data = newsdel.getObject("news_editor"))==null || newsdel.wasNull())?"":newsdel_data)%></span></div></td>
                                    </tr>
                                    <tr valign="baseline" bgcolor="#EEEEEE">
                                      <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">內容：</font></span></td>
                                      <td height="20"><div align="left"><span class="style41"><%=(((newsdel_data = newsdel.getObject("news_content"))==null || newsdel.wasNull())?"":newsdel_data)%></span></div></td>
                                    </tr>
                                  </table>
                                  <input name="news_id" type="hidden" id="news_id" value="<%=(((newsdel_data = newsdel.getObject("news_id"))==null || newsdel.wasNull())?"":newsdel_data)%>" />
                                  <input type="submit" name="Submit" value="確定刪除">
                                  <input name="backurl" type="button" id="backurl2" onClick="window.history.back()" value="回上一頁">
                                  <input type="hidden" name="MM_delete" value="form1">
                                  <input type="hidden" name="MM_recordId" value="<%=(((newsdel_data = newsdel.getObject("news_id"))==null || newsdel.wasNull())?"":newsdel_data)%>">
                              </form></td>
                            </tr>
                          </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><div align="center">
                                    <div align="center"></div>
                                </div></td>
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
                  <td><div align="center"><span class="style15"><span class="style17">[ <a href="news.jsp"><img src="images/home.gif" width="35" height="35" border="0" align="absmiddle"></a>回系統公告 ]</span></span><span class="style15">
                    <% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %>
                  </span></div></td>
                  <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
  </tr>
</table>

</div>
</body>
</html>
<%
newsdel.close();
Statementnewsdel.close();
Connnewsdel.close();
%>
