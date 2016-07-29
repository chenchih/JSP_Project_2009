<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%request.setCharacterEncoding("big5");%>
<%@ include file="Connections/myforum.jsp" %>
<%
String reclist__qryname = "topic";
if (request.getParameter("qryname")  !=null) {reclist__qryname = (String)request.getParameter("qryname") ;}
%>
<%
String reclist__keyword = "%";
if (request.getParameter("keyword") !=null) {reclist__keyword = (String)request.getParameter("keyword");}
%>
<%
Driver Driverreclist = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connreclist = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementreclist = Connreclist.prepareStatement("SELECT message.*,COUNT(remessage.topic_id) as recount,  MAX(if(re_posttime,re_posttime,posttime)) as newtime  FROM message left join remessage  On message.topic_id =remessage.topic_id  WHERE " + reclist__qryname + " like '%" + reclist__keyword + "%'  GROUP BY message.topic_id  ORDER BY topic_id ASC");
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


<html>
<head>
<title>JSP討論區管理主頁面</title>
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
	color: #FFFFFF;
	font-weight: bold;
	font-family: "新細明體";
}
.style18 {color: #FFFF00}
.box {
	border: 2px outset #FFFFFF;
}
.style24 {color: #0000FF}
.style25 {font-size: 18px; font-weight: bold;}
.style26 {font-size: 16px}
a:link {
	color: #0000FF;
}
a:hover {
	color: #FF0000;
}
.style27 {color: #FF0000}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>&nbsp;</p>
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style26"><a href="../signout.jsp">登出</a> || <a href="../all_entry.jsp">使用者資料</a> || <a href="../search.jsp">搜索</a> || <a href="../add_term.jsp">新增名詞</a> || <a href="../news/news.jsp">相關消息</a> || <a href="../suggestion.jsp">意見</a> || <a href="../forum/forum.jsp">討論區</a> || <a href="message.jsp">留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
<table border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" background="images/board.jpg">
  <tr>
    <td align="center" valign="top"><table  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td height="68"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("http://localhost:8080/acc/admin/admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td><table width="200" border="3" align="center" cellpadding="1" cellspacing="2" bordercolor="#6F921A">
              <tr>
                <td valign="top"><img src="images/message.jpg" width="750" height="110" /></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td valign="bottom">
            <table width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="2">
              <tr valign="bottom">
                <td width="16%" height="50"><a href="message_add.jsp"><img src="images/forum_add.gif" width="120" height="48" border="0"></a></td>
                <td width="67%" valign="middle">                    <span class="style18">                                      </span>                  <table width="100%" height="30" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FF9933">
                    <tr>
                      <td valign="middle"><form name="form1" method="post" action="">
                        <div align="center"><span class="style18"><span class="style25">查詢主題：</span></span>
                            <select name="qryname" id="select2">
                              <option value="topic">主題名稱</option>
                              <option value="poster">發表人</option>
                              <option value="type">類別</option>
                            </select>
                            <span class="style18">
                            <input name="keyword" type="text" id="keyword8" value="" size="20">
                            </span><span class="style18">
                            <input type="submit" name="Submit" value="查詢">
                          </span> </div>
                      </form></td>
                    </tr>
                </table></td>
                <td width="16%"><a href="admin.jsp"><img src="images/forum_admin.gif" width="120" height="48" border="0"></a></td>
              </tr>
          </table>          </td>
        </tr>
      </table>
        <table width="100%" align="center" cellpadding="2" cellspacing="1" class="box">
          <% if (!reclist_isEmpty ) { %>
          <tr valign="middle" bgcolor="#6F921A" >
            <td width="63" >&nbsp;</td>
            <td width="63" height="30" ><span class="style16">類別</span></td>
            <td height="30" colspan="3"><span class="style16"><span class="style6 coltext"><strong>討論主題</strong></span> </span></td>
            <td width="76" height="25"><p class="style6 coltext"><span class="style16">發表人</span></p></td>
            <td width=146 height="30"><span class="style16">最新回應時間 </span></td>
            <td width=80 height="30"><span class="style16">點閱次數 </span></td>
            <td width=78 height="30"><span class="style16">回應次數</span></td>
          </tr>
          <% while ((reclist_hasData)&&(Repeat1__numRows-- != 0)) { %>
          <tr valign="middle" bgcolor="#FFFFFF">
            <td ><div align="center"><%=(((reclist_data = reclist.getObject("topic_id"))==null || reclist.wasNull())?"":reclist_data)%></div></td>
            <td height="20" ><span class="style24"><%=(((reclist_data = reclist.getObject("type"))==null || reclist.wasNull())?"":reclist_data)%></span></td>
            <td height="20" colspan="3"><span class="style24"><A HREF="message_hits.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "topic_id=" + (((reclist_data = reclist.getObject("topic_id"))==null || reclist.wasNull())?"":reclist_data) %>"><%=(((reclist_data = reclist.getObject("topic"))==null || reclist.wasNull())?"":reclist_data)%></A></span></td>
            <td height="20"><p class="coltext style27"><%=(((reclist_data = reclist.getObject("poster"))==null || reclist.wasNull())?"":reclist_data)%></p></td>
            <td height="20"><span class="style24"><%=(((reclist_data = reclist.getObject("newtime"))==null || reclist.wasNull())?"":reclist_data)%></span></td>
            <td height="20"><div align="center"><span class="style24"><%=(((reclist_data = reclist.getObject("hits"))==null || reclist.wasNull())?"":reclist_data)%></span></div></td>
            <td height="20"><div align="center"><span class="style24"><%=(((reclist_data = reclist.getObject("recount"))==null || reclist.wasNull())?"":reclist_data)%></span></div></td>
          </tr>
          <%
  Repeat1__index++;
  reclist_hasData = reclist.next();
}
%>
          <% } /* end !reclist_isEmpty */ %>

          <tr>
            <td colspan="4">&nbsp;</td>
            <td colspan="5"><table width="83%" border="0" align="right">
                <tr>
                  <td width="23%" align="center">
                    <% if (MM_offset !=0) { %>
                    <a href="<%=MM_moveFirst%>">〔第一頁〕</a>
                    <% } /* end MM_offset != 0 */ %>
                  </td>
                  <td width="31%" align="center">
                    <% if (MM_offset !=0) { %>
                    <a href="<%=MM_movePrev%>">〔上一頁〕</a>
                    <% } /* end MM_offset != 0 */ %>
                  </td>
                  <td width="23%" align="center">
                    <% if (!MM_atTotal) { %>
                    <a href="<%=MM_moveNext%>">〔下一頁〕</a>
                    <% } /* end !MM_atTotal */ %>
                  </td>
                  <td width="23%" align="center">
                    <% if (!MM_atTotal) { %>
                    <a href="<%=MM_moveLast%>">〔最後一頁〕</a>
                    <% } /* end !MM_atTotal */ %>
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="15" colspan="9"><div align="right">
              <% if (reclist_isEmpty ) { %>
              <table width="100%" border="0">
                <tr>
                  <td bgcolor="#CC0066"><div align="center"><span class="style17">目前尚無符合查詢的資料</span></div></td>
                </tr>
              </table>
              <% } /* end reclist_isEmpty */ %>
</div></td>
          </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
reclist.close();
Statementreclist.close();
Connreclist.close();
%>
