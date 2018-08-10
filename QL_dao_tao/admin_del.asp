<!--#Include File = "db_connect.asp"-->
<%
'Xoa user
Dim  username
username = Trim(Request.QueryString("id"))
sql = " DELETE FROM tbl_user WHERE username = '"&username&"'"		
objConn.Execute(sql)
Response.Write("ok")
%>
