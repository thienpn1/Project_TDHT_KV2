<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
    
	'Lay gia tri search
	
	dim ten_de_xuat,nhan_su_tao,trang_thai,ke_hoach,giang_vien,dia_diem,doi_tuong,hinh_thuc,loai_danh_gia,ket_qua,objRS2,sql2,tien_do_tim_kiem
	ke_hoach= Trim(Request.Form("ke_hoach"))
	giang_vien = Trim(Request.Form("giang_vien"))
	nhan_su_tao = (Request.Form("nhan_su_tao"))
	startTime1 = (Request.Form("startTime1"))
	startTime2 = (Request.Form("startTime2"))
	tien_do_tim_kiem = Trim(Request.Form("tien_do_tim_kiem"))
	dia_diem = Trim(Request.Form("dia_diem"))
	doi_tuong = Trim(Request.Form("doi_tuong"))
	hinh_thuc = Trim(Request.Form("hinh_thuc"))
	noi_dung = Trim(Request.Form("noi_dung"))
	loai_danh_gia = Trim(Request.Form("loai_danh_gia"))
	ket_qua = Trim(Request.Form("ket_qua"))
	
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
	  "aaSorting":[],
	   bJQueryUI: true,"sPaginationType": "full_numbers",
	   "aoColumns": [ {"aaSorting":[] },{"aaSorting":[] }, {"aaSorting":[] }, {"aaSorting":[] }, {"order":[]}, {"order":[]},{"order":[]},{"order":[]},{"order":[]},{"order":[]},{"order":[]},{"order":[]},{"bSortable": false},{"bSortable": false},{"bSortable": false}]
	   
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
  function xoa_de_xuat(id_de_xuat) {
    var xhttp;
	xhttp=new XMLHttpRequest();
    if (confirm("Bạn muốn xoá bản ghi này!")) {
        xhttp.open("POST", "default.asp?page=de_xuat_xoa&id="+id_de_xuat, false);
		xhttp.send();
		location.reload();
		}
  }
  
  function diem_danh(id_de_xuat) {
    var xhttp;
	xhttp=new XMLHttpRequest();
    if (confirm("Bạn đã điểm danh khóa học này")) {
        xhttp.open("POST", "default.asp?page=diem_danh&id="+id_de_xuat, false);
		xhttp.send();
		window.location.replace("default.asp?page=de_xuat");
		}
  }
  function cap_nhat_danh_gia(id,username,ket_qua) {
    var xhttp;
	xhttp=new XMLHttpRequest();
    //if (confirm("default.asp?page=cap_nhat_danh_gia&ket_qua="+ket_qua+"&id="+id+"&username="+username)) {
    //    xhttp.open("POST", "default.asp?page=cap_nhat_danh_gia&ket_qua="+ket_qua&"&id="+id&"&username="+username, false);
	//	xhttp.send();
	//	location.reload();
	//	}
	window.location.replace('default.asp?page=cap_nhat_danh_gia&ket_qua='+ket_qua+'&id='+id+'&username='+username)
  }
  
  function doImport(){
		window.open('JOB_upload.asp','Import','width=600,height=350,left=250,top=200,screenX=100,screenY=100');
  }
  
  
