<html>
<head>
<title>Welcome to Từ điển online!!!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	//Kiểm tra tìm
	function kttim()
	{
		var tim=document.getElementById("dktim");
		
		if(tim.value=="")
		{
			alert("Hãy điền từ cần tìm!")
			tim.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

	<div class="header">
		<div class="logo">
			<img src="../images/Logotudien.png" width="302" height="122"/>
		</div>
		<div class="menu">
			<ul>
				<li class="active"><center><img src="../images/home.png"/></center><a href="../html_asp/Hethong.asp">Trang chủ</a></li>
		  
				<li><center><img src="../images/contact.png"/></center><a href="../html_asp/Lienhe.asp">Liên hệ</a></li>
				<li><center><img src="../images/Undo.png"/></center><a href="../html_asp/Dangxuat.asp">Đăng xuất</a></li>
			</ul>
		</div>
    </div>
	<div class="content">
		<div id="dauthan">		</div>
    <!--hết đầu-->
		<div id="giuathan">
			<div class="cotlon">
				<div class="hopchua">
					<div class="dau_hop"><h1>Welcome to Từ điển online!!!</h1></div>
					<div class="than_hop">
						<div class="noidung">
							Nhiệt liệt chào mừng quản lý <b style="color:#eb7c3f"><%=session("nguoisd")%></b>. Chúc bạn có 1 ngày vui vẻ!<br><br>
							<h1><img src="../images/Nhamhiem.gif"/>&nbsp;&nbsp;Quản lý hệ thống</h1>
							<%
								Response.Expires=0
								if session("quyen")<>"admin" then response.redirect("Dangnhap.asp")
							%>
							<br>
							<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Dstk.asp">Quản lý tài khoản</a></h6>
							<!--<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Themtudien.asp">Thêm từ điển mới</a></h6>
							<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Themtuloai.asp">Thêm từ loại mới</a></h6>-->
							<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Themtutra.asp">Thêm từ tra mới</a></h6>
							<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Dssuatu.asp">Sửa từ trong từ điển</a></h6>
							<h6><img src="../images/Ech.gif"/>&nbsp;&nbsp;<a href="Xoatu.asp">Xóa từ trong từ điển</a></h6>
						</div>
					</div>
					<div class="chan_hop"></div>
				</div>
			</div>
			
			<div class="cotbe">
				<!--Hộp tìm kiếm tất cả-->
				<div class="hopchua">
					<div class="dau_hop2"></div>
					<div class="than_hop">
						<div class="noidung">
							<div id="search">
								<form method="post" action="../html_asp/Ketquatim.asp" onSubmit="return kttim();">
									<div>
										<input type="text" name="dktim" class="otim" id="dktim" placeholder="Tìm trong tất cả từ điển" />
										<input type="submit" name="b1" class="nuttim" id="sbutton" value=" "/>
									</div>
								</form>
							</div>
							
						</div>
					</div>
					<div class="chan_hop"></div>
				</div>
				<!--================================================-->
				<!--Menu các loại từ điển-->
				<div class="hopchua">
					<div class="dau_hop"><h1>Các loại từ điển</h1></div>
					<div class="than_hop">
						<div class="noidung">
							<%
								set Cnn=Server.CreateObject("ADODB.Connection")
								Cnn.Provider="Microsoft.JET.OLEDB.4.0"
								Cnn.Open Server.MapPath("data/TuDien.mdb")
							%>
							 <ul>
								<li><a href="../html_asp/Timkinhte.asp">Kinh tế
									<%	
										sql="Select * from TraNghia where MaTD='KT'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timphapluat.asp">Pháp luật
									<%	
										sql="Select * from TraNghia where MaTD='PL'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timhanghai.asp">Hàng hải
									<%	
										sql="Select * from TraNghia where MaTD='HH'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timanhviet.asp">Anh - Việt
								
									<%	
										sql="Select * from TraNghia where MaTD='AV'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timnhatviet.asp">Nhật - Việt
									<%	
										sql="Select * from TraNghia where MaTD='NV'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timvietanh.asp">Việt - Anh
									<%	
										sql="Select * from TraNghia where MaTD='VA'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
								<li><a href="../html_asp/Timvietphap.asp">Việt - Pháp
									<%	
										sql="Select * from TraNghia where MaTD='VP'"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
								
										dem=0
										do while not rs.eof
										dem=dem+1
										rs.moveNext
										loop
										rs.Close
										set rs=nothing
										Response.write " ("&dem&") "
									%></a></li>
							 </ul>
							
						</div>
					</div>
					<div class="chan_hop"></div>
				</div>
				<!--===============================================-->
				<!--======THống kê===========-->
				<div class="hopchua">
					<div class="dau_hop"><h1>Thống kê</h1></div>
					<div class="than_hop">
						<div class="noidung">
							<%
								set Cnn=Server.CreateObject("ADODB.Connection")
								Cnn.Provider="Microsoft.JET.OLEDB.4.0"
								Cnn.Open Server.MapPath("data/TuDien.mdb")
								
								Dim sqltt, rstt
								sqltt="Select * from TraNghia"
								set rstt=Server.CreateObject("ADODB.Recordset")
								rstt.Open sqltt, Cnn
								
								Dim demtongtu
								demtongtu=0
								do while not rstt.eof
								demtongtu=demtongtu+1
								rstt.moveNext
								loop
								rstt.Close
								set rstt=nothing
								Response.write "<b>Tổng số từ:</b> <big style='color:#5fa6ef'>" &demtongtu& "</big><br>"
							
							
							
								
								'Dim sql, rs
								sql="Select *  from Quyen where Quyen ='mem'"
								set rs=Server.CreateObject("ADODB.Recordset")
								rs.Open sql, Cnn
								
								Dim demtk
								demtk=0
								do while not rs.eof
								demtk=demtk+1
								rs.moveNext
								loop
								rs.Close
								set rs=nothing
								Response.write "<b>Tổng số thành viên:</b> <big style='color:#5fa6ef'>" &demtk& "</big><br>"
							%>
							<!--Số thành viên online: <=Application("Counter")%-->
						</div>
					</div>
					<div class="chan_hop"></div>
				</div>
			</div>

		</div><!--hết giữa thân-->
		<div id="cuoithan"></div>
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
