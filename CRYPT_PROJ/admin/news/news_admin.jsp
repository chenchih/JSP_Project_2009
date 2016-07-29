<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connections/mynews.jsp" %>
<%
Driver Drivernewslist = (Driver)Class.forName(MM_mynews_DRIVER).newInstance();
Connection Connnewslist = DriverManager.getConnection(MM_mynews_STRING,MM_mynews_USERNAME,MM_mynews_PASSWORD);
PreparedStatement Statementnewslist = Connnewslist.prepareStatement("SELECT * FROM newsdata ORDER BY news_date DESC");
ResultSet newslist = Statementnewslist.executeQuery();
boolean newslist_isEmpty = !newslist.next();
boolean newslist_hasData = !newslist_isEmpty;
Object newslist_data;
int newslist_numRows = 0;
%>
<%
int Repeat1__numRows = 5;
int Repeat1__index = 0;
newslist_numRows += Repeat1__numRows;
%>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int newslist_first = 1;
int newslist_last  = 1;
int newslist_total = -1;

if (newslist_isEmpty) {
  newslist_total = newslist_first = newslist_last = 0;
}

//set the number of rows displayed on this page
if (newslist_numRows == 0) {
  newslist_numRows = 1;
}
%>
<%
// *** Recordset Stats: if we don't know the record count, manually count them

if (newslist_total == -1) {

  // count the total records by iterating through the recordset
    for (newslist_total = 1; newslist.next(); newslist_total++);

  // reset the cursor to the beginning
  newslist.close();
  newslist = Statementnewslist.executeQuery();
  newslist_hasData = newslist.next();

  // set the number of rows displayed on this page
  if (newslist_numRows < 0 || newslist_numRows > newslist_total) {
    newslist_numRows = newslist_total;
  }

  // set the first and last displayed record
  newslist_first = Math.min(newslist_first, newslist_total);
  newslist_last  = Math.min(newslist_first + newslist_numRows - 1, newslist_total);
}
%>
<% String MM_paramName = ""; %>
<%
// *** Move To Record and Go To Record: declare variables

ResultSet MM_rs = newslist;
int       MM_rsCount = newslist_total;
int       MM_size = newslist_numRows;
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
  for (i=0; newslist_hasData && (i < MM_offset || MM_offset == -1); i++) {
    newslist_hasData = MM_rs.next();
  }
  if (!newslist_hasData) MM_offset = i;  // set MM_offset to the last possible record
}
%>
<%
// *** Move To Record: if we dont know the record count, check the display range

