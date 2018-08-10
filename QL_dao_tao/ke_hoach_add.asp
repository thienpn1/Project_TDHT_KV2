<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin"))  Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
	
	id = Request.QueryString("id")
	'If (id<>"null")  Then
		sql = "SELECT * FROM dao_tao WHERE id = '"& id &"'"
		Set objRS = objConn.Execute(sql)
		'Response.Write(sql)
	'End if
	
  
	
	dim so_luong,thoi_luong,hinh_thuc_danh_gia
	noi_dung=(Request.Form("noi_dung"))
	startTime1 = Request.Form("startTime1")
	startTime2 = Request.Form("startTime2")
	nhan_su_tao=Session("username")
	phong=Session("phong")
	ke_hoach=Request.Form("ke_hoach")
	doi_tuong=Request.Form("doi_tuong")
	so_luong=Request.Form("so_luong")
	giang_vien=Request.Form("giang_vien")
	thoi_luong=Request.Form("thoi_luong")
	dia_diem=Request.Form("dia_diem")
	hinh_thuc=Request.Form("hinh_thuc")
	hinh_thuc_danh_gia=Request.Form("hinh_thuc_danh_gia")
	
	IF (id<>"null") then
		IF (noi_dung<>"" ) then
			sql	 = "UPDATE `dao_tao` SET "&_
						"nguoi_tao = '"&nhan_su_tao&"' , "&_ 
						"noi_dung = '"&noi_dung&"' , "&_
						"ke_hoach = '"&ke_hoach&"' , "&_				
						"start_time = '"&startTime1&"' , "&_
						"end_time = '"&startTime2&"' , "&_
						"doi_tuong = '"&doi_tuong&"' , "&_
						"so_luong = '"&so_luong&"' , "&_
						"giang_vien = '"&giang_vien&"' , "&_
						"thoi_luong = '"&thoi_luong&"' , "&_
						"dia_diem = '"&dia_diem&"' , "&_
						"hinh_thuc = '"&hinh_thuc&"' , "&_
						"loai_danh_gia = '"&hinh_thuc_danh_gia&"' , "&_
						"tien_do = 'kế hoạch'"&_
						" WHERE id = '"& id &"'"
			'Response.Write(sql)
			Set objRS1 = objConn.Execute(sql)
			Response.Redirect("default.asp?page=de_xuat")
		End if
	else
		IF (id="null" and noi_dung<>"" ) then
			sql	= "INSERT INTO `dao_tao`(`nguoi_tao`, `ke_hoach`, `noi_dung`, `doi_tuong`, `so_luong`, `giang_vien`, `thoi_luong`, `start_time`, `end_time`, `dia_diem`, `hinh_thuc`, `loai_danh_gia`, `tien_do`) VALUES "&_
						"('"&nhan_su_tao&"', "&_
						"'"&ke_hoach&"', "&_
						"'"&noi_dung&"', "&_
						"'"&doi_tuong&"', "&_
						"'"&so_luong&"', "&_
						"'"&giang_vien&"', "&_
						"'"&thoi_luong&"', "&_
						"'"&startTime1&"', "&_
						"'"&startTime2&"', "&_
						"'"&dia_diem&"', "&_
						"'"&hinh_thuc&"', "&_
						"'"&hinh_thuc_danh_gia&"', "&_
						"'kế hoạch')"
			'Response.Write(sql)
			Set objRS1 = objConn.Execute(sql)
			Response.Redirect("default.asp?page=de_xuat")
		end if
	end if
	
								
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

<fieldset class="Khung1" style="border-top-width: 0px;border-top-style: solid;border-bottom-width: 0px;border-bottom-style: solid;border-left-width: 0px;border-left-style: solid;border-right-width: 0px;border-right-style: solid;padding-right: 10px;padding-left: 10px;padding-top: 5px;padding-bottom: 5px;">
  <div class="content" style="padding-top: 10px;padding-bottom: 10px;border-top-style: solid;border-top-width: 0px;border-bottom-style: solid;border-bottom-width: 0px;">
     
