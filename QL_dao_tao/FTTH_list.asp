<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
	
	Dim result
	result = Trim(Request.Form("result")&" ")
	cr_search = Trim(Request.Form("cr_search")&" ")
	
	
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
	   aoColumns: [ {} ,null, null, null, null, null,null, null,null,null,null,null,{"bSortable": false}]
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "ftth_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		oDeleteRowButtonOptions: {	label: "Xóa ticket", 
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
			xmlhttp.open("GET","FTTH_ext.asp?action=Note&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		});			  
	}	
	
	//Thay doi trang thai tram
	function Change(action,id){
	    var xmlhttp;				
		//alert(action);
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
				alert("Trạng thái đã được cập nhật");
				//document.frm_search.search.click();
				//location.reload(true);
			}	
		   }
		xmlhttp.open("GET","FTTH_ext.asp?action="+action+"&id="+id,true); 	
		 
		xmlhttp.send(null);			
		 				
	}
	
	//Hoan thanh
	function direct(id){
	    var xmlhttp;
		jPrompt('Nội dung:', "", 'Đánh giá', function(r) {
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
					var resultText = document.getElementById(id+"_direct");													
					resultText.innerHTML= xmlhttp.responseText+" : "+ r + "<p>" + resultText.innerHTML;					
				}	
			   }
			xmlhttp.open("GET","FTTH_ext.asp?action=direct&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		});			  
	}	
	
	//Ham de tai ve
	function doExport(){
		document.getElementById("isExport").value="1";	
		frm_search.submit();
		document.getElementById("isExport").value="0";
	}
	//Popup window danh gia
	function doImport(){
		window.open('FTTH_upload.asp','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
</script>
  <%		   
sqlOriginal =  " SELECT  "&_
					" id "&_
					" , cr "&_
					" , crname "&_			
					" , DATE_FORMAT(starttime,'%m/%d/%Y %k:%i:%s') AS starttime "&_ 
					" , DATE_FORMAT(inserttime,'%m/%d/%Y %k:%i:%s') AS inserttime "&_ 					
					" , useraction	 "&_
					" , userprepare "&_
					" , checker "&_
					" , userexplain "&_					
					" , preresult "&_
					" , note "&_
					" , doexplain "&_
					" , direct "&_		
					" , isfault "&_										
					" , result "&_	 
					" FROM "&_
					" tbl_checklog where (1 = 1)"

   If (cr_search<>"") then
   '	sqlCondition = sqlCondition + " and (Province like '%"&cr_search &"%')"
   End if  
   
   If (result = "") then
	   result = "0"		 
   End if
   
   If (result<>"" and result<>"-1") then
     sqlCondition  = sqlCondition & "and result= "&result
   End if
   
   sql = sqlOriginal & sqlCondition
   'sql = sql + " ORDER BY CreateTime1 DESC"
   sql = sql + " LIMIT 0, 5000"
   
  ' Response.Write(sql)
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
	 <td><img src="images/maskrow.gif" /> Mã CR </td>
     <td><input  name="cr_search" id="cr_search" size="40" maxlength="250" value="<%=cr_search%>"/></td>
     <td><img src="images/maskrow.gif" />  Trạng thái </td>
     <td><select name="result" class="dropdown" id="result">
       <option value="-1" <%=iff(result="-1","selected","")%>>-----T&#7845;t c&#7843;-----</option>
       <option value="0" <%=iff(result="0","selected","")%>>NOK</option>
       <option value="1" <%=iff(result="1","selected","")%>>OK</option>    
     </select></td>
  </tr>
 <tr class="list_nemo_center"> 
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
		    <th>&nbsp;</th>
			<th>STT</th>
			<th>CR </th>
			<th>Thời gian thực hiện </th>
			<th>NS thực thi </th>
			<th>NS thẩm định </th>
			<th nowrap="nowrap"> NS giải trình </th>		    
			<th>Ghi chú</th>
			<th>Giải trình</th>		   
			<th>LĐP/QLTĐ </th>	 
			<th>Kết quả </th>  
			<th>Lỗi </th>  
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
			If (objRS1.Fields("preresult") = "OK") then
				Response.write("<img src=""images/OK.png"" width=""23"" height=""23"" />")
			Else
			    Response.write("<img src=""images/10.png"" width=""24"" height=""24"" />")
			End if	
			%></td>			
			<td nowrap class="left"><%=stt%></td>
            <td class="left">
			   <%=objRS1.Fields("cr")%>
			   <br /><span class="font_suco_under"><%=objRS1.Fields("crname")%>
			   <br />Thời gian tạo: <%=objRS1.Fields("inserttime")%>
			   <br />Nhân sự checklog: <%=objRS1.Fields("checker")%>
			   </span>
			   
			</td>
			<td class="left"><%=(objRS1.Fields("starttime"))%></td>							
		    <td class="left"><%=(objRS1.Fields("useraction"))%></td>	
			<td class="center"><%=(objRS1.Fields("userprepare"))%></td>	
			<td class="center"><%=(objRS1.Fields("userexplain"))%></td>
			<td class="left"> <%=objRS1.Fields("note")%></td>	
			<td class="left"> 		
				<img src="images/Comment.png" width="20" height="20" onclick="Note(<%=id%>);"/><br/>
				<span id = "<%=id%>_note"><%=replace(objRS1.Fields("doexplain")&" ",VbCrLf,"<br>")%></span>		
			</td>
			<td class="center">	<span id = "<%=id%>_direct"><%=replace(objRS1.Fields("direct")&" ",VbCrLf,"<br>")%></span> </td>
			<td align="left">		
			<%
				   If (objRS1.Fields("result")="1") then
					  Response.write("<img src=""images/tick.png"" width=32 height=32 />")
				   End if			
			%></td>	
			<td align="left">	
			<%
				   If (objRS1.Fields("isfault")="1") then
					  Response.write("<img src=""images/Flag.png"" width=32 height=32 />")
				   End if			
			%>
			</td>	
			<td class="center" nowrap="nowrap">
			<%'If (Check_action_Edit("edit",id)) then%> 
			<div class="size">			
			<span type="text" name="test" class="field"><img src="images/Navigation-32.png" /></span>				
			 <ul class="list">		
			    <% IF (Session("direct")="1" or Session("depart")="QLTD") then %>				
					 <li><input class="btn_on_menu" type"button" value="Chỉ đạo" onclick="direct(<%=id%>)" ></li>	
				<%End if%>	
				<% IF (Session("depart")="QLTD") then %>					
					<li><input class="btn_on_menu" type"button" value="Đánh lỗi" onclick="Change('fault',<%=id%>)" ></li>			   
				   <li><input class="btn_on_menu" type"button" value="Hoàn thành" onclick="Change('ok',<%=id%>)" ></li>
				<%End if%>									
			  </ul>
			</div>	
			<%'End if%>	
			</td>			
		</tr>
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
			<th>CR<font face="Arial"> </font></th>
			<th>Nội dung </th>
			<th><font face="Arial">Thời gian bắt đầu </font></th>
			<th>NS thực thi</th>
			<th>NS thẩm định</th>
			<th>NS checklog </th>
			<th>Kết quả</th>
			<th>Ghi chú</th>
		    <th><font face="Arial">Giải trình </font></th>
			<th>LĐP/QLTĐ</th>
		    <th>Đánh lỗi </th>
		    <th>NS giải trình </th>
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
			<td align="left">  <font face="Arial"><%=objRS1.Fields("cr")%></font></td>									
			<td align="left">	<font face="Arial"><%=objRS1.Fields("crname")%></font></td>	
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("starttime"))%></font></td>
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("useraction"))%></font></td>
			<td align="left">  <font face="Arial"><%=(objRS1.Fields("userprepare"))%></font></td>
			<td align="left">  <font face="Arial"> <%=objRS1.Fields("checker")%></font></td>
			<td align="center"><font face="Arial"><%=(objRS1.Fields("result")="1")%></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("note")%></font></td>					
			<td align="left">  <font face="Arial"><%=objRS1.Fields("doexplain")%><span></font></td>
			<td align="left">  <font face="Arial"><%=objRS1.Fields("direct")%><span></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("isfault")%><span></font></td>
		    <td align="left">  <font face="Arial"><%=objRS1.Fields("userexplain")%><span></font></td>
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