if (MM_rsCount == -1) {

  // walk to the end of the display range for this page
  int i;
  for (i=MM_offset; newslist_hasData && (MM_size < 0 || i < MM_offset + MM_size); i++) {
    newslist_hasData = MM_rs.next();
  }

  // if we walked off the end of the recordset, set MM_rsCount and MM_size
  if (!newslist_hasData) {
    MM_rsCount = i;
    if (MM_size < 0 || MM_size > MM_rsCount) MM_size = MM_rsCount;
  }

  // if we walked off the end, set the offset based on page size
  if (!newslist_hasData && !MM_paramIsDefined) {
    if (MM_offset > MM_rsCount - MM_size || MM_offset == -1) { //check if past end or last
      if (MM_rsCount % MM_size != 0)  //last page has less records than MM_size
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  // reset the cursor to the beginning
  newslist.close();
  newslist = Statementnewslist.executeQuery();
  newslist_hasData = newslist.next();
  MM_rs = newslist;

  // move the cursor to the selected record
  for (i=0; newslist_hasData && i < MM_offset; i++) {
    newslist_hasData = MM_rs.next();
  }
}
%>
<%
// *** Move To Record: update recordset stats

// set the first and last displayed record
newslist_first = MM_offset + 1;
newslist_last  = MM_offset + MM_size;
if (MM_rsCount != -1) {
  newslist_first = Math.min(newslist_first, MM_rsCount);
  newslist_last  = Math.min(newslist_last, MM_rsCount);
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
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>系統管理主畫面</title>
<style type="text/css">
<!--
.box {	border: 1px solid #990066;
}
.style1 {font-family: "新細明體";
	font-weight: bold;
	font-size: 18px;
}
.style4 {font-size: 16px; font-weight: bold; }
.style7 {font-size: 18px}
.style8 {	color: #0000FF;
	font-weight: bold;
}
.style10 {font-size: 16px; color: #FF0000; }
.style14 {
	color: #006600;
	font-size: 18px;
}
.style15 {
	font-size: 12px;
	color: #003366;
	font-weight: bold;
}
.style18 {color: #006699}
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
.style19 {	font-size: 36px;
	color: #000000;
	font-weight: bold;
}

.style20 {font-size: 16px}
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
        <td width="613"><div align="center"><span class="style20"><a href="../signout.jsp" class="style5">登出</a> || <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索</a> || <a href="../add_term.jsp" class="style5">新增名詞 </a>|| <a href="news.jsp" class="style5">相關消息</a> || <a href="../suggestion.jsp" class="style5">意見</a> || <a href="../forum/forum.jsp" class="style5">討論區</a> || <a href="message/message.jsp" class="style5">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;    </p>
    <table width="200" border="5" align="center" cellpadding="0" cellspacing="0" bordercolor="#339999">
  <tr>
    <td width="760" height="440"><div align="center">
      <table width="200" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"></div>
              <table width="750" border="8" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFCC00">
                <tr>
                  <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="45" height="34"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                        <td valign="bottom" background="images/news_r1_c10.gif"><table width="100%" height="34" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="29%"><img src="images/icons_1.gif" width="38" height="35" border="0" alt="">
                                <table width="498" border="0" align="center">
                                  <tr>
                                    <td width="492" valign="top"><div align="center"><span class="style19">相關消息</span></div></td>
                                  </tr>
                                </table>
                              </td>
                              <td width="71%" align="right"><span class="style15"> 記錄 <%=(newslist_first)%> 到 <%=(newslist_last)%>筆<br> 
                                  共 <%=(newslist_total)%> 筆 </span></td>
                            </tr>
                        </table></td>
                        <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="11" height="192" background="images/news_r4_c1.gif">&nbsp;</td>
                        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="7" height="8">&nbsp;</td>
                              <td><div align="right" class="style4"><span class="style10"><span class="style14">[ </span><a href="news_add.jsp"><img src="images/pen.gif" width="35" height="35" border="0" align="absmiddle"></a></span><span class="style14">新增網站公告</span><span class="style7">]</span></div></td>
                            </tr>
                            <tr>
                              <td height="139" rowspan="2" background="images/news_r6_c2.gif">&nbsp;</td>
                              <td style="word-break:break-all"><table width="100%" border="0" cellspacing="0" cellpadding="4">
                                  <tr>
                                    <td><div align="center">
                                      <% if (!newslist_isEmpty ) { %>
                                      <table width="100%" border="0" cellpadding="4" cellspacing="1" class="box">
                                        <tr valign="baseline" bgcolor="#FF9900">
                                          <td width="124" height="20"><span class="style4"><font color="#FFFFFF">公告日期</font></span></td>
                                          <td width="419" height="20"><span class="style4"><font color="#FFFFFF">公告標題</font></span></td>
                                          <td width="122" height="20"><span class="style4"><font color="#FFFFFF">新聞編輯</font></span></td>
                                        </tr>
                                        <% while ((newslist_hasData)&&(Repeat1__numRows-- != 0)) { %>
                                        <tr valign="baseline" bgcolor="#EEEEEE">
                                          <td height="20"><%=(((newslist_data = newslist.getObject("news_date"))==null || newslist.wasNull())?"":newslist_data)%></td>
                                          <td height="20"><div align="left"><span class="style7"><font color="#FF3300">[<%=(((newslist_data = newslist.getObject("news_type"))==null || newslist.wasNull())?"":newslist_data)%>]</font><span class="style8">&nbsp; <%=(((newslist_data = newslist.getObject("news_title"))==null || newslist.wasNull())?"":newslist_data)%></span></span></div></td>
                                          <td height="20" class="style10">[ <A HREF="news_upd.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "news_id=" + (((newslist_data = newslist.getObject("news_id"))==null || newslist.wasNull())?"":newslist_data) %>">修改</A> ] [ <A HREF="news_del.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "news_id=" + (((newslist_data = newslist.getObject("news_id"))==null || newslist.wasNull())?"":newslist_data) %>">刪除</A> ] </td>
                                        </tr>
                                        <%
  Repeat1__index++;
  newslist_hasData = newslist.next();
}
%>
                                      </table>
                                      <% } /* end !newslist_isEmpty */ %>
                                    </div></td>
                                  </tr>
                                </table>
                                  
                                <div align="center">
                                  <% if (newslist_isEmpty ) { %>
                                  <table width="100%" height="26" border="0" cellpadding="4" cellspacing="0">
                                    <tr>
                                      <td height="26" align="center" valign="top"><span class="style1"><font color="#990000">目前沒有任何新聞公告</font></span></td>
                                    </tr>
                                  </table>
                                  <% } /* end newslist_isEmpty */ %>
                              </div></td>
                            </tr>
                            <tr>
                              <td height="35" style="word-break:break-all"><div align="center">
                                  <table border="0" width="50%" align="center">
                                    <tr>
                                      <td width="23%" align="center"><% if (MM_offset !=0) { %>
                                        <a href="<%=MM_moveFirst%>"><img src="First.gif" border=0></a>
                                        <% } /* end MM_offset != 0 */ %>
                                      </td>
                                      <td width="31%" align="center"><% if (MM_offset !=0) { %>
                                        <a href="<%=MM_movePrev%>"><img src="Previous.gif" border=0></a>
                                        <% } /* end MM_offset != 0 */ %>
                                      </td>
                                      <td width="23%" align="center"><% if (!MM_atTotal) { %>
                                        <a href="<%=MM_moveNext%>"><img src="Next.gif" border=0></a>
                                        <% } /* end !MM_atTotal */ %>
                                      </td>
                                      <td width="23%" align="center"><% if (!MM_atTotal) { %>
                                        <a href="<%=MM_moveLast%>"><img src="Last.gif" border=0></a>
                                        <% } /* end !MM_atTotal */ %>
                                      </td>
                                    </tr>
                                  </table>
                              </div></td>
                            </tr>
                        </table></td>
                        <td width="11" align="left" valign="middle">&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="40"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                        <td><div align="center"><span class="style18"><span class="style17">[ <a href="news.jsp"><img src="images/home.gif" width="35" height="35" border="0" align="absmiddle"></a>回系統公告 ]</span></span>
                      
                        </div></td>
                        <td width="11"><img src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
        </tr>
      </table>
    </div>
    </td>
  </tr>
</table>
</div>
</body>
</html>
<%
newslist.close();
Statementnewslist.close();
Connnewslist.close();
%>
