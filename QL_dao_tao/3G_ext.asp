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
		Case "TD_process"
			sql = " UPDATE tbl_integrated3g SET	td_info = '"&value&"', td_time = '" & currentDate &"'"&_
  			       " WHERE	id = "&id 		
			Response.Write(currentDate)	
		Case "TDTT_process"
			sql = " UPDATE tbl_integrated3g SET	tdtt_info = '"&value&"', tdtt_time = '" & currentDate &"'"&_
  			       " WHERE	id = "&id 		
			Response.Write(currentDate)			
		Case "IP_process"
			sql = " UPDATE tbl_integrated3g SET	dvcd_info = '"&value&"', dvcd_time = '" & currentDate &"'"&_
  			       " WHERE	id = "&id&"" 		
			Response.Write(currentDate)	 	 
		Case "Note"
			value =   session("username")& ": "  & value & vbCrLF
			sql = "update tbl_integrated3g set note = concat('"&value&"',COALESCE(note, '') ) WHERE	id =  "&id&"" 
			Response.Write(session("username"))	
		Case "finish"
			sql = " UPDATE tbl_integrated3g SET	finish = 1 WHERE id = "&id&"" 			
		Case "nofinish"
			sql = " UPDATE tbl_integrated3g SET	finish = null WHERE id = "&id&""						
		Case "process"
			value =   session("username")& ": "  & value & vbCrLF & vbCrLF
			sql = "update tbl_job set process = concat('"&value&"',COALESCE(process, '') ) WHERE	id =  "&id&"" 
			Response.Write(session("username"))		
		Case "direct"
			value =  session("username")& " - " &value & vbCrLF & vbCrLF
			sql = "update tbl_job set direct = concat('"&value&"',COALESCE(direct, '') ) WHERE	id =  "&id&"" 	
			Response.Write(session("username"))	
		Case "qos"
			If (value= "true") then
			  value  = "1"
			else
			  value  = "0"
			end if
			sql = " UPDATE tbl_integrated3g SET qos = " + value + " WHERE	id = "&id 			
		Case "checkexist"			
			sql = "SELECT nodename FROM tbl_integrated3g WHERE nodename = '"&id&"' AND (finish <> 2 OR ISNULL(finish))"
			Set objRS = objConn.Execute(sql)
			If Not objRS.EOF then
			  Response.Write("YES")	
			Else
			   Response.Write("NO")
			End if
   End Select
		
If (action<>"" and action<>"checkexist") then
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
