<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connections/board.jsp" %>
<% request.setCharacterEncoding("Big5"); %>
<%
// *** Edit Operations: declare variables

// set the form action variable
String MM_editAction = request.getRequestURI();
if (request.getQueryString() != null && request.getQueryString().length() > 0) {
  MM_editAction += "?" + request.getQueryString();
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
// *** Update Record: set variables

if (request.getParameter("MM_update") != null &&
    request.getParameter("MM_update").toString().equals("form1") &&
    request.getParameter("MM_recordId") != null) {

  MM_editDriver     = MM_board_DRIVER;
  MM_editConnection = MM_board_STRING;
  MM_editUserName   = MM_board_USERNAME;
  MM_editPassword   = MM_board_PASSWORD;
  MM_editTable  = "Reply";
  MM_editColumn = "ReplyID";
  MM_recordId   = "" + request.getParameter("MM_recordId") + "";
  MM_editRedirectUrl = "editboard.jsp?TopicID=" + ((request.getParameter("TopicID")!=null)?request.getParameter("TopicID"):"") + "";
  String MM_fieldsStr = "ReplierName|value|ReplierSex|value|ReplierEmail|value|ReplierSiteName|value|ReplierSiteURL|value|ReplierICQ|value|ReplyBody|value";
  String MM_columnsStr = "ReplierName|',none,''|ReplierSex|',none,''|ReplierEmail|',none,''|ReplierSiteName|',none,''|ReplierSiteURL|',none,''|ReplierICQ|',none,''|ReplyBody|',none,''";

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
// *** Update Record: construct a sql update statement and execute it

if (request.getParameter("MM_update") != null &&
    request.getParameter("MM_recordId") != null) {

  // create the update sql statement
  MM_editQuery = new StringBuffer("update ").append(MM_editTable).append(" set ");
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
    MM_editQuery.append((i!=0)?",":"").append(MM_columns[i]).append(" = ").append(formVal);
  }
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
String updreply__MMColParam = "1";
if (request.getParameter("ReplyID") !=null) {updreply__MMColParam = (String)request.getParameter("ReplyID");}
%>
<%
Driver Driverupdreply = (Driver)Class.forName(MM_board_DRIVER).newInstance();
Connection Connupdreply = DriverManager.getConnection(MM_board_STRING,MM_board_USERNAME,MM_board_PASSWORD);
PreparedStatement Statementupdreply = Connupdreply.prepareStatement("SELECT * FROM Reply WHERE ReplyID = " + updreply__MMColParam + "");
ResultSet updreply = Statementupdreply.executeQuery();
boolean updreply_isEmpty = !updreply.next();
boolean updreply_hasData = !updreply_isEmpty;
Object updreply_data;
int updreply_numRows = 0;
%>
<html>
<head>
<title>Dreamweaver MX For JSP 實作討論區 林建宏&amp;賴慧敏合著</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
</head>

<body>
<form method="POST" action="<%=MM_editAction%>" name="form1">
  <table align="center">
    <tr valign="baseline"> 
      <td nowrap align="right"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">回應者姓名:</div></td>
      <td> <input type="text" name="ReplierName" value="<%=(((updreply_data = updreply.getObject("ReplierName"))==null || updreply.wasNull())?"":updreply_data)%>" size="32"> 
      </td>
    </tr>
    <tr> 
      <td nowrap align="right" valign="top"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">回應者性別:</div></td>
      <td valign="baseline"> <table align="left">
          <tr> 
            <td> <input type="radio" name="ReplierSex" value="男" CHECKED>
              男 <td></tr>
          <tr> 
            <td> <input type="radio" name="ReplierSex" value="女">
              女 <td></tr>
        </table></td>
    </tr>
    <tr valign="baseline"> 
      <td nowrap align="right"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">回應者Email:</div></td>
      <td> <input type="text" name="ReplierEmail" value="<%=(((updreply_data = updreply.getObject("ReplierEmail"))==null || updreply.wasNull())?"":updreply_data)%>" size="32"> 
      </td>
    </tr>
    <tr valign="baseline"> 
      <td nowrap align="right"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">個人網站名稱:</div></td>
      <td> <input type="text" name="ReplierSiteName" value="<%=(((updreply_data = updreply.getObject("ReplierSiteName"))==null || updreply.wasNull())?"":updreply_data)%>" size="32"> 
      </td>
    </tr>
    <tr valign="baseline"> 
      <td nowrap align="right"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">URL網址:</div></td>
      <td> <input type="text" name="ReplierSiteURL" value="<%=(((updreply_data = updreply.getObject("ReplierSiteURL"))==null || updreply.wasNull())?"":updreply_data)%>" size="32"> 
      </td>
    </tr>
    <tr valign="baseline"> 
      <td nowrap align="right"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">回應者的ICQ:</div></td>
      <td> <input type="text" name="ReplierICQ" value="<%=(((updreply_data = updreply.getObject("ReplierICQ"))==null || updreply.wasNull())?"":updreply_data)%>" size="32"> 
      </td>
    </tr>
    <tr> 
      <td nowrap align="right" valign="top"><div align="left"><img src="images/tabletuser_small.gif" width="55" height="55">回應內容:</div></td>
      <td valign="baseline"> <textarea name="ReplyBody" cols="50" rows="5"><%=(((updreply_data = updreply.getObject("ReplyBody"))==null || updreply.wasNull())?"":updreply_data)%></textarea> 
      </td>
    </tr>
    <tr valign="baseline"> 
      <td nowrap align="right">&nbsp;</td>
      <td> <input type="submit" value="確定修改">
        ... <input name="Button" type="button" onClick="MM_goToURL('parent','editboard.jsp');MM_goToURL('parent','editboard.jsp?TopicID=<%= ((request.getParameter("TopicID")!=null)?request.getParameter("TopicID"):"") %>');return document.MM_returnValue" value="返回檢視板面"> 
      </td>
    </tr>
  </table>
  <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%=(((updreply_data = updreply.getObject("ReplyID"))==null || updreply.wasNull())?"":updreply_data)%>">
</form>
<p>&nbsp;</p>
</body>
</html>
<%
updreply.close();
Statementupdreply.close();
Connupdreply.close();
%>
