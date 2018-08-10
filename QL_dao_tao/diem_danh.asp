
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	
else

id= Trim(Request.QueryString("id"))
username=Session("username")

	
		objConn.Execute("INSERT INTO `diem_danh_dao_tao` (`id_from_dao_tao`, `username`, `role`, `result`) VALUES ('"&id&"', '"&username&"', 'hoc vien', 'đạt')") 				
		Response.Write("OK")
		response.Redirect("default.asp?page=de_xuat")

	


End if
%>
