<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%request.setCharacterEncoding("big5");%>
<%@ include file="Connections/myforum.jsp" %>

<%
// *** Logout the current user.
String MM_Logout = request.getRequestURI() + "?MM_Logoutnow=1";
if (request.getParameter("MM_Logoutnow") != null && request.getParameter("MM_Logoutnow").equals("1")) {
  session.putValue("MM_Username", "");
  session.putValue("MM_UserAuthorization", "");
  String MM_logoutRedirectPage = "forum.jsp";
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
String reclist__qryname = "topic";
if (request.getParameter("qryname") !=null) {reclist__qryname = (String)request.getParameter("qryname");}
%>
<%
String reclist__keyword = "%";
if (request.getParameter("keyword") !=null) {reclist__keyword = (String)request.getParameter("keyword");}
%>
<%
Driver Driverreclist = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connreclist = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementreclist = Connreclist.prepareStatement("SELECT topic.*,COUNT(retopic.topic_id) as recount,  MAX(if(re_posttime,re_posttime,posttime)) as newtime  FROM topic left join retopic   On topic.topic_id =retopic.topic_id  WHERE " + reclist__qryname + " like '%" + reclist__keyword + "%'    GROUP BY topic.topic_id  ORDER BY newtime DESC");
ResultSet reclist = Statementreclist.executeQuery();
boolean reclist_isEmpty = !reclist.next();
boolean reclist_hasData = !reclist_isEmpty;
Object reclist_data;
int reclist_numRows = 0;
%>
<%
int Repeat1__numRows = 10;
int Repeat1__index = 0;
reclist_numRows += Repeat1__numRows;
%>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int reclist_first = 1;
int reclist_last  = 1;
int reclist_total = -1;

if (reclist_isEmpty) {
  reclist_total = reclist_first = reclist_last = 0;
}

//set the number of rows displayed on this page
if (reclist_numRows == 0) {
  reclist_numRows = 1;
}
%>
<% String MM_paramName = ""; %>
<%
// *** Move To Record and Go To Record: declare variables

ResultSet MM_rs = reclist;
int       MM_rsCount = reclist_total;
int       MM_size = reclist_numRows;
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
  for (i=0; reclist_hasData && (i < MM_offset || MM_offset == -1); i++) {
    reclist_hasData = MM_rs.next();
  }
  if (!reclist_hasData) MM_offset = i;  // set MM_offset to the last possible record
}
%>
<%
// *** Move To Record: if we dont know the record count, check the display range