</script>
  <%		
   
	dim sqlOriginal,sqlCondition
	If (Session("username")="admin") then
		sqlOriginal = "SELECT *  FROM dao_tao where  1=1"
    
	else
		sqlOriginal = "	SELECT *  FROM dao_tao where  1=1 and doi_tuong like '"&Session("phong")&"' "
	End if
	
	
   'Dieu kien tim kiem
  ' If (Mang_yeu_cau<>"-1") then
  '	 sqlCondition = sqlCondition + " and hatang_request.Mang_yeu_cau like '%"&Mang_yeu_cau&"%'"  
  ' End if
	If (nhan_su_tao<>"") then
		sqlCondition = sqlCondition + " and nhan_su_tao like '%"&nhan_su_tao&"%'"
    End if
	If (ke_hoach<>"") then
		sqlCondition = sqlCondition + " and ke_hoach like '%"&ke_hoach&"%'"
    End if
	If (giang_vien<>"") then
		sqlCondition = sqlCondition + " and giang_vien like '%"&giang_vien&"%'"
    End if
	If (tien_do_tim_kiem<>"") then
		sqlCondition = sqlCondition + " and tien_do like '%"&tien_do_tim_kiem&"%'"
    End if
	If (dia_diem<>"") then
		sqlCondition = sqlCondition + " and dia_diem like '%"&dia_diem&"%'"
    End if
	If (doi_tuong<>"") then
		sqlCondition = sqlCondition + " and doi_tuong like '%"&doi_tuong&"%'"
    End if
	If (hinh_thuc<>"") then
		sqlCondition = sqlCondition + " and hinh_thuc like '%"&hinh_thuc&"%'"
    End if
	If (noi_dung<>"") then
		sqlCondition = sqlCondition + " and noi_dung like '%"&noi_dung&"%'"  
	End if
	If (loai_danh_gia<>"") then
		sqlCondition = sqlCondition + " and loai_danh_gia like '%"&loai_danh_gia&"%'"  
	End if
	If (ket_qua<>"") then
		sqlCondition = sqlCondition + " and ket_qua like '%"&ket_qua&"%'"  
	End if
	    
    If (startTime1<>"") then
		sqlCondition = sqlCondition + " and str_to_date(start_time,'%d/%m/%Y') >= str_to_date('"&startTime1&"','%d/%m/%Y')"
    End if
    If (startTime2<>"") then
    	sqlCondition = sqlCondition + " and str_to_date(start_time,'%d/%m/%Y')  <= str_to_date('"&startTime2&"','%d/%m/%Y')"
    End if
   'Them dieu kien tim kiem theo ban
   'IF (depart = "" and Session("depart")<>"0") then 
   '   sqlCondition = sqlCondition + " and (sub_depart like '"&Session("depart")&"')"
   'Else	
	'IF (depart <> "0") then
	'	sqlCondition = sqlCondition + " and sub_depart like '%"&depart&"%'"
	'  End if	      
   'End if
	dim sql1,objRS1,stt
   sql = sqlOriginal & sqlCondition
   sql1 = sql 
   sql1 = sql1 + " ORDER BY tien_do , start_time desc  "
   
   'Response.Write(tien_do&"A")
   'Response.Write(hinh_thuc&"A")
   'Response.Write(sql1)
   
    Set objRS1 = objConn.Execute(sql1)
	'objRS1.Sort="tien_do"
    Set objRS2 = objConn.Execute(sql1)
   'Neu khong export thi dung form nay
   'objRS1.MoveNext
   If (Request.Form("isExport")<>"1") then   
  %>
