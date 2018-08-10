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
field = Trim(Request.QueryString("field"))
 Select Case action 
		Case "close"
			sql = " UPDATE tbl_job SET	CLOSE = '"&Session("username")&"' WHERE	id = "&id&"" 			 
		Case "open"
			sql = " UPDATE tbl_job SET	CLOSE = null WHERE id = "&id&"" 			
		Case "approve"
			sql = " UPDATE tbl_job SET	approve = '"&Session("username")&"' WHERE id = "&id&""						
		Case "process"
		    value = replace (value,"||",vbCrLF)
			value =   "<strong>"&session("username")& "</strong> : "  & value & vbCrLF & vbCrLF
			sql = "update tbl_job set process = concat('"&value&"',COALESCE(process, '') ) WHERE	id =  "&id&"" 
			Response.Write(session("username"))		
		Case "direct"
			value =  "<strong>"&session("username")& "</strong> : " &value & vbCrLF & vbCrLF
			sql = "update tbl_job set direct = concat('"&value&"',COALESCE(direct, '') ) WHERE	id =  "&id&"" 	
			Response.Write(session("username"))			
		Case "Note"		
			sql = "update tbl_job set "&field&"='"+value+"' WHERE	id =  "&id&"" 
			Response.Write(value)	
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
  pdb = output 
END FUNCTION

%>
