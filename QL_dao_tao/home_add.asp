<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("add")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
	
    Dim title, isHot, content,id, scop
	startTime = convert2SimpleDateSQL(Request.Form("startTime"))
    endTime = convert2SimpleDateSQL(Request.Form("endTime"))
	title = pdb(Server.HTMLEncode(Trim(Request.Form("title"))))
	isHot = Request.Form("isHot")
	scop = Request.Form("scop")
	If(isHot="on") then
	  isHot = 1
	Else
	  isHot = 0
	End if
	content = pdb(Server.HTMLEncode(Trim(Request.Form("content"))))
	creator = Session("username")
	id = Request.querystring("id")
	
	IF (title <> "" and content <>"" and startTime<>"" and endTime<>"") then
		If (id <>"") then
		   sql = "Update tbl_inform set title = '"&title&"', isHot = "&isHot&", startTime='"&startTime&"',"&_
  		         " endTime = '"&endTime&"', content= '"&content&"', creator='"&creator&"', scop='"&scop&"'"&_
				 " where idInform="&id
		Else
			sql = "INSERT INTO tbl_inform ( title, isHot, startTime, endTime, content, creator, scop) "&_
				  " VALUES ('"&title&"', "&isHot&", '"&startTime&"', '"&endTime&"', '"&content&"', '"&creator&"','"&scop&"')"
		End if
		'esponse.Write(sql)
		objConn.Execute(sql)
		Response.write("Dữ liệu đã được cập nhật!")
		'Response.Redirect("default.asp?page=INC_list")
	End if
    
	'Lay thong tin sua	
	id = iff(id="","0",id)
	If (id<>"") then
		sql = "SELECT title, isHot, scop, DATE_FORMAT(startTime,'%d/%m/%Y') as startTime, DATE_FORMAT(endTime,'%d/%m/%Y') as endTime, content, creator FROM tbl_inform WHere idInform="&id
		Set objRS = objConn.Execute(sql)	
		startTime = iff(not objRS.EOF ,objRS.Fields("startTime"),getCurrentDate())
		endTime = iff(not objRS.EOF ,objRS.Fields("endTime"),getLastDateInMonth())
	End if

%>
<script type="text/javascript" src="js/nicEdit/nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Bài học kinh nghiệm</legend>
<form name="form1" method="post" action="">
  <table width="100%" border="0">
    <tr>
      <td width="19%"><strong>Tiêu đề <font color="red">*</font></strong></td>
      <td colspan="3"><input name="title" type="text" id="title" size="70" maxlength="240" value="<%=iff(not objRS.EOF ,objRS.Fields("title"),"")%>"></td>
    </tr>
    <tr>
      <td><strong>Thông tin quan trọng </strong></td>
      <td width="5%"><input name="isHot" type="checkbox" id="isHot" <% = iff( not objRS.EOF,objRS.Fields("isHot"),"")%>></td>
      <td width="9%"><div align="right">Mảng</div></td>
      <td width="67%"><select name="scop">
        <option value="Access" <%=iff(scop="Access","selected","")%>> IP Access</option>
        <option value="Core"   <%=iff(scop="Core","selected","")%>>IP Core</option>
        <option value="CDBR"   <%=iff(scop="CDBR","selected","")%>>IP Băng rộng</option>
        <option value="KH"     <%=iff(scop="KH","selected","")%>>IP Khách hàng</option>
      </select>
      </td>
    </tr>
    <tr>
      <td><strong>Thời gian hiển thị <font color="red">*</font></strong></td>
      <td colspan="3"><input name="startTime" type="text" id="startTime" maxlength="10" size="15" value="<%=startTime%>">&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" />
        đến 
        <input name="endTime" type="text" id="endTime" maxlength="10" size="15" value="<%=endTime%>">&nbsp;<img id= "endTime_btn" src="images/calendar.png" width="20" height="20" /></td>
		<script type="text/javascript">//<![CDATA[
		var startTime = Calendar.setup({
			inputField : "startTime",
			trigger    : "startTime_btn",
			weekNumbers: true,
			onSelect: function() {this.hide();},
			showTime   : 24,		
			dateFormat : "%d/%m/%Y"
		  });
		//]]>
		var startTime = Calendar.setup({
			inputField : "endTime",
			trigger    : "endTime_btn",
			weekNumbers: true,
			onSelect: function() {this.hide();},
			showTime   : 24,		
			dateFormat : "%d/%m/%Y"
		  });
		//]]>
	</script>	
    </tr>
    <tr>
      <td><strong>Nội dung <font color="red">*</font></strong></td>
      <td colspan="3"><textarea name="content" cols="100" rows="15" id="content"><%=iff(not objRS.EOF ,objRS.Fields("content"),"")%></textarea></td>
    </tr>
    <tr>
      <td colspan="4"  class="list_nemo_center">
	   <input type="submit" class="hieu_ung_nut2" name="Submit" value="Cập nhật"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	  </td>
    </tr>
  </table>
</form>
</fieldset>