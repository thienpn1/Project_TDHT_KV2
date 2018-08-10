<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
	set Cnn=Server.CreateObject("ADODB.Connection")
	Cnn.Provider="Microsoft.JET.OLEDB.4.0"
	Cnn.Open Server.MapPath("data/TuDien.mdb")
%>



<html >
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
	
	function kttim2()
	{
		var tim2=document.getElementById("timav");
		
		if(tim2.value=="")
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
				<li><center><img src="../images/Undo.png"/></center><a href="Dangxuat.asp">Đăng xuất</a></li>
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
							<h1>Từ điển Anh - Việt</h1><br>
							<p>Với mục đích giúp bạn đọc nói chung và các bạn đọc học chuyên ngành Anh - Việt nói riêng, chúng tôi đã sưu tầm và chọn lọc một số khái niệm trong lĩnh vực Anh - Việt giúp bạn đọc có thể hiểu những thuật ngữ chuyên ngành Anh - Việt mà mình cần tìm hiểu.</p>
							<form method="post" action="../html_asp/Timanhviet.asp" onSubmit="return kttim2();">
									<div>
										<center><br>
											<input type="text" name="timav" class="otim" id="timav" />
											<input type="submit" name="b2" class="nuttim" value=" " />
										</center>
									</div>
							</form>
							<br><h1>Kết quả tìm kiếm</h1><br>
								<%
									
										
									Dim tk, rs, sql
									tk=request.Form("timav")
									set Cnn=Server.CreateObject("ADODB.Connection")
						
									Cnn.provider="Microsoft.JET.OLEDB.4.0"
									Cnn.Open Server.MapPath("data/TuDien.mdb")
									
									If tk <> "" then
										sql="Select * from TraNghia, TheLoai, LoaiTuDien where LoaiTuDien.MaTuDien=TraNghia.MaTD and TheLoai.MaTuLoai=TraNghia.TL and TraNghia.MaTD='AV' and (TuTra like '%"& tk &"%')"
										set rs=Server.CreateObject("ADODB.Recordset")
										rs.Open sql, Cnn
										If rs.eof then
											Response.Write "<img src='../images/ngap.gif'/>&nbsp;&nbsp;Rất tiếc không có từ bạn cần tìm!"
										else
										do while not rs.eof
								%>
								
								<table width="620" border="0" >
									<tr >
										<td width="150px" align="left" valign="top"><b style="color:#eb7c3f">Từ cần tìm: </b></td><td><%=rs("TuTra")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Loại từ điển: </b></td><td><%=rs("TenTuDien")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Thuộc từ loại: </b></td><td><%=rs("TuLoai")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Nghĩa: </b></td><td><%=rs("Nghia")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Phiên âm: </b></td><td><%=rs("PhienAm")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Ví dụ: </b></td><td><%=rs("ViDu")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Từ đồng nghĩa: </b></td><td><%=rs("TuDN")%></td>
									</tr><tr height="10px"></tr>
									<tr>
										<td  align="left" valign="top"><b style="color:#eb7c3f">Từ trái nghĩa </b></td><td><%=rs("TuTN")%></td>
									</tr>
			
									<tr></tr>
								</table>
								<br><p  style="border-bottom:dotted #5fa6ef"></p><br>
								<%
									
									rs.moveNext
									loop
									End if%>
							
									<%
									else
									
									End if
									
								%>
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
