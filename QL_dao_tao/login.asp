<%
'************************************************
' Modify by NguyenTD - 09/07/2012
' Page login to system
'************************************************
	Dim user, pass
	user = Request.Form("username")
	pass = Request.Form("password")
	If Len(user) > 0 Then
		If(checkLogin(user, pass)) then				
		   Response.Redirect("default.asp?page=de_xuat")		  
		Else
		   Response.Redirect("default.asp?page=login&mess=loginerror")
		End If
	End If	
%>
<script src="js/validation.js"></script>
<script language="javascript">
	window.onload = function () {
		document.getElementById("username").focus();
	};
	function validation()
	{
	var username = document.getElementById("username");
	var password = document.getElementById("password");

	if (Trim(username.value).length == 0)
	  {
	    alert('Chua nhap tai khoan');
		username.focus();
	  }
	else if (Trim(password.value).length == 0)
	  {
	    alert('Chua nhap mat khau');
		password.focus();
	  }
	else
	  {
	      document.f_login.submit();
	  }	
	}	
	
</script>
<table width="90%" border="0" align="center">
  <tr>
    <!--    <th width="50%" scope="col"><img src="images/teamwork.jpg" width="350" height="250" />	</th> -->
    <th width="50%" scope="col"><img src="images/Timesheets.jpg" width="250" height="219"  />	</th>
	<th width="50%" scope="col">
 <p class="mau_chu_legen">ĐĂNG NHẬP VÀO HỆ THỐNG</p>
        <div class="login">
   <form name="f_login" method="post">
   <table border="0">
    <tr>
     <td align="left"><img src="images/maskrow.gif" /> Tên đăng nhập</td>
     <td><input size="36" type="text" id="username" name="username" /></td>
    </tr>
    <tr>
     <td align="left"><img src="images/maskrow.gif" /> Mật khẩu</td>
     <td><input size="36" type="password" id="password" name="password" /></td>
    </tr>
	<tr>
     <td colspan="2" align="center1">
	 <%
		Dim  mess
		mess = Request.QueryString("mess")
		If (mess="loginerror") Then
	 %>
		<font color="red">*</font> Thông tin đăng nhập không chính xác 
	 <%
	    End if
		if (mess="notLogin") Then
	 %>
		<font color="red">*</font> Yêu cầu đăng nhập hệ thống 
	 <%
	    End iF	
	 if (mess="notAdmin") Then
	 %>
		<font color="red">*</font> Bạn không có quyền truy cập vào trang quản trị 
	 <%
	    End iF
	 %>		
	 </td>
     </tr>
   </table>
	<p><input type="submit" class="hieu_ung_nut2" value="Đăng nhập"/></p>
	</form>
    </div>    
	</th>
  </tr>
</table>
