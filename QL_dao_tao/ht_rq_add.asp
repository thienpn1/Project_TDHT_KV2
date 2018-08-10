<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin"))  Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
  dim Mang_yeu_cau,Noi_dung,Ngay_bat_dau,Thoi_gian_dap_ung,Work_log,Nguoi_tao,Nhan_su_tiep_nhan,Trang_thai_yeu_cau,Tien_do
	Mang_yeu_cau = (Request.Form("Mang_yeu_cau"))
	Noi_dung=(Request.Form("Noi_dung"))
	Ngay_bat_dau = convert2SimpleDateSQL(Request.Form("Ngay_bat_dau"))
	Thoi_gian_dap_ung = Request.Form("Thoi_gian_dap_ung")
	Work_log = (Request.Form("Work_log"))
	Ghi_chu = Request.Form("Ghi_chu")
	Nguoi_tao=Session("username")
	Nhan_su_tiep_nhan=""
	
	IF (Noi_dung<>"") then
		sql = "INSERT INTO hatang_request "&_
		"(Mang_yeu_cau, Noi_dung, Nguoi_tao, Ngay_bat_dau, Thoi_gian_dap_ung, Nhan_su_tiep_nhan, Work_log, Tien_do, Trang_thai_yeu_cau, Ghi_chu)"&_
				" VALUES "&_
					"('"&Mang_yeu_cau&"', "&_
					"'"&Noi_dung&"', "&_
					"'"&Nguoi_tao&"', "&_					
					"'"&Ngay_bat_dau&"', "&_
					"'"&Thoi_gian_dap_ung&"', "&_
					"'"&Nhan_su_tiep_nhan&"', "&_
					"'"&Work_log&"', "&_
					"'"&"Chờ tiếp nhận"&"', "&_
					"'"&"trong hạn"&"', "&_
					"'"&Ghi_chu&"')"
		Response.Write(sql)
		Set objRS = objConn.Execute(sql)
		Response.Redirect("default.asp?page=ht_rq_list")
	End if

%>
<style>
<!--
.font_alert {color: #FF0000 ; font-style: italic;}
.font_inform {color: #000066 ;}
-->
</style>
<script type="text/javascript" language="javascript">
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
 
 function tudong_hienthi_ngay_dap_ung() {
 var Mang_yeu_cau= document.getElementById("Mang_yeu_cau");
 var str_mang_yeu_cau =String(Mang_yeu_cau.value);
 
  if (str_mang_yeu_cau=="Đảm bảo VTTB cho công tác phát triển mới") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "10";
	}
  if (str_mang_yeu_cau=="Đảm bảo thủ tục, hợp đồng thi công, đơn vị thi công cho công tác PTHT, các chương trình phục vụ lễ hội, sự kiện") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Tiếp nhận, giải quyết các đề xuất của TTKT KV: những yêu cầu  nghiệp vụ, phần mềm, quản lý chất lượng công trình") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Đảm bảo thủ tục hợp đồng thi công kiên cố nhà trạm, cột anten") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Đảm bảo thủ tục hợp đồng thi công tuyến cáp ngầm") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Làm việc với nhà thầu giải quyết vấn đề phát sinh trong quá trình thi công (đơn giá vận chuyển, giá xây dựng…)") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "5";
	}
  if (str_mang_yeu_cau=="Đảm bảo HSTK được thẩm định, phê duyệt chuyển ĐVTC, Chi nhánh tỉnh, TTKT KV để tổ chức triển khai") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Đảm bảo pháp lý, hướng dẫn thủ tục cho những công việc trong OS, ngoài OS liên quan trong công tác") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Hướng dẫn, đào tạo nghiệp vụ trong công tác đầu tư xây dựng") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "5";
	}
  if (str_mang_yeu_cau=="Đảm bảo cấp phát vật tư thiết bị đảm bảo thực hiện cho các Kế hoạch, chương trình phát triển hạ tầng tháng/quý/năm") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "3";
	}
  if (str_mang_yeu_cau=="Đảm bảo vật tư, thiết bị được KCS theo đúng quy định, không hỏng hóc khi xuất đến công trình phục vụ cho các kế hoạch phát triển hạ tầng tháng/quý/năm") 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "10";
	}	
	if (str_mang_yeu_cau==0) 
	{	
		document.getElementById("Thoi_gian_dap_ung").value= "";
	}	

	
	
 
 }
</script>

