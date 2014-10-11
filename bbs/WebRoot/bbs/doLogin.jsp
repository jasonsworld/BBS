<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.dao.UserInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.UserInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    
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
 		String name = request.getParameter("uName");
 		String pwd = request.getParameter("uPass");
 		
 		UserInfoDAO userDAO = new UserInfoDAOImpl(); 
 		List<UserInfo> list = userDAO.selectAll();
 		boolean flag = true;
 		for(UserInfo user : list){
 			if(user.getName().equals(name) && user.getPwd().equals(pwd)){
 				session.setAttribute("name",name);
 				out.print("<script>alert('欢迎登录！');location.href='index.jsp'</script>");
 				flag = false;
 				break;
 			}
 		}
 		
 		while(flag){
 			out.print("<script>alert('该用户不存在！');location.href='reg.html'</script>");
 			flag = false;
 		}
 		
 	%>
  </body>
</html>
