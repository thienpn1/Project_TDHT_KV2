<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("add")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
' Lay thong tin cong viec
dim sttt
	sttt=Request.QueryString("stt")
	id = Request.QueryString("id")
	sql = "SELECT `id`, `Mang_yeu_cau`, `Noi_dung`, `Nguoi_tao`, date_format(Ngay_bat_dau,'%d/%m/%Y') as Ngay_bat_dau, `Thoi_gian_dap_ung`, `Nhan_su_tiep_nhan`, `Work_log`, `Tien_do`, `Trang_thai_yeu_cau`, `Ghi_chu` FROM `hatang_request` WHERE id = "& id
    Set objRS = objConn.Execute(sql)
	If (Not objRS.EOF) then

'--------------------------------------------
   ' Dim  cr, mailTitle, executer, problems, reportType, note, fileAtt
	dim Nhom_hanh_dong
	Mang_yeu_cau = (Request.Form("Mang_yeu_cau"))
	Noi_dung=(Request.Form("Noi_dung"))
	Ngay_bat_dau = convert2SimpleDateSQL(Request.Form("Ngay_bat_dau"))
	Thoi_gian_dap_ung = Request.Form("Thoi_gian_dap_ung")
	Work_log = (Request.Form("Work_log"))
	Ghi_chu = Request.Form("Ghi_chu")
	Nguoi_tao=Session("username")
	Work_log = (Request.Form("Work_log"))
	Nhom_hanh_dong = (Request.Form("Nhom_hanh_dong"))
	if Nhom_hanh_dong <> "" then
		IF  Nhom_hanh_dong="Tiếp nhận thực hiện" then 
		sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"' , "&_
					"Nhan_su_tiep_nhan = '"&Session("username")&"' , "&_
					"Tien_do = 'Đang thực hiện' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		IF Nhom_hanh_dong="Trả về đơn vị tạo" then 
		sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"' , "&_
					"Tien_do = 'Chờ gửi đi' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		IF Nhom_hanh_dong="Gửi đi" then 
		sql = " UPDATE hatang_request SET "&_
					"Mang_yeu_cau = '"&Mang_yeu_cau&"' , "&_
					"Noi_dung = '"&Noi_dung&"' , "&_
					"Nguoi_tao = '"&Nguoi_tao&"' , "&_
					"Ngay_bat_dau = '"&Ngay_bat_dau&"' , "&_
					"Thoi_gian_dap_ung = '"&Thoi_gian_dap_ung&"' , "&_
					"Work_log = '"&Work_log&"' , "&_
					"Tien_do = 'Chờ tiếp nhận thực hiện' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		IF Nhom_hanh_dong="Hoàn thành" then 
		sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"' , "&_
					"Tien_do = 'Đã hoàn thành' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		IF Nhom_hanh_dong="Đóng" then 
		sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"' , "&_
					"Tien_do = 'Đã đóng' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		IF Nhom_hanh_dong="Mở lại yêu cầu" then 
		sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"' , "&_
					"Tien_do = 'Chờ gửi đi' "&_
					" WHERE id = "& id

		'Response.Write(sql)
		End if
		if Nhom_hanh_dong = "Cập nhật work log" then
			sql = " UPDATE hatang_request SET "&_
					"Work_log = '"&Work_log&"'"&_
					" WHERE id = "& id
		
		end if
		Set objRS1 = objConn.Execute(sql)
		'Response.Write(sql)
		Response.Redirect("default.asp?page=ht_rq_list")
	end if