<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin tìm kiếm <a href="#" class="show_hide" rel="#slidingDiv">View</a></legend>
<div id="slidingDiv">
<form id="frm_search" name="frm_search" method="post" action="">
<table width="100%" border="0"id="list_tbl" >
	<tr>
		<td><strong><img src="images/maskrow.gif" /> Nhân sự tạo:</strong></td>
		<td><input  name="nhan_su_tao" id="nhan_su_tao" size="40" maxlength="250" /></td>
		<td><strong><img src="images/maskrow.gif" /> Kế hoạch:</strong></td>
		<td><input  name="ke_hoach" id="ke_hoach" size="40" maxlength="250" /></td>
		<td><strong><img src="images/maskrow.gif" />Giảng viên:</strong></td>
		<td><input  name="giang_vien" id="giang_vien" size="40" maxlength="250" /></td>
   
		<td><strong><img src="images/maskrow.gif" />  Tiến độ:</strong></td>
		<td>
			<select name="tien_do_tim_kiem" class="dropdown" id="tien_do_tim_kiem">
				<option value="">----Lựa Chọn----</option>
				<option value="đề xuất">Đề xuất</option>
				<option value="kế hoạch">Kế hoạch </option>
				<option value="hoàn thành">Hoàn thành</option>
			</select>
		</td>
	</tr>
	
    <tr>
		<td><strong><img src="images/maskrow.gif" />Địa điểm:</strong></td>
		<td><input  name="dia_diem" id="dia_diem" size="40" maxlength="250" /></td>
		<td><strong><img src="images/maskrow.gif" />Đối tượng:</strong></td>
			<td>
			<select name="doi_tuong" id="doi_tuong">
				<option value=''>Lựa chọn</option>
				<option value='P.TDCD'>Phòng Truyền Dẫn và cơ điện</option>
				<option value='P.NOC'>Phòng NOC</option>
				<option value='TT.HK'>Tổng trạm Hòa Khánh</option>
				<option value='TT.NTH'>Tổng trạm NTH</option>
				<option value='P.TH'>Phòng Tổng hợp</option>
				<option value='P.TKTU'>Phòng TKTU</option>	
				<option value='P.IPCDBR'>Phòng IPCDBR</option>
				<option value='P.DD'>Phong Di động</option>	 
				<option value='P.TDHT'>Phong TĐHT</option>
				<option value='P.HT'>Phong Hạ tầng</option>	 
				<option value='P.VT'>Phong Vô tuyến</option>	 
				<option value='P.KSVHKT'>Phong kiểm soat VHKT </option>	
			</select>
			</td>
		<td><strong><img src="images/maskrow.gif" />Hình thức đào tạo:</strong></td>
		<td>
			<select name="hinh_thuc" class="dropdown" id="hinh_thuc">
				<option selected value="">----Lựa Chọn----</option>
				<option value="tập trung">Tập trung</option>
				<option value="đọc tài liệu">Đọc tài liệu</option>
			</select>
		</td>
		<td><strong><img src="images/maskrow.gif" /> Nội dung:<font color="red">*</font></strong></td>
		<td>
			<span class="font_inform"  id="label_INCEffect"></span>
			<textarea name="noi_dung" cols="32" rows="5" id="noi_dung" class="textarea"></textarea>
		</td>
    </tr>
	<tr>
		<td><strong><img src="images/maskrow.gif" />  Thời gian bắt đầu từ:</strong></td>
		<td><input  name="startTime1" id="startTime1" size="30" maxlength="250" value="<%=startTime1%>"/>&nbsp;<img id= "startTime1_btn" src="images/calendar.png" width="20" height="20" />	 
     &nbsp;
		<td><strong><img src="images/maskrow.gif" />  đến:</strong></td>
		<td><input name="startTime2" id="startTime2" size="30" maxlength="250" value="<%=startTime2%>"/>&nbsp;<img id="startTime2_btn" src="images/calendar.png" width="20" height="20" /></td>
	<!--<td><img src="images/maskrow.gif" />  Mảng :</td>
    <td>
		 <input name="ip" type="checkbox" id="ip" value = 0>ip
		 <input name="cdbr" type="checkbox" id="cdbr" value = 0>cdbr
		 <input name="dd" type="checkbox" id="dd" value = 0>dd	
		 <input name="td" type="checkbox" id="td" value = 0>td		
		 <input name="cd" type="checkbox" id="cd" value = 1>cd	
	</td>-->
		<td><strong><img src="images/maskrow.gif" />Loại đánh giá:</strong></td>
		<td><input  name="loai_danh_gia" id="loai_danh_gia" size="40" maxlength="250" /></td>
		<td><strong><img src="images/maskrow.gif" />Kết quả:</strong></td>
		<td><input  name="ket_qua" id="ket_qua" size="40" maxlength="250" /></td>
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
     <td colspan="10">
	 <input type="submit" class="hieu_ung_nut2" name="search" id="search"  value="Tìm kiếm"/>
	 <input type="hidden" name="isExport" id="isExport"  value="0"/>	</td>
    </tr>
