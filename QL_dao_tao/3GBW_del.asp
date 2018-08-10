<!--#Include File = "db_connect.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
'Xoa Su co
Dim  id
id = Trim(Request.QueryString("id"))
If (Session("del")="1") then
	objConn.Execute("DELETE FROM tbl_3gbw WHERE id = "&id) 				
	Response.Write("ok")
Else
	%>
	Bản ghi không được phép xóa.
	<%
	End if
%>
