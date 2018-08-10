<!--#Include File = "db_connect.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
'Xoa thong tin tram
Dim  id, isOwner
id = Trim(Request.QueryString("id"))
If (Session("del")="1") then
	objConn.Execute("DELETE from tbl_checklog where id = "&id)
	'objConn.Execute("DELETE FROM tbl_integrated3g WHERE id = "&id) 				
	Response.Write("ok")
Else
%>
	Bạn không có quyền xóa bản ghi.
<%
End if
%>
