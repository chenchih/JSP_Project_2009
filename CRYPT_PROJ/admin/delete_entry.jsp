<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="../Connections/myforum.jsp" %>
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
  MM_editTable = "account.member";
  MM_editColumn = "id";
  MM_recordId = "'" + request.getParameter("MM_recordId") + "'";
  MM_editRedirectUrl = "add_delete.jsp";

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
String Recordset1__MMColParam = "1";
if (request.getParameter("id") !=null) {Recordset1__MMColParam = (String)request.getParameter("id");}
%>
<%
Driver DriverRecordset1 = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection ConnRecordset1 = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM account.member WHERE id = '" + Recordset1__MMColParam + "'");
ResultSet Recordset1 = StatementRecordset1.executeQuery();
boolean Recordset1_isEmpty = !Recordset1.next();
boolean Recordset1_hasData = !Recordset1_isEmpty;
Object Recordset1_data;
int Recordset1_numRows = 0;
%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int Recordset1_first = 1;
int Recordset1_last  = 1;
int Recordset1_total = -1;

if (Recordset1_isEmpty) {
  Recordset1_total = Recordset1_first = Recordset1_last = 0;
}

//set the number of rows displayed on this page
if (Recordset1_numRows == 0) {
  Recordset1_numRows = 1;
}
%>
<%
// *** Recordset Stats: if we don't know the record count, manually count them

if (Recordset1_total == -1) {

  // count the total records by iterating through the recordset
    for (Recordset1_total = 1; Recordset1.next(); Recordset1_total++);

  // reset the cursor to the beginning
  Recordset1.close();
  Recordset1 = StatementRecordset1.executeQuery();
  Recordset1_hasData = Recordset1.next();

  // set the number of rows displayed on this page
  if (Recordset1_numRows < 0 || Recordset1_numRows > Recordset1_total) {
    Recordset1_numRows = Recordset1_total;
  }

  // set the first and last displayed record
  Recordset1_first = Math.min(Recordset1_first, Recordset1_total);
  Recordset1_last  = Math.min(Recordset1_first + Recordset1_numRows - 1, Recordset1_total);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
<style type="text/css">
<!--
.box {	border: 1px solid #990066;
}
.style2 {	font-size: 16px;
	font-weight: bold;
}
.style41 {font-size: 14px; color: #000066; }
.style43 {color: #000066; font-size: 16; }
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
.style5 {color: #0000FF}
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

<body>

</head>

<body>

    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">登出</a> || <a href="all_entry.jsp">使用者資料</a> || <a href="search.jsp">搜索</a> || <a href="add_term.jsp">新增名詞</a> || <a href="news/news.jsp">相關消息</a> || <a href="suggestion.jsp">意見</a> || <a href="forum/forum.jsp">討論區</a> || <a href="message/message.jsp">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="7" height="8">&nbsp;</td>
          <td><div align="left" class="style2">
            <div align="center"><font color="#FF0000">
              <%
	  String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals(""))
	  {
		{response.sendRedirect("admin.jsp");}
 	 }


	  %>
              ** 您確定要刪除下列資料？</font></div>
          </div></td>
        </tr>
        <tr>
          <td height="8">&nbsp;</td>
          <td style="word-break:break-all"><table width="100%" height="129" border="0" cellpadding="4" cellspacing="0">
              <tr>
                <td height="129" align="center"><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1" id="form1">
                    <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="box">
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td width="20%" height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">帳號：</font></span></td>
                        <td width="80%" height="20"><div align="left"><span class="style42 style40"><%=(((Recordset1_data = Recordset1.getObject("userid"))==null || Recordset1.wasNull())?"":Recordset1_data)%></span></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">姓名：</font></span></td>
                        <td height="20"><div align="left"><span class="style43"><%=(((Recordset1_data = Recordset1.getObject("name"))==null || Recordset1.wasNull())?"":Recordset1_data)%></span></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">性別：</font></span></td>
                        <td height="20"><div align="left"><span class="style43"><%=(((Recordset1_data = Recordset1.getObject("gender"))==null || Recordset1.wasNull())?"":Recordset1_data)%></span></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF"><font color="#FFFFFF">出生</font>：</font></span></td>
                        <td height="20"><div align="left"><span class="style41"><%=(((Recordset1_data = Recordset1.getObject("year"))==null || Recordset1.wasNull())?"":Recordset1_data)%>年 -<%=(((Recordset1_data = Recordset1.getObject("month"))==null || Recordset1.wasNull())?"":Recordset1_data)%>月 -<%=(((Recordset1_data = Recordset1.getObject("date"))==null || Recordset1.wasNull())?"":Recordset1_data)%>日</span></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF"><font color="#FFFFFF">住址</font>：</font></span></td>
                        <td height="20"><div align="left"><%=(((Recordset1_data = Recordset1.getObject("address"))==null || Recordset1.wasNull())?"":Recordset1_data)%></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">電子郵件：</font></span></td>
                        <td height="20"><div align="left"><%=(((Recordset1_data = Recordset1.getObject("email"))==null || Recordset1.wasNull())?"":Recordset1_data)%></div></td>
                      </tr>
                      <tr valign="baseline" bgcolor="#EEEEEE">
                        <td height="20" align="right" bgcolor="#990099"><span class="style2"><font color="#FFFFFF">聯絡電話：</font></span></td>
                        <td height="20"><div align="left"><%=(((Recordset1_data = Recordset1.getObject("phone"))==null || Recordset1.wasNull())?"":Recordset1_data)%></div></td>
                      </tr>
                    </table>
                    <input type="submit" name="Submit" value="確定刪除">
                    <input name="backurl" type="button" id="backurl2" onClick="window.history.back()" value="回上一頁">
                    <input type="hidden" name="MM_delete" value="form1">
                    <input type="hidden" name="MM_recordId" value="<%=(((Recordset1_data = Recordset1.getObject("id"))==null || Recordset1.wasNull())?"":Recordset1_data)%>">
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
</table>
  <hr>
</div>
</body>

</html>
<%
Recordset1.close();
StatementRecordset1.close();
ConnRecordset1.close();
%>
