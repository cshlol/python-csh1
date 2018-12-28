<%@ page contentType="text/html;charset=gbk" errorPage="../error.jsp"%>
<%@ page import="com.hongshee.ejforum.util.PageUtils"%>
<%@ page import="com.hongshee.ejforum.common.CacheManager"%>
<%@ page import="com.hongshee.ejforum.common.ForumSetting"%>
<%@ page import="com.hongshee.ejforum.data.UserDAO.UserInfo"%>
<%
	UserInfo userinfo = PageUtils.getLoginedUser(request, response);
	if (userinfo == null) return;

	String forumName = ForumSetting.getInstance().getForumName();
	String title = PageUtils.getTitle(forumName);
	String[] menus = PageUtils.getHeaderMenu(request, userinfo);
	String homeUrl = "../index.jsp";
	String forumStyle = PageUtils.getForumStyle(request, response, null);
	
	String friendID = PageUtils.getParam(request,"uid");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>我的好友 - <%= title %></TITLE>
<%= PageUtils.getMetas(title, null) %>
<LINK href="../styles/<%= forumStyle %>/ejforum.css" type=text/css rel=stylesheet>
</HEAD>
<BODY onkeydown="if(event.keyCode==27) return false;">
<SCRIPT src="../js/common.js" type=text/javascript></SCRIPT>
<DIV class=wrap>
<DIV id=header>
<%= PageUtils.getHeader(request, title) %>
<%= PageUtils.getHeadAdBanner(request, null) %></DIV>
<%= menus[0] %>
<DIV id=nav><A href="<%= homeUrl %>"><%= forumName %></A> &raquo;&nbsp; 我的好友</DIV>
<DIV class=container><DIV class=content>
<FORM name="friendform" onSubmit="return validate(this)" action="../perform.jsp?act=member_friend_add" method=post>
<DIV class=mainbox>
<H1>我的好友</H1>
<UL class="tabs">
  <LI class="current additem"><A href="my_addfriend.jsp">添加好友</A> </LI>
  <LI><A href="my_friends.jsp">我的好友</A> </LI></UL>
<TABLE cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TH><LABEL for=friendID>用户名</LABEL></TH>
    <TD><INPUT id=friendID tabIndex=1 size=50 name=friendID maxlength="15" value="<%= friendID==null?"":friendID %>"></TD></TR>
  <TR>
    <TH><LABEL for=remark>备注</LABEL></TH>
    <TD><INPUT id=remark tabIndex=2 size=50 name=remark maxlength="50" value=""></TD></TR>
  <TR class=btns>
    <TH>&nbsp;</TH>
    <TD height="30"><BUTTON class=submit id=postsubmit tabIndex=7 name=postsubmit type=submit>提交</BUTTON> 
  </TD></TR>	
  </TBODY></TABLE></DIV></FORM>
<SCRIPT type=text/javascript>
	function validate(theform) {
		if (trim(theform.friendID.value) == '') {
			alert("请输入好友的用户名。");
			theform.friendID.focus();
			return false;
		}
		return true;
	}
</SCRIPT>
</DIV>
<DIV class=side>
<DIV>
<H2>我的空间</H2>
<UL>
  <LI><H3><A href="../uspace.jsp?uid=<%= userinfo.userID %>" target="_blank">个人信息页</A></H3></LI>
  <LI><H3><A href="my_profile.jsp">编辑个人资料</A></H3></LI>
  <LI><H3><A href="sms_list.jsp">短消息</A></H3></LI>
  <LI><H3><A href="my_topics.jsp">我的话题</A></H3></LI>
  <LI><H3><A href="my_favors.jsp">我的收藏</A></H3></LI>
  <LI class="side_on"><H3><A href="my_friends.jsp">我的好友</A></H3></LI>
  <LI><H3><A href="my_rights.jsp">我的权限</A></H3></LI>
  <LI><H3><A href="my_credits.jsp">积分交易记录</A></H3></LI>
</UL>
</DIV>
<DIV>
<H2>积分概况</H2>
<UL class="credits">
  <LI>积分: <%= userinfo.credits %></LI>
  <LI>帖子: <%= userinfo.posts %></LI>
</UL></DIV></DIV></DIV></DIV>
<%= menus[1]==null?"":menus[1] %>
<%= menus[2]==null?"":menus[2] %>
<%= PageUtils.getFooter(request,forumStyle) %>
</BODY></HTML>
