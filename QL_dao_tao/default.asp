<%
'************************************************
' Code by NguyenTD - 25/06/2012
' Main page
'************************************************
 Option Explicit
 Response.CharSet = "UTF-8" 
 session.CodePage=65001 %>

<!--#Include file = "db_common.asp"-->
<!--#Include file = "db_connect.asp"-->
<!--#Include file = "common.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK REL="shortcut icon"  HREF="images/favicon.ico"  type="image/x-icon">
	<title>Phần mềm Quản lý đào tạo</title>
	<link href="css/index.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css" media="screen">
			@import "media/css/site_jui.ccss";
			@import "media/css/demo_table_jui.css";
			@import "media/css/themes/base/jquery-ui.css";
			.dataTables_info { padding-top: 0; }
			.dataTables_paginate { padding-top: 0; }
			.css_right { float: right; }			
	</style>		
	<script type="text/javascript" src="media/js/complete.js"></script>
	<script src="media/js/jquery.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="media/js/jquery.dataTables.editable.js"></script>
	<script src="media/js/jquery.jeditable.js" type="text/javascript"></script>
	<script src="media/js/jquery-ui.js" type="text/javascript"></script>
	<script src="media/js/jquery.validate.js" type="text/javascript"></script>
	<script src="js/moment.js" type="text/javascript"></script>
	<script src="js/showHide.js" type="text/javascript"></script>
	<!--Giao dien table moi-->
	<link rel="stylesheet" media="all" type="text/css" href="js/cal/jquery-ui_.css"/>
	<!--Validation-->
	<script type="text/javascript" src="js/validation.js"></script>
	<!--JSCal-->
	<!--<link rel="stylesheet" type="text/css" href="JSCal/datetimepicker-master/jquery.datetimepicker.css"/ >
	<script src="JSCal/datetimepicker-master/jquery.js"></script>
	<script src="JSCal/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script> -->
	<script src="JSCal/js/jscal2.js"></script>
    <script src="JSCal/js/lang/en.js"></script>
    <link rel="stylesheet" type="text/css" href="JSCal/css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="JSCal/css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="JSCal/css/steel/steel.css" /> 
	
	<style>
	#slidingDiv{
		display:none;
	}
	</style>
	<!-- Multiline prompt -->	
	<script src="js/jAlerts/jquery.ui.draggable.js" type="text/javascript"></script>
	<script src="js/jAlerts/jquery.alerts.js" type="text/javascript"></script>
	<link  href="js/jAlerts/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />	
	
	<!-- msgbox-tutq08062013 -->
	<link rel="stylesheet" type="text/css" href="js/msgbox/javascript/msgbox/msgBoxLight.css" />
    <script type="text/javascript" src="js/msgbox/javascript/msgbox/jquery.msgBox.js"></script>	
	
	<!-- Notify -->
	<link href="js/notify/style/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/notify/js/notification.js"></script>
</head>
<body>
<script type='text/javascript'>
//window.onload = detectarCarga;
//function detectarCarga() {
//document.getElementById("imgLOAD").style.display="none";
//}
<%If (Session("password")="qaz123") then%>
  //alert ("Yêu cầu đổi mật khẩu trước khi tiếp tục !")
<%End if%>
</script>
<%
Session("isOldInc") = Request.QueryString("isOldInc")
strPage = Request.QueryString("page")
%>
<div class="all">
  <div class="above">
  	<div class="menu">
   	  <div class="menu_parent">
      	<ul>
		
		        	<li <%=iff(strPage="home","id='current'","home")%>><a href='default.asp?page=home'><span>Trang chủ</span></a></li>
        	<li <%=iff(InStr(1,strPage,"de_xuat"),"id='current'","")%>><a href="default.asp?page=de_xuat"><span>Quản lý đào tạo</span></a></li> 
			<% If (Session("username")="admin" or Session("username")="binhpn" ) then %>
				<li id="quan_tri" ><a href="default.asp?page=admin"><span>Quản trị</span></a></li>
			<%End if %> 
		</ul>
      </div>	  
	  <div align= right class="info" >
		<table border="0">
		<tr>
		  <%If(Session("isLogin")) then%>			
			<td align="center"><img src="images/profile.png"  width="20" height="20"/></td>
			<td><a href="default.asp?page=profile"><%=Session("fullname")%></a></td>
			
			<td><img src="images/logout.png"  width="20" height="20"/></td>
			<td align="center"><a href='default.asp?page=logout'>Thoát</a></td>
		  <%End if%>
		</tr>
		</table>&nbsp;&nbsp;
	  </div>	     
  	</div>
  </div>
  <div class="bar">
  </div> 
  <fieldset class="Khung1">
  <div class="content">
     <!--#Include File = "main.asp"-->
  </div>
  </fieldset>
  <div class="bottom_def">  
	  <p>@Copyright Phòng Tác Động Hệ Thống- TTKTKV2</p>	  
  </div> 
</div>	  
<% 
'Chi dung cho trang su co, khong dung cho su co ton
IF (Session("isOldInc")="") then 
%>
<input type="hidden" name="newINC" id="newINC"  value="0"/>   
<script type="text/javascript">


$(document).ready(function () {
	$('.button').click(function () {
		$('.notification').removeClass('hide').addClass('hide').removeClass('visible');
		$('.notification.' + $(this).attr('id') + '').notify({ type: $(this).attr('id') });
	});
});
</script>
<%End iF%>
</body>
</html>