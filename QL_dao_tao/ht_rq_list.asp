<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
    
	'Lay gia tri search
	
	
	Mang_yeu_cau= Trim(Request.Form("Mang_yeu_cau"))
	Noi_dung = Trim(Request.Form("Noi_dung"))
	Nguoi_tao = (Request.Form("Nguoi_tao"))
	startTime1 = (Request.Form("startTime1"))
	startTime2 = (Request.Form("startTime2"))
	Tien_do = Trim(Request.Form("Tien_do"))
	Trang_thai_yeu_cau = Trim(Request.Form("Trang_thai_yeu_cau"))
	
	
	
	
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
	   aoColumns: [ {} ,null, null, null, null, null,null, null,null,null,{"bSortable": false}]
	}).makeEditable({
		sUpdateURL: "",
		//sDeleteURL: "JOB_del.asp",					
		sUpdateURL: function( value, settings)
		{
			//alert(value);
			return(value); //Simulation of server-side response using a callback function						
		},
		sAddHttpMethod: "GET",
		sDeleteHttpMethod: "GET",
		"aoColumns": [null,null,null,null,null,null,null,null,null,null,null],
		oAddNewRowButtonOptions: {	label: "Add...",
						icons: {primary:'ui-icon-plus'} 
		},
		//oDeleteRowButtonOptions: {	label: "Xóa công việc", 
		//				icons: {primary:'ui-icon-trash'}
		//},
		oAddNewRowFormOptions: { 	
						title: 'Add a new browser',
						show: "blind",
						hide: "explode",
						modal: true
		}	//,
	//sAddDeleteToolbarSelector: ".dataTables_length"
	});} );
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
</script>
  <%		
   
If (Session("usergroup")="ADMIN" or Session("usergroup")="LDP" or Session("usergroup")="Phong_HT") then 
   sqlOriginal = "	SELECT  `id`,`Mang_yeu_cau`, `Noi_dung`, `Nguoi_tao`, date_format(Ngay_bat_dau,'%d/%m/%Y') as Ngay_bat_dau,date_format(Ngay_hoan_thanh,'%d/%m/%Y') as Ngay_hoan_thanh, `Thoi_gian_dap_ung`, `Nhan_su_tiep_nhan`, `Work_log`, `Tien_do`, `Trang_thai_yeu_cau`, `Ghi_chu`  FROM "&_
				" hatang_request where  1=1 "
				  
else
	if (Session("usergroup")="CNVT") then 
	sqlOriginal = "	SELECT  `id`,`Mang_yeu_cau`, `Noi_dung`, `Nguoi_tao`, date_format(Ngay_bat_dau,'%d/%m/%Y') as Ngay_bat_dau,date_format(Ngay_hoan_thanh,'%d/%m/%Y') as Ngay_hoan_thanh, `Thoi_gian_dap_ung`, `Nhan_su_tiep_nhan`, `Work_log`, `Tien_do`, `Trang_thai_yeu_cau`, `Ghi_chu`  FROM "&_
				" hatang_request where  1=1 and hatang_request.Nguoi_tao like '"&Session("username")&"'"
	end if		