if (MM_rsCount == -1) {

  // walk to the end of the display range for this page
  int i;
  for (i=MM_offset; reclist_hasData && (MM_size < 0 || i < MM_offset + MM_size); i++) {
    reclist_hasData = MM_rs.next();
  }

  // if we walked off the end of the recordset, set MM_rsCount and MM_size
  if (!reclist_hasData) {
    MM_rsCount = i;
    if (MM_size < 0 || MM_size > MM_rsCount) MM_size = MM_rsCount;
  }

  // if we walked off the end, set the offset based on page size
  if (!reclist_hasData && !MM_paramIsDefined) {
    if (MM_offset > MM_rsCount - MM_size || MM_offset == -1) { //check if past end or last
      if (MM_rsCount % MM_size != 0)  //last page has less records than MM_size
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  // reset the cursor to the beginning
  reclist.close();
  reclist = Statementreclist.executeQuery();
  reclist_hasData = reclist.next();
  MM_rs = reclist;

  // move the cursor to the selected record
  for (i=0; reclist_hasData && i < MM_offset; i++) {
    reclist_hasData = MM_rs.next();
  }
}
%>
<%
// *** Move To Record: update recordset stats

// set the first and last displayed record
reclist_first = MM_offset + 1;
reclist_last  = MM_offset + MM_size;
if (MM_rsCount != -1) {
  reclist_first = Math.min(reclist_first, MM_rsCount);
  reclist_last  = Math.min(reclist_last, MM_rsCount);
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
<%request.setCharacterEncoding("big5");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系統管理--版主管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.style6 {
	color: #FFFF00;
	font-size: 16px;
}
.style16 {color: #FFFF00; font-weight: bold; font-size: 16px; }
.style17 {
	font-size: 24px;
	color: #FFFF00;
	font-weight: bold;
	font-family: "新細明體";
}
.box {border: 3px solid #FFFFFF;
}
.box1 {border: 1px solid #990066;
}
.style18 {color: #FFFF00}
.style19 {font-weight: bold; font-size: 18px;}
.fixbox {
	border: 0px none;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: top;
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

.style58 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
.style61 {font-size: 18px}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style58"><a href="../signout.jsp" class="style5">登出 </a>|| <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索 </a>|| <a href="../add_term.jsp" class="style5">新增名詞</a> || <a href="../news/news.jsp" class="style5">相關消息</a> ||<a href="../suggestion.jsp" class="style5"> 意見</a> || <a href="forum.jsp" class="style5">討論區</a> ||<a href="../message/message.jsp" class="style5"> 留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
    <table width="764" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00">
  <tr>
    <td width="843" valign="top"><table width="200" border="3" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td valign="top"><table width="326" border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td valign="top"><img src="images/forum_pic.jpg" width="750" height="110" /></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="289" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" background="images/admin_board.jpg" class="fixbox">
        <tr>
          <td height="68" align="center" valign="middle"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("http://localhost:8080/acc/admin/admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td height="54" align="center" valign="middle"><div align="center"> <img src="images/admin_title.gif" width="236" height="35"></div></td>
        </tr>
        <tr>
          <td align="center" valign="top"><div align="center"> </div>            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" class="box">
              <tr>
                <td height="203" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="16%"><a href="<%= MM_Logout %>"></a></td>
                    <td width="68%"><form name="form1" method="post" action="">
                      <table height="30" align="center" bgcolor="#608712">
                        <tr>
                          <td valign="baseline"><div align="right" class="style18"><span class="style19">查詢主題：</span> </div></td>
                          <td valign="baseline"><div align="right">
                              <select name="qrytopic" id="select">
                                <option value="TopicName">主題名稱</option>
                                <option value="TopicBody">主題內容</option>
                                <option value="AskerName">發表人名稱</option>
                              </select>
                          </div></td>
                          <td valign="baseline" > <span class="style18">
                            <input name="keyword" type="text" id="keyword" value="輸入關鍵字" size="20">
                            <input type="submit" name="Submit" value="查詢">
                          </span></td>
                        </tr>
                      </table>
                      </form></td>
                    <td width="16%">&nbsp;</td>
                  </tr>
                </table>                                  <table width="100%" align="center">
                  <% if (!reclist_isEmpty ) { %>
                  <tr bgcolor="#098DA5" class="tr-f">
                    <td width="63" ><span class="style16">類別</span></td>
                    <td width="175"><span class="style16"><span class="style6 coltext"><strong>討論主題</strong></span> </span></td>
                    <td width="147"><p class="style6 coltext"><span class="style16">發表人</span></p></td>
                    <td width=155><span class="style16">最新回應日期 </span></td>
                    <td width=60><span class="style16">點閱次數 </span></td>
                    <td width=78><span class="style16">回應次數</span></td>
                    <td width=42>&nbsp;</td>
                  </tr>
                  <% while ((reclist_hasData)&&(Repeat1__numRows-- != 0)) { %>
                  <tr valign="middle" bgcolor="#F3F3F3" class="tr-f">
                    <td height="20" ><%=(((reclist_data = reclist.getObject("type"))==null || reclist.wasNull())?"":reclist_data)%></td>
                    <td height="20"><div align="center"><A HREF="ad_topic.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "topic_id=" + (((reclist_data = reclist.getObject("topic_id"))==null || reclist.wasNull())?"":reclist_data) %>" class="style5"><%=(((reclist_data = reclist.getObject("topic"))==null || reclist.wasNull())?"":reclist_data)%></A></div></td>
                    <td height="20"><p class="coltext"><%=(((reclist_data = reclist.getObject("poster"))==null || reclist.wasNull())?"":reclist_data)%></p></td>
                    <td height="20"><%=(((reclist_data = reclist.getObject("newtime"))==null || reclist.wasNull())?"":reclist_data)%></td>
                    <td height="20"><div align="center"><%=(((reclist_data = reclist.getObject("hits"))==null || reclist.wasNull())?"":reclist_data)%></div></td>
                    <td height="20"><div align="center"><%=(((reclist_data = reclist.getObject("recount"))==null || reclist.wasNull())?"":reclist_data)%></div></td>
                    <td height="20"><div align="center"><A HREF="ad_deltopic.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "topic_id=" + (((reclist_data = reclist.getObject("topic_id"))==null || reclist.wasNull())?"":reclist_data) %>"><img src="images/ico_del.gif" width="20" height="20" border="0"></A></div></td>
                  </tr>
                  <%
  Repeat1__index++;
  reclist_hasData = reclist.next();
}
%>
                  <tr>
                    <td colspan="7"><div align="center" class="style17">
                        <table border="0" width="50%" align="center">
                          <tr>
                            <td width="23%" align="center">
                              <% if (MM_offset !=0) { %>
                                  <span class="style61"><span class="style60"><a href="<%=MM_moveFirst%>">第一頁</a>
                                  <% } /* end MM_offset != 0 */ %>
                              </span></span></td>
                            <td width="31%" align="center">
                              <% if (MM_offset !=0) { %>
                                  <span class="style61"><span class="style60"><a href="<%=MM_movePrev%>">上一頁</a>
                                  <% } /* end MM_offset != 0 */ %>
                              </span></span></td>
                            <td width="23%" align="center">
                              <% if (!MM_atTotal) { %>
                                  <span class="style61"><span class="style60"><a href="<%=MM_moveNext%>">下一頁</a>
                                  <% } /* end !MM_atTotal */ %>
                              </span></span></td>
                            <td width="23%" align="center">
                              <% if (!MM_atTotal) { %>
                                  <span class="style60"><a href="<%=MM_moveLast%>" class="style61">最後一頁</a>
                                  <% } /* end !MM_atTotal */ %>
                              </span></td>
                          </tr>
                        </table>
                    </div></td>
                  </tr>
                  <% } /* end !reclist_isEmpty */ %>
                    <tr valign="top">
                      <td height="50" colspan="7"><div align="right">
                        <% if (reclist_isEmpty ) { %>
                        <table width="100%" border="3" align="center" cellpadding="0" cellspacing="0" bgcolor="#6F921A">
                          <tr>
                            <td valign="top" bgcolor="#6F921A"><div align="center"><span class="style17">目前尚無符合查詢的資料</span></div></td>
                          </tr>
                        </table>
                        <% } /* end reclist_isEmpty */ %>
</div></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<div class="bottom"></div>
</body>
</html>
<%
reclist.close();
Statementreclist.close();
Connreclist.close();
%>
