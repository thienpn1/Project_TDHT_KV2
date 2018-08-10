<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") and Session("usergroup")<>"ADMIN") Then
		Response.Redirect("default.asp?page=login&mess=notAdmin")
	End if
	
	Dim groupname, add, edit, del,progress
	groupname = Request.Form("groupname") 
	add = "0"&Request.Form("add")
	edit = "0"&Request.Form("edit")
	del = "0"&Request.Form("del")
	approve = "0"&Request.Form("approve")
	direct = "0"&Request.Form("direct")
	progress = "0"&Request.Form("progress")
	' Insert to database	
	If (groupname<>"" and not(checkExistGroup(groupname))) then
	 sql = " INSERT INTO tbl_usergroup (groupname,_add, edit, del, approve,direct,progress ) "&_
			" VALUES('"&groupname&"',"&add&","&edit&","&del&","&approve&","&direct&","&progress&")"
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
		sDeleteURL: "admin_group_del.asp",						
		sUpdateURL: function( value, settings)
		{
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [
					null,null,null
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
<script>
    //Thay doi quyen cho group
	function ChangeRole(groupname, type, value){
	    var xmlhttp;
		if (window.XMLHttpRequest){
		  // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();}
		else if (window.ActiveXObject)
		  {
		  // code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
		else { 
			alert("Your browser does not support XMLHTTP!"); }
		xmlhttp.onreadystatechange=function()
		  {
			if(xmlhttp.readyState==4)
			{
				//document.getElementById(eval(idCV)).innerHTML= result;
				//alert(xmlhttp.responseText);
				alert("Dữ liệu đã được cập nhật!");
			}	
		   }
		xmlhttp.open("GET","Admin_ext.asp?groupname="+groupname+"&action="+type+"&value="+value,true); 
		 
		xmlhttp.send(null);	
	}
</script>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Tạo nhóm mới</legend>
<form id="form_adduser" method="post" action="">
	<table width="100%" border="0"id="list_tbl">
      <tr>
        <td> <label for="groupname"><img src="images/maskrow.gif" /> Tên nhóm <font color="red">*</font></label></td>
        <td><input name="groupname" type="text" id="groupname" size="40" maxlength="25" rel="0" /></td>
        <td><img src="images/maskrow.gif" /> Phân quyền</td>
		<td>
		 <input name="add" type="checkbox" id="add" value = 1> Add
		 <input name="edit" type="checkbox" id="edit" value = 1> Edit
		 <input name="del" type="checkbox" id="del" value = 1>Delete	
		 <input name="approve" type="checkbox" id="approve" value = 1>Approve		
		 <input name="direct" type="checkbox" id="direct" value = 1>Direct	
		 <input name="progress" type="checkbox" id="progress" value = 1>update progress	
		</td>
      </tr>      
      <tr class="list_nemo_center">
        <td colspan="4">
		<input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo nhóm"/>
		 <input type="reset" class="hieu_ung_nut2" name="reset" value="Reset"/>
		</td>
      </tr>
    </table>
</form>  
</fieldset>
  <%		
   sql = "SELECT groupname, _add, edit, del, approve, direct, LEVEL,progress FROM tbl_usergroup order by groupname"	  
   '	Response.Write(sql)
   Set objRS = objConn.Execute(sql)	   
  %>	   
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbUser">
	<thead>
		<tr>
			<th></th>
			<th>Group name</th>
		    <th>Add</th>
		    <th>Edit</th>
		    <th>Delete</th>		    
			<th>Approve</th>	
			<th>Direct</th>	
			<th>Progress</th>	
		</tr>
	</thead>
	<tbody>
	<%
	While Not objRS.EOF
	%>
		<tr id="<%=objRS.Fields("groupname")%>">
			<td></td>
			<td class="left"><%=objRS.Fields("groupname")%></td>
			<td class="center"><input name="_add|<%=objRS.Fields("groupname")%>"id="_add|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("_add")="1","checked=""checked""","")%> onclick="ChangeRole('<%=objRS.Fields("groupname")%>','_add',this.checked)"/></td>
			<td class="center"><input name="edit|<%=objRS.Fields("groupname")%>"id="edit|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("edit")="1","checked=""checked""","")%> onclick="ChangeRole('<%=objRS.Fields("groupname")%>','edit',this.checked)"/></td>
			<td class="center"><input name="del|<%=objRS.Fields("groupname")%>"id="del|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("del")="1","checked=""checked""","")%>    onclick="ChangeRole('<%=objRS.Fields("groupname")%>','del',this.checked)"/></td>
			<td class="center"><input name="approve|<%=objRS.Fields("groupname")%>"id="approve|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("approve")="1","checked=""checked""","")%> onclick="ChangeRole('<%=objRS.Fields("groupname")%>','approve',this.checked)"/></td>
			<td class="center"><input name="direct|<%=objRS.Fields("groupname")%>"id="direct|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("direct")="1","checked=""checked""","")%>    onclick="ChangeRole('<%=objRS.Fields("groupname")%>','direct',this.checked)"/></td>
			<td class="center"><input name="progress|<%=objRS.Fields("groupname")%>"id="progress|<%=objRS.Fields("groupname")%>" type='checkbox' value="1" <% = iff(objRS.Fields("progress")="1","checked=""checked""","")%>    onclick="ChangeRole('<%=objRS.Fields("groupname")%>','progress',this.checked)"/></td>
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