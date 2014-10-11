<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理删帖</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String replyId = request.getParameter("replyId");
	String boardName = request.getParameter("boardName");
	String topicName = request.getParameter("topicName");
	String title = request.getParameter("title");
	
	ReplyInfo rep = new ReplyInfo();
	rep.setReplyId(Integer.parseInt(replyId));
	ReplyInfoDAO repDAO = new ReplyInfoDAOImpl();
	repDAO.delReply(rep);
	
	
 %>
 <script>window.location.replace("detail.jsp?boardName=<%=boardName%>&topicName=<%=topicName%>&title=<%=title%>");</script>
</body>
</html>