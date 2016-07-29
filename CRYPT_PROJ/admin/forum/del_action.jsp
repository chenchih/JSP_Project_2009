<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="Connections/myforum.jsp" %>
<%

String delre__topicid = null;
if(request.getParameter("topic_id") != null){ delre__topicid = (String)request.getParameter("topic_id");}

%>
<%
Driver Driverdelre = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Conndelre = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement delre = Conndelre.prepareStatement("DELETE FROM retopic  WHERE topic_id="+ delre__topicid + " ");
delre.executeUpdate();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>執行批次刪除</title>
</head>

<body>

</body>
</html>
<%
Conndelre.close();
%>
<jsp:forward page="forum_admin.jsp" />