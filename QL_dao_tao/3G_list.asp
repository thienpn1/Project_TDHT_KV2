<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
	
	Dim cr_search
	status = Trim(Request.Form("status")&" ")
	cr_search = Trim(Request.Form("cr_search")&" ")

	IF (status = "") then
	  status = "0"
	End if
%>
<STYLE>
.comment {}
a.morelink {
	color:blue;
	text-decoration:none;
	outline: none;
}
.morecontent span {
	display: none;
}
</STYLE>
<script type="text/javascript" charset="utf-8">
//Show more/less text
$(document).ready(function() {
	var showChar = 20;
	var ellipsestext = "...";
	var moretext = "more";
	var lesstext = "less";
	$('.more').each(function() {
		var content = $(this).html();
		if(content.length > showChar) {
			var c = content.substr(0, showChar);
			var h = content.substr(showChar, content.length - showChar);
			var html = c + '<span class="moreelipses">'+ellipsestext+'</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">'+moretext+'</a></span>';
			$(this).html(html);		}
	});

	$(".morelink").click(function(){
		if($(this).hasClass("less")) {
			$(this).removeClass("less");
			$(this).html(moretext);
		} else {
			$(this).addClass("less");
			$(this).html(lesstext);
		}
		$(this).parent().prev().toggle();
		$(this).prev().toggle();
		return false;
	});
});

//Cho popup mennu		
	(function($){
	$.fn.styleddropdown = function(){
		return this.each(function(){
			var obj = $(this)
			obj.find('.field').click(function() { //onclick event, 'list' fadein
			obj.find('.list').fadeIn(200);
			
			$(document).keyup(function(event) { //keypress event, fadeout on 'escape'
				if(event.keyCode == 27) {
				obj.find('.list').fadeOut(200);
				}
			});			
			obj.find('.list').hover(function(){ },
				function(){
					$(this).fadeOut(400);
				});
			});			
			obj.find('.list li').click( function() { //onclick event, change field value with selected 'list' item and fadeout 'list'
			obj.find(//'.field'
			)
				.val($(this).html())
				.css({					
				});
			obj.find('.list').fadeOut(0);
			}	
			);
		});
	};
})(jQuery);
$(function(){
	$('.size').styleddropdown();
});

