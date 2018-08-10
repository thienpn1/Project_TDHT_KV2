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
</script>
</head>
<body>

	<div class="header">
		<div class="logo">
			<img src="../images/Logotudien.png" width="302" height="122"/>
		</div>
		<div class="menu">
			<ul>
				<li class="active"><center><img src="../images/home.png"/></center><a href="../html_asp/Trangchu.asp">Trang chủ</a></li>
		  
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
							<%
								If session("nguoisd")="" then
									response.redirect("Dangnhap.asp")
								else
							%>
							Chúc bạn <b style="color:#eb7c3f"><%=session("nguoisd")%></b> có 1 ngày vui vẻ!<br><br>
							<h1><img src="../images/loa1.png"/>&nbsp; &nbsp;Lời nói đầu</h1><br>
							<p>Nhóm sinh viên thực hiện <strong style="color:#eb7c3f">"Nhóm 2"</strong> xin gửi lời cảm ơn đến thầy giáo Lê Hữu Dũng - người đã giúp đỡ chúng em rất nhiều để hoàn thành chương trình này. </p><br>
							<p>Chương trình được viết bằng ngôn ngữ ASP và sử dụng cơ sở dữ liệu ACCESS cho phép xây dựng một cơ sở dữ liệu tập trung trên máy chủ để thuận tiện cho việc quản lý và thu thập thông tin.</p><br>
							<p><strong style="color:#eb7c3f">Từ điển trực tuyến</strong> là chương trình tra cứu và quản lý từ điển với giao diện thân thiện dễ sử dụng giúp bạn có thể dễ dàng tra cứu bất kỳ một thuật ngữ nào mà bạn muốn tìm hiểu. </p><br>
							<p>Chúng tôi hi vọng với chương trình nhỏ này sẽ giúp ích cho bạn một phần nào đó trong việc tìm hiểu các thuật ngữ một cách nhanh chóng và hiệu quả. Tuy nhiên chương trình vẫn còn một số hạn chế rất mong được thầy và các bạn đóng góp ý kiến để chương trình ngày càng hoàn thiện hơn</p>
							<%
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
							<!--Số thành viên online: <Application("hd")%-->
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