end if	
   'Dieu kien tim kiem
   If (Mang_yeu_cau<>"-1") then
  	 sqlCondition = sqlCondition + " and hatang_request.Mang_yeu_cau like '%"&Mang_yeu_cau&"%'"  
   End if
   If (Noi_dung<>"") then
   sqlCondition = sqlCondition + " and hatang_request.Noi_dung like '%"&Noi_dung&"%'"  
    End if
	If (Nguoi_tao<>"") then
   sqlCondition = sqlCondition + " and hatang_request.Nguoi_tao like '%"&Nguoi_tao&"%'"
    End if
	If (Nhan_su_tiep_nhan<>"") then
   sqlCondition = sqlCondition + " and hatang_request.Nhan_su_tiep_nhan like '%"&Nhan_su_tiep_nhan&"%'"
    End if
      
   If (startTime1<>"") then
  	 sqlCondition = sqlCondition + " and date_format(Ngay_bat_dau,'%Y/%m/%d') >= str_to_date('"&(startTime1)&"','%d/%m/%Y')"
   End if
   If (startTime2<>"") then
   	sqlCondition = sqlCondition + " and date_format(Ngay_bat_dau,'%Y/%m/%d')  <= str_to_date('"&(startTime2)&"','%d/%m/%Y')"
   End if
   If (Trang_thai_yeu_cau<>"-1") then
  	 sqlCondition = sqlCondition + " and hatang_request.Trang_thai_yeu_cau like '%"&Trang_thai_yeu_cau&"%'"  
   End if
   If (Tien_do<>"-1") then
  	 sqlCondition = sqlCondition + " and hatang_request.Tien_do like '%"&Tien_do&"%'"  
   End if
   
  
  'Them dieu kien tim kiem theo ban
   'IF (depart = "" and Session("depart")<>"0") then 
   '   sqlCondition = sqlCondition + " and (sub_depart like '"&Session("depart")&"')"
   'Else	
	'IF (depart <> "0") then
	'	sqlCondition = sqlCondition + " and sub_depart like '%"&depart&"%'"
	'  End if	      
   'End if

   sql = sqlOriginal & sqlCondition
   sql1 = sql 
   sql1 = sql1 + " LIMIT 0, 1000"
   
   'Response.Write(sql)
   Set objRS1 = objConn.Execute(sql1)
   'Neu khong export thi dung form nay
   If (Request.Form("isExport")<>"1") then   
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm [<a href="#" class="show_hide" rel="#slidingDiv">View</a>]</legend>
<div id="slidingDiv">
<form id="frm_search" name="frm_search" method="post" action="">
<table width="100%" border="0"id="list_tbl" >
<tr>
	 <td width="10%"><img src="images/maskrow.gif" /> Mảng yêu cầu <font color="red">*</font></td>
     <td><select name="Mang_yeu_cau" id="Mang_yeu_cau" onChange="tudong_hienthi_ngay_dap_ung()">
	  <option value="-1" selected >-------Lựa chọn-------</option>
       <option value="Đảm bảo VTTB cho công tác phát triển mới">Đảm bảo VTTB cho công tác phát triển mới</option>
       <option value="Đảm bảo thủ tục, hợp đồng thi công, đơn vị thi công cho công tác PTHT, các chương trình phục vụ lễ hội, sự kiện">Đảm bảo thủ tục, hợp đồng thi công, đơn vị thi công cho công tác PTHT, các chương trình phục vụ lễ hội, sự kiện</option>
       <option value="Tiếp nhận, giải quyết các đề xuất của TTKT KV: những yêu cầu  nghiệp vụ, phần mềm, quản lý chất lượng công trình">Tiếp nhận, giải quyết các đề xuất của TTKT KV: những yêu cầu  nghiệp vụ, phần mềm, quản lý chất lượng công trình</option>
       <option value="Đảm bảo thủ tục hợp đồng thi công kiên cố nhà trạm, cột anten">Đảm bảo thủ tục hợp đồng thi công kiên cố nhà trạm, cột anten</option>
	   <option value="Đảm bảo thủ tục hợp đồng thi công tuyến cáp ngầm ">Đảm bảo thủ tục hợp đồng thi công tuyến cáp ngầm </option>
       <option value="Làm việc với nhà thầu giải quyết vấn đề phát sinh trong quá trình thi công (đơn giá vận chuyển, giá xây dựng…)">Làm việc với nhà thầu giải quyết vấn đề phát sinh trong quá trình thi công (đơn giá vận chuyển, giá xây dựng…)</option>
       <option value="Đảm bảo HSTK được thẩm định, phê duyệt chuyển ĐVTC, Chi nhánh tỉnh, TTKT KV để tổ chức triển khai ">Đảm bảo HSTK được thẩm định, phê duyệt chuyển ĐVTC, Chi nhánh tỉnh, TTKT KV để tổ chức triển khai </option>
       <option value="Đảm bảo pháp lý, hướng dẫn thủ tục cho những công việc trong OS, ngoài OS liên quan trong công tác.">Đảm bảo pháp lý, hướng dẫn thủ tục cho những công việc trong OS, ngoài OS liên quan trong công tác.</option>
	   <option value="Hướng dẫn, đào tạo nghiệp vụ trong công tác đầu tư xây dựng">Hướng dẫn, đào tạo nghiệp vụ trong công tác đầu tư xây dựng</option>
 <option value="Đảm bảo cấp phát vật tư thiết bị đảm bảo thực hiện cho các Kế hoạch, chương trình phát triển hạ tầng tháng/quý/năm
