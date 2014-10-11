<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.PostInfo"%>
<%@page import="com.iflytek.bbs.dao.PostInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.PostInfoDAOImpl"%>
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
	String postId = (String)session.getAttribute("postId");
	boardName = (String)session.getAttribute("boardName");
	String topicName = (String)session.getAttribute("topicName");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	int id = Integer.parseInt(postId);
	PostInfo po = new PostInfo();
	po.setTitle(title);
	po.setContent(content);
	po.setPostId(id);
	
	PostInfoDAO poDAO  = new PostInfoDAOImpl();
	poDAO.updatePost(po);
	
 %>
<script >window.location.replace("detail.jsp?boardName=<%=boardName%>&topicName=<%=topicName%>&title=<%=title%>");</script>

</body>
</html>