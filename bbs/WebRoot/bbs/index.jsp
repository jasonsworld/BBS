<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.iflytek.bbs.dao.PostInfoDAO"%>
<%@page import="com.iflytek.bbs.dao.impl.PostInfoDAOImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问讯飞学员论坛</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>

<div>
	<img src="image/logo.jpg"/>
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
 <%
 	PostInfoDAO postDAO = new PostInfoDAOImpl();
  %>
</div>

<!--      主体        -->
<div class="t">
	<table cellspacing="0" cellpadding="0" width="100%">
		<tr class="tr2" align="center">
			<td colspan="2">论坛</td>
			<td style="WIDTH: 10%;">主题</td>
			<td style="WIDTH: 30%">最后发表</td>
		</tr>
	<!--       主版块       -->
		
		<tr class="tr3">
			<td colspan="4">.NET技术</td>
		</tr>
	<!--       子版块       -->
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=C语言">C语言</a>
			</th>
			<td align="center">
			<%= postDAO.getBoardNameNum("C语言")%>
			</td>
			<th>
				<%-- <span>
					<a href="detail.jsp?boardName=C语言&topicName=<%=postDAO.getLatestPost("C语言").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("C语言").get(0).getTitle() %>"><%=postDAO.getLatestPost("C语言").get(0).getTitle() %> </a>
				</span> --%>
				<br/>
				<span><%=postDAO.getLatestPost("C语言").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("C语言").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=WinForms">WinForms</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("WinForms")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=WinForms&topicName=<%=postDAO.getLatestPost("WinForms").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("WinForms").get(0).getTitle() %>"><%=postDAO.getLatestPost("WinForms").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("WinForms").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("WinForms").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif" />
				<a href="list.jsp?boardName=ADO.NET">ADO.NET</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("ADO.NET")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=ADO.NET&topicName=<%=postDAO.getLatestPost("ADO.NET").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("ADO.NET").get(0).getTitle() %>"><%=postDAO.getLatestPost("ADO.NET").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("ADO.NET").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("ADO.NET").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=ASP.NET">ASP.NET</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("ASP.NET")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=ASP.NET&topicName=<%=postDAO.getLatestPost("ASP.NET").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("ASP.NET").get(0).getTitle() %>"><%=postDAO.getLatestPost("ASP.NET").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("ASP.NET").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("ASP.NET").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td colspan="4">Java技术</td>
		</tr>
	<!--       子版块       -->
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=Java基础">Java基础</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("Java基础")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=Java基础&topicName=<%=postDAO.getLatestPost("Java基础").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("Java基础").get(0).getTitle() %>"><%=postDAO.getLatestPost("Java基础").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("Java基础").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("Java基础").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=JSP技术">JSP技术</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("JSP技术")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=JSP技术&topicName=<%=postDAO.getLatestPost("JSP技术").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("JSP技术").get(0).getTitle() %>"><%=postDAO.getLatestPost("JSP技术").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("JSP技术").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("JSP技术").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=Servlet技术">Servlet技术</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("Servlet技术")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=Servlet技术&topicName=<%=postDAO.getLatestPost("Servlet技术").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("Servlet技术").get(0).getTitle() %>"><%=postDAO.getLatestPost("Servlet技术").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("Servlet技术").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("Servlet技术").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=Eclipse应用">Eclipse应用</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("Eclipse应用")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=Eclipse应用&topicName=<%=postDAO.getLatestPost("Eclipse应用").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("Eclipse应用").get(0).getTitle() %>"><%=postDAO.getLatestPost("Eclipse应用").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("Eclipse应用").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("Eclipse应用").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td colspan="4">数据库技术</td>
		</tr>
	<!--       子版块       -->
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=SQL_Server基础">SQL Server基础</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("SQL_Server基础")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=SQL_Server基础&topicName=<%=postDAO.getLatestPost("SQL_Server基础").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("SQL_Server基础").get(0).getTitle() %>"><%=postDAO.getLatestPost("SQL_Server基础").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("SQL_Server基础").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("SQL_Server基础").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=SQL_Server高级">SQL Server高级</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("SQL_Server高级")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=SQL_Server高级&topicName=<%=postDAO.getLatestPost("SQL_Server高级").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("SQL_Server高级").get(0).getTitle() %>"><%=postDAO.getLatestPost("SQL_Server高级").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("SQL_Server高级").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("SQL_Server高级").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
		<tr class="tr3">
			<td colspan="4">娱乐</td>
		</tr>
	<!--       子版块       -->
		
		<tr class="tr3">
			<td width="5%">&nbsp;</td>
			<th align="left">
				<img src="image/board.gif"/>
				<a href="list.jsp?boardName=灌水乐园">灌水乐园</a>
			</th>
			<td align="center"><%= postDAO.getBoardNameNum("灌水乐园")%></td>
			<th>
				<span>
					<a href="detail.jsp?boardName=灌水乐园&topicName=<%=postDAO.getLatestPost("灌水乐园").get(0).getTopicName() %> 
					&title=<%=postDAO.getLatestPost("灌水乐园").get(0).getTitle() %>"><%=postDAO.getLatestPost("灌水乐园").get(0).getTitle() %> </a>
				</span>
				<br/>
				<span><%=postDAO.getLatestPost("灌水乐园").get(0).getAuthor() %></span>
				<span class="gray">[<%=postDAO.getLatestPost("灌水乐园").get(0).getPostTime() %>]</span>
			</th>
		</tr>
		
	</table>
</div>

<br/>
<center class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd 版权所有</center>
</body>
</html>