<%
	Session("username")= ""
	Session("fullname")= ""
	Session("depart")= ""
	Session("usergroup")= ""
	Session("time")= ""
	Session("isLogin")= false
	Session.Contents.RemoveAll()
	Response.Redirect("default.asp?page=login")
%>