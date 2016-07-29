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
  MM_editTable = "account.message";
  MM_editColumn = "topic_id";
  MM_recordId = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "del_action.jsp";

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
String recdeltopic__MMColParam = "1";
if (request.getParameter("topic_id") !=null) {recdeltopic__MMColParam = (String)request.getParameter("topic_id");}
%>
<%
Driver Driverrecdeltopic = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrecdeltopic = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrecdeltopic = Connrecdeltopic.prepareStatement("SELECT *  FROM account.message  WHERE topic_id = " + recdeltopic__MMColParam + "");
ResultSet recdeltopic = Statementrecdeltopic.executeQuery();
boolean recdeltopic_isEmpty = !recdeltopic.next();
boolean recdeltopic_hasData = !recdeltopic_isEmpty;
Object recdeltopic_data;
int recdeltopic_numRows = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系統管理--刪除討論主題</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.box {border: 3px solid #FFFFFF;
}
.fixbox {border: 0px none;
	background-attachment: fixed;
	background-repeat: no-repeat;
}
.style20 {font-size: 12px}
.style24 {font-size: 14}
.style35 {	color: #FF0000;
	font-weight: bold;
}
.fixbox2 {	border: 0px none;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: top;
}
.box1 {border: 2px outset #FFFFFF;
}
.style25 {font-size: 14px}
.style36 {
	color: #0000FF;
	font-size: 14px;
	font-family: "超研澤中圓";
}
.style37 {
	color: #0000FF;
	font-family: "超研澤中圓";
}
.style42 {color: #000000}
.style43 {color: #000000; font-size: 14px; }
.style44 {color: #FF0000}
.style45 {	font-size: 16px;
	font-weight: bold;
}
.style46 {font-size: 18px; color: #FF0000;}
.style47 {font-size: 24px}
.style48 {
	font-family: "超研澤中圓";
	font-weight: bold;
	color: #A3CF9C;
}
.style49 {color: #FF6600}
.style53 {font-size: 12px; font-family: "超研澤中圓"; }
.style54 {font-family: "超研澤中圓"}
.style51 {color: #FF6600; font-family: "超研澤中圓"; }
.style56 {color: #000000; font-weight: bold; }
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="../signout.jsp" class="style5">登出</a> || <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索</a> || <a href="../add_term.jsp" class="style5">新增名詞</a> || <a href="../news/news.jsp" class="style5">相關消息</a> || <a href="../suggestion.jsp" class="style5">意見</a> || <a href="../forum/forum.jsp" class="style5">討論區</a> || <a href="message.jsp" class="style5">留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
    <table width="764" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00">
  <tr>
    <td width="843" valign="top"><table width="200" border="3" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td valign="top"><img src="images/message.jpg" width="750" height="110" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="338" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" background="images/admin_board.jpg" class="fixbox">
        <tr>
          <td height="61" colspan="3" align="center" valign="middle">&nbsp;</td>
        </tr>
        <tr>
          <td width="34%" height="68" align="center" valign="bottom"><div align="center">              </div>
          
              <div align="left"></div>            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="bottom"><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1">
                    
                    <div align="center"></div>
                                                
                    <input type="hidden" name="MM_delete" value="form1">
                    <input type="hidden" name="MM_recordId" value="<%=(((recdeltopic_data = recdeltopic.getObject("topic_id"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%>">
                    <input name="topic_id" type="hidden" id="topic_id">
                    <input name="Submit" type="submit" value="確定刪除">
                    <input name="Submit2" type="button" onClick="MM_goToURL('parent','admin.jsp');return document.MM_returnValue" value="回上一頁">
                </form></td>
              </tr>
                        </table></td>
          <td width="50%" align="center" valign="middle"><div align="left"><img src="images/admin_title.gif" width="236" height="35"></div></td>
          <td width="16%" align="center" valign="middle"><div align="right"></div></td>
        </tr>
        <tr>
          <td colspan="3" align="center" valign="top"><div align="center"> </div>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" class="box">
                <tr>
                  <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="84%"><div align="left"><span class="style47"><span class="style48"><span class="style49">刪除的討論主題：</span></span><span class="style51"><%=(((recdeltopic_data = recdeltopic.getObject("topic"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%></span></span></div></td>
                        <td width="16%"><div align="right"></div></td>
                      </tr>
                    </table>                                      
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF" class="box">
                        <tr valign="middle">
                          <td height="25" colspan="2"><span class="style46"><span class="style45">你確定要刪除這筆記錄嗎??</span></span></td>
                      </tr>
                        <tr>
                          <td width="213" valign="top">
                            <div align="center"><span class="style53"><strong>主題:</strong> <%=(((recdeltopic_data = recdeltopic.getObject("topic"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%></span><br>
                                <font face="Verdana, 新細明體" size="2"></font>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="18"><div align="center"><span class="style20"><span class="style44"><span class="style56">類別:</span></span><span class="style35">〔<%=(((recdeltopic_data = recdeltopic.getObject("type"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%>〕</span></span></div></td>
                                  </tr>
                                </table>
                            </div></td>
                          <td valign="top">
                            <div align="left"></div>
                            <table width="103%" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#DFDFDF">
                              <tr>
                               
                                <td width="65%" height="19" class="style20"><div align="left"><span class="style36"> 張 貼 者：</span><span class="style44"><span class="style43"> </span></span><%=(((recdeltopic_data = recdeltopic.getObject("poster"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%></div></td>
                                <td width="35%" rowspan="2">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="22" class="style24"><div align="left"><span class="style25"><span class="style37">張貼時間<strong>：</strong></span><span class="style42"></span></span><%=(((recdeltopic_data = recdeltopic.getObject("posttime"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%></div></td>
                              </tr>
                            </table>
                                                        <table width="100%" border="0" cellpadding="4" cellspacing="0" bgcolor="#F5F5F5">
                              <tr>
                                <td height="94" align="left" valign="top">
                                  <div align="left" class="style25 style54"><%=(((recdeltopic_data = recdeltopic.getObject("content"))==null || recdeltopic.wasNull())?"":recdeltopic_data)%> </div></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table>                  </td>
                </tr>
            </table></td>
        </tr>
    </table></td>
  </tr>
</table>
    <div class="bottom"></div>
</div>
</body>

</html>
<%
recdeltopic.close();
Statementrecdeltopic.close();
Connrecdeltopic.close();
%>
