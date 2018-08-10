<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin"))  Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
	dim id_de_xuat
	id_de_xuat = Trim(Request.QueryString("id_de_xuat"))
	ten_de_xuat = (Request.Form("ten_de_xuat"))
	noi_dung=(Request.Form("noi_dung"))
	startTime1 = convert2SimpleDateSQL(Request.Form("startTime1"))
	startTime2 = convert2SimpleDateSQL(Request.Form("startTime2"))
	nhan_su_tao=Session("username")
	phong=Session("department")
	ip="0"&(Request.Form("ip"))
	cdbr="0"&(Request.Form("cdbr"))
	dd="0"&(Request.Form("dd"))
	td="0"&(Request.Form("td"))
	cd="0"&(Request.Form("cd"))
	
	IF (Noi_dung<>"") then
		sql = "INSERT INTO `de_xuat_dao_tao` (`proposer`, `department`, `content`, `start_time`, `end_time`, `status`, `ip`, `cdbr`, `td`, `dd`, `cd`) VALUES "&_
					"('"&nhan_su_tao&"', "&_
					"'"&phong&"', "&_
					"'"&noi_dung&"', "&_					
					"'"&startTime1&"', "&_
					"'"&startTime2&"', "&_
					"'chưa có kế hoạch đào tạo', "&_
					"'"&ip&"', "&_
					"'"&cdbr&"', "&_
					"'"&td&"', "&_
					"'"&dd&"', "&_
					"'"&cd&"')"
		'Response.Write(sql)
		Set objRS = objConn.Execute(sql)
		Response.Redirect("default.asp?page=de_xuat")
	End if

%>
<style>
<!--.font_alert {color: #FF0000 ; font-style: italic;}	.font_inform {color: #000066 ;}-->
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
 
 
</script>

<fieldset class="Khung1">
<legend class="mau_chu_legen">Nhập Thông tin về kế hoạch đào tạo</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="100%" border="0" id="list_tbl">

	<tr>
		<td width=30% ><strong><img src="images/maskrow.gif" />Tên kế hoạch<font color="red">*</font> </strong></td>
		<td><input  name="ten_dao_tao" id="ten_dao_tao" size="40" maxlength="250" /></td>
	</tr>
    <tr>
		<td ><strong><img src="images/maskrow.gif" /> Nội dung<font color="red">*</font></strong></td>
		<td>
			<textarea name="noi_dung" cols="50" rows="5" id="noi_dung" class="textarea"></textarea>
		</td>
    </tr>
	<tr>
		<td ><strong><img src="images/maskrow.gif" />Đối tượng<font color="red">*</font> </strong></td>
		<td><input  name="doi_tuong" id="doi_tuong" size="40" maxlength="250" /></td>
	</tr>
	<tr>
		<td ><strong><img src="images/maskrow.gif" />Giảng viên<font color="red">*</font> </strong></td>
		<td><input  name="giang_vien" id="giang_vien" size="40" maxlength="250" /></td>
	</tr>
	<tr>
		<td ><strong><img src="images/maskrow.gif" />Thời lượng<font color="red">*</font> </strong></td>
		<td><input  name="thoi_luong" id="thoi_luong" size="40" maxlength="250" /></td>
	</tr>
	<tr>
		<td><strong><img src="images/maskrow.gif" /> Thời gian dự kiến đào tạo <font color="red">*</font> </strong></td>
		<td ><input  name="startTime1" id="startTime1" size="20" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'startTime1')"/>&nbsp;</td>
		<td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	</tr>
	<tr>
		<td ><strong><img src="images/maskrow.gif" />Địa điểm tổ chức<font color="red">*</font> </strong></td>
		<td><input  name="dia_diem" id="dia_diem" size="40" maxlength="250" /></td>
	</tr>
	<td><img src="images/maskrow.gif" /><strong>Hình thức đào tạo<font color="red">*</font> </strong></td>
	<td><select name="hinh_thuc_dao_tao" class="dropdown" id="hinh_thuc_dao_tao">
			<option value="0">----Lựa Chọn----</option>
			<option value="tập trung" >Tập trung</option>
			<option value="tự tham khảo tài liệu" >Tham khảo tài liệu</option>
		</select>
	</td>
	<tr>
		<td><img src="images/maskrow.gif" /><strong>Đánh giá<font color="red">*</font> </strong></td>
		<td><select name="danh_gia" class="dropdown" id="danh_gia">
				<option value="0">----Lựa Chọn----</option>
				<option value="có đánh giá" >Có đánh giá</option>
				<option value="không đánh giá" >Không đánh giá</option>
			</select>
		</td>
	</tr>
	
	
	


   <script type="text/javascript">//<![CDATA[
   
    
	jQuery('#startTime1').datetimepicker({
			format:'d/m/Y H:i',
			lang:'ru'
		});
	   var startTime = Calendar.setup({
        inputField : "startTime1",
        trigger    : "startTime1_btn",
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
        inputField : "startTime2",
        trigger    : "startTime2_btn",
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
   <!--<td><strong><img src="images/maskrow.gif" />  Mảng :<font color="red">*</font></strong></td>
    <td>
		 <input name="ip" type="checkbox" id="ip" value =1>ip
		 <input name="cdbr" type="checkbox" id="cdbr" value =1>cdbr
		 <input name="dd" type="checkbox" id="dd" value =1>dd	
		 <input name="td" type="checkbox" id="td" value =1>td		
		 <input name="cd" type="checkbox" id="cd" value =1>cd	
	</td>
	</tr>-->
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo yêu cầu"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>