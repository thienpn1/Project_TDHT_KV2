<% 'Kiểm tra đăng nhập

	set Cnn=Server.CreateObject("ADODB.Connection")
	Cnn.Provider="Microsoft.JET.OLEDB.4.0"
	Cnn.Open Server.MapPath("data/TuDien.mdb")
	sql="Select * from Quyen where Ten='"&request("ten")&"' and MatKhau='"&request("mk")&"'"
	set rs=Cnn.execute(sql)
	session("dangnhap")="" 'Kiểm tra đăng nhập có thành công hay không
	session("quyen")=""  'Kiểm tra quyền hạn
	session("nguoisd")=""  'Kiểm tra tên người đăng nhập
	if rs.eof then
		response.redirect("Dangnhaplai.asp")
	else
		do while not rs.eof 
		if rs("Quyen")="admin" then
			session("dangnhap")=true
			session("quyen")="admin"
			session("nguoisd")=rs("Ten")
			response.redirect("Hethong.asp")
		else
			session("dangnhap")="true"
			session("quyen")=""
			session("nguoisd")=rs("Ten")
			response.redirect("Trangchu.asp")
		end if
		rs.moveNext
		loop
	end if
	Cnn.close
	rs.close
	set Cnn=nothing
	set rs=nothing

%>