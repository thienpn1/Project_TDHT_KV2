
<%
If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	
else
	dim tstart,tend
	id= Trim(Request.QueryString("id"))
	tstart=Trim(Request.QueryString("tstart"))
	tend=Trim(Request.QueryString("tend"))
	startTime1 = Request.Form("startTime1")
	startTime2 = Request.Form("startTime2")
	IF (startTime1<>"" and startTime2<>"" ) then
		sql	 = "UPDATE `dao_tao` SET "&_
					"start_time = '"&startTime1&"' , "&_
					"end_time = '"&startTime2&"' , "&_
					"tien_do = 'đóng' , "&_
					"thoi_luong = TIMESTAMPDIFF(HOUR,str_to_date('"&startTime1&"','%d/%m/%Y %H:%i:%s'),str_to_date('"&startTime2&"','%d/%m/%Y %H:%i:%s')) "&_
					" WHERE id = '"& id &"'"
		Response.Write(sql)
		Set objRS1 = objConn.Execute(sql	)
		Response.Redirect("default.asp?page=de_xuat")
	End if
	
	


End if
%>
<fieldset class="Khung1" style="border-top-width: 0px;border-top-style: solid;border-bottom-width: 0px;border-bottom-style: solid;border-left-width: 0px;border-left-style: solid;border-right-width: 0px;border-right-style: solid;padding-right: 10px;padding-left: 10px;padding-top: 5px;padding-bottom: 5px;">
<legend class="mau_chu_legen">Thông tin để đóng kế hoạch</legend>
<div class="content" style="padding-top: 10px;padding-bottom: 10px;border-top-style: solid;border-top-width: 0px;border-bottom-style: solid;border-bottom-width: 0px;">
<form id="frm_search" name="frm_search" method="post" onsubmit="return validateFormOnSubmit()" action="">
<div class="container">
<span class="font_inform" id="label_INCEffect"></span><span class="font_inform" id="label_INCEffect"></span><div>
   </div><table id="list_tbl" width="100%" border="0">

	<tbody>
	
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif"> Ngày bắt đầu (từ ngày) <font color="red">*</font> </strong></td>
		<td>
			<input  name="startTime1" id="startTime1" size="40" maxlength="250" value="" onchange="onChaneText(this.value,'startTime1')">
			<img id="startTime1_btn" src="images/calendar.png" width="20" height="20">
		</td>
		<td><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif"> Ngày kết thúc (Đến ngày) <font color="red">*</font> </strong></td>
		<td>
			<input  name="startTime2" id="startTime2" size="40" maxlength="250" value=""  onchange="onChaneText(this.value,'startTime2')">
			<img id="startTime2_btn" src="images/calendar.png" width="20" height="20">
		</td>
     <td><label class="font_alert" id="for_startTime">&nbsp;</label></td>
  </tr>
   <script type="text/javascript">//<![CDATA[
		  Calendar.setup({
        inputField : "startTime1",
        trigger    : "startTime1_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y %H:%M:%S"
      });
	  Calendar.setup({
        inputField : "startTime2",
        trigger    : "startTime2_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y %H:%M:%S"
      });
	
    //]]></script>	
	
	<tr>
    <td colspan="3" class="list_nemo_center" style="border-top-width: 0px;border-top-style: solid;margin-top: 10px;padding-top: 20px;padding-bottom: 20px;">
	    <input class="hieu_ung_nut2" name="Submit" value="Đóng kế hoạch" type="submit">
       
    </tr>
</tbody></table>
</div>
</form> 
</div>
</fieldset>