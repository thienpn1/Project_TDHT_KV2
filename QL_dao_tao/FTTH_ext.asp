<!--#Include File = "db_connect.asp"-->
<!--#Include File = "common.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
End if

'Xoa Su co
Dim  id, action, value
action = Trim(Request.QueryString("action"))
id = Trim(Request.QueryString("id"))
value = Server.HTMLEncode(Trim(pdb(Request.QueryString("value"))))
currentDate = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
 Select Case action 	
		Case "Note"		
			value = replace (value,"||",vbCrLF)
			value =   "<strong>"&session("username")& "</strong>  -  "&getCurrentDateTime() &": " & value & vbCrLF& vbCrLF
		
			sql = "update tbl_checklog set doexplain = concat('"&value&"',COALESCE(doexplain, '') ) WHERE	id =  "&id&"" 
			Response.Write(session("username"))	
			
		Case "direct"
			value =   "<strong>"&session("username")& "</strong> - "&getCurrentDateTime()& ": "  & value & vbCrLF & vbCrLF
			sql = "update tbl_checklog set direct = concat('"&value&"',COALESCE(direct, '') ) WHERE	id =  "&id&"" 			
			Response.Write(session("username"))	
		
		Case "finish"							
			value =   session("username")& ": "  & value & vbCrLF
			sql = "update tbl_checklog set result= concat('"&value&"',COALESCE(result, '') ) WHERE	id =  "&id&"" 
			Response.Write(session("username"))				
		
		Case "ok"			
			sql = " UPDATE tbl_checklog set result = 1 WHERE	id = "&id 		
		
		Case "fault"			
			sql = " UPDATE tbl_checklog set isfault = 1 WHERE	id = "&id 	
		
		Case "nok"			
			sql = " UPDATE tbl_checklog set result = 0 WHERE	id = "&id 			
   End Select
		
If (action<>"") then
	objConn.Execute(sql)
	'response.write(sql)	
End if
'response.write(sql)

' Xoa cac dau nhay trong chuoi
FUNCTION pdb(str)
  Dim output 
  output= Replace(str, "'", "''")
  output= Replace(output, "\", "\\")  
  output= Replace(output, "||", "#")  
  pdb = output 
END FUNCTION

%>