</table>
</form> 
</div>
</fieldset>
<table cellpadding="0" cellspacing="0" border="1" class="display" id="tbKHThang">
	<thead >
		<tr>
		    		
			<th border="1" width="1%">STT</th>				
			<th border="1" width="5%">Nhân sự đề xuất</th>	
			<th border="1" width="7%">Kế hoạch</th>			
			<th border="1" width="20%">Nội dung</th>	
		    <th border="1" width="5%">Đối tượng</th>	
			<th border="1" width="5%">Giảng viên</th>	
			<th border="1" width="10%">Thời gian bắt đầu</th>	
			<th border="1" width="10%">Thời gian kết thúc</th>	
			<th border="1" width="5%">Địa điểm</th>	
			<th border="1" width="5%">Hình thức</th>	
			<th border="1" width="5%">Loại đánh giá</th>	
			<th border="1" width="5%">Tiến độ</th>
			<th border="1" width="5%">Kết quả</th>	
			<th border="1" width="5%">Điểm danh</th>	
			<th border="1" width="1%">Menu</th>
			
			<!--<th width="9%">Thuộc mảng IP</th>	
			<th width="9%">Thuộc mảng CDBR</th>				
			<th width="9%">Thuộc mảng DD</th>	
			<th width="9%">Thuộc mảng TD</th>
			<th width="9%">Thuộc mảng CĐ</th>	-->
			 
		</tr>
	</thead>
	<tbody>
	<%
	
	stt = 1
	
	While Not objRS1.EOF
	   id = objRS1.Fields("id")
	%>
	
	
			<% dim tien_do1
			tien_do1=objRS1.Fields("tien_do")
			IF (tien_do1="kế hoạch") then 
			%>
			<tr style="background-color:white" id="<%=id%>">
					<% end if 			%>
		
			<% dim tien_do2
			tien_do1=objRS1.Fields("tien_do")
			IF (tien_do1="đề xuất") then 
			%>
			<tr style="background-color:yellow" id="<%=id%>">
					<% end if 			%>		

			<% dim tien_do3
			tien_do1=objRS1.Fields("tien_do")
			IF (tien_do1="đóng") then 
			%>
			<tr style="background-color:orange" id="<%=id%>">
					<% end if 			%>		
		
		<%
			dim sql_count,objRS_dem,dem_diem_danh,so_hang
			sql_count = "	SELECT COUNT(*) as DEM FROM diem_danh_dao_tao WHERE id_from_dao_tao='"&id&"'"
			Set objRS_dem = objConn.Execute(sql_count)
			dem_diem_danh=(objRS_dem.Fields("DEM"))
			'Response.Write("<br>ID:"&id)
			'Response.Write("<br>SL:"&dem_diem_danh)
			IF (dem_diem_danh="0") then
				so_hang="1"
			else
				so_hang=dem_diem_danh
			end if
			
		%>
		
		<td >
			<span > <%=objRS1.Fields("id")%></span> 
		</td >
			<td >
				<span class="comment more"> <%=objRS1.Fields("nguoi_tao")%></span> 
			</td>
	        <td >
				<span class="comment more"> <%=objRS1.Fields("ke_hoach")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("noi_dung")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("doi_tuong")%></span> 
			</td>
			<td >
				<%giang_vien=objRS1.Fields("giang_vien")%>
				<span class="comment more"> <%=giang_vien%></span> 
			</td>	
			<td >
				
					
				<span class="comment more"> <%=objRS1.Fields("start_time")%></span>
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("end_time")%></span>
				
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("dia_diem")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("hinh_thuc")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS1.Fields("loai_danh_gia")%></span> 
			</td>
			<td >
				<%tien_do=objRS1.Fields("tien_do")%>
				<span class="comment more"> <%=tien_do%></span> 
			</td>
			<%
				IF (dem_diem_danh<>"0") then
					dim sql_diem_danh,objRS_diem_danh,objConn2
					sql_diem_danh = "SELECT * FROM diem_danh_dao_tao WHERE id_from_dao_tao='"&id&"'"
					Set objRS_diem_danh = objConn.Execute(sql_diem_danh)
					
			%>
			
				<td style="padding-left: 0px;padding-right: 0px;" >
					<div>
					<table id="danh_gia" border="1" >
						<tbody>
			<%
				'objRS_diem_danh.MoveNext
				While Not objRS_diem_danh.EOF
					
			%>
			<%
				username=Session("username")
				giang_vien=objRS1.Fields("giang_vien")
				
				dim disable,hidden,username_diemdanh,danh_gia_default,danh_gia_hidden
				danh_gia_hidden=objRS_diem_danh.Fields("result")
				username_diemdanh=objRS_diem_danh.Fields("username")
				hidden=iff(username=giang_vien,"","hidden")
				disable=iff(username=giang_vien and tien_do="kế hoạch","","disabled")
				danh_gia_default=iff(danh_gia_hidden="","Đạt",objRS_diem_danh.Fields("result"))
				
				
				
			%>
					<tr rowspan="<%=so_hang%>" >
						<td colspan="2" style="min-width: 90px;" >
							<%
								username_diemdanh=objRS_diem_danh.Fields("username")
								
							%>
							<%=username_diemdanh%>
						</td>	
						<td style="max-width: 90px;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;" >
					
							<select onchange="cap_nhat_danh_gia('<%=id%>','<%=username_diemdanh%>',this.value)" name="<%=objRS_diem_danh.Fields("username")&id%>"  <%=disable%> id="<%=objRS_diem_danh.Fields("username")&id%>" >
								<%=lay_danh_gia(danh_gia_hidden)%>
							</select>	
						</td>	
						
					</tr>	
					
			
			<%	
					objRS_diem_danh.MoveNext
					'stt =  stt + 1
				Wend 
				objRS_diem_danh.Close
				Set objRS_diem_danh = Nothing
				
			%>	
						</tbody>
					</table>
					</div>
				
				</td>
			<%else%>
					<td style="padding-left: 0px;padding-right: 0px;" >
						
					</td>
			<%end if%>
			<td >
				<%
				  dim sql_22,objRS22,dem3
				  nguoi_tao=objRS1.Fields("nguoi_tao")
				  id=objRS1.Fields("id")
				  sql_22="SELECT COUNT(*) as dem FROM diem_danh_dao_tao where id_from_dao_tao='"&id&"' and username ='"&Session("username")&"'"
				  'Response.Write(sql2)
				  Set objRS22 = objConn.Execute(sql_22)
				  
				  
				  dem3=objRS22.Fields("dem")
				'Response.Write(dem)
				  
				%>
				<% IF (tien_do="kế hoạch" and  dem3="0") then %><input type="button" class="hieu_ung_nut2" name="Điểm danh" value="Điểm danh" onClick="diem_danh(<%=id%>)" />
				<%
					End if
					objRS22.Close
					Set objRS22 = Nothing
				%>
				
			</td>
			<td  class="center" nowrap="nowrap">
				<div class="size">			
				<span type="text" name="test" class="field"><img src="images/Navigation-32.png" /></span>				
				<ul class="list">	
					
					
					<% IF (Session("username")="admin" and (tien_do="đề xuất" or tien_do="kế hoạch")) then %><li><input class="btn_on_menu" type"button" value="Xoá" onclick="xoa_de_xuat(<%=id%>)"></li><%End if%> 
					<% IF ((nguoi_tao=Session("username") or Session("username")="admin" ) and tien_do="đề xuất" ) then %><li><input class="btn_on_menu" type"button" value="Sửa đề xuất" onclick="parent.location='default.asp?page=de_xuat_edit&id=<%=id%>'"></li><%End if%>	
					<% IF (tien_do="đề xuất") then %><li><input class="btn_on_menu" type "button" value="Tạo kế hoạch" onclick="parent.location='default.asp?page=ke_hoach_add&id=<%=id%>'"></li><%End if%>
					<% IF (tien_do="kế hoạch" and username ="admin" or username = giang_vien) then %><li><input class="btn_on_menu" type "button" value="Đóng kế hoạch" onclick="parent.location='default.asp?page=de_xuat_dong&id=<%=id%>&tstart=<%=objRS1.Fields("start_time")%>&tend=<%=objRS1.Fields("end_time")%>'"></li><%End if%>
					
	
	
					<li><input class="btn_on_menu" type"button" value="...." ></li>
					</ul>
				</div>	
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
		<input type="button" class="hieu_ung_nut2" name="add" value="Tạo đề xuất" onClick="location.href='default.asp?page=de_xuat_add'" />
		<input type="button" class="hieu_ung_nut2" name="add" value="Tạo kế hoạch" onClick="location.href='default.asp?page=ke_hoach_add&id=null'" />
		<!--<input type="button" class="hieu_ung_nut2" name="import" value="Import" onClick="doImport();" />-->
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
    <td><div align="center"><strong>PHÒNG .......</strong></div></td>
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
    <td colspan="5"> <div align="center">BẢNG TỔNG HỢP ĐÀO TẠO THÁNG</div></td>
  </tr>
  <tr>
    <td colspan="5"> <div align="center">(Từ ngày: .............. đến ngày ...................)</div></td>
  </tr>