">Đảm bảo cấp phát vật tư thiết bị đảm bảo thực hiện cho các Kế hoạch, chương trình phát triển hạ tầng tháng/quý/năm.
</option>	  
	  <option value="Đảm bảo vật tư, thiết bị được KCS theo đúng quy định, không hỏng hóc khi xuất đến công trình phục vụ cho các kế hoạch phát triển hạ tầng tháng/quý/năm">Đảm bảo vật tư, thiết bị được KCS theo đúng quy định, không hỏng hóc khi xuất đến công trình phục vụ cho các kế hoạch phát triển hạ tầng tháng/quý/năm.</option>
     </select>  
	 </td>
   </tr>
    <tr>
	 <td width="10%"><img src="images/maskrow.gif" /> Nội dung</td>
     
	   <span class="font_inform"  id="label_INCEffect"></span>
	   <td><input  name="Noi_dung" id="Noi_dung" size="40" maxlength="250" /></td>
      
   <%
		if (Session("usergroup")="CNVT") then %>
		<tr>
			<td><img src="images/maskrow.gif" />  Người tạo </td>
			<td><input  name="Nguoi_tao" id="Nguoi_tao" size="40" maxlength="250" /></td>
        </tr>
	 <% end if %>
   </tr>
   
  <tr>
	 <td><img src="images/maskrow.gif" /> Nhân sự tiếp nhận</td>
     <td><input  name="Nhan_su_tiep_nhan" id="Nhan_su_tiep_nhan" size="40" maxlength="250" /></td>
         
  </tr>
   <tr>
     <td><img src="images/maskrow.gif" /> Tiến độ </td>
     <td><select name="Tien_do" class="dropdown" id="Tien_do">
       <option value="-1" >-----T&#7845;t c&#7843;-----</option>
       <option value="Chờ tiếp nhận">Chờ tiếp nhận</option>
       <option value="Đang thực hiện">Đang thực hiện</option>
	   <option value="Hoàn Thành">Hoàn Thành</option>
       <option value="Đóng">Đóng</option>
       </select></td>
   </tr>
   
   
   
   <tr>
     <td><img src="images/maskrow.gif" /> Trạng thái</td>
     <td><select name="Trang_thai_yeu_cau" class="dropdown" id="Trang_thai_yeu_cau">
       <option value="-1" >-----T&#7845;t c&#7843;-----</option>
       <option value="Trong hạn">Trong hạn</option>
       <option value="Quá hạn">Quá hạn</option>
	   
       </select></td>
   </tr>
   <tr>
     <td><img src="images/maskrow.gif" />  Thời gian bắt đầu từ </td>
     <td><input  name="startTime1" id="startTime1" size="13" maxlength="250" value="<%=startTime1%>"/>&nbsp;<img id= "startTime1_btn" src="images/calendar.png" width="20" height="20" />	 
     &nbsp;đến
       <input  name="startTime2" id="startTime2" size="13" maxlength="250" value="<%=startTime2%>"/>&nbsp;<img id= "startTime2_btn" src="images/calendar.png" width="20" height="20" /></td>
     
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
<table cellpadding="0" cellspacing="0" border="0" class="display" id="tbKHThang">
	<thead >
		<tr>
		    <th width="1%">STT</th>			
			<th width="20%">Mảng yêu cầu</th>			
			<th width="20%"> Nội Dung </th>
			<th width="5%">Trạng thái</th>	
		    <th width="7%">Ngày bắt đầu</th>	
			<th width="7%">Ngày hoàn thành</th>				
			<th width="7%">Thời gian đáp ứng</br>(Số ngày)</th>
			<th width="10%">Nhân sự tiếp nhận</th>	
			<th width="10%">Tiến độ</th>				
			<th width="5%">Người tạo</th>	
			<th width="25%">Work log</th>			
			
						
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
		<td >
			<span > <%=objRS1.Fields("Id")%></span> 
		</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Mang_yeu_cau")%></span> 
			</td>
	        <td >
				<span class="comment more"> <%=objRS1.Fields("Noi_dung")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Trang_thai_yeu_cau")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Ngay_bat_dau")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Ngay_hoan_thanh")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Thoi_gian_dap_ung")%></span> 
			</td>	
			<td >
				<span class="comment more"> <%=objRS1.Fields("Nhan_su_tiep_nhan")%></span> 
			</td>	
			<td >
				<span class="comment more"> <%=objRS1.Fields("Tien_do")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Nguoi_tao")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("Work_log")%></span> 
			</td>			
							
		 	
			<td class="center" nowrap="nowrap">
			<div class="size">			
			<span type="text" name="test" class="field"><img src="images/Navigation-32.png" /></span>				
			 <ul class="list">												
				<%dim Tien_do_temp,nguoi_tao_temp,nhan_su_tiep_nhan_temp
				nhan_su_tiep_nhan_temp=objRS1.Fields("Nhan_su_tiep_nhan")
				nguoi_tao_temp=objRS1.Fields("Nguoi_tao")
				Tien_do_temp=objRS1.Fields("Tien_do")%>						
				<% IF (check_action(nguoi_tao_temp,"Cập nhật thông tin",Tien_do_temp)) then %><li><input class="btn_on_menu" type"button" value="Cập nhật thông tin" onclick="parent.location='default.asp?page=ht_rq_xuli&id=<%=id%>&stt=cho_gui_di'"></li><%End if%>	
				<% IF (check_action(nguoi_tao_temp,"Đóng yêu cầu",Tien_do_temp)) then %><li><input class="btn_on_menu" type"button" value="Đóng yêu cầu" onclick="parent.location='default.asp?page=ht_rq_xuli&id=<%=id%>&sttt=cho_dong'"></li><%End if%>
				<% IF (check_action("","Cập nhật tiến độ",Tien_do_temp)) then %><% IF (Session("username")=nhan_su_tiep_nhan_temp) then %><li><input class="btn_on_menu" type"button" value="Cập nhật tiến độ" onclick="parent.location='default.asp?page=ht_rq_xuli&id=<%=id%>'"></li><%End if%><%End if%>
				<% IF (check_action("","Tiếp nhận thực hiện",Tien_do_temp)) then %><li><input class="btn_on_menu" type"button" value="Xử lí yêu cầu" onclick="parent.location='default.asp?page=ht_rq_xuli&id=<%=id%>'"></li><%End if%>
				<% IF (check_action("","Cập nhật yêu cầu",Tien_do_temp)) then %><li><input class="btn_on_menu" type"button" value="Cập nhật yêu cầu" onclick="parent.location='default.asp?page=ht_rq_xuli&id=<%=id%>&sttt=cap_nhat_tien_do	'"></li><%End if%>
				<li><input class="btn_on_menu" type"button" value="...." ></li>
				</ul>
			</div>	
			<%'End if%>			</td>			
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
If (Session("add")="1"  and Session("usergroup")= "CNVT") Then
%>	 
	<input type="button" class="hieu_ung_nut2" name="add" value="Tạo yêu cầu" onClick="location.href='default.asp?page=ht_rq_add'" />
