<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("big5");%>
<%@ include file="admin/message/Connections/myforum.jsp" %>
<%

String counthits__topicid = null;
if(request.getParameter("topic_id") != null){ counthits__topicid = (String)request.getParameter("topic_id");}

%>
<%
Driver Drivercounthits = (Driver)Class.forName(MM_myforum_DRIVER).newInstance();
Connection Conncounthits = DriverManager.getConnection(MM_myforum_STRING,MM_myforum_USERNAME,MM_myforum_PASSWORD);
PreparedStatement counthits = Conncounthits.prepareStatement("UPDATE message  SET hits=hits+1  WHERE topic_id="+ counthits__topicid + " ");
counthits.executeUpdate();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>討論主題點閱次數計算</title>
</head>

<body>

</body>
</html>
<%
Conncounthits.close();
%>
<jsp:forward page="message_topic.jsp" />