<style>
<!--.font_alert {color: #FF0000 ; font-style: italic;}	.font_inform {color: #000066 ;}-->
</style>
<script type="text/javascript" language="javascript">
function validateFormOnSubmit() {

	var startTime1= document.getElementById("startTime1").value
	var startTime1_temp=moment(startTime1, "DD-MM-YYYY");
	var startTime2= document.getElementById("startTime2").value
	var startTime2_temp=moment(startTime2, "DD-MM-YYYY");
	var noi_dung= document.getElementById("noi_dung")
	var giang_vien= document.getElementById("giang_vien")
		if (startTime1.value=="" || startTime2.value=="" || noi_dung.value=="" || giang_vien.value=="" ) 
		{	
			window.alert("cần nhập đầy đủ thông tin vào các trường có dấu (*)");
			return false;
		}
		if (moment(startTime2_temp).isBefore(startTime1_temp))
		{
			window.alert("LỖI:Đang nhập ngày kết thúc trước ngày bắt đầu!");
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
<legend class="mau_chu_legen">Thông tin kế hoạch đào tạo</legend>
<div align="left">
<form id="frm_search" name="frm_search" method="post" onsubmit="return validateFormOnSubmit()" action="">
<div class="container">
<span class="font_inform" id="label_INCEffect"></span><span class="font_inform" id="label_INCEffect"></span><div>
   </div><table id="list_tbl" width="100%" border="0">

	<tbody>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Kế hoạch<font color="red"></font> </strong></td>
		<% if id<>"null" then ke_hoach=objRS.Fields("ke_hoach") else ke_hoach="" end if %>
		<td><input name="ke_hoach" id="ke_hoach" size="40" maxlength="250" value="<%=ke_hoach%>"></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif"> Nội dung<font color="red">*</font></strong></td>
		<td>
			<% if id<>"null" then noi_dung=objRS.Fields("noi_dung") else noi_dung="" end if %>
			<span class="font_inform" id="label_INCEffect"></span>
			
			<textarea name="noi_dung" cols="50" rows="5" id="noi_dung" class="textarea" "><%=noi_dung%></textarea></td>
    </tr>

	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif"> Ngày bắt đầu (từ ngày) <font color="red">*</font> </strong></td>
		<td>
			<% if id<>"null" then startTime1=objRS.Fields("start_time") else startTime1="" end if %>
			<input readonly name="startTime1" id="startTime1" size="40" maxlength="250" value="<%=startTime1%>" onchange="onChaneText(this.value,'startTime1')">
			<img id="startTime1_btn" src="images/calendar.png" width="20" height="20">
		</td>
		<td><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif"> Ngày kết thúc (Đến ngày) <font color="red">*</font> </strong></td>
		<td>
			<% if id<>"null" then startTime2=objRS.Fields("end_time") else startTime2="" end if %>
			<input readonly name="startTime2" id="startTime2" size="40" maxlength="250" value="<%=startTime2%>"  onchange="onChaneText(this.value,'startTime2')">
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
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Đối tượng<font color="red">*</font> </strong></td>
		<td>
			<% if id<>"null" then doi_tuong=objRS.Fields("doi_tuong") else doi_tuong="" end if %>
			<%=listDonVi("doi_tuong","","multiple","size=10")%>
							 <font color="red"><i>    Giữ Ctrl để chọn nhiều đơn vị</i> </font>

		</td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Số lượng dự kiến tham gia<font color="red"></font> </strong></td>
		<td><input name="so_luong" id="so_luong" size="40" maxlength="250" value=""></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Giảng viên<font color="red">*</font> </strong></td>
		<td><input name="giang_vien" id="giang_vien" size="40" maxlength="250" value="" list="user"></td>
		<td><%=listuser()%></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Thời lượng (số giờ)<font color="red"></font> </strong></td>
		<td><input name="thoi_luong" id="thoi_luong" size="40" maxlength="250" value=""></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Địa điểm<font color="red"></font> </strong></td>
		<td><input name="dia_diem" id="dia_diem" size="40" maxlength="250" value=""></td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Hình thức đào tạo<font color="red"></font> </strong></td>
		<td>
			<select style="width: 250px;" name="hinh_thuc"  id="hinh_thuc">
				<option selected value="">----Lựa Chọn----</option>
				<option value="tập trung">Tập trung</option>
				<option value="đọc tài liệu">Đọc tài liệu</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="width: 250px;"><strong><img src="images/maskrow.gif">Hình thức đánh giá<font color="red"></font> </strong></td>
		<td>
			<select style="width: 250px;" name="hinh_thuc_danh_gia"  id="hinh_thuc_danh_gia">
				<option selected value="">----Lựa Chọn----</option>
				<option value="không đánh giá">Không đánh giá</option>
				<option value="có đánh giá">Có đánh giá</option>
			</select>
		</td>
	</tr>
	
	
	
<tr>
    <td colspan="3" class="list_nemo_center" style="border-top-width: 0px;border-top-style: solid;margin-top: 10px;padding-top: 20px;padding-bottom: 20px;">
	    <input class="hieu_ung_nut2" name="Submit" value="Tạo kế hoạch đào tạo" type="submit">
       <input name="Reset" class="hieu_ung_nut2" id="Reset" value="Reset" type="reset">
	   <input name="back" class="hieu_ung_nut2" id="back" value="Quay lại" onclick="history.go(-1)" type="button">	 </td>
    </tr>

</tbody></table>
</div>
</form> 
</div>
</fieldset>
  </div>
  </fieldset>