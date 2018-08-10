<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") ) Then
		Response.Redirect("default.asp?page=login&mess=notAdmin")
	End if
	
	'Xu ly reset va khoa tai khoan
	Dim action
	action= Trim(Request.QueryString("type"))
	user= Trim(Request.QueryString("user"))
	If (action<>"" and user<>"") then
	  If (action = "reset") then
	    objConn.Execute("UPDATE tbl_user SET PASSWORD = '"&Base64encode("qaz123")&"' WHERE username = '"&user&"'")
	  End if
	  If (action = "lock") then
	    objConn.Execute("UPDATE tbl_user SET islock = '1' WHERE username = '"&user&"'")
	  End if
	   If (action = "delete") then
	    objConn.Execute("DELETE  FROM tbl_user  WHERE username = '"&user&"'")
	  End if
	End if
	
	Dim username, ma_nv,fullname,email,sdt,chuc_danh
	username = Trim(Request.Form("username"))
	password = Trim(Request.Form("password"))
	ma_nv = Request.Form("ma_nv") 
	fullname = Trim(Request.Form("fullname"))
	email = Request.Form("email") 
	sdt = Request.Form("sdt") 
	phong = Request.Form("phong") 
	chuc_danh = Request.Form("chuc_danh") 
	
	' Insert to database	
	If (username<>"" and password <>"" and not(checkExistAcc(username))) then
	 sql = " INSERT INTO tbl_user (ma_nv,username,password, fullname, chuc_danh,email,sdt,phong,islock) VALUES"&_
					"('"&ma_nv&"', "&_
					"'"&username&"', "&_
					"'"&Base64encode(password)&"', "&_					
					"'"&fullname&"', "&_
					"'"&chuc_danh&"', "&_
					"'"&email&"', "&_
					"'"&sdt&"', "&_
					"'"&phong&"', "&_
					"'0')"
	 objConn.Execute(sql)
	End if	
	'Response.Write(sql)
	
%>
	<script type="text/javascript" charset="utf-8">
			$(document).ready( function () {
				var id = -1;//simulation of id
				$('#tbUser').dataTable({ bJQueryUI: true,"sPaginationType": "full_numbers"}).makeEditable({
					sUpdateURL: "UpdateData.asp",
					sAddURL: "adminAjAddUser.asp",	
					sDeleteURL: "admin_del.asp",						
					sUpdateURL: function( value, settings)
					{
						return(value); //Simulation of server-side response using a callback function						
					},
					sAddHttpMethod: "GET",
					sDeleteHttpMethod: "GET",
					"aoColumns": [
								null,null,null,null,null,null,null,null
							],
					oAddNewRowButtonOptions: {	label: "Add...",
									icons: {primary:'ui-icon-plus'} 
					},
					oDeleteRowButtonOptions: {	label: "Xóa bản ghi", 
									icons: {primary:'ui-icon-trash'}
					},
					oAddNewRowFormOptions: { 	
									title: 'Tạo tài khoản',
									show: "blind",
									hide: "blind",
									modal: true
					}	,
				sAddDeleteToolbarSelector: ".dataTables_length"});} );
		</script>

        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-17838786-2']);
            _gaq.push(['_trackPageview']);

            (function () {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = 'js/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

</script>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Tạo mới tài khoản</legend>
<form id="form_adduser" method="post" action="">
	<table width="100%" border="0"id="list_tbl">
      <tr>
        <td> <label ><img src="images/maskrow.gif" /> Tài khoản <font color="red">*</font></label></td>
        <td><input name="username" type="text" id="username" size="40" maxlength="25" rel="0" /></td>
        <td><img src="images/maskrow.gif" /> Mật khẩu<font color="red">*</font></td>
        <td><input name="password"  type="password" id="password" size="40" maxlength="50" rel="1" /></td>
      </tr>
      <tr>
		<td> <label ><img src="images/maskrow.gif" /> Mã nhân viên <font color="red">*</font></label></td>
        <td><input name="ma_nv" type="text" id="ma_nv" size="40" maxlength="25" rel="0" /></td>
		<td> <label ><img src="images/maskrow.gif" /> Họ và tên <font color="red">*</font></label></td>
        <td><input name="fullname" type="text" id="fullname" size="40" maxlength="25" rel="0" /></td>
       </tr>
	    <tr>
			<td> <label ><img src="images/maskrow.gif" /> Email <font color="red">*</font></label></td>
			<td><input name="email" type="text" id="email" size="40" maxlength="25" rel="0" /></td>
			<td> <label ><img src="images/maskrow.gif" /> Số điện thoại <font color="red">*</font></label></td>
			<td><input name="sdt" type="text" id="sdt" size="40" maxlength="25" rel="0" /></td>
       </tr>
	   <tr>
			<td> <label ><img src="images/maskrow.gif" /> Phòng <font color="red">*</font></label></td>
			<td>
						<%=listDonVi("phòng","","","size=1")%>
			</td>
			<td> <label ><img src="images/maskrow.gif" /> Chức danh  <font color="red">*</font></label></td>
			<td><input name="chuc_danh" type="text" id="chuc_danh" size="40" maxlength="25" rel="0" /></td>
       </tr>
	   
      <tr class="list_nemo_center">
        <td colspan="4">
		<input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo tài khoản"/>
		 <input type="reset" class="hieu_ung_nut2" name="reset" value="Reset"/>
		</td>
      </tr>
    </table>
</form>  
</fieldset>
  <%		
   sql = "SELECT  *  FROM tbl_user " 
   'Response.Write(sql)
   Set objRS = objConn.Execute(sql)	   
  %>	   
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbUser">
	<thead>
		<tr>
			<th>&nbsp;</th>
			<th>Mã nhân viên</th>
			<th>User</th>
			<th>Họ và tên</th>
			<th>Chức danh</th>
		    <th>Email</th>
		    <th>Số điện thoại</th>
		    <th>Phòng</th>	
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	<%
	While Not objRS.EOF
	%>
		<tr id="<%=objRS.Fields("username")%>">
			<td></td>
			<td><% =objRS.Fields("ma_nv")%></td>
			<td class="left"><%=objRS.Fields("username")%></td>
			<td class="center"><%=objRS.Fields("fullname")%></td>
			<td class="center"><%=objRS.Fields("chuc_danh")%></td>
			<td class="center"><%=objRS.Fields("email")%></td>
			<td class="center"><%=objRS.Fields("sdt")%></td>
			<td class="center"><%=objRS.Fields("phong")%></td>
			<td class="center" nowrap='nowrap'>						
				<a href='default.asp?page=admin&type=reset&user=<%=objRS.Fields("username")%>'>
					<img src="images/reset.png" width="20" height="20"  alt="Reset mật khẩu"/>
				</a>
				<a href='default.asp?page=admin&type=lock&user=<%=objRS.Fields("username")%>'>
					<%If (objRS.Fields("islock")="1") then%>
						<img src="images/unlock.png"  width="20" height="20"  alt="Mở khóa tài khoản"/>
				</a>
				<%Else%>
				   <img src="images/lock.png"  width="20" height="20"  alt="Khóa tài khoản"/>
				</a>
				<%End if%>
				<a href='default.asp?page=admin&type=delete&user=<%=objRS.Fields("username")%>'>
					<img src="images/delete.gif" width="20" height="20"  alt="Reset mật khẩu"/>
				</a>
			</td>			
		</tr>	
	<%	
		objRS.MoveNext
		Wend 
	%>
	</tbody>	
</table>

	<%
		objRS.Close
		Set objRS = Nothing
		objConn.Close
		Set objConn = Nothing	
	%>