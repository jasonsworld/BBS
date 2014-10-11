<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.iflytek.bbs.dao.impl.UserInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.dao.UserInfoDAO"%>
<%@page import="com.iflytek.bbs.entity.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
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
  	UserInfoDAO userDAO = new UserInfoDAOImpl(); 
  
  	
  	String name = request.getParameter("uName");	
  	String pwd = request.getParameter("uPass");
  	String sex = request.getParameter("sex");
  	String headPic = request.getParameter("head");
  	
  	List<UserInfo> list = userDAO.selectAll();
  	boolean flag = true;
 	for(UserInfo user:list){
 		if(user.getName().equals(name)){
 			out.print("<script>alert('该用户已注册!');location.href='reg.html'</script>");
 			flag = false;
 			break;
 		}
  	}
  	
  	while(flag){
	  	UserInfo user = new UserInfo();
	  	user.setName(name);
		user.setPwd(pwd);
		user.setSex(sex);
		user.setHeadPic(headPic);
		userDAO.add(user);
		out.print("<script>alert('注册成功！');location.href='login.html'</script>");
		flag = false;
	}
   %>
  </body>
</html>
