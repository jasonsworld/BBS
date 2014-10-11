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
<title>处理删帖</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String postId = request.getParameter("postId");
	String boardName = request.getParameter("boardName");
	String topicName = request.getParameter("topicName");
	String title = request.getParameter("title");
	
	int id = Integer.parseInt(postId); 
	 
	PostInfo po = new PostInfo(); 
	po.setPostId(id); 
	PostInfoDAO poDAO = new PostInfoDAOImpl();
	poDAO.delete(po);
	
	
 %>
 <script>window.location.replace("list.jsp?boardName=<%=boardName%>");</script>
</body>
</html>