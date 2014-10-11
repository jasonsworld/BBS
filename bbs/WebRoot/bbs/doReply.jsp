<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doReply</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String title = (String)session.getAttribute("title");
	String replyAuthor = (String)session.getAttribute("replyAuthor");
	String boardName = (String)session.getAttribute("boardName");
	String topicName = (String)session.getAttribute("topicName");
	
	String replyTitle = request.getParameter("replyTitle");
   	String replyContent = request.getParameter("replyContent");
   	
   	ReplyInfoDAO repDAO = new ReplyInfoDAOImpl();
   	ReplyInfo repin = new ReplyInfo();
   	
   	repin.setReplyAuthor(replyAuthor);
   	repin.setReplyTitle(replyTitle);
   	repin.setReplyContent(replyContent);
   	repin.setBoardName(boardName);
   	repin.setTopicName(topicName);
   	
   	repDAO.add(repin);
   	
   	out.print("<script>alert('亲，您已回帖成功！');location.href='detail.jsp?boardName="+boardName+"&topicName="+topicName+"&title="+title+"'</script>");
   	
%>

</body>
</html>