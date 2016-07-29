<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<% request.setCharacterEncoding("big5"); %>
<%@ include file="Connections/mynews.jsp" %>
<%
String newsdetail__MMColParam = "1";
if (request.getParameter("news_id") !=null) {newsdetail__MMColParam = (String)request.getParameter("news_id");}
%>
<%
Driver Drivernewsdetail = (Driver)Class.forName(MM_mynews_DRIVER).newInstance();
Connection Connnewsdetail = DriverManager.getConnection(MM_mynews_STRING,MM_mynews_USERNAME,MM_mynews_PASSWORD);
PreparedStatement Statementnewsdetail = Connnewsdetail.prepareStatement("SELECT *  FROM newsdata  WHERE news_id = " + newsdetail__MMColParam + "");
ResultSet newsdetail = Statementnewsdetail.executeQuery();
boolean newsdetail_isEmpty = !newsdetail.next();
boolean newsdetail_hasData = !newsdetail_isEmpty;
Object newsdetail_data;
int newsdetail_numRows = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新聞公告內容頁面</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
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
.style6 {color: #003366}
.style8 {
	color: #0000FF;
	font-weight: bold;
	font-size: 18px;
}
.style9 {
	font-size: 18px;
	font-weight: bold;
}
.style10 {color: #FF0000}
.style11 {font-size: 24px}
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
.style18 {	font-size: 36px;
	color: #000000;
	font-weight: bold;
}
.style19 {font-size: 16px}
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
        <td width="613"><div align="center"><span class="style19"><a href="../signout.jsp" class="style5">登出</a> || <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索</a> || <a href="../add_term.jsp" class="style5">新增名詞 </a>|| <a href="news.jsp" class="style5">相關消息</a> || <a href="../suggestion.jsp" class="style5">意見</a> || <a href="../forum/forum.jsp" class="style5">討論區</a> || <a href="message/message.jsp" class="style5">留言</a></span></div></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <table width="200" border="5" align="center" bordercolor="#339999">
  <tr>
    <td><table width="200" border="0" align="center">
      <tr>
        <td><table width="498" border="0" align="center">
          <tr>
            <td width="492" valign="top"><div align="center"><span class="style18">相關消息</span></div></td>
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
                      <td width="30%"><img src="images/icons_1.gif" width="38" height="35" border="0" alt=""><img src="images/news_board.jpg" width="150" height="35" border="0" alt=""></td>
                      <td width="70%" align="right"><div align="left" class="style11"><span class="style6"><strong><span class="style10">[<%=(((newsdetail_data = newsdetail.getObject("news_type"))==null || newsdetail.wasNull())?"":newsdetail_data)%>]</span></strong></span> </div></td>
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
                      <td><div align="right"></div></td>
                    </tr>
                    <tr>
                      <td height="8">&nbsp;</td>
                      <td style="word-break:break-all"><table width="100%" height="129" border="0" cellpadding="4" cellspacing="0">
                          <tr>
                            <td height="129" align="center"><table width="100%" border="0" cellpadding="4" cellspacing="1" class="box">
                                <tr valign="baseline" bgcolor="#EEEEEE">
                                  <td width="21%" height="20" align="right" bgcolor="#990099"><div align="right" class="style9"><font color="#FFFFFF">標題：</font></div></td>
                                  <td width="79%" height="20"><div align="left"><span class="style6"><span class="style8"><%=(((newsdetail_data = newsdetail.getObject("news_title"))==null || newsdetail.wasNull())?"":newsdetail_data)%></span></span></div></td>
                                </tr>
                                <tr valign="baseline" bgcolor="#EEEEEE">
                                  <td height="20" align="right" bgcolor="#990099"><div align="right" class="style9"><font color="#FFFFFF">公告時間：</font></div></td>
                                  <td height="20"><div align="left"><span class="style6"><%=(((newsdetail_data = newsdetail.getObject("news_date"))==null || newsdetail.wasNull())?"":newsdetail_data)%></span></div></td>
                                </tr>
                                <tr valign="baseline" bgcolor="#EEEEEE">
                                  <td height="20" align="right" bgcolor="#990099"><div align="right" class="style9"><font color="#FFFFFF">編輯人：</font></div></td>
                                  <td height="20"><div align="left"><span class="style10"><%=(((newsdetail_data = newsdetail.getObject("news_editor"))==null || newsdetail.wasNull())?"":newsdetail_data)%></span></div></td>
                                </tr>
                                <tr valign="baseline" bgcolor="#EEEEEE">
                                  <td height="20" align="right" bgcolor="#990099"><div align="right" class="style9"><font color="#FFFFFF">內容：</font></div></td>
                                  <td height="20"><div align="left"><span class="style6"><%=(((newsdetail_data = newsdetail.getObject("news_content"))==null || newsdetail.wasNull())?"":newsdetail_data)%></span></div></td>
                                </tr>
                              </table>
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
                <td><div align="center"><span class="style15"><span class="style17">[ <a href="news.jsp"><img src="images/home.gif" width="35" height="35" border="0" align="absmiddle"></a>回系統公告 ]</span></span><span class="style15">
                 
                </span></div></td>
                <td width="11"><img name="news_r1_c11" src="images/icons.jpg" width="45" height="38" border="0" alt=""></td>
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
newsdetail.close();
Statementnewsdetail.close();
Connnewsdetail.close();
%>
