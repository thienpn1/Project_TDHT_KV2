<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
	Dim password, newpassword
	fullname = pdb(Server.HTMLEncode(Trim(Request.Form("fullname"))))
	password = Base64encode((Request.Form("password")))
	newpassword = Base64encode((Request.Form("newpassword")))
 
    IF (Base64encode(Session("password")) = password and fullname<>"") then		
		sql = "UPDATE tbl_user SET "&iff (newpassword<>""," PASSWORD = '"&(newpassword)&"',","")&" fullname = '"&fullname&"' WHERE username = '"&Session("username")&"'"
		objConn.Execute(sql)
		'Response.write(sql)
		Response.write(".:D&#7919; li&#7879;u &#273;&#227; &#273;&#432;&#7907;c c&#7853;p nh&#7853;t !")
	Else	
	sql = " SELECT tbl_user.username, tbl_user.password, tbl_user.fullname, tbl_user. phong "&_
		  " FROM tbl_user  "&_
		  " WHERE username = '"& Session("username") &"'"
	Set objRS = objConn.Execute(sql)
	'Response.write(sql)
%>
<script type="text/javascript">
$(document).ready(function(){
   $('.show_hide').showHide({			 
		speed: 400,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open					 
	}); 
});
</script>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tài khoản</legend>
<form id="frm_search" name="frm_search" method="post" action="">
<div class="container">
<%
	While Not objRS.EOF	   
%>
<table width="60%" border="0"id="list_tbl" >
   <tr>
	 <td width="20%"><strong><img src="images/maskrow.gif" /> Username: </strong></td>
     <td width="70%" ><%=(objRS.Fields("username"))%></td>
    </tr>
	<tr>
	 <td width="20%"><strong><img src="images/maskrow.gif" /> Password cũ: </strong></td>
     <td width="70%" ><input  type= password name="password" id="password" size="30" maxlength="100" value=""> <font color=red>.:Gõ password cũ để cập nhật.</font></td>
    </tr>
	<tr>
	 <td width="20%"><strong><img src="images/maskrow.gif" /> Password mới: </strong></td>
     <td width="70%" ><input  type= password name="newpassword" id="newpassword" size="30" maxlength="100" value=""> <font color=red>.:Gõ password mới để đổi mật khẩu.</font></td>
    </tr>
   <tr>
     <td><strong><img src="images/maskrow.gif" /> Họ và tên: </strong></td>
     <td ><input  name="fullname" id="fullname" size="30" maxlength="100" value="<%=objRS.Fields("fullname")%>"></td>
   </tr>
 
   <tr>
     <td colspan="2" class="list_nemo_center" >
	   <input name="back" type="submit" class="hieu_ung_nut2" id="back" value="Cập nhật"/>
	 </td>
    </tr>
</table>
<%	
	objRS.MoveNext
	Wend 
	
%>	
</div>
</form> 
</fieldset>
<%End iF%>
