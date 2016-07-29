<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%request.setCharacterEncoding("big5");%>
<%@ include file="Connections/myforum.jsp" %>
<%
String rectopic__MMColParam = "1";
if (request.getParameter("topic_id") !=null) {rectopic__MMColParam = (String)request.getParameter("topic_id");}
%>
<%
Driver Driverrectopic = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrectopic = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrectopic = Connrectopic.prepareStatement("SELECT * FROM topic WHERE topic_id = " + rectopic__MMColParam + "");
ResultSet rectopic = Statementrectopic.executeQuery();
boolean rectopic_isEmpty = !rectopic.next();
boolean rectopic_hasData = !rectopic_isEmpty;
Object rectopic_data;
int rectopic_numRows = 0;
%>
<%
String recre__MMColParam = "1";
if (request.getParameter("topic_id") !=null) {recre__MMColParam = (String)request.getParameter("topic_id");}
%>
<%
Driver Driverrecre = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Connrecre = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement Statementrecre = Connrecre.prepareStatement("SELECT * FROM retopic WHERE topic_id = " + recre__MMColParam + " ORDER BY re_posttime DESC");
ResultSet recre = Statementrecre.executeQuery();
boolean recre_isEmpty = !recre.next();
boolean recre_hasData = !recre_isEmpty;
Object recre_data;
int recre_numRows = 0;
%>
<%
int Repeat1__numRows = 3;
int Repeat1__index = 0;
rectopic_numRows += Repeat1__numRows;
%>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int recre_first = 1;
int recre_last  = 1;
int recre_total = -1;

if (recre_isEmpty) {
  recre_total = recre_first = recre_last = 0;
}

//set the number of rows displayed on this page
if (recre_numRows == 0) {
  recre_numRows = 1;
}
%>
<%
// *** Recordset Stats: if we don't know the record count, manually count them

