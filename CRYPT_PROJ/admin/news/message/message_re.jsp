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
  MM_editTable  = "account.remessage";
  MM_editRedirectUrl = "message_topic.jsp";
  String MM_fieldsStr = "re_topic|value|re_poster|value|re_content|value|topic_id|value|re_posttime|value|re_ip|value";
  String MM_columnsStr = "re_topic|',none,''|re_poster|',none,''|re_content|',none,''|topic_id|none,none,NULL|re_posttime|',none,NULL|re_ip|',none,''";

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
  	if (form1.retopic.value == "" )
		{ alert("請輸入您的新主題");	}
			else if (form1.reposter.value == "" )
				{ alert("請輸入您的發言人");	}
					else if (form1.recontent.value == "" )
						{ alert("請輸入您的內容");	}
							
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
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2" marginheight="2" leftmargin="2" marginwidth="2">
<table width="694" height="397" border="3" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" class="fixbox">
  <tr>
    <td width="686" height="391" valign="top"><table width="100%" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="685" height="68">&nbsp;</td>
        </tr>
        <tr>
          <td height="52"><div align="center" class="style1"><font color="#FFFFFF" face="Verdana, 新細明體">■ 回應主題 ■</font></div></td>
        </tr>
        <tr>
          <td><form ACTION="<%=MM_editAction%>" METHOD="POST" name="form1">
            <table width="100%" border="0" cellspacing="0">
              <tr>
                <td>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="box">
                    <tr>
                      <td width="113" height="30" bgcolor="#a3d3ad">
                        <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>回應主題：</b></font></div></td>
                      <td height="30" colspan="2"> <font size="2" face="新細明體"> 　
                            <input name="re_topic" type="text" id="re_topic" size="30">
                            </font></td>
                    </tr>
                    <tr>
                      <td width="113" height="30" bgcolor="#a3d3ad">
                        <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b>發言人：</b></font></div></td>
                      <td width="451" height="30"><font size="2" face="新細明體"> 　
                            <input name="re_poster" type="text" id="re_poster">
                      </font></td>
                      
                    </tr>
                    <tr>
                      <td width="113" height="30" valign="top" bgcolor="#a3d3ad">
                        <div align="right"><font color="#990000" size="2" face="Verdana, 新細明體"><b><br>
                內容：</b></font></div></td>
                      <td colspan="2"> <font size="2" face="新細明體"> 　
                            <textarea name="re_content" cols="60" rows="10" id="re_content"></textarea>
                      </font></td>
                    </tr>
                    <tr>                    </tr>
                    <tr>
                      <td width="113" height="30" bgcolor="#a3d3ad">&nbsp;</td>
                      <td height="30" colspan="2"> 　
                          <input name="Submit" type="submit"  value="送出發言" onClick="check()" >
                          <input type="reset" name="Submit2" value="重新填寫">
                          <input type="button" name="Submit2" value="關閉視窗" onClick="window.close()" >                          <b>
                          <input name="topic_id" type="hidden" id="topic_id" value="<%= ((request.getParameter("topic_id")!=null)?request.getParameter("topic_id"):"") %>">
                          </b><b>
                          <input name="re_posttime" type="hidden" id="re_posttime" value="<%=posttime%>" />
                          </b>                          <b>
                        <input name="re_ip" type="hidden" id="re_ip" value="<%=request.getRemoteAddr()%>">
                        <input type="hidden" name="MM_insert" value="form1">
                        </b></td>
                    </tr>
                </table></td>
              </tr>
            </table>
                              </form></td>
        </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>