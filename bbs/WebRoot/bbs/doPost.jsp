<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.dao.PostInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.PostInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.PostInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doPost.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   		request.setCharacterEncoding("UTF-8");
   		String title = request.getParameter("title");
   		String content = request.getParameter("content");
   		String boardName = (String)session.getAttribute("boardName");
   		
   		String author = (String)session.getAttribute("name");
   		
   		PostInfoDAO poinDAO = new PostInfoDAOImpl();
		PostInfo poin = new PostInfo();
		poin.setTitle(title);
		poin.setContent(content);
		poin.setAuthor(author);
		poin.setBoardName(boardName);
		poin.setTopicName(title);
		
		poinDAO.add(poin);
		
		out.print("<script>alert('亲，您已发帖成功！');location.href='list.jsp?boardName="+boardName+"'</script>");
   		
   %>
  </body>
</html>
