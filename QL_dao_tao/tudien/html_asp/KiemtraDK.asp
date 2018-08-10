<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<html>
<head>
<title>Welcome to Từ điển online!!!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
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
							
							<% 'Kiểm tra đăng ký
							set Cnn=Server.CreateObject("ADODB.Connection")
							Cnn.provider="Microsoft.JET.OLEDB.4.0"
							Cnn.Open Server.MapPath("data/TuDien.mdb")
	
							Dim tendk, mkdk, emaildk,q
							tendk=request.Form("ten")
							mkdk=request.Form("mk")
							q=request.Form("quyen")
							emaildk=request.Form("email")
	
							If tendk <> "" and mkdk <> "" and emaildk <> "" and q <> ""then
	
		
								Dim sql, rs
								sql="Select * from Quyen where Ten='"& tendk &"'"
		

								set rs=Server.CreateObject("ADODB.Recordset")
								rs.Open sql, Cnn,3,3
	
								If rs.eof then
									rs.AddNew
									rs("Ten")=tendk
									rs("MatKhau")=mkdk
									rs("Quyen")=q
									rs("DiaChi")=emaildk
									rs.Update
									rs.Close
									set rs=nothing
									Response.write "<img src='../images/Thumb.gif'/>&nbsp; &nbsp;Bạn đã đăng ký thành công với tên tài khoản là: <b style='color:#eb7c3f'>"&tendk&"</b>"&"<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  Vui lòng nhấn vào <a href='Dangnhap.asp'>đây</a>  để truy cập!"
								else
									Dim X, tensd, dem, sql2, rs2
									do until X=true
									dem=dem+1
									tensd=tendk&dem
									tendk=tensd
	
									sql2="Select * from Quyen where Ten='"& tendk &"'"
									set rs2=Server.CreateObject("ADODB.Recordset")
									rs2.Open sql2,Cnn
									'Xét trường hợp tên đăng ký bị trùng và đưa ra gợi ý tên đăng ký khác có thể sử dụng đc
									If rs2.eof then
										X=true
									else
										dem=dem
									End if
	
									loop
	
									rs2.Close
									set rs2=nothing
	
									Response.write "<img src='../images/Chongmat.gif'/>&nbsp; &nbsp;Tên tài khoản này đã tồn tại, mời bạn vui lòng đăng ký tên khác!" &"<br>&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Vui lòng nhấn vào <a href='Dangky.asp'>đây</a>  để đăng ký lại!"
									Response.write "<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  Bạn có thể dùng tên sau: <b style='color:#eb7c3f'>"&tendk&"</b>"
								End if
							else
								Response.Write "<img src='../images/Chongmat.gif'/>&nbsp; &nbsp;Bạn vui lòng điền đầy đủ các yêu cầu!"&"<br>&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Vui lòng nhấn vào <a href='Dangky.asp'>đây</a>  để đăng ký lại!"
							End if
	
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

