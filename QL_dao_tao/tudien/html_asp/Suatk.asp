<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>


<html>
<head>
<title>Welcome to Từ điển online!!!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<!--Kiểm tra giá trị rỗng trong ô text-->
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
	

	function kiemtra()
	{
		var mkhau=document.getElementById("matkhau");
	
		if(mkhau.value=="")
		{
			alert("Hãy điền mật khẩu!")
			mkhau.focus();
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
				<li ><center><img src="../images/home.png"/></center><a href="../html_asp/Trangchu.asp">Trang chủ</a></li>
		  
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
							<!--Chúc bạn <b style="color:#eb7c3f"><%=session("nguoisd")%></b> có 1 ngày vui vẻ!<br><br-->
							<h1><img src="../images/sua.png"/>&nbsp; &nbsp;Sửa tài khoản</h1><br>
							<%
								Dim sql, rs
								set Cnn=Server.CreateObject("ADODB.Connection")
								Cnn.provider="Microsoft.Jet.OLEDB.4.0"
								Cnn.open Server.Mappath("data/TuDien.mdb")
								
								Dim tentk
								tentk=request.QueryString("ten")
								If tentk <> "" then
								
									sql="select * from Quyen WHERE Ten='"&tentk&"'" 
									set rs=server.CreateObject("ADODB.recordset")
									rs.Open sql, Cnn
																
									If rs.eof then
										Response.write"<h6><img src='../images/venh.gif'/>&nbsp;&nbsp;Xin lỗi tên tài khoản này không tồn tại! Vui lòng điền tên khác!</h6>"
									else
							%>
						
								<form name="Suatk" method="post" action='Suatk.asp?ten=<%=rs("Ten")%>' onSubmit="return kiemtra();" onReset="return bandau();">
								<table align="center" border="0">
									
									<tr>
										<td >Tên tài khoản:</td>
										<td colspan="2"><%=rs("Ten")%><input type="hidden" name="tentaikhoan" id="tentaikhoan" size="40" value="<%=rs("Ten")%>"/></td>
									</tr>
									
									<tr>
										<td >Mật khẩu:</td>
										<td colspan="2"><input type="text" name="matkhau" id="matkhau" size="40" value="<%=rs("MatKhau")%>"><b style='color:#eb7c3f'>*</b></td>
									</tr>
									
									
									<tr>
										<td >Quyền hạn:</td>
										<td colspan="2"><input type="text" name="quyen" id="quyen" size="40" value="<%=rs("Quyen")%>"/></td>
									</tr>
									<tr>
										<td >Địa chỉ:</td>
										<td colspan="2"><input type="text" name="diachi" id="diachi" size="40" value="<%=rs("DiaChi")%>"/></td>
									</tr>
									
									<tr></tr>
									<tr>
										<td colspan="3" >
											<input type="submit" name="submit" style="height:30px;margin:10px 0 0 210px" value="Sửa"/>
											
										</td>
									</tr>
									<tr><center><td colspan="3"><b style='color:#eb7c3f'>*</b> bắt buộc phải điền!</td></center></tr>
								</table>
								
								</form><br>
							<%	
																	
								Dim t, mk, q, dc
							
							
									t=request.Form("tentaikhoan")
									mk=request.Form("matkhau")
									q=request.Form("quyen")
									dc=request.Form("diachi")
									
								If t <> "" and mk <> "" and dc <> ""  then
								
								sql = " Update Quyen set MatKhau = '"&mk&"' , Quyen = '"&q&"', DiaChi= '"&dc&"' where Ten='"&t&"'"

								on error resume next
								Cnn.execute(sql)
								set Cnn=nothing
								Response.write "<h6><img src='../images/phon.gif'/>&nbsp;&nbsp;Bạn đã sửa thành công! Quay trở lại danh sách để kiểm tra!</h6> <br> Tên tài khoản: <b style='color:#eb7c3f'>"&t&"</b>"&"<br>Mật khẩu: <b style='color:#eb7c3f'>"&mk&"</b>"&"<br>Quyền hạn:<b style='color:#eb7c3f'>"&q&"</b>"&"<br>Địa chỉ: <b style='color:#eb7c3f'>"&dc&"</b>" 
								Cnn.close
								end if
								end if
							else
								Response.write"<h6><img src='../images/hutthuoc.gif'/>&nbsp;&nbsp;Tên tài khoản sửa đâu bạn???</h6>"
							end if	
							%>
							
							<br><p align="right">Quay trở lại <a href="../html_asp/Dstk.asp"> Danh sách tài khoản</a></p>
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
								
								Dim sqltk, rstk
								sqltk="Select * from Quyen where Quyen<>'admin'"
								set rstk=Server.CreateObject("ADODB.Recordset")
								rstk.Open sqltk, Cnn
								
								Dim demtk
								demtk=0
								do while not rstk.eof
								demtk=demtk+1
								rstk.moveNext
								loop
								rstk.Close
								set rstk=nothing
								Response.write "<b>Tổng số thành viên:</b> <big style='color:#5fa6ef'>" &demtk& "</big><br>"
							%>
							
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
