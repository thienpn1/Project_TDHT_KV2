<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("edit")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
   ' Lay thong tin tram
	id = Request.QueryString("id")
	sql = "Select crname, nodename, cr_status, transmissionType, cluster, vlan, ip, e1_info, note  from tbl_integrated3g  where id = "& id
    Set objRS = objConn.Execute(sql)
	If (Not objRS.EOF) then
	
		crname = pdb(Server.HTMLEncode(Request.Form("crname")))	
		nodename= pdb(Server.HTMLEncode(Request.Form("nodename")))			
		e1_info = pdb(Server.HTMLEncode(Request.Form("e1_info")))
		cr_status = pdb(Server.HTMLEncode(Request.Form("cr_status")))	
		transmissionType = pdb(Server.HTMLEncode(Request.Form("transmissionType")))	
		cluster = pdb(Server.HTMLEncode(Request.Form("cluster")))		
		vlan = pdb(Server.HTMLEncode(Request.Form("vlan")))	
		ip = pdb(Server.HTMLEncode(Request.Form("ip")))	
		note = pdb(Server.HTMLEncode(Request.Form("note")))		
		dd_time = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
		
		IF (crname<>"" and nodename <>"") then
			
			If (Session("depart")= "DVCD" and Session("usergroup")<>"ADMIN") then
			 	sql = " UPDATE tbl_integrated3g SET "&_						
						"vlan = '"&vlan&"' , "&_
						"ip = '"&ip&"'  "&_										
					" WHERE id = "& id		
			Else
				sql = " UPDATE tbl_integrated3g SET "&_
						"crname = '"&crname&"' , "&_
						"nodename = '"&nodename&"' , "&_
						"cr_status = '"&cr_status&"' , "&_
						"transmissionType = '"&transmissionType&"' , "&_
						"cluster = '"&cluster&"' , "&_
						"vlan = '"&vlan&"' , "&_
						"ip = '"&ip&"' , "&_
						"e1_info = '"&e1_info&"' , "&_	
						"dd_time = '"&dd_time&"' , "&_					
						"note = '"&note&"' "&_					
					" WHERE id = "& id			
			End if
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
		
 var nodeinfo= document.getElementById("nodeinfo")
		if (nodeinfo.value=="") 
		{	document.getElementById("for_startTime").innerHTML= "Chưa nhập thông tin trạm";
			nodeinfo.focus();
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
<legend class="mau_chu_legen">Thông tin sự cố</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl" >
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> CR <font color="red">*</font></strong></td>
     <td width="40%"><input  name="crname" id="crname" size="40" maxlength="250" value ="<%=objRS.Fields("crname")%>" onChange="onChaneText(this.value,'for_crname')" readonly/></td>
     <td width="30%"><label class="font_alert" id="for_crname">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Tình trạng CR <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="cr_status" id="cr_status" size="40" maxlength="50" value ="<%=objRS.Fields("cr_status")%>" readonly/></td>
     <td width="30%"><label class="font_alert" id="for_cr_status">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="nodename" id="nodename" size="40" maxlength="250" value ="<%=objRS.Fields("nodename")%>" readonly/></td>
     <td width="30%"><label class="font_alert" id="for_nodename">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại luồng truyền dẫn</strong></td>
     <td width="40%">
     <select name="transmissionType" id="transmissionType" <%=iff (Session("depart")= "DVCD","disabled","") %>>
       <option value="FE" <%=iff ("FE"=objRS.Fields("transmissionType"),"selected","")%>>FE</option>
       <option value="E1" <%=iff ("E1"=objRS.Fields("transmissionType"),"selected","")%>>E1</option>
       <option value="FE -&gt; E1" <%=iff ("FE -&gt; E1"=objRS.Fields("transmissionType"),"selected","")%>>FE -&gt; E1</option>
       <option value="E1 -&gt; FE" <%=iff ("E1 -&gt; FE"=objRS.Fields("transmissionType"),"selected","")%>>E1 -&gt; FE</option>
       <option value="SRT" <%=iff ("SRT"=objRS.Fields("transmissionType"),"selected","")%>>SRT</option>
         </select>
     </td>
     <td width="30%"><label class="font_alert" id="for_transmissionType">&nbsp;</label></td>
   </tr>
      <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Cluster</strong></td>
     <td width="40%">
     <select name="cluster" id="cluster" <%=iff (Session("depart")= "DVCD","disabled","") %>>
       <option value="1" <%=iff ("1"=objRS.Fields("cluster"),"selected","")%>>1</option>
       <option value="2" <%=iff ("2"=objRS.Fields("cluster"),"selected","")%>>2</option>
      </select>
     </td>
     <td width="30%"><label class="font_alert" id="for_cluster">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Vlan</strong></td>
     <td width="40%"><input name="vlan" id="vlan" value="<%=objRS.Fields("vlan")%>" size="40" maxlength="40" <%=iff (Session("depart")= "BSS","readonly","") %>/></td>
     <td width="30%"><label class="font_alert" id="for_vlan">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> IP</strong></td>
     <td width="40%"><input name="ip" id="ip" value="<%=objRS.Fields("ip")%>" size="40" maxlength="60" <%=iff (Session("depart")= "BSS","readonly","") %>/></td>
     <td width="30%"><label class="font_alert" id="for_ip">&nbsp;</label></td>
   </tr>
 
    <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> E1-P.TDHT<font color="red">*</font> </strong></td>
     <td width="40%"><input  name="e1_info" id="e1_info" size="40" maxlength="250" value ="<%=objRS.Fields("e1_info")%>" <%=iff (Session("depart")= "DVCD","readonly","") %>/></td>
     <td width="30%"><label class="font_alert" id="for_e1_info">&nbsp;</label></td>
   </tr>   
   <tr>
     <td ><strong><img src="images/maskrow.gif" /> Ghi chú</strong></td>
     <td colspan="2"><textarea name="note" cols="50" rows="2" id="note" class="textarea"  onchange="onChaneText(this.value,'for_note')" readonly="readonly"><%=objRS.Fields("note")%></textarea></td>
   </tr>
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Cập nhật"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>

<%End if ' End viec kiem tra co du lieu cong viec khong%> 