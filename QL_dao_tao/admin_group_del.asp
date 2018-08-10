<!--#Include File = "db_connect.asp"-->
<%
'Xoa user
Dim  groupname
groupname = Trim(Request.QueryString("id"))
sql = "DELETE FROM tbl_usergroup WHERE	groupname = '"&groupname&"'"		
objConn.Execute(sql)
Response.Write("ok")
%>
