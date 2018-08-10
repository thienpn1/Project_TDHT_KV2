<!--#Include File = "db_connect.asp"-->
<!--#Include File = "common.asp"-->
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
End if

Dim  id, action, value
action = Trim(Request.QueryString("action"))
id = Trim(Request.QueryString("id"))
value = Server.HTMLEncode(Trim(pdb(Request.QueryString("value"))))
field = Trim(Request.QueryString("field"))
Select Case action 		
		Case "Note"		
			if (field = "TimeFinish") then
			  sql = "update tbl_maintain set "&field&"='"+convert2SimpleDateSQL(value)+"' WHERE	id =  "&id&"" 
			Else
			  sql = "update tbl_maintain set "&field&"='"+value+"' WHERE	id =  "&id&"" 
			End if
			
			Response.Write(value)	
		Case "Value"		
			sql = "update tbl_maintain set "&field&"="+value+" WHERE	id =  "&id&"" 
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
