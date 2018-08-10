<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("add")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
    Dim  crname, nodename, cr_status, transmissionType, cluster, vlan, ip, dd_time, e1_info
	crname = pdb(Server.HTMLEncode(Request.Form("crname")))	
	nodename= pdb(Server.HTMLEncode(Request.Form("nodename")))	
	cr_status = pdb(Server.HTMLEncode(Request.Form("cr_status")))	
	transmissionType = pdb(Server.HTMLEncode(Request.Form("transmissionType")))	
	cluster = pdb(Server.HTMLEncode(Request.Form("cluster")))		
	e1_info = pdb(Server.HTMLEncode(Request.Form("e1_info")))	
	dd_time = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
	note = pdb(Server.HTMLEncode(Request.Form("note")))		
		
	IF (crname<>"" and nodename <>"" and cr_status<>"") then
		sql = "INSERT INTO tbl_integrated3g "&_
				"(crname, nodename, cr_status, transmissionType, cluster, e1_info, dd_time, note)"&_
			   " VALUES "&_
					"('"&crname&"', "&_
					"'"&nodename&"', "&_
					"'"&cr_status&"', "&_
					"'"&transmissionType&"', "&_
					"'"&cluster&"', "&_	
					"'"&e1_info&"', "&_	
					"'"&dd_time&"', "&_				
					"'"&note&"')"
		'Response.Write(sql)
		Set objRS = objConn.Execute(sql)
		Response.Redirect("default.asp?page=3g_list")
	End if

%>
<style>
<!--
.font_alert {color: #FF0000 ; font-style: italic;}
.font_inform {color: #000066 ;}
-->
</style>
<script type="text/javascript" language="javascript">
function isExistNode()
{
   var nodeName = document.getElementById("nodename");  
   var nodeValue =  nodeName.value;
   var xmlhttp;		
   var returnValue= "A";   
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
			returnValue = xmlhttp.responseText ;	
			document.getElementById("returnValue").value= returnValue ;		
			//alert(returnValue);
		}	
	   }
	xmlhttp.open("GET","3G_ext.asp?action=checkexist&id="+ nodeValue,true); 
	 
	xmlhttp.send(null);	
		
	return returnValue;
}

function validateFormOnSubmit() {

  var crname= document.getElementById("crname")
		if (crname.value=="") 
		{	document.getElementById("for_crname").innerHTML= "Chưa nhập nội dung CR";
			crname.focus();
			return false;
		}

  var nodename= document.getElementById("nodename")
		if (nodename.value=="") 
		{	document.getElementById("for_nodename").innerHTML= "Chưa nhập mã trạm";
			nodename.focus();
			return false;
		} 
  var input = document.getElementById("nodename");
  var returnValue = document.getElementById("returnValue").value;
  if(input.value != "")
	   {
		if (returnValue == "YES")
		{
		  document.getElementById("for_nodename").innerHTML= "Mã trạm đã tồn tại";
		  input.focus();
		  return false;
		}
		 else
		  document.getElementById("for_nodename").innerHTML= "";
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
  //Kiem tra node da ton tai chua
  function checkNode()
  {
  isExistNode();
  var input = document.getElementById("nodename");
  var returnValue = document.getElementById("returnValue").value;
  if(input.value != "")
	   {
	    //alert(returnValue);		
		if (returnValue != "YES")
		{
		  document.getElementById("for_nodename").innerHTML= "Mã trạm đã tồn tại";
		  input.focus();
		}
		 else
		  document.getElementById("for_nodename").innerHTML= "";
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
<legend class="mau_chu_legen">Thông tin sự cố</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl" >
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> CR <font color="red">*</font></strong></td>
     <td width="40%"><input  name="crname" id="crname" size="40" maxlength="70" onChange="onChaneText(this.value,'for_crname')"/></td>
     <td width="30%"><label class="font_alert" id="for_crname">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Tình trạng CR <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="cr_status" id="cr_status" size="40" maxlength="50"/></td>
     <td width="30%"><label class="font_alert" id="for_cr_status">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="nodename" id="nodename" size="40" maxlength="250" value ="" onchange="checkNode()"/></td>
     <td width="30%"><label class="font_alert" id="for_nodename">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại luồng truyền dẫn</strong></td>
     <td width="40%">
     <select name="transmissionType" id="transmissionType">
       <option value="FE">FE</option>
       <option value="E1">E1</option>
       <option value="FE -&gt; E1">FE -&gt; E1</option>
       <option value="E1 -&gt; FE">E1 -&gt; FE</option>
       <option value="SRT">SRT</option>
         </select>
     </td>
     <td width="30%"><label class="font_alert" id="for_transmissionType">&nbsp;</label></td>
   </tr>
      <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Cluster</strong></td>
     <td width="40%">
     <select name="cluster" id="cluster">
       <option value="1">1</option>
       <option value="2">2</option>
         </select>
     </td>
     <td width="30%"><label class="font_alert" id="for_transmissionType">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Vlan</strong></td>
     <td width="40%"><input class="font_suco_under" name="vlan" id="vlan" size="40" maxlength="25" value ="Ban DVCD cập nhật" readonly="true"/></td>
     <td width="30%"><label class="font_alert" id="for_vlan">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> IP</strong></td>
     <td width="40%"><input class="font_suco_under" name="ip" id="ip" size="40" maxlength="60" value ="Ban DVCD cập nhật" readonly="true"/></td>
     <td width="30%"><label class="font_alert" id="for_ip">&nbsp;</label></td>
   </tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> E1-P.TDHT<font color="red">*</font> </strong></td>
     <td width="40%"><input  name="e1_info" id="e1_info" size="40" maxlength="250" value =""/></td>
     <td width="30%"><label class="font_alert" id="for_e1_info">&nbsp;</label></td>
   </tr>
	 
   </tr>  
   <tr>
     <td ><strong><img src="images/maskrow.gif" /> Ghi chú</strong></td>
     <td colspan="2"><textarea name="note" cols="50" rows="2" id="note" class="textarea"  onchange="onChaneText(this.value,'for_note')"></textarea></td>
   </tr>
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo trạm mới"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	
	   <input name="returnValue" id="returnValue"  type="hidden" value="" />
	    </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>