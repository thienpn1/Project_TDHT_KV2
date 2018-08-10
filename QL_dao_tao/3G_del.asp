<!--#Include File = "db_connect.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
'Xoa thong tin tram
Dim  id, isOwner
id = Trim(Request.QueryString("id"))
If (Session("del")="1" and (Session("depart")="BSS" or Session("usergroup")="ADMIN")) then
	objConn.Execute("UPDATE tbl_integrated3g SET finish = 2 WHERE id = "&id)
	'objConn.Execute("DELETE FROM tbl_integrated3g WHERE id = "&id) 				
	Response.Write("ok")
Else
%>
	Bạn không có quyền xóa bản ghi.
<%
End if
%>
