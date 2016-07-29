<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%request.setCharacterEncoding("big5");%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%
  SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd H:m:s");
  String posttime=date.format(new Date());
  %>
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
// *** Insert Record: set variables

if (request.getParameter("MM_insert") != null && request.getParameter("MM_insert").toString().equals("form1")) {

  MM_editDriver     = MM_myforum_DRIVER;
  MM_editConnection = MM_myforum_STRING;
  MM_editUserName   = MM_myforum_USERNAME;
  MM_editPassword   = MM_myforum_PASSWORD;
  MM_editTable  = "account.retopic";
  MM_editRedirectUrl = "forum_topic.jsp";
  String MM_fieldsStr = "re_topic|value|re_poster|value|re_face|value|re_content|value|topic_id|value|re_posttime|value|re_ip|value";
  String MM_columnsStr = "re_topic|',none,''|re_poster|',none,''|re_face|',none,''|re_content|',none,''|topic_id|none,none,NULL|re_posttime|',none,NULL|re_ip|',none,''";

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
<title>回應主題</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<script language="JavaScript">
<!--


function chgimg() 
{
    document.faceimg.src ="images/face/"+document.form1.re_face.value;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

function check()
 {
 
	if (form1.re_topic.value == "" )
		{ alert("請輸入您的新主題");	}
			else if (form1.re_poster.value == "" )
				{ alert("請輸入您的發言人");	}
					else if (form1.re_content.value == "" )
						{ alert("請輸入您的內容");	}
						else 										
								{ form1.submit();}	
	}

//-->
</script>
<style type="text/css">
<!--
.box {border: 2px outset #FFFFFF;
}
.fixbox {	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center top;
	background-image: url(images/board.jpg);
}
.style1 {
	font-size: 24px;
	font-weight: bold;
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

.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
.style19 {color: #000000}
-->
</style>
</head>
<body text="#000000" topmargin="2" marginheight="2" leftmargin="2" marginwidth="2">
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="../signout.jsp" class="style5">登出 </a>|| <a href="../all_entry.jsp" class="style5">使用者資料</a> || <a href="../search.jsp" class="style5">搜索 </a>|| <a href="../add_term.jsp" class="style5">新增名詞</a> || <a href="../news/news.jsp" class="style5">相關消息</a> ||<a href="../suggestion.jsp" class="style5"> 意見</a> || <a href="forum.jsp" class="style5">討論區</a> ||<a href="../message/message.jsp" class="style5"> 留言</a></span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
    <table width="877" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" class="fixbox">
  <tr>
    <td width="869" height="535" valign="top"><table width="100%" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="685" height="71" bgcolor="#FFFFFF"><% String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("http://localhost:8080/acc/admin/admin.jsp");}
  }

 %></td>
        </tr>
        <tr>
          <td height="55" bgcolor="#CEE597"><div align="center" class="style1"><span class="style19"><font face="Verdana, 新細明體">■ 回應討論區 ■</font>
              </span>
              <div align="center" class="style1"><font color="#FFFFFF" face="Verdana, 新細明體"><font color="#FFFFFF" face="Verdana, 新細明體">            </font></font></div>
          </div></td>
        </tr>
        <tr>
          <td height="410"><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1">
              <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td valign="top">
                    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="box">
                      <tr>
                        <td width="96" height="30" bgcolor="#a3d3ad">
                        <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>回應主題</b></font></div></td>
                        <td height="30" colspan="2"> <div align="left">
                          <p><font size="2" face="新細明體"> 　
                            <input name="re_topic" type="text" id="re_topic2" size="30">
                            </font></p>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="30" bgcolor="#a3d3ad">
                          <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>發言人</b></font></div></td>
                        <td width="631" height="30"><div align="left">
                          <p><font size="2" face="新細明體"> 　
                            <input name="re_poster" type="text" id="re_poster">
                            </font></p>
                        </div></td>
                        <td width="119" height="120" rowspan="4" align="center"> <div align="left"><img src="images/face/anger.gif" name="faceimg" width="100" height="120" border="1" id="faceimg" > </div></td>
                      </tr>
                      <tr> </tr>
                      <tr>
                        <td height="30" bgcolor="#a3d3ad">
                          <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>表情</b></font></div></td>
                        <td height="30"><div align="left">
                          <p><font size="2" face="新細明體"> 　
                            <select name="re_face" id="select3" onchange="javascript:chgimg();return true;">
                              <option value="anger.gif" selected="selected">選個表情吧！</option>
                              <option value="anger.gif">怒</option>
                              <option value="cry.gif">哭</option>
                              <option value="down.gif">低落</option>
                              <option value="glad.gif">快活</option>
                              <option value="happy.gif">高興</option>
                              <option value="laugh.gif">笑</option>
                              <option value="quiet.gif">沈默</option>
                              <option value="sad.gif">悲哀</option>
                              <option value="silence.gif">寂靜</option>
                              <option value="tongue.gif">舌</option>
                              <option value="undecided.gif">未決定的</option>
                              <option value="wink.gif">眨眼</option>
                              </select>
                            </font></p>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="30" bgcolor="#a3d3ad">
                          <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>內容</b></font></div></td>
                        <td height="30"> <div align="left">
                          <p><font size="2" face="新細明體"> 　
                            <textarea name="re_content" cols="60" rows="10" id="textarea3"></textarea>
                            </font></p>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="30" valign="top" bgcolor="#a3d3ad">
                          <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b><br>
                        </b></font></div></td>
                        <td colspan="2">
                          <div align="center"><font size="2" face="新細明體"> 　 　
                                <input type="button" name="button2" value="送出" onClick="check()">
                                <input type="reset" name="Submit2" value="重新填寫">
                                <b>
                                <input name="topic_id" type="hidden" id="topic_id5" value="<%= ((request.getParameter("topic_id")!=null)?request.getParameter("topic_id"):"") %>">
                                </b><b>
                                <input name="re_posttime" type="hidden" id="re_posttime5" value="<%=posttime%>" />
                                </b> <b>
                                <input name="re_ip" type="hidden" id="re_ip5" value="<%=request.getRemoteAddr()%>">
                                <input type="hidden" name="MM_insert" value="form1">
                            </b> </font></div></td>
                      </tr>
                      <tr>
                        <td height="30" bgcolor="#a3d3ad">
                          <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"></font></div></td>
                        <td height="30" colspan="2">
                          <div align="center"><font size="2" face="新細明體">
                            <input type="button" name="Submit22" value="關閉視窗" onClick="window.close()" >
                            <b> </b></font></div></td>
                      </tr>
                      <tr bgcolor="#D4E8A1" > </tr>
                  </table></td>
                </tr>
              </table>
          </form></td>
        </tr>
    </table></td>
  </tr>
</table>
    <div class="bottom"></div>
</body>
</html>