if (recre_total == -1) {

  // count the total records by iterating through the recordset
    for (recre_total = 1; recre.next(); recre_total++);

  // reset the cursor to the beginning
  recre.close();
  recre = Statementrecre.executeQuery();
  recre_hasData = recre.next();

  // set the number of rows displayed on this page
  if (recre_numRows < 0 || recre_numRows > recre_total) {
    recre_numRows = recre_total;
  }

  // set the first and last displayed record
  recre_first = Math.min(recre_first, recre_total);
  recre_last  = Math.min(recre_first + recre_numRows - 1, recre_total);
}
%>
<% String MM_paramName = ""; %>
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
<html>
<head>
<title>討論內容</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.box {	border: 2px outset #FFFFFF;
}
.style21 {font-size: 12px}
.style22 {
	color: #FF0000;
	font-weight: bold;
}
.style24 {font-size: 14}
.style25 {font-size: 14px}
.style29 {
	font-size: 14px;
	color: #990000;
	font-weight: bold;
}
.style30 {
	color: #FF0000;
	font-size: 18px;
	font-weight: bold;
}
.fixbox {
	border: none;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center top;
}
.style33 {color: #9900FF; font-size: 18px; font-weight: bold; }
.style36 {
	color: #0000FF;
	font-size: 14px;
}
.style37 {color: #0000FF}
.style42 {color: #000000}
.style43 {color: #000000; font-size: 14px; }
.style44 {color: #FF0000}
.style57 {font-size: 36px;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" background="images/board.jpg">
  <tr>
    <td width="766" valign="top"><table width="683"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="679" height="68"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td><table width="501" border="3" align="center" cellpadding="0" cellspacing="2" bordercolor="#6F921A">
              <tr>
                <td width="489" bgcolor="#FFFFFF"><table width="200" border="3" align="center" cellpadding="0" cellspacing="2">
                  <tr>
                    <td valign="top"><table width="326" border="0" align="center" cellpadding="0" cellspacing="2">
                        <tr>
                          <td valign="top"><div align="center"><span class="style57">Forum 討論區</span></div></td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="50">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="16%"><a href="admin_login.jsp"><img src="images/forum_admin.gif" width="120" height="48" border="0"></a></td>
                <td width="68%"><div align="center">
                  </div></td>
                <td width="16%"><a href="forum_add.jsp"><img src="images/forum_add.gif" width="120" height="48" border="0"></a></td>
              </tr>
          </table></td>
        </tr>
      </table>
        <table width="760" height="40" border="0" align="center" cellpadding="4" cellspacing="0" background="images/detail_title.gif" class="fixbox">
          <tr>
            <td width="142" height="30">&nbsp;</td>
            <td width="497" valign="bottom"><span class="style21"><span class="style24"><span class="style33"><%=(((rectopic_data = rectopic.getObject("topic"))==null || rectopic.wasNull())?"":rectopic_data)%></span></span></span> </td>
            <td width="97" valign="bottom"><div align="center"><span class="style30"><%=(recre_total)%></span></div></td>
          </tr>
      </table>
        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" background="images/line03.gif">
          <tr>
            <td><img src="images/line01.gif" width="760" height="15"></td>
          </tr>
          <tr>
            <td valign="top">
              <table width="95%" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#EFEFEF" class="box">
                <tr>
                  <td width="150" valign="top">                    <div align="center"><img name="face" src="images/face/<%=(((rectopic_data = rectopic.getObject("face"))==null || rectopic.wasNull())?"":rectopic_data)%>" width="100" height="120" alt="表情"><br>
                        <font face="Verdana, 新細明體" size="2"></font>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><div align="center"><span class="style21"><span class="style22"><%=(((rectopic_data = rectopic.getObject("type"))==null || rectopic.wasNull())?"":rectopic_data)%></span></span></div></td>
                          </tr>
                        </table>
                        <table border="0" cellspacing="0" cellpadding="0" width="142" align="center">
                          <tr>
                            <td><img src="images/spacer.gif" width="142" height="1"></td>
                          </tr>
                          <tr>
                            <td background="images/button01.gif" height="20">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="10">&nbsp;</td>
                                  <td valign="baseline">
                                    <div align="center"><font face="新細明體" size="2"><a href="forum.jsp">回主畫面</a> / <A HREF="forum_re.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "topic_id=" + (((rectopic_data = rectopic.getObject("topic_id"))==null || rectopic.wasNull())?"":rectopic_data) %>">回應</A></font></div></td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
                  </div></td>
                  <td valign="top">
                    <div align="left"></div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  bgcolor="#DFDFDF">
                      <tr>
                        <td width="7%" rowspan="2" align="left" valign="top"> <div align="left"><span class="style21"> <font face="Arial, Helvetica, sans-serif">&nbsp;</font><span class="style24"> </span></span>                          
                        <span class="style25"></span> <span class="style21"><span class="style24"><span class="style25"><font size="2"><img src="images/<%=(((rectopic_data = rectopic.getObject("sex"))==null || rectopic.wasNull())?"":rectopic_data)%>" alt="性別" name="sex" width="32" height="32" align="absmiddle"></font></span></span></span></div></td>
                        <td width="48%" class="style21"><div align="left"><span class="style36"> 張 貼 者 ：</span><span class="style44"><span class="style43"><%=(((rectopic_data = rectopic.getObject("poster"))==null || rectopic.wasNull())?"":rectopic_data)%></span></span></div></td>
                        <td width="45%" rowspan="2"><span class="style21"></span></td>
                      </tr>
                      <tr>
                        <td class="style24"><div align="left"><span class="style25"><span class="style37">張貼時間<strong>：</strong></span><span class="style42"><%=(((rectopic_data = rectopic.getObject("posttime"))==null || rectopic.wasNull())?"":rectopic_data)%></span></span></div></td>
                      </tr>
                  </table>
                    <hr noshade size="1">
                    <table width="100%" height="90" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
                      <tr>
                        <td valign="top" bgcolor="#F5F5F5"> <span class="style21"> <span class="style24"> <span class="style25"></span></span></span>
                            
                            <span class="style25"><%=(((rectopic_data = rectopic.getObject("content"))==null || rectopic.wasNull())?"":rectopic_data)%></span> </td>
                      </tr>
                    </table>                  
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5">
                      <tr>
                        <td>
                          <div align="right"><font face="Verdana, 新細明體" size="2"><b> <a href="http://<%=(((rectopic_data = rectopic.getObject("url"))==null || rectopic.wasNull())?"":rectopic_data)%>"><img src="images/www.gif" width="16" height="17" align="absmiddle" border="0" alt="個人網址"></a> <a href="mailto:<%=(((rectopic_data = rectopic.getObject("email"))==null || rectopic.wasNull())?"":rectopic_data)%>"><img src="images/ico_email.gif" width="30" height="20" align="absmiddle" border="0" alt="電子信箱"></a> </b></font></div></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <hr noshade size="1" width="95%">
              <% while ((rectopic_hasData)&&(Repeat1__numRows-- != 0)) { %>
              <% if (!recre_isEmpty ) { %>
              <table width="95%" border="0" align="center" cellpadding="4" cellspacing="0" bgcolor="#EFEFEF">
                <tr>
                  <td width="150" valign="top">
                    <div align="center"><img src="images/face/<%=(((recre_data = recre.getObject("re_face"))==null || recre.wasNull())?"":recre_data)%>" alt="表情" name="reface" width="100" height="120" id="reface"><br>
                      <font face="Verdana, 新細明體" size="2"></font>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><div align="center"><span class="style21"><span class="style22"><%=(((rectopic_data = rectopic.getObject("type"))==null || rectopic.wasNull())?"":rectopic_data)%></span></span></div></td>
                          </tr>
                        </table>
                        <table border="0" cellspacing="0" cellpadding="0" width="142" align="center">
                          <tr>
                            <td><img src="images/spacer.gif" width="142" height="1"></td>
                          </tr>
                          <tr>
                            <td background="images/button01.gif" height="20">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="10">&nbsp;</td>
                                  <td valign="baseline">
                                  <div align="center"><font face="新細明體" size="2"><a href="forum.jsp">回主畫面</a> / <A HREF="forum_re.jsp?<%= MM_keepNone + ((MM_keepNone!="")?"&":"") + "topic_id=" + (((rectopic_data = rectopic.getObject("topic_id"))==null || rectopic.wasNull())?"":rectopic_data) %>">回應</A></font></div></td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
                  </div></td>
                  <td valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  bgcolor="#DFDFDF">
                      <tr>
                        <td width="7%" rowspan="2" valign="top">
                        <div align="center"><span class="style21"> <font face="Arial, Helvetica, sans-serif"><span class="style25"><font size="2"><img src="images/<%=(((recre_data = recre.getObject("re_sex"))==null || recre.wasNull())?"":recre_data)%>" alt="性別" name="resex" width="32" height="32" align="absmiddle" id="resex"></font></span>&nbsp;</font><span class="style24"> </span></span> <span class="style25"></span> <span class="style21"><span class="style24"><span class="style25"></span></span></span></div></td>
                        <td width="45%" class="style21"><div align="left"><span class="style36">張 貼 者 ：</span><span class="style44"><span class="style43"><span class="style25"><%=(((recre_data = recre.getObject("re_poster"))==null || recre.wasNull())?"":recre_data)%></span></span></span></div></td>
                        <td width="48%" rowspan="2"><span class="style21"><span class="style25"><span class="style29"><%=(((recre_data = recre.getObject("re_topic"))==null || recre.wasNull())?"":recre_data)%></span></span></span></td>
                      </tr>
                      <tr>
                        <td class="style24"><div align="left"><span class="style25"><span class="style37">張貼時間<strong>：</strong></span><span class="style42"><%=(((recre_data = recre.getObject("re_posttime"))==null || recre.wasNull())?"":recre_data)%></span></span></div></td>
                      </tr>
                      </table>                                              <hr noshade size="1">
                    <span class="style25"></span>
                    <table width="100%" height="90" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
                      <tr>
                        <td valign="top" bgcolor="#F5F5F5"> <span class="style21"> <span class="style24"> <span class="style25"></span></span></span> <span class="style25"><%=(((recre_data = recre.getObject("re_content"))==null || recre.wasNull())?"":recre_data)%></span> </td>
                      </tr>
                      </table>                                              <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5">
                                  <tr>
                                    <td>
                                      <div align="right"><font face="Verdana, 新細明體" size="2"><b> <a href="http://<%=(((rectopic_data = rectopic.getObject("url"))==null || rectopic.wasNull())?"":rectopic_data)%>"><img src="images/www.gif" width="16" height="17" align="absmiddle" border="0" alt="個人網址"></a> <a href="mailto:<%=(((rectopic_data = rectopic.getObject("email"))==null || rectopic.wasNull())?"":rectopic_data)%>"><img src="images/ico_email.gif" width="30" height="20" align="absmiddle" border="0" alt="電子信箱"></a> </b></font></div></td>
                                  </tr>
                                                                                            </table></td>
                </tr>
                <tr valign="top">
                  <td colspan="2"><hr width="100%" size="2" noshade color="#FF9900"></td>
                </tr>
                </table>
              <% } /* end !recre_isEmpty */ %>
              <%
  Repeat1__index++;
  rectopic_hasData = rectopic.next();
}
%>
              <hr noshade size="1" width="95%"></td>
          </tr>
          <tr>
            <td><img src="images/line01.gif" width="760" height="15"></td>
          </tr>
        </table></td>
  </tr>
</table>
</body>
</html>
<%
rectopic.close();
Statementrectopic.close();
Connrectopic.close();
%>
<%
recre.close();
Statementrecre.close();
Connrecre.close();
%>
