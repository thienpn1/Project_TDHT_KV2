<!--#Include File = "db_connect.asp"-->
<!--#Include File = "common.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
End if

'Xoa Su co
Dim  id, action, value
action = Trim(Request.QueryString("action"))
field = Trim(Request.QueryString("field"))
id = Trim(Request.QueryString("id"))
value = Server.HTMLEncode(Trim(pdb(Request.QueryString("value"))))
'currentDate = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
 Select Case action 	
		Case "Note"		
			sql = "update tbl_hatang set "&field&"='"+value+"' WHERE	id =  "&id&"" 
			Response.Write(value)		
		Case "finish"		
			sql = " UPDATE tbl_hatang SET status = 2 WHERE	id = "&id 					
		Case "CR_3G_integrate"			
			sql = " UPDATE tbl_hatang SET CR_3G_integrate = '" + session("username") + "' WHERE	id = "&id 
		Case "CR_2G_integrate"			
			sql = " UPDATE tbl_hatang SET CR_2G_integrate= '" + session("username") + "' WHERE	id = "&id 	
		Case "CR_3G_active"			
			sql = " UPDATE tbl_hatang SET CR_3G_active= '" + session("username") + "' WHERE	id = "&id 			
		Case "CR_2G_active"			
			sql = " UPDATE tbl_hatang SET CR_2G_active= '" + session("username") + "' WHERE	id = "&id 						
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
