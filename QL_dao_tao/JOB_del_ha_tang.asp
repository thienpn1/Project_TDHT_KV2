<!--#Include File = "db_connect.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
End if
If (Request.QueryString("delete")= "yes") then
	    'Xoa dữ liệu trước khi import
		objConn.Execute("DELETE FROM ha_tang.tien_do_ha_tang")
		Response.Write("OK")
		response.Redirect("default.asp?page=JOB_list.asp")
	End if
		
%>
