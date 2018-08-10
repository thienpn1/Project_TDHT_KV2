﻿
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

	function kiemtra()
	{
		var mtd=document.getElementById("matudien");
		var mtl=document.getElementById("matuloai");
		var mtt=document.getElementById("matutra");
		var tt=document.getElementById("tutra");
		var n=document.getElementById("nghia");
		
		if(mtd.value=="")
		{
			alert("Hãy điền mã loại từ điển!")
			//mtd.focus();
			return false;
		}
		
		if(mtl.value=="")
		{
			alert("Hãy điền mã từ loại!")
			//mtl.focus();
			return false;
		}
		if(tt.value=="")
		{
			alert("Hãy điền mã từ tra!")
			mtt.focus();
			return false;
		}
		if(tt.value=="")
		{
			alert("Hãy điền từ tra!")
			tt.focus();
			return false;
		}
		
		if(n.value=="")
		{
			alert("Hãy điền nghĩa!")
			n.focus();
			return false;
		}
		return true;
	}
	
	function bandau()
	{
		var a=confirm("Bạn có chắc chắn muốn nhập lại từ đầu không?");
		if (!a) return false;
		var mtd=getElementById("matudien");
		mtd.focus();
	}
	
//Tạo list chọn mã từ điển và mã từ loại	
var tdlist=new Array('Kinh tế','Pháp luật','Hàng hải','Anh - Việt','Nhật - Việt','Việt - Anh','Việt - Hàn','Việt - Pháp');
var matdlist=new Array('KT','PL','HH','AV','NV','VA','VH','VP');
var matllist=new Array('DaiT','DgT','DT','GT','LT','MT','NDT','NgDT','PT','ThT','TrT','TT','VT');
var tllist=new Array('Đại từ','Động từ','Danh từ','Giới từ','Liên từ','Mạo từ','Nội động từ','Ngoại động từ','Phó từ','Thán từ','Trạng từ','Tính từ','Tính từ');

function listtd(z1)
{
       	var tudien=document.getElementById('matudien');
        if(z1==-1)
	{
         tudien.value="";
	 return;
	}
	
        tudien.value=matdlist[z1];
		
	{
	
	}
}