//Edit table
$(document).ready( function () {
	var id = -1;//simulation of id
	$('#tbKHThang').dataTable({ 
	   bJQueryUI: true,"sPaginationType": "full_numbers",
	   aoColumns: [ {} ,null, null, null, null, null,null, null,null,null,null,{"bSortable": false}]
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "3G_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		oDeleteRowButtonOptions: {	label: "Xóa trạm", 
						icons: {primary:'ui-icon-trash'}
		},
		oAddNewRowFormOptions: { 	
						title: 'Add a new browser',
						show: "blind",
						hide: "explode",
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
</SCRIPT>

<script type="text/javascript">
$(document).ready(function(){
   $('.show_hide').showHide({			 
		speed: 500,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open					 
	}); 
});
</script>
<script>
    //Dong su co
	function Close(id){
	    var xmlhttp;
		if (confirm("Bạn muốn đóng công việc này?")) {			
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
					location.reload(true);
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=close&id="+id,true); 
			 
			xmlhttp.send(null);
			
		  }				
	}
	//Mo lai su co
	function Open(id){
	    var xmlhttp;
		if (confirm("Bạn muốn mở lại công việc này?")) {			
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
					location.reload(true);
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=open&id="+id,true); 
			 
			xmlhttp.send(null);
			
		  }				
	}
    //Phe duyet su co
	function Approve(id){
	    var xmlhttp;
		if (confirm("Bạn muốn phê duyệt công việc này?")) {			
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
					location.reload(true);
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=approve&id="+id,true); 
			 
			xmlhttp.send(null);
			
		  }				
	}
	//Cap nhat tien do
	function Process(id){
	    var xmlhttp;
	    jPrompt('Nội dung:', '<%=getCurrentDate()%>'+":", 'Cập nhật tiến độ', function(r) {
		if( r ) {
		//alert('You entered ' + r);
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
					var processText = document.getElementById(id+"_process");					
					processText.innerHTML= xmlhttp.responseText+" - "+ r + "<p>" + processText.innerHTML;
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=process&id="+id+"&value="+r,true); 
			 
			xmlhttp.send(null);
		}
		});					
	}
	//Chi dao
	function Direct(id){
	    var xmlhttp;
		jPrompt('Nội dung:', '<%=getCurrentDate()%>'+":", 'Thông tin chỉ đạo', function(r) {
		if( r ) {		
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
					var directText = document.getElementById(id+"_direct");					
					directText.innerHTML= xmlhttp.responseText+" - "+ r + "<p>" + directText.innerHTML;
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=direct&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		});			  
	}
	
	
	//TD cap nhat toa do luong
	function TD_process(id){
	    var xmlhttp;
		var temp;
	    jPrompt('Tọa độ luồng:',"", 'Cập nhật tạo độ luồng qui hoạch', function(r) {
		if( r ) {
		//alert('You entered ' + r);
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
					var td_info = document.getElementById(id+"_td_process");						
					td_info.innerHTML= r;					
				}	
			   }
			temp = r.replace(/#/g, "||");
			temp = temp.replace(/(\r\n|\n|\r)/gm,"|.|");;
			xmlhttp.open("GET","3G_ext.asp?action=TD_process&id="+id+"&value="+temp,true); 
			 
			xmlhttp.send(null);
		}
		});					
	}
	//TDTT cap nhat toa do luong
	function TDTT_process(id){
	    var xmlhttp;
		var temp;
	    jPrompt('Tọa độ luồng:',"", 'Cập nhật tạo độ luồng đã khai', function(r) {
		if( r ) {
		//alert('You entered ' + r);
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
					var td_info = document.getElementById(id+"_tdtt_process");						
					td_info.innerHTML= r;					
				}	
			   }
			temp = r.replace(/#/g, "||");
			temp = temp.replace(/(\r\n|\n|\r)/gm,"|.|");;
			xmlhttp.open("GET","3G_ext.asp?action=TDTT_process&id="+id+"&value="+temp,true); 
			 
			xmlhttp.send(null);
		}
		});					
	}
	//DVCD cap nhat toa do luong
	function IP_process(id){
	    var xmlhttp;
	    jPrompt('Khai báo:',"", 'Cập nhật khai báo trên ME', function(r) {
		if( r ) {
		//alert('You entered ' + r);
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
					var td_info = document.getElementById(id+"_ip_process");						
					td_info.innerHTML= r;					
				}	
			   }
			xmlhttp.open("GET","3G_ext.asp?action=IP_process&id="+id+"&value="+r,true); 
			 
			xmlhttp.send(null);
		}
		});					
	}
	
	//Ghi chu
	function Note(id){
	    var xmlhttp;
		jPrompt('Nội dung:', "", 'Ghi chú', function(r) {
		if( r ) {		
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
					var noteText = document.getElementById(id+"_note");					
					noteText.innerHTML= xmlhttp.responseText+" : "+ r + "<p>" + noteText.innerHTML;
				}	
			   }
			xmlhttp.open("GET","3G_ext.asp?action=Note&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		});			  
	}
	
	 //Hoàn thành
	function finish(id){
	    var xmlhttp;
		if (confirm("Bạn muốn hoàn thành trạm này?")) {			
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
					location.reload(true);
				}	
			   }
			xmlhttp.open("GET","3G_ext.asp?action=finish&id="+id,true); 
			 
			xmlhttp.send(null);
			
		  }				
	}
	//Chua Hoàn thành
	function notfinish(id){
	    var xmlhttp;
		if (confirm("Bạn muốn thực hiện lại trạm này?")) {			
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
					location.reload(true);
				}	
			   }
			xmlhttp.open("GET","3G_ext.asp?action=nofinish&id="+id,true); 
			 
			xmlhttp.send(null);
			
		  }				
	}
	
	//Thay doi trang thai tram
	function Change(action,id){
	    var xmlhttp;
		var value;	
		value = document.getElementById(action +"_"+ id).checked ;	
	
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
				//alert(xmlhttp.responseText);
				//document.frm_search.search.click();
				//location.reload(true);
			}	
		   }
		xmlhttp.open("GET","3G_ext.asp?action="+action+"&id="+id+"&value="+value,true); 
		 
		xmlhttp.send(null);			
		 				
	}
	//Ham de tai ve
	function doExport(){
		document.getElementById("isExport").value="1";	
		frm_search.submit();
		document.getElementById("isExport").value="0";
	}
	//Popup window danh gia
	function doImport(){
		window.open('3G_upload.asp','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
</script>
  <%		
   sqlOriginal= "SELECT id, crname, nodename, cr_status, transmissionType, cluster, vlan, ip, DATE_FORMAT(dd_time,'%k:%i %d/%m/%Y') as dd_time, e1_info, DATE_FORMAT(e1_time,'%k:%i %d/%m/%Y') as e1_time,"&_
					"td_info, DATE_FORMAT(td_time,'%k:%i %d/%m/%Y') as td_time, tdtt_info, DATE_FORMAT(tdtt_time,'%k:%i %d/%m/%Y') as tdtt_time, dvcd_info, DATE_FORMAT(dvcd_time,'%k:%i %d/%m/%Y') as dvcd_time, qos, note, finish"&_
      		 " FROM tbl_integrated3g where (1 = 1) "	
	  
 
   If (cr_search<>"") then
   	sqlCondition = sqlCondition + " and (crname like '%"&cr_search &"%')"
   End if  
   
   Select Case status 
		Case "2"
			sqlCondition = sqlCondition + " and (finish = 2)"
		Case "1"
			sqlCondition = sqlCondition + " and (finish = 1)"
		Case "0"
			sqlCondition = sqlCondition + " and (isNull(finish) or finish = 0) "		
   End Select
   
   sql = sqlOriginal & sqlCondition
   sql = sql +  " ORDER BY id "& iff(Request.Form("isExport")<>"1","DESC", "ASC")
   sql = sql + " LIMIT 0, 1000"
   
   'Response.Write(sql)
   Set objRS1 = objConn.Execute(sql)
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")<>"1") then   
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm [<a href="#" class="show_hide" rel="#slidingDiv">View</a>]</legend>
<div id="slidingDiv">
<form id="frm_search" name="frm_search" method="post" action="">
<table width="100%" border="0"id="list_tbl" >
   <tr>
	 <td><img src="images/maskrow.gif" />  CR </td>
     <td><input  name="cr_search" id="cr_search" size="40" maxlength="250" value="<%=cr_search%>"/></td>
     <td><img src="images/maskrow.gif" />  Trạng thái </td>
     <td><select name="status" class="dropdown" id="status">
       <option value="-1" <%=iff(status="-1","selected","")%>>-----T&#7845;t c&#7843;-----</option>
       <option value="1" <%=iff(status="1","selected","")%>>Đã hoàn thành</option>
       <option value="0" <%=iff(status="0","selected","")%>>Chưa hoàn thành</option>
	   <option value="2" <%=iff(status="2","selected","")%>>Đã xóa</option>
     </select></td>
  </tr>
   <tr class="list_nemo_center">
     <td colspan="4">
	 <input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/>
	 <input type="hidden" name="isExport" id="isExport"  value="0"/>	</td>
    </tr>
</table>
</form> 
</div>
</fieldset>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbKHThang">
	<thead >
		<tr>
		    <th>&nbsp;</th>
			<th>CR name</th>
			<th>Node Name </th>
			<th>Node infor </th>
			<th>Vlan, IP </th>
			<th nowrap="nowrap"> E1-P.TDHT </th>
		    <th>Transmission plan </th>
			<th>Transmission Oper </th>
			<th>QoS </th>
		    <th>Metro </th>
			<th>Note</th>		   
		    <th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	<%
	
	stt = 1
	While Not objRS1.EOF
	   id = objRS1.Fields("id")
	%>
		<tr id="<%=id%>">
		    <td class="center"><% 
			If (objRS1.Fields("finish") <> "") then
				Response.write("<img src=""images/OK.png"" width=""25"" height=""25"" />")
			Else
			    Response.write("<img src=""images/10.png"" width=""25"" height=""25"" />")
			End if	
			%></td>			
			<td nowrap class="left"><strong class="comment more" ><%=objRS1.Fields("crname")%></strong>
									  <br/><span class="font_suco_under">Tạo lúc: <%=objRS1.Fields("dd_time")%></span>
			</td>
            <td class="center"><strong><%=objRS1.Fields("nodename")%></strong></td>			
		    <td class="left" nowrap="nowrap">Tình trạng CR: <%=(objRS1.Fields("cr_status"))%><br>
							 Loại luồng: <%=(objRS1.Fields("transmissionType"))%><br>
							 Cluster: <%=(objRS1.Fields("cluster"))%></br>
			</td>	
			<td class="left" nowrap="nowrap">Vlan: <%=(objRS1.Fields("vlan"))%><br>
							 IP: <%=(objRS1.Fields("ip"))%>
			</td>	
			<td class="left">
			  <%=(objRS1.Fields("e1_info"))%>
			  <span class="font_suco_under"><%'=(objRS1.Fields("e1_time"))%></span>	
			</td>
			<td class="left"><%If (Session("depart")="TD" or Session("usergroup")="ADMIN") then %> <img src="images/edit.png" width="20" height="20" onclick="TD_process(<%=id%>);"/><%End if%>
				<span id = "<%=id%>_td_process" > <span class="comment more"><%=replace(objRS1.Fields("td_info")&" ","|.|","<br>")%> </span><span>
				<br/><span class="font_suco_under" id = "<%=id%>_td_time">Cập nhật lúc: <%=objRS1.Fields("td_time")%></span>			
		    </td>	
			<td class="left"> <%If (Session("depart")="TD" or Session("usergroup")="ADMIN") then %> <img src="images/edit.png" width="20" height="20" onclick="TDTT_process(<%=id%>);"/><%End if%>
				<span id = "<%=id%>_tdtt_process" > <span class="comment more"><%=replace(objRS1.Fields("tdtt_info")&" ","|.|","<br>")%> </span><span>
				<br/><span class="font_suco_under" id = "<%=id%>_tdtt_time">Cập nhật lúc: <%=objRS1.Fields("tdtt_time")%></span>
			</td>
			<td>
			
			<% 
			If (Session("depart")="TD" or Session("usergroup")="ADMIN") then %>
			    <input type="checkbox" name="qos_<%=id%>" id="qos_<%=id%>" onchange="Change('qos',<%=id%>)"  <%=iff(objRS1.Fields("qos")="1","checked","")%>/>
			 <% Else  
				   If (objRS1.Fields("qos")="1") then
					  Response.write("<img src=""images/tick.png"" width=32 height=32 />")
				   End if
			End if
			%>
			
			</td>			
			<td align="left"><%If (Session("depart")="DVCD" or Session("usergroup")="ADMIN") then %><img src="images/edit.png" width="20" height="20" onclick="IP_process(<%=id%>);"/><%End if%>
				<span id = "<%=id%>_ip_process"> <%=objRS1.Fields("dvcd_info")%><span>
			    <br/><span class="font_suco_under">Cập nhật lúc: <%=objRS1.Fields("dvcd_time")%></span>
			</td>	
			<td align="left">
				<img src="images/Comment.png" width="20" height="20" onclick="Note(<%=id%>);"/><br/>
				<span id = "<%=id%>_note"><%=replace(objRS1.Fields("note")&" ",VbCrLf,"<br>")%></span>	
				</td>		
			<td class="center" nowrap="nowrap">
			<%If (Check_action_3G("edit",id) or  Check_action_3G("notfinish",id) or Check_action_3G("finish",id)) then%> 
			<div class="size">			
			<span type="text" name="test" class="field"><img src="images/Navigation-32.png" /></span>				
			 <ul class="list">					
				<% IF (Check_action_3G("finish",id)) then %><li><input class="btn_on_menu" type"button" value="Chỉnh sửa" onclick="parent.location='default.asp?page=3G_edit&id=<%=id%>'"></li><%End if%>	
				<% IF (Check_action_3G("notfinish",id)) then %><li><input class="btn_on_menu" type"button" value="Chưa hoàn thành" onClick="notfinish('<%=id%>')"></li><%End if%>	
				<% IF (Check_action_3G("finish",id)) then %><li><input class="btn_on_menu" type"button" value="Hoàn thành" onClick="finish('<%=id%>')"></li><%End if%>					
			  </ul>
			</div>	
			<%End if%>	
			</td>			
		</tr>
		<div class="menu_<%=id%>" style="display: none;">	   </div>
	<%	
		objRS1.MoveNext
		stt =  stt + 1
		Wend 
		objRS1.Close
		Set objRS1 = Nothing
		objConn.Close
		Set objConn = Nothing
	%>	
	</tbody>	
</table>
<div align ="center">
<form id="frm_export" name="frm_export" method="post" action="#">
<%
If (Session("add")="1" and (Session("depart")="BSS" or Session("usergroup")="ADMIN")) Then
%>	 
	<input type="button" class="hieu_ung_nut2" name="add" value="Tạo mới" onClick="location.href='default.asp?page=3G_add'" />
	<input type="button" class="hieu_ung_nut2" name="import" value="Import" onClick="doImport();" />
<%
End if
%>
   <input type="button" class="hieu_ung_nut2" name="export" value="Export to Excel" onClick="doExport();" />
</form>
</div>
<%
'Neu co export thì dung form nay
Else
	'Neu tai ve thi chuyen sang dinh dang excel
	Response.Buffer = True
	Response.Clear	
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_Du_lieu_tich_hop.xls"
	Response.Charset = "UTF-8"	
%>
<table border="1">
	<thead>
		<tr BGcolor=#92D050>			
			<th><font face="Arial">STT</font></th>
			<th><font face="Arial">CR Name </font></th>
			<th><font face="Arial">Node name </font></th>
			<th><font face="Arial">Node info </font></th>
			<th><font face="Arial">Vlan,IP</font></th>
			<th><font face="Arial">E1</font></th>
			<th><font face="Arial">Transmission</font></th>
		    <th><font face="Arial">Metro</font></th>
			<th><font face="Arial">Note</font></th>		    	
		</tr>
	</thead>
	<tbody>
	<%
	'Set objRS = objConn.Execute(sql)
	stt =  1
	While Not objRS1.EOF
	%>
		<tr>
			<td align="center"><font face="Arial"><%=stt%></font></td>	
			<td align="left"><font face="Arial"><strong><%=objRS1.Fields("crname")%></strong>
									  <br/><span class="font_suco_under">Tạo lúc: <%=objRS1.Fields("dd_time")%></font></td>
			<td align="left"><font face="Arial"><%=objRS1.Fields("nodename")%></font></td>
			<td align="left"><font face="Arial">Tình trạng CR: <%=(objRS1.Fields("cr_status"))%><br>
							 Loại luồng: <%=(objRS1.Fields("transmissionType"))%><br>
							 Cluster: <%=(objRS1.Fields("cluster"))%></font></td>
			<td align="left"><font face="Arial">Vlan: <%=(objRS1.Fields("vlan"))%><br>
							 IP: <%=(objRS1.Fields("ip"))%></font></td>
			<td align="center"><font face="Arial"><%=(objRS1.Fields("e1_info"))%></font></td>
			<td align="left"><font face="Arial"><%=replace(objRS1.Fields("td_info")&" ","|.|","<br>")%><span>
				<br/><span class="font_suco_under" id = "<%=id%>_td_time">Cập nhật lúc: <%=objRS1.Fields("td_time")%></span></font></td>					
			<td align="left"><font face="Arial"><%=objRS1.Fields("dvcd_info")%><span>
			    <br/><span class="font_suco_under">Cập nhật lúc: <%=objRS1.Fields("dvcd_time")%></span></font></td>
			<td align="left"><font face="Arial"><%=replace(objRS1.Fields("note")&" ",VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></font></td>				
		</tr>	
	<%	
		stt =  stt + 1
		objRS1.MoveNext
		Wend 
		objRS1.Close
		Set objRS1 = Nothing
		objConn.Close
		Set objConn = Nothing
	%>	
	</tbody>	
</table>
<%
'Kết thúc điều kiện export
End if
%>