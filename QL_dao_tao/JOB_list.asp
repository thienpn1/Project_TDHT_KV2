<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
    
	If (Request.QueryString("delete")= "yes") then
	    'Xoa dữ liệu trước khi import
		objConn.Execute("DELETE FROM ha_tang.tien_do_ha_tang")
		objConn.Execute("ALTER TABLE ha_tang.tien_do_ha_tang AUTO_INCREMENT = 1")
		sql_log="INSERT INTO log_action(user, action, Time) VALUES ('"&Session("username")&"','Xóa toàn bộ dữ liệu bảng thông tin hạ tầng ','"&getCurrentDateTime()&"')"	
		objConn.Execute(sql_log)
		
	End if
	'Lay gia tri search
	Dim stt,  idInc,nameInc,startTime,endTime, startTime1,startTime2, startTime11,startTime22,endTime1,endTime2, isLossSer, cause, PROCESS, typeInc, direct, creator, CLOSE, approve, status, subdepart,an_import
	Tinh= Trim(Request.Form("Tinh"))
	Ma_nha_tram= Trim(Request.Form("Ma_nha_tram"))	
	Qua_han_xong_cot= Trim(Request.Form("Qua_han_xong_cot"))
	Qua_han_xong_MC= Trim(Request.Form("Qua_han_xong_MC"))
	Ngay_khoi_cong = convert2SimpleDateSQL(Request.Form("Ngay_khoi_cong"))	
	executer= Trim(Request.Form("executer"))
	depart = Trim(Request.Form("cbDep"))
	content = Server.HTMLEncode(Trim(Request.Form("content")))		
	startTime1 = Request.Form("startTime1")
	startTime11 = convert2SimpleDateSQL(Request.Form("startTime1"))		
	startTime2 = Request.Form("startTime2")
	startTime22 = convert2SimpleDateSQL(Request.Form("startTime2"))
	endTime1 = Trim(Request.Form("endTime1"))
	endTime2 = Trim(Request.Form("endTime2"))
	status = Trim(Request.Form("status")&" ")
	

	

	If (Request.QueryString("start1")<>"" and Request.QueryString("start2")<>"") then
	   startTime1 = Request.QueryString("start1")
	   startTime2 = Request.QueryString("start2")
	   depart = "0"	   
	End if	
		
	IF (status = "") then
	  status = "2"
	End if
	
%>
<head>
<style>


.comment {}
a.morelink {
	color:blue;
	text-decoration:none;
	outline: none;
}
.morecontent span {
	display: none;
}
</style>
</head>

