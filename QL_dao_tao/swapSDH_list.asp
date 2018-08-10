<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if			
	cr_search = Trim(Request.Form("cr_search")&" ")
	status = Trim(Request.Form("status")&" ")
	If (status = "") then
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
	   aoColumns: [ {} ,null, null, null, null, null,null, null,null,null,null,null,null,null,null,null,null]
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "swapSDH_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		oDeleteRowButtonOptions: {	label: "Xóa luồng", 
						icons: {primary:'ui-icon-trash'}
		},
		oAddNewRowFormOptions: { 	
						title: 'Add a new browser',
						show: "blind",
						hide: "explode",
						modal: true
		}	,
	sAddDeleteToolbarSelector: ".dataTables_length"});} );

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-17838786-2']);
	_gaq.push(['_trackPageview']);

	(function () {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = 'js/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

$(document).ready(function(){
   $('.show_hide').showHide({			 
		speed: 500,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open					 
	}); 
});
   	//Ghi chu
	
	function Note(action,filed,id){
	    alert('A');
		var xmlhttp;
		
		var r = prompt("Nhập nội dung", "");

}


	function Note(action,field,id){	   
		var xmlhttp;		
	
		jPrompt('Nội dung:', "", 'Cập nhật thông tin', function(r) {
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
					var noteText = document.getElementById(id+"_"+filed);								
					noteText.innerHTML= r;
					alert('A');
				}	
			   }
			xmlhttp.open("GET","swapSDH_ext.asp?action=Note&field="+field+"&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		});			  
	}	
	
	//Thay doi trang thai tram
	function Change(action,id){	  
	    var xmlhttp;				
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
		xmlhttp.open("GET","swapSDH_ext.asp?action="+action+"&id="+id,true); 
		 
		xmlhttp.send(null);			
		 				
	}
	
	//Hoan thanh
	function Finish(id){
	    var xmlhttp;
			
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
				location.reload(true);
			}	
		   }
		xmlhttp.open("GET","swapSDH_ext.asp?action=finish&id="+id,true); 
		 
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
		window.open('swapSDH_upload.asp','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
</script>
  <%		   
sqlOriginal = " SELECT 	id, "&_
				  " province,  "&_
				  " link_label,  "&_
				  " link_type,  "&_
				   " cabin,  "&_
				  " account_ftth,  "&_				  
				  " viba,  "&_
				  " point_old,  "&_
				  " point_new,  "&_
				  " port_detect,  "&_
				  " CR,  "&_
				  " date_action,  "&_
				  " nodename,  "&_
				  " BSC,  "&_
				  " Sub_old,  "&_
				  " Slot_old,  "&_
				  " Sub_new,   "&_
				  " Slot_new,  "&_
				  " Port_new,  "&_
				  " user_province,  "&_
				  " user_zone,  "&_		
				  " dvcd,  "&_				  
				  " dd,  "&_		
				  " note "&_
		 
			  " FROM  "&_
			  " timesheet.tbl_swapsdh  "&_			
				  " tbl_ftth where (1 = 1)"    
 
   If (cr_search<>"") then
   	sqlCondition = sqlCondition + " and (Province like '%"&cr_search &"%')"
   End if  
   
   Select Case status 
	Case "2"
		sqlCondition = sqlCondition + " and (status = 2)"
	Case "1"
		sqlCondition = sqlCondition + " and (status = 1)"
	Case "0"
		sqlCondition = sqlCondition + " and (isNull(status) or status = 0) "		
   End Select
   
   sql = sqlOriginal & sqlCondition 
   sql = sql + " LIMIT 0, 5000"
   
   'Response.Write(sql)
   Set objRS1 = objConn.Execute(sql)
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")<>"1") then   
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm</legend>
<div>
<form id="frm_search" name="frm_search" method="post" action="">
<table width="100%" border="0"id="list_tbl" >
   <tr>
	 <td><img src="images/maskrow.gif" /> Mã tỉnh </td>
     <td><input  name="cr_search" id="cr_search" size="40" maxlength="250" value="<%=cr_search%>"/></td>
     <td><img src="images/maskrow.gif" />  Trạng thái </td>
     <td><select name="status" class="dropdown" id="status">
       <option value="-1" <%=iff(status="-1","selected","")%>>-----T&#7845;t c&#7843;-----</option>
       <option value="1" <%=iff(status="1","selected","")%>>Đã thực hiện</option>
       <option value="0" <%=iff(status="0","selected","")%>>Chưa thực hiện</option>
       <option value="2" <%=iff(status="2","selected","")%>>Đã hoàn thành</option>
     </select></td>
  </tr>
   <tr class="list_nemo_center">
     <td colspan="4"><input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/>
       <input type="hidden" name="isExport" id="isExport"  value="0"/>	</td>
    </tr>
</table>
</form> 
</div>
</fieldset>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbKHThang">
	<thead >
		<tr>
		    <th>STT</th>
			<th>Tỉnh</th>
			<th>Nhãn luồng </th>			
			<th>Vị trí Tủ A/B</th>			
			<th> Account /  Viba</th>		 
			<th>Điểm cũ / mới</th>			 
			<th>Định danh port </th>
			<th>CR</th>				
			<th>Đăng ký chuyển </th>	
			<th>Mã trạm</th>	
			<th>Tọa độ BSC <br />(Sub/slot/port)</th>	
			<th>NV tỉnh </th>
			<th>NV KV</th>
			<th>DVCD </th>
			<th>DD</th>			
			<th>Ghi chú </th>				   
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
		    <td class="center"><% =stt%></td>			
			<td nowrap class="center"><%=Ucase(objRS1.Fields("province"))%></td>
            <td class="left"><strong> <%=objRS1.Fields("link_label")%></strong><br />
							 <span class="font_suco_under"><%=(objRS1.Fields("link_type"))%></span>	</td>
			<td class="left"> <%=objRS1.Fields("cabin")%></td>					
		    <td class="left"><img src="images/Comment.png" width="20" height="20" onclick="Note('Note','account_ftth',<%=id%>);"/><br/>
							<span id = "<%=id%>_account_ftth"><%=(objRS1.Fields("account_ftth"))%><%=(objRS1.Fields("viba"))%></span></td>			
			<td class="left" nowrap="nowrap"> <strong>Cũ: </strong><%=Ucase(objRS1.Fields("point_old"))%> </br>
							  <strong>Mới: </strong><%=Ucase(objRS1.Fields("point_new"))%>
			</td>			
			<td class="center"> <img src="images/Comment.png" width="20" height="20" onclick="Note('Note','port_detect',<%=id%>);"/><br/>
							<span id = "<%=id%>_port_detect"><%=Ucase(objRS1.Fields("port_detect"))%></span></td>
			<td class="center"><%=Ucase(objRS1.Fields("CR"))%></td>	
			<td class="center"><%=Ucase(objRS1.Fields("date_action"))%></td>
			<td class="left"> <%=objRS1.Fields("nodename")%></td>	
			<td class="left" nowrap="nowrap">
				<strong>Cũ :</strong> <%=objRS1.Fields("BSC")&" "&objRS1.Fields("Sub_old")&"/"&objRS1.Fields("Slot_old")%> <br />
				<strong>Mới:</strong> <%
				Response.Write(objRS1.Fields("BSC")&" "&objRS1.Fields("Sub_new")&"/"&objRS1.Fields("Slot_new")&"/")
				If (objRS1.Fields("Port_new")="") then %>
				  <a onclick="Note('Note','Port_new',<%=id%>);">...</a>
				<%
				Else %>
				  <a onclick="Note('Note','Port_new',<%=id%>);"><%=objRS1.Fields("Port_new")%></a>				  
				<%
				End if
				%>
			</td>
			<td class="center"><%=objRS1.Fields("user_province")%></td>								
			<td class="center"><%=objRS1.Fields("dvcd")%></td>	
			<td class="center">			 
			<% If (objRS1.Fields("dvcd")<>"") then
				Response.write("<img src=""images/tick.png"" />")
			   Elseif (Session("usergroup")<>"CNVT") then %>
			    <input type="checkbox" name="dvcd_do_<%=id%>" id="dvcd_do_<%=id%>" onchange="Change('dvcd',<%=id%>)" />
			<% End if%>									
			</td>								
			<td class="center">
			<% If (objRS1.Fields("dd")<>"") then
				Response.write("<img src=""images/tick.png"" />")
			   Elseif (Session("usergroup")<>"CNVT") then %>
			    <input type="checkbox" name="dd_do_<%=id%>" id="dd_do_<%=id%>" onchange="Change('dd',<%=id%>)" />
			<% End if%>				
			</td>	
			<td class="center"><img src="images/Comment.png" width="20" height="20" onclick="Note('Note','note',<%=id%>);"/><br/>
			<span id = '<%=id%>_note'> <%=objRS1.Fields("note")%></span></td>								
			<td class="center" nowrap="nowrap">
			<%'If (Check_action_Edit("edit",id)) then%> 
			<div class="size">			
			<span type="text" name="test" class="field"><img src="images/Navigation-32.png" /></span>				
			 <ul class="list">					
				   <li><input class="btn_on_menu" type"button" value="Hoàn thành" onclick="Finish(<%=id%>)" ></li>
			  </ul>
			</div>	
			<%'End if%>	
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
   <input type="button" class="hieu_ung_nut2" name="add" value="Tạo mới" onClick="location.href='default.asp?page=3G_add'" />
   <input type="button" class="hieu_ung_nut2" name="import" value="Import" onClick="doImport();" />
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
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_Du_lieu_khai_bao_FTTx.xls"
	Response.Charset = "UTF-8"	
%>
<table border="1">
	<thead>
		<tr BGcolor=#92D050>			
			<th><font face="Arial">STT</font></th>
			<th><font face="Arial">Tỉnh</font></th>
			<th><font face="Arial">Nhãn luồng</font></th>
			<th><font face="Arial">Loại luồng</font></th>
			<th><font face="Arial">Vị trí Tủ A/B</font></th>
			<th><font face="Arial">Accoun</font>t</th>
			<th><font face="Arial">Tuyến Viba</font></th>
			<th><font face="Arial">Điểm cũ</font></th>
			<th><font face="Arial">Điểm mới</font></th>
		    <th><font face="Arial">Định danh port</font></th>
			<th><font face="Arial">CR</font></th>
			<th><font face="Arial">Đăng ký chuyển</font></th>		    	
		    <th><font face="Arial">Mã trạm</font></th>
		    <th><font face="Arial">BSC </font></th>
		    <th><font face="Arial">Sub_old </font></th>
		    <th><font face="Arial">Slot_old </font></th>
		    <th><font face="Arial">Sub_new</font></th>
		    <th><font face="Arial">Slot_new </font></th>
		    <th><font face="Arial">Port_new </font></th>
			<th><font face="Arial">NV tỉnh</font></th>
		    <th><font face="Arial">NV KV</font></th>
			<th><font face="Arial">Ghi chú</font></th>
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
			<td align="left">  <font face="Arial"><%=objRS1.Fields("province")%></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("link_label")%></font></td>									
			<td align="left">  <font face="Arial"><%=objRS1.Fields("link_type")%></font></td>
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("cabin"))%></font></td>
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("account_ftth"))%></font></td>
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("viba"))%></font></td>
			<td align="center"><font face="Arial"><%=(objRS1.Fields("point_old"))%></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("point_new")%></font></td>					
			<td align="left">  <font face="Arial"><%=objRS1.Fields("port_detect")%><span></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("CR")%><span></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("date_action")%></font></td>				
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("nodename")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("BSC")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("Sub_old")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("Slot_old")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("Sub_new")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("Slot_new")%></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("Port_new")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("user_province")%></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("user_zone")%></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("note")%></font></td>
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