
<html>
<head>
<title>Welcome to Từ điển online!!!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function kiemtra()
	{
		var id=document.getElementById("ten");
		var pass=document.getElementById("mk");
		var email=document.getElementById("email");
		
		if(id.value=="")
		{
			alert("Hãy điền tên đăng nhập!")
			id.focus();
			return false;
		}
		
		if(pass.value=="")
		{
			alert("Hãy điền mật khẩu!")
			pass.focus();
			return false;
		}
		
		if(email.value=="")
		{
			alert("Hãy điền địa chỉ Email!")
			email.focus();
			return false;
		}
		return true;
	}
	
	function bandau()
	{
		var a=confirm("Bạn có chắc chắn không?");
		if (!a) return false;
		var id=document.getElementById("ten");
		id.focus();
	}
</script>
</head>
<body>

	<div class="header">
		<div class="logo">
			<img src="../images/Logotudien.png" width="302" height="122" style="margin-left:300px"/>
		</div>
		
    </div>
	<div class="content">
		<div id="dauthan">		</div>
    <!--hết đầu-->
		<div id="giuathan">
			<div class="cotlon" style="margin-left:130px">
				<div class="hopchua">
					<div class="dau_hop"><h1>Đăng ký để truy cập Từ điển online!</h1></div>
					<div class="than_hop">
						<div class="noidung">
							<h1><img src="../images/hi.gif"/>&nbsp; &nbsp;Mời bạn đăng ký</h1><br><br>
							<form name="Dangky" method="post" action="KiemtraDK.asp" onSubmit="return kiemtra();" onReset="return bandau();">
								<table align="center" border="0">
									<tr>
										<td>Tên đăng ký:</td>
										<td><input type="text" name="ten" id="ten" size="20"/></td>
									</tr>
									<tr>
										<td>Mật khẩu:</td>
										<td><input type="password" name="mk" id="mk" size="20"/></td>
										<td><input type="hidden" name="quyen" id="quyen" size="10" value="mem"/></td>
									</tr>
									<tr>
										<td>Địa chỉ Email:</td>
										<td><input type="text" name="email" id="email" size="20"/></td>
									</tr>
									<tr></tr>
									<tr>
										<td colspan="2" ><input type="submit" name="submit" style="height:30px;margin:10px 0 0 110px" value="Đăng ký"/>
										<input type="reset" name="reset" style="height:30px;margin:10px 0 0 5px" value="Nhập lại"/></td>
									</tr>
								</table>
								<br><center>Nếu đã có tài khoản mời bạn đăng nhập&nbsp;&nbsp;<a href="Dangnhap.asp">tại đây</a></center>
							</form>

						</div>
					</div>
					<div class="chan_hop"></div>
				</div>
			</div>

		</div><!--hết giữa thân-->
		<div id="cuoithan">		</div>
</div>
	<div class="content">
		<div id="dauthan"></div>
  <div id="giuathan">
			<div class="hopchua" style="margin-left:20px;">
				COPYRIGHT &copy; 2012 <B><FONT COLOR="#FF6B00";> TỪ ĐIỂN ONLINE</FONT></B>&nbsp;&nbsp;&nbsp;&nbsp;DESIGNED BY&nbsp;<B><FONT COLOR="#FF6B00";> HÙNG - KHÁNH - NHẬT - ÁNH</FONT></B>&nbsp;&nbsp; 
				LỚP 709B1 - KHOA CÔNG NGHỆ THÔNG TIN - VIỆN ĐẠI HỌC MỞ HÀ NỘI
			</div>
		</div>
		<div id="cuoithan"></div>
</div>
</body>
</html>
