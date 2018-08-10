<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
    
	'Lay gia tri search
	Dim id_log,usr_action, log_action,thoi_gian, thoi_gian_tu, thoi_gian_den
	id_log= Trim(Request.Form("id_log"))
	usr_action= Trim(Request.Form("usr_action"))
	action = Trim(Request.Form("action"))
	thoi_gian =Trim(Request.Form("thoi_gian"))		
	
	
	Dim s_rnc, s_bw, s_transtype, s_bwtype, s_rasoat
	
	s_rnc= Trim(Request.Form("rnc"))
	s_transtype = Trim(Request.Form("transtype"))
	s_bw =Trim(Request.Form("bw"))		
	s_bwtype = Trim(Request.Form("bwtype"))
	s_rasoat = Trim(Request.Form("rasoat"))
	
	If (Request.QueryString("delete")= "yes") then
	    'Xoa dữ liệu trước khi import
		objConn.Execute("DELETE FROM ha_tang.log_action")
		objConn.Execute("ALTER TABLE ha_tang.log_action AUTO_INCREMENT = 1")
		response.Redirect("default.asp?page=3GBW_list")
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
.style2 {color: #FF0000}
</STYLE>
<script type="text/javascript" charset="utf-8">
//Show more/less text
$(document).ready(function() {
	var showChar = 100;
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
	   aoColumns: [ {} ,null, null, null, null]
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "3GBW_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		oDeleteRowButtonOptions: {	label: "Xóa", 
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
		speed: 200,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open					 
	}); 
});

	//Ghi chu
	
	function Note(action,field,id){	   
		var xmlhttp;		
	
		jPrompt('Nội dung:', "", 'Cập nhật thông tin', function(r) {
		if( r ) {
			// ((field == "week1" ||field == "week2" ||field == "week3" ||field == "week4" ) && !isPositiveInteger(r))
			// {		
			//alert (r);			
			//} //else 
			{
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
					//var noteText = document.getElementById(eval(id+"_"+filed));								
					//noteText.innerHTML= xmlhttp.responseText;
					//alert(xmlhttp.responseText);
					var noteText = "";
					
					switch (field) {
					  case "Note":
						var noteText = document.getElementById(id+"_note");
						break;
					  case "TransType":
						var noteText = document.getElementById(id+"_TransType");
						break;
					  case "TransOrigin":
						var noteText = document.getElementById(id+"_TransOrigin");
						break;
					  case "RNCBW":
						var noteText = document.getElementById(id+"_RNCBW");
						break;
					  case "nodeBW":
					  	var noteText = document.getElementById(id+"_nodeBW");
						break;
					  case "TransBW":
					  	var noteText = document.getElementById(id+"_TransBW");
						break;	
					  case "VibaBW":
					  	var noteText = document.getElementById(id+"_VibaBW");
						break;
					  case "executer":
					  	var noteText = document.getElementById(id+"_executer");
						break;
 					   case "sub_executer":
					  	var noteText = document.getElementById(id+"_sub_executer");
						break;			 
					  default:						
					}
					
					noteText.innerHTML= xmlhttp.responseText;	
				}	
			   }
			xmlhttp.open("GET","3GBW_ext.asp?action=Note&field="+field+"&id="+id+"&value="+r,true); 			 
			xmlhttp.send(null);			
		  }	
		 }
		});			  
	}	
	
	//Ham de tai ve
	function doExport(){
		document.getElementById("isExport").value="1";	
		frm_search.submit();
		document.getElementById("isExport").value="0";
	}

  function doImport(){
		window.open('3GBW_upload.asp?Type=import','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
   
  function doUpdate(){
		window.open('3GBW_upload.asp?Type=update','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
    
  function doDelete(){
     if (confirm("Bạn muốn xóa hết dữ liệu?")) {	
	 
	 window.location.href = "default.asp?page=3GBW_list&delete=yes";
	 }
  }
  
  function doRasoat(){
	 window.location.href = "default.asp?page=3GBW_list&rasoat=yes";
	 
  }
  
</script>
  <%	
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")="1") then   
   
   	'Neu tai ve thi chuyen sang dinh dang excel
	Response.Buffer = True
	Response.Clear	
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_DL_BW_3G.xls"
	Response.Charset = "UTF-8"	
   End if
  %>


<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm</legend>
<form id="frm_search" name="frm_search" method="post" action="">
<table width="80%" border="0"id="list_tbl" >
   <tr>
	 <td><img src="images/maskrow.gif" /> STT</td>
     <td><input  name="id_log" id="id_log" size="20" maxlength="250" value="<%=id_log%>"/></td>
	 <td><img src="images/maskrow.gif" /> User name</td>
     <td><input  name="usr_action" id="usr_action" size="20" maxlength="250" value="<%=usr_action%>"/></td>
     <td><img src="images/maskrow.gif" /> Hành động </td>
	 <td><input  name="action" id="action" size="20" maxlength="250" value="<%=action%>"/></td>
     <td><img src="images/maskrow.gif" /> Thời gian  </td>
     <td><input  name="thoi_gian" id="thoi_gian" size="20" maxlength="250" value="<%=thoi_gian%>"/></td>
	 <tr class="list_nemo_center">
     <td colspan="8">
      <input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/>
	   <input type="hidden" name="isExport" id="isExport"  value="0"/></td>
    </tr>
</table>
</form> 
</fieldset>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbKHThang">
	<thead >
		<tr>
		    <th><strong>STT</strong></th>
		    <th><strong>User thực hiện</strong></th>			
			<th><strong>Hành Động</strong></th>			
			<th><strong>Thời gian</strong></th>

		</tr>
	</thead>
	<tbody>
	<%
	Dim TransType, TransOrigin, RNCBW, nodeBW, TransBW,VibaBW , Rasoat
	stt = 1
	
	sqlOriginal	= " SELECT 	id, "&_
	" user,  "&_
	" action, " &_
	" Time " &_
	" FROM " &_
	" ha_tang.log_action where  1=1 "
			
   If (id_log<>"") then
     sqlCondition = sqlCondition + " And id = '"& id_log & "' "
   End if
   If (usr_action<>"") then
     sqlCondition = sqlCondition + " And user = '"& usr_action & "' "
   End if
   
   If (log_action<>"") then
     sqlCondition = sqlCondition + " And action = '"& log_action & "' "
   End if
    If (thoi_gian<>"") then
     sqlCondition = sqlCondition + " And Time = '"& thoi_gian & "' "
   End if
   
  
      
   
   sql = sqlOriginal & sqlCondition
   sql = sql + " order by Time DESC LIMIT 0, 10000"
   
   Response.Write(sql)
   Set objRS1 = objConn.Execute(sql)
	
   While Not objRS1.EOF
	   id = objRS1.Fields("id")
	   usr_action= objRS1.Fields("user")&" "
	   log_action = objRS1.Fields("action")&" "
	   thoi_gian = objRS1.Fields("Time")&" "
%>
		<tr id="<%=id%>">
		    
		    <td class="center"><%=objRS1.Fields("id")%></td>		
	        <td class="center"><%=objRS1.Fields("user")%></td>			
			<td class="center"><%=objRS1.Fields("action")%></td>					
		 	<td align="center"><%=objRS1.Fields("Time")%></td>
			
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
   <input type="button" class="hieu_ung_nut2" name="export" value="Export to Excel" onClick="doExport();" />
   <% If (Session("usergroup")="ADMIN") then %>
   <input type="button" class="hieu_ung_nut2" name="delete" value="Xóa dữ liệu"  onClick="doDelete();" />
   <%End if%>
</form>
</div>