<script type="text/javascript" charset="utf-8">
//Show more/less text
$(document).ready(function() {
	var showChar = 50;
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



//update thong tin 

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
	   aoColumns: [ {} ,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,{"bSortable": true}]
	   
	}).makeEditable({
		sUpdateURL: "",
		sDeleteURL: "JOB_del.asp",					
		sDeleteURL: "JOB_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		oDeleteRowButtonOptions: {	label: "Xóa Hạ Tầng", 
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
		speed: 0,  // speed you want the toggle to happen	
		easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
		changeText: 1, // if you dont want the button text to change, set this to 0
		showText: 'View',// the button text to show when a div is closed
		hideText: 'Close' // the button text to show when a div is open					 
	}); 
});

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
	    var xmlhttp, temp;
	    jPrompt('Nội dung:', '<%=getCurrentDate()%>'+":", 'Cập nhật tiến độ', function(r) {
		if( r ) {	
		temp = r.replace(/(?:\r\n|\r|\n)/g, '||');
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
			   
			xmlhttp.open("GET","JOB_ext.asp?action=process&id="+id+"&value="+temp,true); 
			 
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
					  case "note":
						var noteText = document.getElementById(id+"_note");
						break;
					  case "week1":
						var noteText = document.getElementById(id+"_week1");
						break;
					  case "week2":
						var noteText = document.getElementById(id+"_week2");
						break;
					  case "week3":
						var noteText = document.getElementById(id+"_week3");
						break;
					  case "week4":
					  	var noteText = document.getElementById(id+"_week4");
						break;
					  case "sumMonth":
					  	var noteText = document.getElementById(id+"_sumMonth");
						break;	
					  case "sumtotal":
					  	var noteText = document.getElementById(id+"_sumtotal");
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
											
					//noteText.innerHTML= xmlhttp.responseText;
				}	
			   }
			xmlhttp.open("GET","JOB_ext.asp?action=Note&field="+field+"&id="+id+"&value="+r,true); 			 
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
	
	//Popup window danh gia
	function doReview(id){
	 window.open('review.asp?id='+id,'Đánh giá','width=600,height=250,left=250,top=300,screenX=100,screenY=100');
	 //opener.location.reload(true);
     //self.close();
	 //Popup 	
  }
  
  function doImport(){
		window.open('JOB_upload.asp','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
   function hidden_Import(){
	
		$('#import').hide();
  }
  
    function doDelete(){
     if (confirm("Bạn muốn xóa hết dữ liệu?")) {	
	 
			window.location.href = "default.asp?page=JOB_list&delete=yes";
	 }
}

//================================
$("#test_table").tabulator({
    height:205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
    layout:"fitColumns", //fit columns to width of table (optional)
    columns:[ //Define Table Columns
        {title:"Name", field:"name", width:150},
        {title:"Age", field:"age", align:"left", formatter:"progress"},
        {title:"Favourite Color", field:"col"},
        {title:"Date Of Birth", field:"dob", sorter:"date", align:"center"},
    ],
    rowClick:function(e, row){ //trigger an alert message when the row is clicked
        alert("Row " + row.getData().id + " Clicked!!!!");
    },
});

</script>
  <%		
   Dim sql,sql1, sqlOriginal,sqlCondition,objRS1,objRS2
'==========phan sua==============



 If (Session("username")="admin") then 
   sqlOriginal = "	SELECT 	* FROM "&_
				" ha_tang.tien_do_ha_tang where  1=1 "
				  
else
sqlOriginal = "	SELECT 	* FROM "&_
				" ha_tang.tien_do_ha_tang where  1=1 and LOWER(tien_do_ha_tang.Tinh) like   SUBSTRING('"&Session("username")&"',1,3)"
				
end if
				  
   'Dieu kien tim kiem
     If (Tinh<>"") then 
   sqlCondition = sqlCondition + " and tien_do_ha_tang.Tinh like '%"&Tinh&"%'"   
 end if
     If (Ma_nha_tram<>"") then 
    sqlCondition = sqlCondition + " and tien_do_ha_tang.Ma_nha_tram like '%"&Ma_nha_tram&"%'"
 end if
 
   If (startTime11<>"") then
   	sqlCondition = sqlCondition + " and DATE_FORMAT(tien_do_ha_tang.ngay_khoi_cong, '%Y-%m-%d') >= '"&startTime11&"'"
   End if 

   

   If (startTime22<>"") then
   	sqlCondition = sqlCondition + " and DATE_FORMAT(tien_do_ha_tang.ngay_khoi_cong, '%Y-%m-%d') <= '"&startTime22&"'"
   End if 
           If (Qua_han_xong_MC<>"") then 
   sqlCondition = sqlCondition + " and tien_do_ha_tang.Qua_han_xong_MC like '%"&Qua_han_xong_MC&"%'"   
 end if
        If (Qua_han_xong_cot<>"") then 
   sqlCondition = sqlCondition + " and tien_do_ha_tang.Qua_han_xong_cot like '%"&Qua_han_xong_cot&"%'"   
 end if
   

 
   sql = sqlOriginal & sqlCondition   
   Response.Write(Session("username"))
   sql1=sql
   Set objRS1 = objConn.Execute(sql)
   Set objRS2 = objConn.Execute(sql)
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")<>"1") then   
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm [<a href="#" class="show_hide" rel="#slidingDiv">View</a>]</legend>
<div id="slidingDiv">
<form id="frm_search" name="frm_search" method="post" action="">
<table width="25%" border="0"id="list_tbl" >
	   <tr>
		 <td><img src="images/maskrow.gif" />  Tỉnh </td>
	  <td><input  name="Tinh" id="Tinh" size="40" maxlength="250" value="<%=Tinh%>"/></td>
		 
	  </tr>
	  
   <tr>
  <td><img src="images/maskrow.gif" />  Mã nhà trạm</td>
  <td><input  name="Ma_nha_tram" id="Ma_nha_tram" size="40" maxlength="250" value="<%=Ma_nha_tram%>"/></td>
	    
   </tr>
  
   <tr>
  <td><img src="images/maskrow.gif" />  Ngày khởi công </td>
  <td><input  name="startTime1" id="startTime1" size="13" maxlength="250" />&nbsp;<img id= "startTime1_btn" src="images/calendar.png" width="20" height="20" />	 
     &nbsp;đến
       <input  name="startTime2" id="startTime2" size="13" maxlength="250" />&nbsp;<img id= "startTime2_btn" src="images/calendar.png" width="20" height="20" /></td>
	
   </tr>
    <tr>
	 <td><img src="images/maskrow.gif" />   Quá hạn xong móng cột</td>
	<td><select name="Qua_han_xong_MC" class="dropdown" id="Qua_han_xong_MC">
			<option selected value=""></option>
       <option value="Quá hạn" >Quá hạn </option>
       <option value="Trong hạn" >Trong hạn</option>
	   <option value="Đã xong cột" >Đã xong cột</option>
       </select></td>
    
  </tr>
  
   <tr>
<td><img src="images/maskrow.gif" />  Quá hạn xong cột</td>
	<td><select name="Qua_han_xong_cot" class="dropdown" id="Qua_han_xong_cot">
			<option selected value=""></option>
       <option value="Quá hạn" >Quá hạn </option>
       <option value="Trong hạn" >Trong hạn</option>
	   <option value="Đã xong cột" >Đã xong cột</option>
       </select></td>
    
  </tr>
      <tr>
 <td><img src="images/maskrow.gif" />  Trạng thái PS </td>
  <td><select name="Trang_thai_ps" class="dropdown" id="Trang_thai_ps">
       <option value="" ></option>
       <option value="Đã phát sóng" >Đã phát sóng </option>
       <option value="Chưa phát sóng" >Chưa phát sóng</option>
       </select></td>
  </tr>
    <script type="text/javascript">//<![CDATA[
      Calendar.setup({
        inputField : "startTime1",
        trigger    : "startTime1_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	  Calendar.setup({
        inputField : "startTime2",
        trigger    : "startTime2_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	  Calendar.setup({
        inputField : "endTime1",
        trigger    : "endTime1_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	  Calendar.setup({
        inputField : "endTime2",
        trigger    : "endTime2_btn",
        onSelect   : function() { this.hide() },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
    //]]></script>
   <tr class="list_nemo_center">
     <td colspan="4">
	 <input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/>
	 <input type="hidden" name="isExport" id="isExport"  value="0"/>	</td>
    </tr>
</table>
</form> 
</div>
</fieldset>
<table id="test_table"></div>
<table  cellpadding="0" cellspacing="0" border="1" class="display" id="tbKHThang" >
	<thead >
		<tr>
<th>&nbsp;</th>
<th> STT									    </th>
<th> Tỉnh                                       </th>
<th> Mã nhà trạm                                </th>
<th> Mã trạm                                    </th>
<th> Mã công trình                              </th>
<th> ĐVTC                                       </th>
<th> Loại trạm(trên mái, dưới đất)              </th>
<th> Địa hinh                                   </th>
<th> Loại cột                                   </th>
<th> Độ cao cột                                 </th>
<th> Loại nhà                                   </th>
<th> Target Phát sóng(Ngày)                     </th>
<th> Target xong móng cột                       </th>
<th> Target xong cột                            </th>
<th> Target xong nhà                            </th>
<th> Kế hoạch tháng                             </th>
<th> Ngày BGMB                                  </th>
<th>  Ngày cấp Bulong móng                      </th>
<th> Thời gian giảm trừ trước khởi công         </th>
<th> Nguyên nhân cha(quá hạn khởi công)         </th>
<th> Nguyên nhân con(Quá hạn khởi công)         </th>
<th> Quá hạn khởi công                          </th>
<th> Ngày Khởi công                             </th>
<th>  Ngày xong móng cột                        </th>
<th> Quá hạn xong móng cột                      </th>
<th> Nguyên nhân cha(Quá hạn móng cột)          </th>
<th> Nguyên nhân con(Quá hạn móng cột)          </th>
<th> Ngày cấp cột                               </th>
<th>  Ngày xong cột                             </th>
<th> Quá hạn xong cột                           </th>
<th> Nguyên nhân cha(Quá hạn xong cột)          </th>
<th> Nguyên nhân con(Quá hạn xong cột)          </th>
<th> Ngày cấp nhà Cont                          </th>
<th> Ngày xong nhà                              </th>
<th> Quá hạn xong nhà                           </th>
<th> Nguyên nhân cha                            </th>
<th> Nguyên nhân con                            </th>
<th> Ngày cấp TB                                </th>
<th> Ngày lắp xong TB                           </th>
<th> Target lắp thiết bị(Ngày)                  </th>
<th> Quá hạn lắp xong TB                        </th>
<th> Nguyên nhân cha                            </th>
<th> Nguyên nhân con                            </th>
<th> Target xong điện(Ngày)                     </th>
<th> Ngày Xong điện                             </th>
<th> Quá hạn lắp xong Điện                      </th>
<th> Nguyên nhân cha                            </th>
<th> Nguyên nhân con                            </th>
<th> Target xong quang(Ngày)                    </th>
<th> Ngày Xong quang                            </th>
<th> Nguyên nhân cha                            </th>
<th> Nguyên nhân con                            </th>
<th> Ngày phát sóng                             </th>
<th> Trạng thái PS                              </th>
<th> Nguyên nhân cha                            </th>
<th> Nguyên nhân con                            </th>
<th> Thời gian thi công đến hiện tại(ngày)      </th>
<th> Thời gian giảm trừ(ngày)                   </th>
<th> Thời gian thi công sau giảm trừ            </th>
<th> Tình trạng                                 </th>
<th> Trạm ưu tiên                               </th>
<th> Ngày phê duyệt vị trí trạm                 </th>
<th> Công văn phê duyệt trạm                    </th>
<th> Trạm đang thi công                         </th>
<th> Trạm dừng thi công do vướng                </th>
<th> Có đội xây dựng trong ngày                 </th>
<th> Có đội dựng cột trong ngày                 </th>
<th> Có đội lắp thiết bị trong ngày             </th>
<th> Ghi chú                                    </th>
<th> User tạo									</th>
		</tr>
	</thead>
	<tbody >
	
	<%


	stt = 1
	While Not objRS1.EOF
	   id = objRS1.Fields("id")

	%>
		<tr id="<%=id%>">
		<td>
		<div class="size">			
			<span type="text" name="test" class="field"><img onclick="parent.location='default.asp?page=JOB_edit&id=<%=id%>&ma_tram=<%=Ma_tram%>'" src="images/Navigation-32.png" /></span>				
			
			</div>	
			</td>
			<td >
<span class="comment more"> <%=id%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Tinh")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ma_nha_tram")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ma_tram")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ma_cong_trinh")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("DVTC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Loai_tram_TM_DD")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Dia_hinh")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Loai_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Do_cao_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Loai_nha")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_phat_song_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_xong_mong_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_xong_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_xong_nha")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ke_hoach_thang")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_BGMB")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_cap_Bulong_mong")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Thoi_gian_giam_tru_truoc_KC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHKC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHKC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_khoi_cong")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_khoi_cong")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_xong_mong_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_xong_MC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHMC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHMC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_cap_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_xong_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_xong_cot")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHXC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHXC")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_cap_nha_cont")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_xong_nha")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_xong_nha")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHXN")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHXN")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_cap_tb")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_lap_xong_tb")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_lap_tb_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_lap_xong_tb")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHTB")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHTB")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_xong_dien_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_xong_dien")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Qua_han_lap_xong_dien")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHXD")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHXD")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Target_xong_quang")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_xong_quang")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHXQ")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHXQ")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_ps")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Trang_thai_ps")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_cha_QHPS")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguyen_nhan_con_QHPS")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Time_thi_cong_ht")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Time_giam_tru")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Time_thi_cong_sau_gt")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Tinh_trang")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Tram_uu_tien")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ngay_pd_vtri_tram")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("CV_phe_duyet_vtri_tram")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Tram_dang_thi_cong")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Tram_dung_thi_cong_do_vuong")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Co_doi_xay_dung_trong_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Co_doi_dung_cot_trong_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Co_doi_lap_thiet_bi_trong_ngay")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Ghi_chu")%></span> 
</td>
<td >
    <span class="comment more"> <%=objRS1.Fields("Nguoi_tao")%></span> 
