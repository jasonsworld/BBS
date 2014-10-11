<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>讯飞学员论坛--回复帖子</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />

<script type="text/javascript">
function check(){

	if(document.postform.replyTitle.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.postform.replyContent.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.postform.replyContent.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}else{
		document.postform.submit();
		return true;
	}
}
</script>
</head>

<body>
<div>
	<img src="image/logo.jpg"/>
</div>
<!--      用户信息、登录、注册        -->

<div class="h">
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("name");
	String topicName = (String)session.getAttribute("topicName");
	session.setAttribute("topicName",topicName);
	session.setAttribute("replyAuthor",name);
	out.print("欢迎您！"+name+"&nbsp;| &nbsp;<a href='exit.jsp'>退出</a>");
	
 %>
</div>


<!--      主体        -->
<div><br/>
	<!--      导航        -->
	<div>
		&gt;&gt;<b><a href="index.jsp">论坛首页</a></b>&gt;&gt;
	<%
		String boardName = (String)session.getAttribute("boardName");
		if(boardName.equals("C#语言")){
			out.print("<B><a href='list.jsp?boardName=C%23语言'>"+boardName+"</a></B>");
		}else{
			out.print("<B><a href='list.jsp?boardName="+request.getParameter("boardName")+"'>"+boardName+"</a></B>");
		}
		session.setAttribute("boardName",boardName);
		
		String title = (String)session.getAttribute("title");
		session.setAttribute("title",title);
	%>
	</div><br/>
	<div>
		<form name="postform" action="doReply.jsp" method="post"> 
			<input type="hidden" name="boardId" value="4"/>
			<input type="hidden" name="topicId" value=""/>
			<div class="t">
				<table cellspacing="0" cellpadding="0" align="center">
				    <tr>
					    <td class="h" colspan="3"><b>回复帖子</b></td>
				    </tr>
	
				    <tr class="tr3">
					    <th width="20%"><b>标题</b></th>
					    <th><input class="input" style="padding-left: 2px; font: 14px tahoma" tabindex="1" size="60" name="replyTitle"/></th>
				    </tr>
	
				    <tr class="tr3">
					    <th valign=top>
					      <div><b>内容</b></div>
					    </th>
					    <th colspan=2>
					        <div>	
						        <span><textarea style="WIDTH: 500px;" name="replyContent" rows="20" cols="90" tabindex="2" ></textarea></span>
						    </div>
					      (不能大于:<font color="blue">1000</font>字)
					    </th>
					</tr>
				</table>
			</div>		
	
			<div style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<input class="btn" tabindex="3" type="button" value="提 交" onclick = "check()"/> 
				<input class="btn" tabindex="4" type="reset"  value="重 置"/>
			</div>
		</form>	
	</div>
</div>
<!--      声明        -->
<br/>
<center class="gray">2007 Beijing Aptech Beida Jade Bird
Information Technology Co.,Ltd 版权所有</center>
</body>
</html>