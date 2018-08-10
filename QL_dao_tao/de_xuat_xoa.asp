
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	
else

id= Trim(Request.QueryString("id"))


	
		objConn.Execute("DELETE FROM dao_tao WHERE id = '"& id &"'") 				
		Response.Write("OK")
		response.Redirect("default.asp?page=de_xuat")

	


End if
%>