</table>
</br>
<table border="1">
	<thead>
		<tr BGcolor=#92D050>			
			<th border="1" width="1%">STT</th>				
			<th border="1" width="5%">Nhân sự đề xuất</th>	
			<th border="1" width="7%">Kế hoạch</th>			
			<th border="1" width="20%">Nội dung</th>	
		    <th border="1" width="5%">Đối tượng</th>	
			<th border="1" width="5%">Giảng viên</th>	
			<th border="1" width="10%">Thời gian bắt đầu</th>	
			<th border="1" width="10%">Thời gian kết thúc</th>	
			<th border="1" width="5%">Địa điểm</th>	
			<th border="1" width="5%">Hình thức</th>	
			<th border="1" width="5%">Loại đánh giá</th>	
			<th border="1" width="5%">Tiến độ</th>
			<th border="1" width="5%">Kết quả</th>	
			<th border="1" width="5%">Thời Lương</th>
		</tr>
		
	</thead>
	<tbody>
	<%
	
	stt = 1
	
	While Not objRS2.EOF
	   id = objRS2.Fields("id")
	%>
		<tr id="<%=id%>">
		<%
			sql_count = "	SELECT COUNT(*) as DEM FROM diem_danh_dao_tao WHERE id_from_dao_tao='"&id&"'"
			Set objRS_dem = objConn.Execute(sql_count)
			dem_diem_danh=(objRS_dem.Fields("DEM"))
			'Response.Write("<br>ID:"&id)
			'Response.Write("<br>SL:"&dem_diem_danh)
			IF (dem_diem_danh="0") then
				so_hang="1"
			else
				so_hang=dem_diem_danh
			end if
			
		%>
		
		<td >
			<span > <%=objRS2.Fields("id")%></span> 
		</td >
			<td >
				<span class="comment more"> <%=objRS2.Fields("nguoi_tao")%></span> 
			</td>
	        <td >
				<span class="comment more"> <%=objRS2.Fields("ke_hoach")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("noi_dung")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("doi_tuong")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("giang_vien")%></span> 
			</td>	
			<td >
				
					
				<span class="comment more"> <%=objRS2.Fields("start_time")%></span>
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("end_time")%></span>
				
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("dia_diem")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("hinh_thuc")%></span> 
			</td>
			<td >
				<span class="comment more"> <%=objRS2.Fields("loai_danh_gia")%></span> 
			</td>
			<td >
				<%tien_do=objRS2.Fields("tien_do")%>
				<span class="comment more"> <%=tien_do%></span> 
			</td>
			<%
				IF (dem_diem_danh<>"0") then
					sql_diem_danh = "SELECT * FROM diem_danh_dao_tao WHERE id_from_dao_tao='"&id&"'"
					Set objRS_diem_danh = objConn.Execute(sql_diem_danh)
					
			%>
			
				<td >
					<div>
					<table id="danh_gia" border="1" >
						<tbody>
			<%
				'objRS_diem_danh.MoveNext
				While Not objRS_diem_danh.EOF
					
			%>
			<%
				username=Session("username")
				giang_vien=objRS2.Fields("giang_vien")
				
				
				danh_gia_hidden=objRS_diem_danh.Fields("result")
				username_diemdanh=objRS_diem_danh.Fields("username")
				hidden=iff(username=giang_vien,"","hidden")
				disable=iff(username=giang_vien and tien_do="kế hoạch","","disabled")
				danh_gia_default=iff(danh_gia_hidden="","Đạt",objRS_diem_danh.Fields("result"))
				
				
				
			%>
					<tr rowspan="<%=so_hang%>" >
						<td colspan="2" >
							<%
								username_diemdanh=objRS_diem_danh.Fields("username")
								
							%>
							<span ><%=username_diemdanh%></span> 
						</td>	
						<td>
					
							<span ><%=danh_gia_hidden%></span> 
						</td>	
						
					</tr>	
					
			
			<%	
					objRS_diem_danh.MoveNext
					'stt =  stt + 1
				Wend 
				objRS_diem_danh.Close
				Set objRS_diem_danh = Nothing
				
			%>	
						</tbody>
					</table>
					</div>
				
				</td>
			<%else%>
					<td >
						<div>
						<table id="danh_gia" border="1" >
							<tbody>
							<tr>
								<td colspan="2">
									<span size="10"></span> 
								</td>	
								<td>
									.......
								</td>	
						</tr>	
						</tbody>
						</table>
						</div>
					</td>
			<%end if%>
			
			<td >
				<span class="comment more"> <%=objRS2.Fields("thoi_luong")%></span> 
			</td>
		 	
					
		</tr>
		
	<%	
		objRS2.MoveNext
		stt =  stt + 1
		Wend 
		objRS2.Close
		Set objRS2 = Nothing
		objConn.Close
		Set objConn = Nothing
	%>	
	</tbody>	
		
</table>
<%
'Kết thúc điều kiện export
End if
%>