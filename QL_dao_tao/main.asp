<%
'**********************************************************
' Create bay NguyenTD - 25/08/2012
' Define which page include main page when user click link
'**********************************************************

Dim strPage, strPageName
strPage = Request.QueryString("page")
if strPage <> "" then 
	Select Case strPage 
		
		
		Case "de_xuat_xoa"
			%>
			<!--#Include file = "de_xuat_xoa.asp"-->						
			<%	
		Case "profile"
			%>
			<!--#Include file = "profile.asp"-->						
			<%	
		Case "admin"
			%>
			<!--#Include file = "admin.asp"-->						
			<%	
		Case "diem_danh"
			%>
			<!--#Include file = "diem_danh.asp"-->						
			<%	
		Case "login"
			%>
			<!--#Include file = "login.asp"-->						
			<%
		Case "logout"
			%>
			<!--#Include file = "logout.asp"-->						
			<%	
		Case "home_add"
			%>
			<!--#Include file = "home_add.asp"-->						
			<%		
		Case "de_xuat"
			%>
			<!--#Include file = "de_xuat.asp"-->						
			<%	
		Case "ht_rq_add"
			%>
			<!--#Include file = "ht_rq_add.asp"-->						
			<%	
		Case "ht_rq_xuli"
			%>
			<!--#Include file = "ht_rq_xuli.asp"-->						
			<%			
		Case "de_xuat_add"
			%>
			<!--#Include file = "de_xuat_add.asp"-->						
			<%		
		Case "ke_hoach_add"
			%>
			<!--#Include file = "ke_hoach_add.asp"-->						
			<%			
		Case "de_xuat_edit"
			%>
			<!--#Include file = "de_xuat_edit.asp"-->						
			<%		
		Case "de_xuat_dong"
			%>
			<!--#Include file = "de_xuat_dong.asp"-->						
			<%						
		Case "cap_nhat_danh_gia"
			%>
			<!--#Include file = "cap_nhat_danh_gia.asp"-->						
			<%		
		Case Else
		%>
			<!--#Include file = "home.asp"-->				
		<%
	End Select
Else
		%>
		<!--#Include file = "home.asp"-->
		<%
End if
%>