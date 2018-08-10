<% Option Explicit
 Response.CharSet = "UTF-8" 
 session.CodePage=65001 %>
<!--#Include file = "db_common.asp"-->
<!--#Include file = "db_connect.asp"-->
<!--#Include file = "common.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
'Xoa Su co
Dim  id, isOwner,mt,sql,sql_log
isOwner = true
id = Trim(Request.QueryString("id"))

If (Session("del")="1") then
	sql = "SELECT * from tien_do_ha_tang WHERE id = '"& id &"'"
	Set objRS = objConn.Execute(sql)
	mt=objRS.Fields("Ma_tram")
	
		objConn.Execute("DELETE FROM tien_do_ha_tang WHERE id = '"& id &"'") 				
	sql_log="INSERT INTO log_action(user, action, Time) VALUES ('"&Session("username")&"','Xoa tram "&mt&"','"&getCurrentDateTime()&"')"	
objConn.Execute(sql_log)
	

	
Else
%>
	Bạn không có quyền xóa bản ghi.
<%
End if
%>
