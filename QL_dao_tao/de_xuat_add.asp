<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin"))  Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
	dim phong
	noi_dung=(Request.Form("noi_dung"))
	startTime1 = Request.Form("startTime1")
	startTime2 = Request.Form("startTime2")
	nhan_su_tao=Session("username")
	phong=Session("phong")
	ke_hoach=Request.Form("ke_hoach")
	doi_tuong=Request.Form("doi_tuong")
	
	
	IF (Noi_dung<>"") then
		sql = "INSERT INTO `dao_tao` (`nguoi_tao`, `noi_dung`,  `ke_hoach`, `start_time`, `end_time`,`doi_tuong`,`tien_do`) VALUES "&_
					"('"&nhan_su_tao&"', "&_
					"'"&noi_dung&"', "&_
					"'"&ke_hoach&"', "&_					
					"'"&startTime1&"', "&_
					"'"&startTime2&"', "&_
					"'"&doi_tuong&"', "&_
					"'đề xuất')"
		'Response.Write(sql)
		Set objRS1 = objConn.Execute(sql)
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
	var doi_tuong= document.getElementById("doi_tuong")
		if (startTime1.value=="" || startTime2.value=="" || noi_dung.value=="" || doi_tuong.value=="") 
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
<legend class="mau_chu_legen">Thông tin đề xuất đào tạo</legend>
<div align="left">
<form id="frm_search" name="frm_search" method="post" onsubmit="return validateFormOnSubmit()" action="">
<div class="container">
<span class="font_inform" id="label_INCEffect"></span><span class="font_inform" id="label_INCEffect"></span><div>
   </div><table id="list_tbl" width="80%" border="0">

	<tbody>
	<tr>
		<td><strong><img src="images/maskrow.gif">Theo kế hoạch<font color="red"></font> </strong></td>
		<td><input name="ke_hoach" id="ke_hoach" size="40" maxlength="250"></td>
	</tr>
	<tr>
		<td><strong><img src="images/maskrow.gif"> Nội dung<font color="red">*</font></strong></td>
		<td>
			<span class="font_inform" id="label_INCEffect"></span>
			<textarea name="noi_dung" cols="50" rows="5" id="noi_dung" class="textarea"></textarea></td>
    </tr>

	<tr>
		<td><strong><img src="images/maskrow.gif"> Ngày bắt đầu (từ ngày) <font color="red">*</font> </strong></td>
		<td>
			<input readonly name="startTime1" id="startTime1" size="40" maxlength="250" value="" onchange="onChaneText(this.value,'startTime1')">
			<img id="startTime1_btn" src="images/calendar.png" width="20" height="20">
		</td>
		<td><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	</tr>
	<tr>
		<td><strong><img src="images/maskrow.gif"> Ngày kết thúc (Đến ngày) <font color="red">*</font> </strong></td>
		<td>
			<input readonly name="startTime2" id="startTime2" size="40" maxlength="250" value="" onchange="onChaneText(this.value,'startTime2')">
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
		<td><strong><img src="images/maskrow.gif">Đối tượng<font color="red">*</font> </strong></td>
		
		<td style="vertical-align:middle;">
						<%=listDonVi("doi_tuong","","multiple","size=10")%>
				
				 <font color="red"><i>    Giữ Ctrl để chọn nhiều đơn vị</i> </font>
				
				
		</td>
	</tr>
<tr>
    <td colspan="3" class="list_nemo_center" style="border-top-width: 0px;border-top-style: solid;margin-top: 10px;padding-top: 20px;padding-bottom: 20px;">
	    <input class="hieu_ung_nut2" name="Submit" value="Tạo yêu cầu" type="submit">
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