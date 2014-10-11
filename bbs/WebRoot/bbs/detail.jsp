<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.iflytek.bbs.dao.PostInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.PostInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.PostInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.iflytek.bbs.dao.UserInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.UserInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.UserInfo"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>讯飞学员论坛--看贴</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
<div>&nbsp; 
	<img src="image/logo.jpg"/>
</div>

<!--      用户信息、登录、注册        -->

	<div class="h">
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String)session.getAttribute("name");
		if(name==null){
			out.print("您尚未　<a href='login.html'>登录</a> &nbsp;| &nbsp; <A href='reg.html'>注册</A> |");
		}else{
			out.print("欢迎您！"+name+"&nbsp;| &nbsp;<a href='exit.jsp'>退出</a>");
		}
	 %>
	</div>

<!--      主体        -->
<div><br/>
	<!--      导航        -->
<div>
	&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
	<%
		String boardName = request.getParameter("boardName");
		out.print("<B><a href='list.jsp?boardName="+request.getParameter("boardName")+"'>"+boardName+"</a></B>");
		
	%>
	
</div>
	<br/>
	<!--      回复、新帖        -->
	<div>
	<%
		String topicName = request.getParameter("topicName");
		String title = request.getParameter("title");
		session.setAttribute("title",title);
		session.setAttribute("boardName",boardName);
		
		if(name != null){
			out.print("<a href='reply.jsp'><img src='image/reply.gif'  border='0' id=td_post/></a> ");
		}
	%>	
		
	</div>

	<!--      本帖主题的标题        -->
	<div>
		<table cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<th class="h">本帖主题: <%=topicName %></th>
			</tr>
			<tr class="tr2">
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	
	<!--      主题        -->
	<%
		PostInfoDAO poinDAO = new PostInfoDAOImpl();
		PostInfo poin = new PostInfo();
		poin.setTitle(title);
		List<PostInfo> poinList = poinDAO.selectByTitle(poin);
		
		poin.setBoardName(poinList.get(0).getBoardName());
		poin.setTopicName(poinList.get(0).getTopicName());
		poin.setContent(poinList.get(0).getContent());
		poin.setPostId(poinList.get(0).getPostId());
		
		String userName = poinList.get(0).getAuthor();
		UserInfoDAO userDAO = new UserInfoDAOImpl();
		UserInfo user = new UserInfo();
		user.setName(userName);
		List<UserInfo> userinfoList = userDAO.selectByName(user);
		
		session.setAttribute("topicName",poinList.get(0).getTopicName());
		
	%>
	<div class="t">
		<table style="bORDER-TOP-WIDth: 0px; table-LaYOUT: fixed" cellspacing="0" cellpadding="0" width="100%">
			<tr class="tr1">
				<th style="WIDth: 20%">
					<b><%=poinList.get(0).getAuthor() %></b><br/>
					<img src="image/head/<%=userinfoList.get(0).getHeadPic() %>"/><br/>
					注册:<%=userinfoList.get(0).getRegTime() %><br/>
				</th>
				
				<th>
					<h4><%=poin.getTitle() %></h4>
					<div><%=poinList.get(0).getContent() %></div>
					<div class="tipad gray">
						发表：<%=poinList.get(0).getPostTime() %>
						<%
							if(name!=null){
						 %>
							 <%
								if(name.equals(poin.getAuthor())|| name.equals("admin")){
	 						%>
							<a href="doDeletePost.jsp?postId=<%=poin.getPostId() %>&boardName=<%=poin.getBoardName() %>
							&topicName=<%=poin.getTopicName() %>&title=<%=poin.getTitle() %>" onclick="return confirm('确认删除？')">[删除]</a>
						
							<a href="updatePost.jsp?postId=<%=poin.getPostId() %>&boardName=<%=poin.getBoardName() %>
							&topicName=<%=poin.getTopicName() %>&title=<%=poin.getTitle() %>&content=<%=poin.getContent() %>">[修改]</a>
							<%} %>
						 <%} %>
					</div>
				</th>
			</tr>
		</table>
	</div>
	
	<!--      回复        -->
	<%
	
		String getPage = request.getParameter("page");
		if(getPage == null){
			getPage = 1+"";
		}
		int pageNow = Integer.parseInt(getPage);
		
		ReplyInfoDAO repinDAO = new ReplyInfoDAOImpl();
		ReplyInfo repin = new ReplyInfo();
		repin.setBoardName(boardName);
		repin.setTopicName(topicName);
		List<ReplyInfo> repinList = null;
		
		repinList = repinDAO.selectByboardTopicName(pageNow,repin);
		int pageCount = repinDAO.getPageCount(repin);
		
	%>
	
	<%
		for(ReplyInfo rep : repinList){
		
		List<UserInfo> uList = null;
		UserInfo u = new UserInfo();
		u.setName(rep.getReplyAuthor());
		uList = userDAO.selectByName(u);
	%>
	<div class="t">
		<table style="bORDER-TOP-WIDth: 0px; table-LaYOUT: fixed" cellspacing="0" cellpadding="0" width="100%">
			<tr class="tr1">
				<th style="WIDth: 20%">
					<b><%=rep.getReplyAuthor() %></b><br/><br/>
					<img src="image/head/<%=uList.get(0).getHeadPic() %>"/><br/>
					注册:<%=uList.get(0).getRegTime() %><br/>
				</th>
				<th>
					<h4><%=rep.getReplyTitle() %></h4>
					<div><%=rep.getReplyContent() %></div>
					<div class="tipad gray">
						发表：<%=rep.getReplyTime() %>
						<%
							if(name!=null){
						 %>
						<%
							if(name.equals(rep.getReplyAuthor()) || name.equals("admin")){
						 %>
						<a href="doDeleteReply.jsp?replyId=<%=rep.getReplyId() %>&boardName=<%=rep.getBoardName() %>
						&topicName=<%=rep.getTopicName() %>&title=<%=rep.getTopicName() %>" onclick="return confirm('确认删除？')">[删除]</a>
						<a href="updateReply.jsp?replyId=<%=rep.getReplyId() %>&boardName=<%=rep.getBoardName() %>
						&topicName=<%=rep.getTopicName() %>&title=<%=rep.getReplyTitle() %>&replyContent=<%=rep.getReplyContent() %>">[修改]</a>
					<%} %>
					<%} %>
					</div>
				</th>
			</tr>
		</table>
	</div>
	
	<%} %>
	<!--            翻 页          -->
	<div>
		
		<%
			String bn = null;
			bn = boardName;
		%>
			
		<a href="detail.jsp?page=1&boardName=<%=bn %>&topicName=<%=topicName %>&title=<%=title %>">首页</a>&nbsp;|&nbsp;
		
		<%
			if(pageNow!=1){
		%>
		<a href="detail.jsp?page=<%=pageNow-1 %>&boardName=<%=bn %>&topicName=<%=topicName %>&title=<%=title %>">上一页</a>&nbsp;|&nbsp;
		<%} %>
		
		<%
			if(pageNow != pageCount){
		%>
		<a href="detail.jsp?page=<%=pageNow+1 %>&boardName=<%=bn %>&topicName=<%=topicName %>&title=<%=title %>">下一页</a>&nbsp;|&nbsp;
		<%} %>
		
		<a href="detail.jsp?page=<%=pageCount %>&boardName=<%=bn %>&topicName=<%=topicName %>&title=<%=title %>">末页</a>
	</div>
	
</div>

<!--      声明        -->
<br/>
<center class="gray">2007 beijing aptech beida Jade bird
Information Technology Co.,Ltd 版权所有</center>
</body>
</html>