<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.iflytek.bbs.dao.PostInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.PostInfoDAOImpl"%>
<%@page import="com.iflytek.bbs.entity.PostInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.iflytek.bbs.entity.ReplyInfo"%>
<%@page import="com.iflytek.bbs.dao.ReplyInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.ReplyInfoDAOImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>讯飞学员论坛--帖子列表</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
<div>
	(<img src="image/logo.jpg"/>
</div>
<!--      用户信息、登录、注册        -->

<div class="h">
<%
	String name = (String)session.getAttribute("name");
	if(name==null){
		out.print("您尚未　<a href='login.html'>登录</a> &nbsp;| &nbsp; <A href='reg.html'>注册</A> |");
	}else{
		out.print("欢迎您！"+name+"&nbsp;| &nbsp;<a href='exit.jsp'>退出</a>");
	}
 %>
</div>


<!--      主体        -->
<div>
<!--      导航        -->
<br/>
<div>
	&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
	<%
		request.setCharacterEncoding("UTF-8");
		String boardName = request.getParameter("boardName");
		out.print("<B><a href='list.jsp?boardName="+request.getParameter("boardName")+"'>"+boardName+"</a></B>");
		
		
		
	%>
	
</div>
<br/>
<!--      新帖        -->

	<div>
	<%
		if(name != null){
			out.print("<A href=post.jsp?boardName="+request.getParameter("boardName")+"><IMG src='image/post.gif' name='td_post' border='0' id=td_post></A>");
			
		}
	%>
		
	</div>

	<div class="t">
		<table cellspacing="0" cellpadding="0" width="100%">		
			<tr>
				<th class="h" style="WIDTH: 100%" colspan="4"><span>&nbsp;</span></th>
			</tr>
<!--       表 头           -->
			<tr class="tr2">
				<td>&nbsp;</td>
				<td style="WIDTH: 80%" align="center">文章</td>
				<td style="WIDTH: 10%" align="center">作者</td>
				<td style="WIDTH: 10%" align="center">回复</td>
			</tr>
<!--         主 题 列 表        -->
			<%
				String getPage = request.getParameter("page");
				if(getPage == null){
					getPage = 1+"";
				}
				int pageNow = Integer.parseInt(getPage);
				 
				PostInfoDAO poinDAO = new PostInfoDAOImpl();
				List<PostInfo> poinList = null;
				poinList = poinDAO.selectByboardName(boardName,pageNow);
				int pageCount = poinDAO.getPageCount(boardName);
				ReplyInfoDAO repDAO= new ReplyInfoDAOImpl();
			%>
		
			<%
				for(PostInfo poin : poinList){
			%>
			<tr class="tr3">
				<td><img src="image/topic.gif" border=0 /></td>
				<td style="FONT-SIZE: 15px">
				
					<a href="detail.jsp?boardName=<%=boardName %>&topicName=<%=poin.getTopicName() %>&title=<%=poin.getTitle() %>"><%=poin.getTitle() %></a>
				</td>
				<td align="center"><%=poin.getAuthor() %></td>
				<td align="center"><%=repDAO.getReplyCount(poin.getTopicName()) %></td>
			</tr>
			<%} %>
			
			
		</table>
	</div>
<!--            翻 页          -->
	<div>
		
		<a href="list.jsp?page=1&boardName=<%=boardName %>">首页</a>&nbsp;|&nbsp;
		
		<%
			if(pageNow!=1){
		%>
		<a href="list.jsp?page=<%=pageNow-1 %>&boardName=<%=boardName %>">上一页</a>&nbsp;|&nbsp;
		<%} %>
		
		<%
			if(pageNow != pageCount){
		%>
		<a href="list.jsp?page=<%=pageNow+1 %>&boardName=<%=boardName %>">下一页</a>&nbsp;|&nbsp;
		<%} %>
		
		<a href="list.jsp?page=<%=pageCount %>&boardName=<%=boardName %>">末页</a>
	</div>
</div>
<!--             声 明          -->
<br/>
<center class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd 版权所有</center>

</body>
</html>