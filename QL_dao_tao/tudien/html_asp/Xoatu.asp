<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	
	matu=request.QueryString("ma")
 	sqldelete="delete MaTu,TuTra,MaTD,TL,PhienAm,Nghia,ViDu,TuDN,TuTN From TraNghia WHERE MaTu='"&request("ma")&"'"
	set Cnn=Server.CreateObject("ADODB.connection")
	set rs=server.CreateObject("ADODB.recordset")
	Cnn.provider="Microsoft.JET.OLEDB.4.0"
	Cnn.open Server.Mappath("data/TuDien.mdb")
 	on error resume next
 	Cnn.execute(sqldelete)
	set Cnn=nothing
	Cnn.close
	response.Redirect "Dsxoa.asp"
%>