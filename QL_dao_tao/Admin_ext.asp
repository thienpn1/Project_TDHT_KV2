<!--#Include File = "db_connect.asp"--><!--#Include File = "common.asp"--><%If (not Session("isLogin")) Then		Response.Redirect("default.asp?page=login&mess=notLogin")End ifDim  groupname, value, actionaction = Trim(Request.QueryString("action"))groupname = Trim(Request.QueryString("groupname"))value = Trim(Request.QueryString("value")) sql = " UPDATE tbl_usergroup SET "&action&" = "&value&" WHERE	groupname =  '"&groupname&"'"  objConn.Execute(sql) Response.write(sql)%>