<%
End if
%>
    <input type="button" class="hieu_ung_nut2" name="import" value="Import" onClick="doImport();" />
   <input type="button" class="hieu_ung_nut2" name="export" value="Export to Excel" onClick="doExport();" />
</form>
</div>
<%
'Neu co export thì dung form nay
Else
	Set objRS1 = Nothing
	'Response.Write(sql)
	'Neu tai ve thi chuyen sang dinh dang excel
	Response.Buffer = True
	Response.Clear	
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=Export_congviec.xls"
	Response.Charset = "UTF-8"	
%>
<table width="100%" border="0">
  <tr>
    <td><div align="center">TRUNG TÂM KỸ THUẬT KV2</div></td>
    <td>&nbsp;</td>
    <td> <div align="center"><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</strong></div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center"><strong>PHÒNG KỸ THUẬT KHAI THÁC</strong></div></td>
    <td>&nbsp;</td>
    <td> <div align="center"><strong>Độc lập - Tự do - Hạnh phúc</strong></div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"> <div align="center">BẢNG THEO DÕI NHIỆM VỤ THÁNG</div></td>
  </tr>
  <tr>
    <td colspan="5"> <div align="center">(Từ ngày: .............. đến ngày ...................)</div></td>
  </tr>
</table>
</br>
<table border="1">
	<thead>
		<tr BGcolor=#92D050>			
			<th rowspan="2"><font face="Times New Roman">STT</font></th>
			<th rowspan="2"><font face="Times New Roman">N&#7897;i dung c&#244;ng vi&#7879;c</font></th>
			<th rowspan="2"><font face="Times New Roman">C&#259;n c&#7913; th&#7921;c hi&#7879;n</font></th>
			<th rowspan="2"><font face="Times New Roman">Chủ trì thực hiện </font></th>
			<th rowspan="2"><font face="Times New Roman">Phối hợp thực hiện </font></th>
			<th rowspan="2"><font face="Times New Roman">Ng&#224;y b&#7855;t &#273;&#7847;u</font></th>
		    <th rowspan="2"><font face="Times New Roman">Ng&#224;y k&#7871;t th&#250;c</font></th>
		    <th colspan="4"><font face="Times New Roman">Số liệu theo dõi  </font></th>		
			<th colspan="7"><font face="Times New Roman">Kết quả </font></th>			
		</tr>
		<tr BGcolor=#92D050>
		  <th>Tổng thể </th>
	      <th>Đã TH </th>
	      <th>Tồn</th>
	      <th>ĐK</th>
	      <th>Tuần 1 </th>
	      <th>Tuần 2 </th>
	      <th>Tuần 3 </th>
	      <th>Tuần 4 </th>
	      <th>Lũy kế tháng </th>
	      <th>Tổng lũy kế </th>
	      <th>Diễn giải KQ </th>
	  </tr>
	</thead>
	<tbody>	
	<tr>
		  <td align="center"><strong>A</strong></td>
		  <td colspan="17" align="left"><strong>Công việc định lượng </strong></td>
	 </tr>	
	<%
	sql1 = sql & "and typeJob='A'"	
	'Response.Write(sql)
	Set objRS1 = objConn.Execute(sql1)
	stt =  1
	While Not objRS1.EOF
	%>
	  <tr>
			<td align="center"><font face="Times New Roman"><%=stt%></font></td>				
			<td align="left" valign="top"><font face="Times New Roman"><%=replace(objRS1.Fields("content")&" ",VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("cr")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_depart")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_executer")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("startTime")%></font></td>					
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("endTime")%></font></td>			
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("total")%></font></td>	
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("done_total")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=(cint("0"&objRS1.Fields("total")) - cint("0"&objRS1.Fields("done_total")))%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("regist")%></font></td>			
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week1")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week2")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week3")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week4")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman">
			<%
			  ' Dim luykethang
			  ' luykethang =cint("0"&objRS1.Fields("week1"))+cint("0"&objRS1.Fields("week2"))+cint("0"&objRS1.Fields("week3"))+cint("0"&objRS1.Fields("week4"))
			  Response.Write(objRS1.Fields("sumMonth"))
			%></font></td>
			<td align="left" valign="top"><%=objRS1.Fields("sumtotal")%></td>
			<td align="left" valign="top"><%=replace(replace(objRS1.Fields("process")&" ",VbCrLf&VbCrLf,VbCrLf),VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></td>					
	  </tr>
	<%	
		stt =  stt + 1
		objRS1.MoveNext
		Wend 
		
	%>	
	 <tr>
		  <td align="center"><strong>B</strong></td>
		  <td colspan="17" align="left"><strong>Công việc không định lượng </strong></td>
	 </tr>	
	<%
	sql1 = sql & "and typeJob='B'"	
	'Response.Write(sql1)
	Set objRS1 = objConn.Execute(sql1)
	stt =  1
	While Not objRS1.EOF
	%>
	  <tr>
			<td align="center" valign="top"><font face="Times New Roman"><%=stt%></font></td>				
			<td align="left" valign="top"><font face="Times New Roman"><%=replace(objRS1.Fields("content")&" ",VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("cr")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_depart")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_executer")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("startTime")%></font></td>					
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("endTime")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("total")%></font></td>	
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("done_total")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("regist")%></font></td>		
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week1")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week2")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week3")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week4")%></font></td>
			<td align="left">&nbsp;</td>
			<td align="left">&nbsp;</td>
			<td align="left" valign="top"><%=replace(replace(objRS1.Fields("process")&" ",VbCrLf&VbCrLf,VbCrLf),VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></td>				
	  </tr>
	<%	
		stt =  stt + 1
		objRS1.MoveNext
		Wend 		
	%>	
	 <tr>
		  <td align="center"><strong>C</strong></td>
		  <td colspan="17" align="left"><strong>Công việc theo dõi </strong></td>
	 </tr>	
	<%
	sql1 = sql & "and typeJob='C'"	
	'Response.Write(sql)
	Set objRS1 = objConn.Execute(sql1)
	stt =  1
	While Not objRS1.EOF
	%>
	  <tr>
			<td align="center" valign="top"><font face="Times New Roman"><%=stt%></font></td>				
			<td align="left" valign="top"><font face="Times New Roman"><%=replace(objRS1.Fields("content")&" ",VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("cr")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_depart")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_executer")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("startTime")%></font></td>					
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("endTime")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("total")%></font></td>	
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("done_total")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("regist")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week1")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week2")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week3")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week4")%></font></td>
			<td align="left">&nbsp;</td>
			<td align="left">&nbsp;</td>
			<td align="left" valign="top"><%=replace(replace(objRS1.Fields("process")&" ",VbCrLf&VbCrLf,VbCrLf),VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></td>						
	  </tr>
	<%	
		stt =  stt + 1
		objRS1.MoveNext
		Wend 		
	%>	
	 <tr>
		  <td align="center"><strong>D</strong></td>
		  <td colspan="17" align="left"><strong> KLHP, KLGB, CHỈ THỊ, CHỈ ĐẠO, CÔNG VĂN…</strong></td>
	 </tr>	
	<%
	sql1 = sql & "and typeJob='D'"	
	'Response.Write(sql)
	Set objRS1 = objConn.Execute(sql1)
	stt =  1
	While Not objRS1.EOF
	%>
	  <tr>
			<td align="center" valign="top"><font face="Times New Roman"><%=stt%></font></td>				
			<td align="left" valign="top"><font face="Times New Roman"><%=replace(objRS1.Fields("content")&" ",VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("cr")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_depart")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("sub_executer")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("startTime")%></font></td>					
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("endTime")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("total")%></font></td>	
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("done_total")%></font></td>
			<td align="left" valign="top"><font face="Times New Roman"></font></td>
			<td align="left" valign="top"><font face="Times New Roman"><%=objRS1.Fields("regist")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week1")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week2")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week3")%></font></td>
			<td align="center" valign="top"><font face="Times New Roman"><%=objRS1.Fields("week4")%></font></td>
			<td align="left">&nbsp;</td>
			<td align="left">&nbsp;</td>
			<td align="left" valign="top"><%=replace(replace(objRS1.Fields("process")&" ",VbCrLf&VbCrLf,VbCrLf),VbCrLf,"<br style='mso-data-placement:same-cell;'/>")%></td>		
	  </tr>
	<%	
		stt =  stt + 1
		objRS1.MoveNext
		Wend 		
	%>	
	</tbody>	
</table>
<%
'Kết thúc điều kiện export
End if
%>