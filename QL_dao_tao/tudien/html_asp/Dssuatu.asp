<html >
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
							<h1><img src="../images/dss.png"/>&nbsp; &nbsp;Danh sách từ sửa</h1><br>
							<br><p align="right">Quay trở lại <a href="../html_asp/Hethong.asp"> Quản lý hệ thống</a></p><br>
						
								<%
									
									set Cnn=Server.CreateObject("ADODB.connection")
									
									Cnn.provider="Microsoft.JET.OLEDB.4.0"
									Cnn.open Server.Mappath("data/TuDien.mdb")
								%>	
								<table align="center" border="1" style="font: normal 12px Arial, Helvetica, sans-serif;">	
									<tr>
										
										<th align="center">Từ tra</th>
										<th align="center">Mã từ điển</th>
										<th align="center">Mã từ loại</th>
										<th align="center">Phiên âm</th>
										<th align="center" width="150">Nghĩa</th>
										<th align="center">Ví dụ</th>
										<th align="center">Đồng nghĩa</th>
										<th align="center">Trái nghĩa</th>
										<th align="center">Xử lý</th>
									</tr>
								<%	
									Dim sql, rs
									sql = "SELECT * FROM TraNghia" 
									Set rs = Server.CreateObject("ADODB.Recordset")
									rs.CursorType = 3 'để 3 thì các từ sắp xếp theo thứ tự ABC
									rs.Open sql, Cnn
						
									Dim trangso, dembg
									'trangso - số thứ tự trang | dembg - biến đếm số bản ghi 
									
									trangso = Request.Querystring("trang")
									
									If trangso = "" THEN trangso = 1 
									'Nếu trang = rỗng (không có số thứ tự) thì hiện 10 bản ghi của trang số 1
										
										trangso = ((trangso - 1) * 10) +1
										dembg = 0

										If NOT rs.EOF THEN
											rs.Move (trangso - 1)
										DO WHILE dembg < 10 and NOT rs.EOF
								%>


									<tr>
										<td align="center"><%=rs("TuTra")%></td>
										<td align="center"><%=rs("MaTD")%></td>
										<td align="center"><%=rs("TL")%></td>
										<td align="center"><%=rs("PhienAm")%></td>
										<td align="center" width="150"><%=rs("Nghia")%></td>
										<td align="center"><%=rs("ViDu")%></td>
										<td align="center"><%=rs("TuDN")%></td>
										<td align="center"><%=rs("TuTN")%></td>
									
										<td align="center"><a href='Suatu.asp?ma=<%=rs("MaTu")%>' onClick='return confirm("Bạn có chắc chắn muốn sửa không?");'>Sửa</a></td>
									</tr>
										<%
										rs.MoveNext
										dembg = dembg +1
										Loop
										End If
										%>
								</table><br>

								<%=trangso%> - <%=trangso+(dembg-1)%> của <%=(rs.RecordCount)%> từ
								
								<%
								'rs.RecordCount tổng số từ tất cả
								%>
								
								<%
									Dim tongsotrang, tranghienthi, tranghientai
									'tongsotrang - tổng số trang| tranghientai - trang hiện tại
									tranghientai = Request.Querystring("trang")
									If tranghientai = "" THEN tranghientai = 1
										tongsotrang = int(rs.RecordCount \ 10)
										'tổng số trang = tổng số từ chia cho 10, làm tròn
										If rs.RecordCount MOD 10 <> 0 THEN tongsotrang = tongsotrang + 1
											Response.Write("<br><br>Trang: [")
										FOR tranghienthi = 1 TO tongsotrang
											If Cint(tranghienthi) = Cint(tranghientai) THEN
												Response.Write " <b style='color:#5fa6ef'>" & tranghientai & "</b> "
											else
												Response.Write " <a href=""Dssuatu.asp?trang=" & tranghienthi & """>" & tranghienthi &"</a> "
											End If
										NEXT
										Response.Write ("]<br>")
								%><br>
									<% 'Hiển thị nút “Trước”
									if tranghientai>1 then %>
									<a href="Dssuatu.asp?trang=<%=tranghientai-1%>">Trước</a>
									<%end if%>
									<% 'Hiển thị nút “Tiếp”
									if not RS.EOF then %>
										<a href="Dssuatu.asp?trang=<%=tranghientai+1%>">Tiếp</a>

									<%end if
										rs.close 'đóng recordset
									%>
						
							<br><p align="right">Quay trở lại <a href="../html_asp/Hethong.asp"> Quản lý hệ thống</a></p>
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