%>
<style>
<!--
.font_alert {color: #FF0000 ; font-style: italic;}
.font_inform {color: #000066 ;}
-->
</style>
<script type="text/javascript" language="javascript">
window.onload = function(){
			disabled_input()
};
function validateFormOnSubmit() {

  var content= document.getElementById("content")
		if (content.value=="") 
		{	document.getElementById("for_content").innerHTML= "Chưa nhập nội dung công việc";
			content.focus();
			return false;
		}

  var executer= document.getElementById("executer")
		if (executer.value=="") 
		{	document.getElementById("for_executer").innerHTML= "Chưa nhập nhân sự thực hiện";
			executer.focus();
			return false;
		}
		
 var startTime= document.getElementById("startTime")
		if (startTime.value=="") 
		{	document.getElementById("for_startTime").innerHTML= "Chưa nhập thời gian";
			startTime.focus();
			return false;
		}
		if (!isDate(startTime.value)) 
		{			   
			document.getElementById("for_startTime").innerHTML= "Sai định dạng (dd/mm/yyyy)";
			startTime.focus();
			return false;
		}
  
  return true;
}

function onChaneText(input, text)
{
if(input.length > 0)
   {
    document.getElementById(text).innerHTML= "";
   }
}
  
 //Function add ảnh hưởng
 function addINCEffect(){
 	 var cb = document.getElementById("cbINCLevel");
     var level = cb.options[cb.selectedIndex].text;
	 var effect = document.getElementById("txt_INCLevel").value;	 
	 if (effect!= "") 
	 {
	 	document.getElementById("label_INCEffect").innerHTML += level + ": " + effect + "<br>";
		document.getElementById("hidden_effect").value += level + "$$" + effect + "||";		
	 }
	
  }  
  //Function clear ảnh hưởng
 function clearINCEffect(){
	document.getElementById("label_INCEffect").innerHTML = "";
	document.getElementById("hidden_effect").value = "";			
 }
 function disabled_input(){
 var trang_thai=document.getElementById("sttt").value

 if(trang_thai == "cho_gui_di")
   {
			document.getElementById("Noi_dung").disabled = false;
			document.getElementById("Mang_yeu_cau").disabled = false;
			document.getElementById("Nguoi_tao").disabled = false;
			document.getElementById("Ngay_bat_dau").disabled = false;
			document.getElementById("Thoi_gian_dap_ung").disabled = false;		
   }else
   {
			document.getElementById("Noi_dung").disabled = true;
			document.getElementById("Mang_yeu_cau").disabled = true;
			document.getElementById("Nguoi_tao").disabled = true;
			document.getElementById("Ngay_bat_dau").disabled = true;
			document.getElementById("Thoi_gian_dap_ung").disabled = true;
   }
   
}
			
 
</script>

<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin yêu cầu</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl" >
   <tr>
	 <td width="30%"><img src="images/maskrow.gif" /> Mảng yêu cầu <font color="red">*</font></td>
     <td width="40%"><textarea name="Mang_yeu_cau" cols="50" rows="2" id="Mang_yeu_cau" class="textarea" onchange="onChaneText(this.value,'for_content')" ><%=objRS.Fields("Mang_yeu_cau")%></textarea></td>
     <td width="30%"><label class="font_alert" id="for_content">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><img src="images/maskrow.gif" /> Nội dung <font color="red">*</font></td>
     <td width="40%"><textarea name="Noi_dung" cols="50" rows="2" id="Noi_dung" class="textarea" onchange="onChaneText(this.value,'for_content')" ><%=objRS.Fields("Noi_dung")%></textarea></td>
     <td width="30%"><label class="font_alert" id="for_content">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><img src="images/maskrow.gif" />Người tạo</td>
     <td width="40%"><input  name="Nguoi_tao" id="Nguoi_tao" size="40" maxlength="250" value ="<%=objRS.Fields("Nguoi_tao")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
     
   <tr>
     <td><strong><img src="images/maskrow.gif" /> Ngày bắt đầu <font color="red">*</font> </strong></td>
     <td ><input  name="Ngay_bat_dau" id="Ngay_bat_dau" size="40" maxlength="250" value ="<%=objRS.Fields("Ngay_bat_dau")%>"/>&nbsp;<img id= "Ngay_bat_dau_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><img src="images/maskrow.gif" />Thời gian đáp ứng</td>
     <td width="40%"><input  name="Thoi_gian_dap_ung" id="Thoi_gian_dap_ung" size="40" maxlength="250" value ="<%=objRS.Fields("Thoi_gian_dap_ung")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><img src="images/maskrow.gif" />Work log</td>
      <td width="40%"><textarea name="Work_log" cols="50" rows="2" id="Work_log" class="textarea" onchange="onChaneText(this.value,'for_content')" ><%=objRS.Fields("Work_log")%></textarea></td>
     <td width="30%">&nbsp;</td>
   </tr>
   
   <tr>
     <td><img src="images/maskrow.gif" /><strong> Nhóm hành động</strong></td>
     <td width="40%"><%=liststt("Nhom_hanh_dong","",""&objRS.Fields("Tien_do")&"")%></td>
   </tr> 
   
   <tr>
	 <input hidden name="sttt" id="sttt" size="40" maxlength="250" value ="<%=sttt%>"/>
     
   </tr>
   <script type="text/javascript">//<![CDATA[
    var startTime = Calendar.setup({
        inputField : "Ngay_bat_dau",
        trigger    : "Ngay_bat_dau_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  this.args.max = date;
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	  
	 var endTime = Calendar.setup({
        inputField : "endTime",
        trigger    : "endTime_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  this.args.max = date;
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	
    //]]></script>	
   
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Cập nhật yêu cầu"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>

<%End if ' End viec kiem tra co du lieu cong viec khong%> 