<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin yêu cầu</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl">
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" ></img>Mảng yêu cầu <font color="red">*</font></strong></td>
     <td><select name="Mang_yeu_cau" id="Mang_yeu_cau" onChange="tudong_hienthi_ngay_dap_ung()">
	  <option value="0" selected >-------Lựa chọn-------</option>
       <option value="Đảm bảo VTTB cho công tác phát triển mới">Đảm bảo VTTB cho công tác phát triển mới</option>
       <option value="Đảm bảo thủ tục, hợp đồng thi công, đơn vị thi công cho công tác PTHT, các chương trình phục vụ lễ hội, sự kiện">Đảm bảo thủ tục, hợp đồng thi công, đơn vị thi công cho công tác PTHT, các chương trình phục vụ lễ hội, sự kiện</option>
       <option value="Tiếp nhận, giải quyết các đề xuất của TTKT KV: những yêu cầu  nghiệp vụ, phần mềm, quản lý chất lượng công trình">Tiếp nhận, giải quyết các đề xuất của TTKT KV: những yêu cầu  nghiệp vụ, phần mềm, quản lý chất lượng công trình</option>
       <option value="Đảm bảo thủ tục hợp đồng thi công kiên cố nhà trạm, cột anten">Đảm bảo thủ tục hợp đồng thi công kiên cố nhà trạm, cột anten</option>
	   <option value="Đảm bảo thủ tục hợp đồng thi công tuyến cáp ngầm ">Đảm bảo thủ tục hợp đồng thi công tuyến cáp ngầm </option>
       <option value="Làm việc với nhà thầu giải quyết vấn đề phát sinh trong quá trình thi công (đơn giá vận chuyển, giá xây dựng…)">Làm việc với nhà thầu giải quyết vấn đề phát sinh trong quá trình thi công (đơn giá vận chuyển, giá xây dựng…)</option>
       <option value="Đảm bảo HSTK được thẩm định, phê duyệt chuyển ĐVTC, Chi nhánh tỉnh, TTKT KV để tổ chức triển khai ">Đảm bảo HSTK được thẩm định, phê duyệt chuyển ĐVTC, Chi nhánh tỉnh, TTKT KV để tổ chức triển khai </option>
       <option value="Đảm bảo pháp lý, hướng dẫn thủ tục cho những công việc trong OS, ngoài OS liên quan trong công tác.">Đảm bảo pháp lý, hướng dẫn thủ tục cho những công việc trong OS, ngoài OS liên quan trong công tác.</option>
	   <option value="Hướng dẫn, đào tạo nghiệp vụ trong công tác đầu tư xây dựng">Hướng dẫn, đào tạo nghiệp vụ trong công tác đầu tư xây dựng</option>
 <option value="Đảm bảo cấp phát vật tư thiết bị đảm bảo thực hiện cho các Kế hoạch, chương trình phát triển hạ tầng tháng/quý/năm
">Đảm bảo cấp phát vật tư thiết bị đảm bảo thực hiện cho các Kế hoạch, chương trình phát triển hạ tầng tháng/quý/năm.
</option>	  
	  <option value="Đảm bảo vật tư, thiết bị được KCS theo đúng quy định, không hỏng hóc khi xuất đến công trình phục vụ cho các kế hoạch phát triển hạ tầng tháng/quý/năm">Đảm bảo vật tư, thiết bị được KCS theo đúng quy định, không hỏng hóc khi xuất đến công trình phục vụ cho các kế hoạch phát triển hạ tầng tháng/quý/năm.</option>
     </select>  
	 </td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Nội dung</strong></td>
     <td width="40%">
	   <span class="font_inform"  id="label_INCEffect"></span>
       <textarea name="Noi_dung" cols="50" rows="5" id="Noi_dung" class="textarea"></textarea></td>
     <
   </tr>

   <tr>
     <td><strong><img src="images/maskrow.gif" /> Ngày bắt đầu <font color="red">*</font> </strong></td>
     <td ><input  name="Ngay_bat_dau" id="Ngay_bat_dau" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_bat_dau_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
      <tr>
     <td width="35%" ><strong><img src="images/maskrow.gif" /> Thời gian đáp ứng ( Ngày )</strong></td>
     <td width="40%"><input  name="Thoi_gian_dap_ung" id="Thoi_gian_dap_ung" size="40" maxlength="250" value ="" readonly ="true" />
	 
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
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Work log</strong></td>
     <td width="40%">
	   <span class="font_inform"  id="label_INCEffect"></span>
       <textarea name="Work_log" cols="50" rows="5" id="Work_log" class="textarea"></textarea></td>
     <td width="30%"><label class="font_alert" id="for_hidden_effect">&nbsp;</label></td>
   </tr>   
   
   
    <td ><strong><img src="images/maskrow.gif" /> Ghi chú</strong></td>
     <td colspan="2"><textarea name="Ghi_chu" cols="50" rows="2" id="Ghi_chu" class="textarea"  onchange="onChaneText(this.value,'for_process')"></textarea></td>
   </tr>
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo công việc"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>