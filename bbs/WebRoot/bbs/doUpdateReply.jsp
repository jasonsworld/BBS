<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理修改的帖子</title>
</head>
<body>

<%
	String boardName = null;
	request.setCharacterEncoding("UTF-8");
	String replyId = (String)session.getAttribute("replyId");
	boardName = (String)session.getAttribute("boardName");
	String topicName = (String)session.getAttribute("topicName");
	String replyTitle = request.getParameter("replyTitle");
	String replyContent = request.getParameter("replyContent");
	
	int id = Integer.parseInt(replyId);
	ReplyInfo rep = new ReplyInfo();
	rep.setReplyId(id);
	rep.setReplyTitle(replyTitle);
	rep.setReplyContent(replyContent);
	rep.setBoardName(boardName);
	rep.setTopicName(topicName);
	
	ReplyInfoDAO repDAO = new ReplyInfoDAOImpl();
	repDAO.updateReply(rep);
	
 %>
<script >window.location.replace("detail.jsp?boardName=<%=boardName%>&topicName=<%=topicName%>&title=<%=topicName%>");</script>

</body>
</html>