function listtl(z2)
{
       	var tuloai=document.getElementById('matuloai');
        if(z2==-1)
	{
         tuloai.value="";
	 return;
	}
        tuloai.value=matllist[z2];
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
							<h1><img src="../images/tag.png"/>&nbsp; &nbsp;Thêm từ tra mới</h1><br>
					
							<form name="Themtutra" method="post" action="Themtutra.asp" onSubmit="return kiemtra();" onReset="return bandau();">
								<table align="center" border="0">
									
									<tr>
										<td >Mã từ tra:</td>
										<td colspan="2"><input type="text" name="matutra" id="matutra" size="40"/><b style='color:#eb7c3f'>*</b></td>
									</tr>
									<tr>
										<td >Từ tra:</td>
										<td colspan="2"><input type="text" name="tutra" id="tutra" size="40"/><b style='color:#eb7c3f'>*</b></td>
									</tr>
									
									<tr>
										<td>Mã loại từ điển:</td>
										<td><select name="tudien" id="tudien" onChange=listtd(this.value)>
												<script type="text/javascript">
												document.write("<option value=-1>Chọn mã loại từ điển</option>");
												count=tdlist.length;
												for(i=0;i<count;i++)
												document.write("<option value="+i+">"+tdlist[i]+"</option>");
												</script>
											</select>
										</td>
										<td><input type="text" id="matudien" size=40 name="matudien" ><b style='color:#eb7c3f'>*</b></td>
										
									</tr>
									<tr>
										<td >Mã từ loại:</td>
										<td><select name="tuloai" id="tuloai" onChange=listtl(this.value)>
												<script type="text/javascript">
												document.write("<option value=-1>Chọn mã loại từ </option>");
												count=tllist.length;
												for(i=0;i<count;i++)
												document.write("<option value="+i+">"+tllist[i]+"</option>");
												</script>
											</select>
										</td>
										<td><input type="text"  id="matuloai" size=40 name="matuloai" ><b style='color:#eb7c3f'>*</b></td>
									</tr>
									
										<td >Phiên âm:</td>
										<td colspan="2"><input type="text" name="phienam" id="phienam" size="40"/></td>
									</tr>
									<tr>
										<td >Nghĩa:</td>
										<td colspan="2"><input type="text" name="nghia" id="nghia" size="40"/><b style='color:#eb7c3f'>*</b></td>
									</tr>
									<tr>
										<td >Ví dụ:</td>
										<td colspan="2"><input type="text" name="vidu" id="vidu" size="40"/></td>
									</tr>
									<tr>
										<td >Từ đồng nghĩa:</td>
										<td colspan="2"><input type="text" name="tudn" id="tudn" size="40"/></td>
									</tr>
									<tr>
										<td >Từ trái nghĩa:</td>
										<td colspan="2"><input type="text" name="tutn" id="tutn" size="40"/></td>
									</tr>
									<tr></tr>
									<tr>
										<td colspan="3" ><input type="submit" name="submit" style="height:30px;margin:10px 0 0 210px" value="Thêm"/>
										<input type="reset" name="reset" style="height:30px;margin:10px 0 0 5px" value="Nhập lại"/></td>
									</tr>
									<tr><center><td colspan="3"><b style='color:#eb7c3f'>*</b> bắt buộc phải điền!</td></center></tr>
								</table>
								<!--<br><center>Nếu đã có tài khoản mời bạn đăng nhập&nbsp;&nbsp;<a href="Dangnhap.asp">tại đây</a></center>-->
							</form><br>
							<% 'thêm
			
							set Cnn=Server.CreateObject("ADODB.Connection")
							Cnn.Provider = "Microsoft.Jet.OLEDB.4.0"
							Cnn.Open server.mappath("data/TuDien.mdb")
	
							Dim matt, matd, matl, ttra, pa, ngh, vd, tdn, ttn
							
							
							matt=request.Form("matutra")
							ttra=request.Form("tutra")
							matd=request.Form("matudien")
							matl=request.Form("matuloai")
							pa=request.Form("phienam")
							ngh=request.Form("nghia")
							vd=request.Form("vidu")
							tdn=request.Form("tudn")
							ttn=request.Form("tutn")
							
							If matt <> "" and ttra <> "" and matd <> "" and matl <> "" then
								
								Dim sql1, rs1, rs2, sql2
								sql1="Select * from LoaiTuDien where MaTuDien='"& matd &"'"
								sql2="Select * from TheLoai where MaTuLoai='"& matl &"'"
								set rs1=Server.CreateObject("ADODB.Recordset")
								set rs2=Server.CreateObject("ADODB.Recordset")
								rs1.Open sql1, Cnn
								rs2.Open sql2, Cnn
								
								If rs1.eof or rs2.eof then
								
								Response.Write "Mã từ điển hoặc mã từ loại không đúng! Bạn hãy chọn mã từ điển hoặc mã từ loại trong list!"
								rs1.Close
								set rs1=nothing
								rs2.Close
								set rs2=nothing
								else
								
								Dim sql, rs
								sql="Select * from TraNghia where MaTu='"& matt &"'"


								set rs=Server.CreateObject("ADODB.Recordset")
								rs.Open sql, Cnn
	
								If rs.eof then
									
									sql="insert into TraNghia(MaTu,TuTra,MaTD,TL,PhienAm,Nghia,ViDu,TuDN,TuTN)"
									sql=sql& " values('"&matt&"','"&ttra&"','"&matd&"','"&matl&"','"&pa&"','"&ngh&"','"&vd&"','"&tdn&"','"&ttn&"')"
										on error resume next
									Cnn.execute(sql)
									rs.Close
									set rs=nothing
									Response.write "Bạn đã thêm thành công! Mã từ tra: <b style='color:#eb7c3f'>"&matt&"</b>"&"&nbsp;&nbsp;Từ tra: <b style='color:#eb7c3f'>"&ttra&"</b>"&"&nbsp;&nbsp;Thuộc mã từ điển:<b style='color:#eb7c3f'>"&matd&"</b>"&"&nbsp;&nbsp;Thuộc mã từ loại: <b style='color:#eb7c3f'>"&matl&"</b>"
								
								else
									Response.write "Mã từ tra <b style='color:#eb7c3f'>"&request.Form("matutra")&"</b> đã tồn tại, mời bạn vui lòng điền mã khác!" 
								End if
							end if
							End if
	
							'sql="insert into TraNghia(TuTra,MaTD,TL,PhienAm,Nghia,ViDu,TuDN,TuTN)"
							'sql=sql& " values('"&ttra&"','"&matd&"','"&matl&"','"&pa&"','"&ngh&"','"&vd&"','"&tdn&"','"&ttn&"')"
								'on error resume next
								'Cnn.execute(sql)
								'rs.Close
								'set rs=nothing
							'Response.write "Bạn đã thêm thành công! Từ tra: <b style='color:#eb7c3f'>"&ttra&"</b>"&"&nbsp;&nbsp;Thuộc mã từ điển:<b style='color:#eb7c3f'>"&matd&"</b>"&"&nbsp;&nbsp;Thuộc mã từ loại: <b style='color:#eb7c3f'>"&matl&"</b>"
							'End if
					

							%>	
							<br><br><p align="right">Quay trở lại <a href="../html_asp/Hethong.asp"> Quản lý hệ thống</a></p>
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