</td>



		
		</tr>
		<div class="menu_<%=id%>" style="display: block;">	   </div>
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

<div align ="left">
<form id="frm_export" name="frm_export" method="post" action="#">
<%
If (Session("add")="1" and Session("isOldInc")="" and Session("usergroup")<> "CNVT") Then
%>	 
	<input type="button" class="hieu_ung_nut2" name="add" value="Tạo Hạ tầng" onClick="location.href='default.asp?page=JOB_add'" />
<%
End if
%>

	<% 
 If (Session("username")<>"admin") then 
		an_import="hidden"
else
	an_import=""
end if
%>
    <input type="button" class="hieu_ung_nut2" id="import" name="import" value="Import" onClick="doImport();" <%=an_import%>  />

   <input type="button" class="hieu_ung_nut2" name="export" id="export" value="Export to Excel" onClick="doExport();" />
      <% If (Session("username")="admin") then %>
   <input type="button" class="hieu_ung_nut2" name="delete" value="Xóa dữ liệu"  onClick="doDelete();" />
   <%End if%>
</form>
</div>
<%
'Neu co export thì dung form nay
Else
	Set objRS1 = Nothing
	Response.Write(sql)
	'Neu tai ve thi chuyen sang dinh dang excel
	Response.Buffer = True
	Response.Clear	
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_congviec.xls"
	Response.Charset = "UTF-8"	
