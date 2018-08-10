
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")

else



ket_qua= (Request.QueryString("ket_qua"))
id= (Request.QueryString("id"))
username= (Request.QueryString("username"))
response.write("KETQUA:"&ket_qua&"ID:"&id&"USSER:"&username)



	
		objConn.Execute("UPDATE `diem_danh_dao_tao` SET result='"&ket_qua&"' WHERE  username='"&username&"' ")
		'objConn.Execute("UPDATE `dao_tao` SET hinh_thuc='"&ket_qua&"'" ) 		
		Response.Write("OK")
		response.Redirect("default.asp?page=de_xuat")

	


End if
%>
<script type="text/javascript" charset="utf-8">
//Show more/less text
//$(document).ready(function() {
	//alert("id="+<%=id%>);
//});
</script>