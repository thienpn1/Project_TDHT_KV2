n<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
    
	Dim Province, Mang, s_Mang, Array_sub, Device_name, Network_name, Vendor, Chuky, TimeFinish, Trangthai
	'Lay gia tri search

	If (Request.QueryString("delete")= "yes" and Request.QueryString("mang")<> "") then 
	    'Xoa dữ liệu trước khi import
		objConn.Execute("DELETE FROM tbl_maintain where _Array='"+Server.HTMLEncode(Request.QueryString("mang"))+"'")
		response.Redirect("default.asp?page=Maintain_list")
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
	var showChar = 200;
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
	   aoColumns: [ {} ,null, null, null, null, null,null, null,null,null,null,null,null]
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "maintain_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null,null, null],
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
					  case "CR":
						var noteText = document.getElementById(id+"_CR");
						break;
					  case "_Status":
						var noteText = document.getElementById(id+"_Status");
						break;
					  case "TimeFinish":
						var noteText = document.getElementById(id+"_TimeFinish");
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
			xmlhttp.open("GET","Maintain_ext.asp?action="+action+"&field="+field+"&id="+id+"&value="+r,true); 			 
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
		window.open('Maintain_upload.asp?Type=import','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
    
  function doDelete(mang){
     if (confirm("Bạn muốn xóa hết dữ liệu mảng " + mang + "?")) {	
	 
	 window.location.href = "default.asp?page=Maintain_list&delete=yes&mang="+mang;
	 }
  }

  
</script>
  <%	
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")="1") then   
   
   	'Neu tai ve thi chuyen sang dinh dang excel
	Response.Buffer = True
	Response.Clear	
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_DL_Bao_duong.xls"
	Response.Charset = "UTF-8"	
   End if
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thống kê bảo dưỡng năm <%=Year(Date())%></legend>
<table width="100%" border="0"id="list_tbl" >
   <tr class="list_nemo_center">
     <td><table width="100%" border="0">
       <tr>
	     <td><strong>Mảng</strong></td>
         <td><strong>Tháng 1 </strong></td>
         <td><strong>Tháng 2 </strong></td>
         <td><strong>Tháng 3 </strong></td>
         <td><strong>Tháng 4 </strong></td>
         <td><strong>Tháng 5 </strong></td>
         <td><strong>Tháng 6 </strong></td>
         <td><strong>Tháng 7 </strong></td>
         <td><strong>Tháng 8 </strong></td>
         <td><strong>Tháng 9 </strong></td>
         <td><strong>Tháng 10 </strong></td>
         <td><strong>Tháng 11 </strong></td>
         <td><strong>Tháng 12 </strong></td>
         <td bgcolor="#66FFFF"><strong>% 6T đầu năm</strong></td>
         <td bgcolor="#66FFFF"><strong>Tổng 6T đầu năm</strong> </td>
         <td bgcolor="#FFFF33"><strong>% 6T cuối năm</strong></td>
         <td bgcolor="#FFFF33"><strong>Tổng 6T cuối năm </strong></td>
       </tr>

      
	   <% 

	   sql = "SELECT DISTINCT _array FROM tbl_maintain"
	  
	   Set objRS = objConn.Execute(sql)
	   while Not objRS.EOF 
	      Mang =  objRS.Fields("_array")
		  sql = "SELECT (SELECT COUNT(id) FROM tbl_maintain WHERE _Array='"&Mang&"' AND _Round like '6T &#273;&#7847;u n&#259;m "&year(Date())&"') AS tong1,"&_
		    " (SELECT COUNT(id) FROM tbl_maintain WHERE _Array='"&Mang&"' AND _Round like '6T cu&#7889;i n&#259;m "&year(Date())&"') AS tong2,"&_
            " (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '1' AND _Round like '%"&year(Date())&"' ) AS Thang1,"&_
            " (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '2' AND _Round like '%"&year(Date())&"') AS Thang2,"&_
            " (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '3' AND _Round like '%"&year(Date())&"') AS Thang3,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '4' AND _Round like '%"&year(Date())&"') AS Thang4,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '5' AND _Round like '%"&year(Date())&"') AS Thang5,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '6' AND _Round like '%"&year(Date())&"') AS Thang6,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '7' AND _Round like '%"&year(Date())&"') AS Thang7,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '8' AND _Round like '%"&year(Date())&"') AS Thang8,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '9' AND _Round like '%"&year(Date())&"') AS Thang9,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '10' AND _Round like '%"&year(Date())&"') AS Thang10,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '11' AND _Round like '%"&year(Date())&"') AS Thang11,"&_
			" (SELECT 	COUNT(id) FROM tbl_maintain WHERE  _Array='"&Mang&"' AND _Status= 'OK' AND Month(TimeFinish) = '12' AND _Round like '%"&year(Date())&"') AS Thang12"
		
	       Set objRS1 = objConn.Execute(sql)
		   while Not objRS1.EOF 
		   dim tong1, tong2, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12
		   
		   tong1= Clng("0"&objRS1.Fields("tong1"))
		   tong2= Clng("0"&objRS1.Fields("tong2"))
		   t1=  Cint(objRS1.Fields("Thang1"))
		   t2=  Cint(objRS1.Fields("Thang2"))
		   t3=  Cint(objRS1.Fields("Thang3"))
		   t4=  Cint(objRS1.Fields("Thang4"))
		   t5=  Cint(objRS1.Fields("Thang5"))
		   t6=  Cint(objRS1.Fields("Thang6"))
		   t7=  Cint(objRS1.Fields("Thang7"))
		   t8=  Cint(objRS1.Fields("Thang8"))
		   t9=  Cint(objRS1.Fields("Thang9"))
		   t10= Cint(objRS1.Fields("Thang10"))
		   t11= Cint(objRS1.Fields("Thang11"))
		   t12= Cint(objRS1.Fields("Thang12"))
		%> 
		<tr>
		
		 <td align="center"><strong><%=Mang%></strong></td>
         <td align="center"><%=t1%></td>
         <td align="center"><%=t2%></td>
         <td align="center"><%=t3%></td>
         <td align="center"><%=t4%></td>
         <td align="center"><%=t5%></td>
         <td align="center"><%=t6%></td>
         <td align="center"><%=t7%></td>
		 <td align="center"><%=t8%></td>
		 <td align="center"><%=t9%></td>
		 <td align="center"><%=t10%></td>
		 <td align="center"><%=t11%></td>
		 <td align="center"><%=t12%></td>
		 <td align="center"><strong><% 
		 if (tong1 >0) then
		    response.write(Round((t1+t2+t3+t4+t5+t6)/tong1 *100))
		 else 
		    response.write("0")
		 End if
		 %>%</strong></td>
		 <td align="center"><strong><%=tong1%></strong></td>
		 <td align="center"><strong>
		 <% 
		 if (tong2 >0) then
		    response.write( (t7+t8+t9+t10+t11+t12)/tong2)
		 else 
		    response.write("0")
		 End if
		 %>% </strong></td>
		 <td align="center"><strong><%=tong2%></strong></td>
		</tr>
		<% 
		     objRS1.MoveNext
		    Wend
		  objRS.MoveNext
	   Wend   
   
	   ' Lay thong tin search  
	   s_Mang= Server.HTMLEncode(Trim(Request.Form("Mang")))
       Array_sub = Server.HTMLEncode(Trim(Request.Form("Array_sub")))
	   Chuky = (Trim(Request.Form("Chuky")))	
	   Trangthai = Trim(Request.Form("trangthai"))
	  
	  If (s_Mang ="") then
	     s_Mang ="TH"
	  End if
	   %>
        
     </table></td>
  </tr>
</table>
</fieldset>

<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm</legend>
<form id="frm_search" name="frm_search" method="post" action="">
<table width="80%" border="0"id="list_tbl" >
   <tr>
	 <td><img src="images/maskrow.gif" /> Mảng</td>
     <td><%=listMang("Mang", s_Mang)%></td>
     <td><img src="images/maskrow.gif" /> Chủng loại </td>
     <td><%=listChungloai("array_sub", array_sub)%></td>
     <td><img src="images/maskrow.gif" /> Chu kỳ bảo dưỡng </td>
     <td><%=listChuky("Chuky",Server.HTMLEncode(chuky))%>      </td>
     <td><img src="images/maskrow.gif" /> Kết quả bảo dưỡng </td>
     <td><select name="trangthai" id="select">
       <option value="" <%=iff(trangthai="","selected","")%>>---ALL---</option>
       <option value="OK"  <%=iff(trangthai="OK","selected","")%>>Đã thực hiện OK</option>
	   <option value="NOK" <%=iff(trangthai="NOK","selected","")%>>Đã thực hiện NOK</option>
       <option value="NOTYET" <%=iff(trangthai="NOTYET","selected","")%>>Chưa thực hiện</option>
     </select></td>
     <td><input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/></td>
   </tr>
   <tr class="list_nemo_center">
     <td colspan="9"><input type="hidden" name="isExport" id="isExport"  value="0"/></td>
    </tr>
</table>
</form> 
</fieldset>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbKHThang">
	<thead >
		<tr>
		    <th><strong>STT</strong></th>
		    <th><strong>Tỉnh</strong></th>			
			<th><strong>Mảng</strong></th>			
			<th><strong>Chủng loại </strong></th>
			<th><strong>Tên thiết bị</strong> </th>
		    <th><strong>Tên node mạng </strong></th>		
		    <th><strong>IP</strong></th>			
			<th><strong>Vendor</strong></th>
			<th><strong>Chu kỳ </strong></th>		
			<th><strong>Tgian thực hiện </strong></th>			
			<th><strong>Tình trạng </strong></th>
			<th><strong>CR </strong></th>	
			<th><strong>Ghi chú </strong></th>  
		</tr>
	</thead>
	<tbody>
	<%

	stt = 1
	sqlOriginal = " SELECT 	Id,  "&_
	" Province,  "&_
	" _Array,  "&_
	" Array_sub,  "&_
	" Device_name,  "&_
	" Network_name,  "&_
	" IP,  "&_
	" Vendor,  "&_
	" _ROUND,  "&_
	" DATE_FORMAT(TimeFinish,'%d/%m/%Y') as TimeFinish, "&_
	" _STATUS,  "&_
	" CR,  "&_
	" Note "&_
	 
	" FROM  "&_ 
	" tbl_maintain where  1=1 "
					  
   If (s_Mang<>"") then
      sqlCondition = sqlCondition + " And _array ='"&s_Mang&"'"
   End if
   
   If (array_sub<>"") then
      sqlCondition = sqlCondition + " And array_sub ='"&array_sub&"'"
   End if
   
   If (chuky<>"") then
      sqlCondition = sqlCondition + " And _round ='"&Server.HTMLEncode(chuky)&"'"
   End if
   
   If (trangthai="NOTYET") then
      sqlCondition = sqlCondition + " And _status =''"
	  Elseif (trangthai<>"") then
	    sqlCondition = sqlCondition + " And _status ='"&trangthai&"'"
   End if
   
   sql = sqlOriginal & sqlCondition
   'sql = sql + " order by Rasoat DESC LIMIT 0, 1000"
   
   'Response.Write(sql)
   Set objRS1 = objConn.Execute(sql)
	
   While Not objRS1.EOF
	   id = objRS1.Fields("id")
	   Province = objRS1.Fields("Province")
	   Mang = objRS1.Fields("_Array")
	   Array_sub = objRS1.Fields("Array_sub")
	   Device_name = objRS1.Fields("Device_name")
	   Network_name = objRS1.Fields("Network_name")
	   IP = objRS1.Fields("IP")
	   Vendor = objRS1.Fields("Vendor")
	   Chuky = objRS1.Fields("_Round")
	   TimeFinish = objRS1.Fields("TimeFinish")
	   Trangthai = objRS1.Fields("_Status")
	   CR = objRS1.Fields("CR")
	   Note= replace(objRS1.Fields("Note")&" ",VbCrLf,"<br>")
	%>
		<tr id="<%=id%>">
		    <td class="center"><%=stt%></td>
		    <td class="center"><%=Province%></td>		
	        <td class="center"><%=Mang%></td>			
			<td class="center"><%=Array_sub%></td>					
		 	<td align="center"><%=Device_name%></td>
			<td align="center"><%=Network_name %></td>							
			<td align="center"><%=IP%></td>
			<td align="center"><%=Vendor%></td>			
			<td align="center" nowrap="nowrap"><%=Chuky%></td>
			<td align="center">
			<span id="<%=id%>_TimeFinish" >
			   <a  onclick="Note('Note','TimeFinish',<%=id%>);"> <%=iff(isNull(TimeFinish),"...",TimeFinish)%> </a>
			</span>
			</td>
			<td align="center">
			<span id="<%=id%>_Status" >
			   <a  onclick="Note('Note','_Status',<%=id%>);"> <%=iff(Trangthai="","...",Trangthai)%> </a>
			</span>
			</td>
			<td align="left">
			<span id="<%=id%>_CR" >
			   <a  onclick="Note('Note','CR',<%=id%>);"> <%=iff(CR="","...",CR)%> </a>
			</span></td>
			</td>
			<td align="left">
			<span id="<%=id%>_note" class="comment more">
			   <a  onclick="Note('Note','Note',<%=id%>);"> <%=iff(Note=" ","...",Note)%> </a>
			</span></td>				
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
   <input type="button" class="hieu_ung_nut2" name="import" value="Import" onClick="doImport();" />
   <input type="button" class="hieu_ung_nut2" name="export" value="Export to Excel" onClick="doExport();" />
   <% If (Session("usergroup")="ADMIN") then %>
   <input type="button" class="hieu_ung_nut2" name="delete" value="Xóa dữ liệu"  onClick="doDelete('<%=s_Mang%>');" />
   <%End if%>
</form>
</div>