%>
<table width="100%" border="0">
  <tr>
 </td><div align="center">TRUNG TÂM KỸ THUẬT KV2</div></td>
 </td>&nbsp;</td>
 </td> <div align="center"><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong></div></td>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
  </tr>
  <tr>
 </td><div align="center"><strong>PHÒNG KỸ THUẬT KHAI THÁC</strong></div></td>
 </td>&nbsp;</td>
 </td> <div align="center"><strong>Độc lập - Tự do - Hạnh phúc</strong></div></td>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
  </tr>
  <tr>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
 </td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"> <div align="center">BẢNG THEO DÕI NHIỆM VỤ THÁNG</div></td>
  </tr>
  <tr>
    <td colspan="5"> <div align="center">(Từ ngày: .............. đến ngày ...................)</div></td>
  </tr>
</table>
</div>
</br>
<table border="1">
	<thead>
		<tr BGcolor=#92D050>		
<th colspan="5"><font face="Times New Roman"> STT  </font></th> 	
<th colspan="5"><font face="Times New Roman"> Tỉnh  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Mã nhà trạm  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Mã trạm  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Mã công trình  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> ĐVTC  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Loại trạm(trên mái, dưới đất)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Địa hinh  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Loại cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Độ cao cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Loại nhà  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target Phát sóng(Ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target xong móng cột </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target xong cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target xong nhà  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Kế hoạch tháng  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày BGMB  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày cấp Bulong móng  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Thời gian giảm trừ trước khởi công  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha(quá hạn khởi công)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con(Quá hạn khởi công)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Quá hạn khởi công  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày Khởi công  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày xong móng cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Quá hạn xong móng cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha(Quá hạn móng cột)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con(Quá hạn móng cột)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày cấp cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày xong cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Quá hạn xong cột  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha(Quá hạn xong cột)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con(Quá hạn xong cột)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày cấp nhà Cont  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày xong nhà  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Quá hạn xong nhà  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày cấp TB  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày lắp xong TB  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target lắp thiết bị(Ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Quá hạn lắp xong TB  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target xong điện(Ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày Xong điện  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Target xong quang(Ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày Xong quang  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày phát sóng  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Trạng thái PS  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân cha  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Nguyên nhân con  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Thời gian thi công đến hiện tại(ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Thời gian giảm trừ(ngày)  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Thời gian thi công sau giảm trừ  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Tình trạng  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Trạm ưu tiên  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ngày phê duyệt vị trí trạm  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Công văn phê duyệt trạm  </font></th> 	 
<th colspan="5"><font face="Times New Roman"> Ghi chú  ***********</font></th> 	 
<th colspan="5"><font face="Times New Roman"> User tạo </font></th> 	 
		</tr>
		
	</thead>
	<tbody>	
	<%
	Response.Write(sql1)
	Response.Write(sql)
	'Set objRS1 = objConn.Execute(sql1)
	'Response.Write(sql1)
	stt =  1
	While Not objRS2.EOF
	%>
	  <tr>
	  <td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("id")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Tinh")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ma_nha_tram")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ma_tram")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ma_cong_trinh")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("DVTC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Loai_tram_TM_DD")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Dia_hinh")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Loai_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Do_cao_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Loai_nha")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_phat_song_ngay")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_xong_mong_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_xong_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_xong_nha")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ke_hoach_thang")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_BGMB")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_cap_Bulong_mong")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Thoi_gian_giam_tru_truoc_KC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHKC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHKC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Qua_han_khoi_cong")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_khoi_cong")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_xong_mong_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Qua_han_xong_MC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHMC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHMC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_cap_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_xong_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Qua_han_xong_cot")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHXC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHXC")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_cap_nha_cont")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_xong_nha")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Qua_han_xong_nha")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHXN")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHXN")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_cap_tb")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_lap_xong_tb")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_lap_tb_ngay")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Qua_han_lap_xong_tb")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHTB")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHTB")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_xong_dien_ngay")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_xong_dien")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHXD")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHXD")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Target_xong_quang")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_xong_quang")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHXQ")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHXQ")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_ps")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Trang_thai_ps")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_cha_QHPS")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguyen_nhan_con_QHPS")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Time_thi_cong_ht")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Time_giam_tru")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Time_thi_cong_sau_gt")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Tinh_trang")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Tram_uu_tien")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ngay_pd_vtri_tram")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("CV_phe_duyet_vtri_tram")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Ghi_chu")%></font></td> 
<td align="center" colspan="5"><font face="Times New Roman"> <%=objRS2.Fields("Nguoi_tao")%></font></td> 

						
	  </tr>
	<%	
		stt =  stt + 1
		objRS2.MoveNext
		Wend 
		
	%>	


	</tbody>	
</table>

<%
'Kết thúc điều kiện export
End if
%>