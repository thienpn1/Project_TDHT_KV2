<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	
	tentk=request.QueryString("ten")
 	sqldelete="delete Ten,MatKhau,Quyen,DiaChi From Quyen WHERE Ten='"&request("ten")&"'"
	set Cnn=Server.CreateObject("ADODB.connection")
	set rs=server.CreateObject("ADODB.recordset")
	Cnn.provider="Microsoft.JET.OLEDB.4.0"
	Cnn.open Server.Mappath("data/TuDien.mdb")
 	on error resume next
 	Cnn.execute(sqldelete)
	set Cnn=nothing
	Cnn.close
	response.Redirect "Dstk.asp"
%>