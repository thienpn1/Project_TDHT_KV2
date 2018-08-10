<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("add")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
' Lay thong tin cong viec
	id = Request.QueryString("id")
	sql = "SELECT * FROM tien_do_ha_tang WHERE id = '"& id &"'"
		'Response.Write(sql)
    Set objRS = objConn.Execute(sql)
	If (Not objRS.EOF) then

'--------------------------------------------
   ' Dim  cr, mailTitle, executer, problems, reportType, note, fileAtt
	'content = pdb(Server.HTMLEncode(Request.Form("content")))	
	'cr= pdb(Server.HTMLEncode(Request.Form("cr")))	
	'sub_depart = pdb(Server.HTMLEncode(Request.Form("sub_depart")))		
	'startTime = convert2SimpleDateSQL(Request.Form("startTime"))
	'endTime = convert2SimpleDateSQL(Request.Form("endTime"))
	'ask = pdb(Server.HTMLEncode(Request.Form("ask")))	
	'PROCESS = pdb(Server.HTMLEncode(Request.Form("PROCESS")))
	'PROCESS = replace(PROCESS,"{","<strong>")
	'PROCESS = replace(PROCESS,"}","</strong>")
	'total = Request.Form("total")
	'done_total = Request.Form("done_total")
	'regist = Request.Form("regist")	
	'typejob = Request.Form("typejob")
	'direct = pdb(Server.HTMLEncode(Request.Form("direct")))		
	'direct = replace(direct,"{","<strong>")
	'direct = replace(direct,"}","</strong>")	
	'note = pdb(Server.HTMLEncode(Request.Form("note")))		
	dim checkbox,sql_log
	Tinh = Request.Form("Tinh")
    Ma_nha_tram = Request.Form("Ma_nha_tram")
    Ma_tram = Request.Form("Ma_tram")
    Ma_cong_trinh = Request.Form("Ma_cong_trinh")
    DVTC = Request.Form("DVTC")
    Loai_tram_TM_DD = Request.Form("Loai_tram_TM_DD")
    Dia_hinh = Request.Form("Dia_hinh")
    Loai_cot = Request.Form("Loai_cot")
    Do_cao_cot = Request.Form("Do_cao_cot")
    Loai_nha = Request.Form("Loai_nha")
    Target_phat_song_ngay	 = Request.Form("Target_phat_song_ngay")
    Target_xong_mong_cot	 = Request.Form("Target_xong_mong_cot")
    Target_xong_cot	 = Request.Form("Target_xong_cot")
    Target_xong_nha	 = Request.Form("Target_xong_nha")
    Ke_hoach_thang	 = Request.Form("Ke_hoach_thang")
    Ngay_BGMB	 = Request.Form("Ngay_BGMB")
    Ngay_cap_Bulong_mong	 = Request.Form("Ngay_cap_Bulong_mong")
    Thoi_gian_giam_tru_truoc_KC	 = Request.Form("Thoi_gian_giam_tru_truoc_KC")
    Nguyen_nhan_cha_QHKC	 = Request.Form("Nguyen_nhan_cha_QHKC")
    Nguyen_nhan_con_QHKC	 = Request.Form("Nguyen_nhan_con_QHKC")
    Qua_han_khoi_cong	 = Request.Form("Qua_han_khoi_cong")
    Ngay_khoi_cong	 = Request.Form("Ngay_khoi_cong")
    Ngay_xong_mong_cot	 = Request.Form("Ngay_xong_mong_cot")
    Qua_han_xong_MC	 = Request.Form("Qua_han_xong_MC")
    Nguyen_nhan_cha_QHMC	 = Request.Form("Nguyen_nhan_cha_QHMC")
    Nguyen_nhan_con_QHMC	 = Request.Form("Nguyen_nhan_con_QHMC")
    Ngay_cap_cot	 = Request.Form("Ngay_cap_cot")
    Ngay_xong_cot	 = Request.Form("Ngay_xong_cot")
    Qua_han_xong_cot	 = Request.Form("Qua_han_xong_cot")
    Nguyen_nhan_cha_QHXC	 = Request.Form("Nguyen_nhan_cha_QHXC")
    Nguyen_nhan_con_QHXC	 = Request.Form("Nguyen_nhan_con_QHXC")
    Ngay_cap_nha_cont	 = Request.Form("Ngay_cap_nha_cont")
    Ngay_xong_nha	 = Request.Form("Ngay_xong_nha")
    Qua_han_xong_nha	 = Request.Form("Qua_han_xong_nha")
    Nguyen_nhan_cha_QHXN	 = Request.Form("Nguyen_nhan_cha_QHXN")
    Nguyen_nhan_con_QHXN	 = Request.Form("Nguyen_nhan_con_QHXN")
    Ngay_cap_tb	 = Request.Form("Ngay_cap_tb")
    Ngay_lap_xong_tb	 = Request.Form("Ngay_lap_xong_tb")
    Target_lap_tb_ngay	 = Request.Form("Target_lap_tb_ngay")
    Qua_han_lap_xong_tb	 = Request.Form("Qua_han_lap_xong_tb")
    Nguyen_nhan_cha_QHTB	 = Request.Form("Nguyen_nhan_cha_QHTB")
    Nguyen_nhan_con_QHTB	 = Request.Form("Nguyen_nhan_con_QHTB")
    Target_xong_dien_ngay	 = Request.Form("Target_xong_dien_ngay")
    Ngay_xong_dien	 = Request.Form("Ngay_xong_dien")
	Qua_han_lap_xong_dien	 = Request.Form("Qua_han_lap_xong_dien")
	Nguyen_nhan_cha_QHXD	 = Request.Form("Nguyen_nhan_cha_QHXD")
    Nguyen_nhan_con_QHXD	 = Request.Form("Nguyen_nhan_con_QHXD")
    Target_xong_quang	 = Request.Form("Target_xong_quang")
    Ngay_xong_quang	 = Request.Form("Ngay_xong_quang")
	Nguyen_nhan_cha_QHXQ	 = Request.Form("Nguyen_nhan_cha_QHXQ")
    Nguyen_nhan_con_QHXQ	 = Request.Form("Nguyen_nhan_con_QHXQ")
    Ngay_ps	 = Request.Form("Ngay_ps")
    Trang_thai_ps	 = Request.Form("Trang_thai_ps")
    Nguyen_nhan_cha_QHPS	 = Request.Form("Nguyen_nhan_cha_QHPS")
    Nguyen_nhan_con_QHPS	 = Request.Form("Nguyen_nhan_con_QHPS")
    Time_thi_cong_ht	 = Request.Form("Time_thi_cong_ht")
    Time_giam_tru	 = Request.Form("Time_giam_tru")
    Time_thi_cong_sau_gt	 = Request.Form("Time_thi_cong_sau_gt")
    Tinh_trang	 = Request.Form("Tinh_trang")
    Tram_uu_tien	 = Request.Form("Tram_uu_tien")
    Ngay_pd_vtri_tram	 = Request.Form("Ngay_pd_vtri_tram")
    CV_phe_duyet_vtri_tram	 = Request.Form("CV_phe_duyet_vtri_tram")
    Ghi_chu	 = Request.Form("Ghi_chu")	
	Tram_dang_thi_cong	 = Request.Form("Tram_dang_thi_cong")
	Tram_dung_thi_cong_do_vuong	 = Request.Form("Tram_dung_thi_cong_do_vuong")
	Co_doi_xay_dung_trong_ngay	 = Request.Form("Co_doi_xay_dung_trong_ngay")
	Co_doi_dung_cot_trong_ngay	 = Request.Form("Co_doi_dung_cot_trong_ngay")
	Co_doi_lap_thiet_bi_trong_ngay	 = Request.Form("Co_doi_lap_thiet_bi_trong_ngay")
	checkbox=Request.Form("checkbox")
	
	
	'Response.Write(sql)
	IF ((checkbox<>"") and (Ma_nha_tram<>"") and (Ma_tram<>"") and (Tinh<>"")) then
		sql = " UPDATE tien_do_ha_tang SET "&_
				"Tinh = '"&Tinh&"' , "&_
				"Ma_nha_tram = '"&Ma_nha_tram&"' , "&_
				"Ma_tram = '"&Ma_tram&"' , "&_
				"Ma_cong_trinh = '"&Ma_cong_trinh&"' , "&_
				"DVTC = '"&DVTC&"' , "&_
				"Loai_tram_TM_DD = '"&Loai_tram_TM_DD&"' , "&_
				"Dia_hinh = '"&Dia_hinh&"' , "&_
				"Loai_cot = '"&Loai_cot&"' , "&_
				"Do_cao_cot = '"&Do_cao_cot&"' , "&_
				"Loai_nha = '"&Loai_nha&"' , "&_
				"Target_phat_song_ngay = '"&Target_phat_song_ngay&"' , "&_
				"Target_xong_mong_cot = '"&Target_xong_mong_cot&"' , "&_
				"Target_xong_cot = '"&Target_xong_cot&"' , "&_
				"Target_xong_nha = '"&Target_xong_nha&"' , "&_
				"Ke_hoach_thang = '"&Ke_hoach_thang&"' , "&_
				"Ngay_BGMB = '"&Ngay_BGMB&"' , "&_
				"Ngay_cap_Bulong_mong = '"&Ngay_cap_Bulong_mong&"' , "&_
				"Thoi_gian_giam_tru_truoc_KC = '"&Thoi_gian_giam_tru_truoc_KC&"' , "&_
				"Nguyen_nhan_cha_QHKC = '"&Nguyen_nhan_cha_QHKC&"' , "&_
				"Nguyen_nhan_con_QHKC = '"&Nguyen_nhan_con_QHKC&"' , "&_
				"Qua_han_khoi_cong = '"&Qua_han_khoi_cong&"' , "&_
				"Ngay_khoi_cong = '"&Ngay_khoi_cong&"' , "&_
				"Ngay_xong_mong_cot = '"&Ngay_xong_mong_cot&"' , "&_
				"Qua_han_xong_MC = '"&Qua_han_xong_MC&"' , "&_
				"Nguyen_nhan_cha_QHMC = '"&Nguyen_nhan_cha_QHMC&"' , "&_
				"Nguyen_nhan_con_QHMC = '"&Nguyen_nhan_con_QHMC&"' , "&_
				"Ngay_cap_cot = '"&Ngay_cap_cot&"' , "&_
				"Ngay_xong_cot = '"&Ngay_xong_cot&"' , "&_
				"Qua_han_xong_cot = '"&Qua_han_xong_cot&"' , "&_
				"Nguyen_nhan_cha_QHXC = '"&Nguyen_nhan_cha_QHXC&"' , "&_
				"Nguyen_nhan_con_QHXC = '"&Nguyen_nhan_con_QHXC&"' , "&_
				"Ngay_cap_nha_cont = '"&Ngay_cap_nha_cont&"' , "&_
				"Ngay_xong_nha = '"&Ngay_xong_nha&"' , "&_
				"Qua_han_xong_nha = '"&Qua_han_xong_nha&"' , "&_
				"Nguyen_nhan_cha_QHXN = '"&Nguyen_nhan_cha_QHXN&"' , "&_
				"Nguyen_nhan_con_QHXN = '"&Nguyen_nhan_con_QHXN&"' , "&_
				"Ngay_cap_tb = '"&Ngay_cap_tb&"' , "&_
				"Ngay_lap_xong_tb = '"&Ngay_lap_xong_tb&"' , "&_
				"Target_lap_tb_ngay = '"&Target_lap_tb_ngay&"' , "&_
				"Qua_han_lap_xong_tb = '"&Qua_han_lap_xong_tb&"' , "&_
				"Nguyen_nhan_cha_QHTB = '"&Nguyen_nhan_cha_QHTB&"' , "&_
				"Nguyen_nhan_con_QHTB = '"&Nguyen_nhan_con_QHTB&"' , "&_
				"Target_xong_dien_ngay = '"&Target_xong_dien_ngay&"' , "&_
				"Ngay_xong_dien = '"&Ngay_xong_dien&"' , "&_
				"Qua_han_lap_xong_dien = '"&Qua_han_lap_xong_dien&"' , "&_
				"Nguyen_nhan_cha_QHXD = '"&Nguyen_nhan_cha_QHXD&"' , "&_
				"Nguyen_nhan_con_QHXD = '"&Nguyen_nhan_con_QHXD&"' , "&_
				"Target_xong_quang = '"&Target_xong_quang&"' , "&_
				"Ngay_xong_quang = '"&Ngay_xong_quang&"' , "&_
				"Nguyen_nhan_cha_QHXQ = '"&Nguyen_nhan_cha_QHXQ&"' , "&_
				"Nguyen_nhan_con_QHXQ = '"&Nguyen_nhan_con_QHXQ&"' , "&_
				"Ngay_ps = '"&Ngay_ps&"' , "&_
				"Trang_thai_ps = '"&Trang_thai_ps&"' , "&_
				"Nguyen_nhan_cha_QHPS = '"&Nguyen_nhan_cha_QHPS&"' , "&_
				"Nguyen_nhan_con_QHPS = '"&Nguyen_nhan_con_QHPS&"' , "&_
				"Time_thi_cong_ht = '"&Time_thi_cong_ht&"' , "&_
				"Time_giam_tru = '"&Time_giam_tru&"' , "&_
				"Time_thi_cong_sau_gt = '"&Time_thi_cong_sau_gt&"' , "&_
				"Tinh_trang = '"&Tinh_trang&"' , "&_
				"Tram_uu_tien = '"&Tram_uu_tien&"' , "&_
				"Ngay_pd_vtri_tram = '"&Ngay_pd_vtri_tram&"' , "&_
				"CV_phe_duyet_vtri_tram = '"&CV_phe_duyet_vtri_tram&"' , "&_
				"Tram_dang_thi_cong = '"&Tram_dang_thi_cong&"' , "&_
				"Tram_dung_thi_cong_do_vuong = '"&Tram_dung_thi_cong_do_vuong&"' , "&_
				"Co_doi_xay_dung_trong_ngay = '"&Co_doi_xay_dung_trong_ngay&"' , "&_
				"Co_doi_dung_cot_trong_ngay = '"&Co_doi_dung_cot_trong_ngay&"' , "&_
				"Co_doi_lap_thiet_bi_trong_ngay = '"&Co_doi_lap_thiet_bi_trong_ngay&"' , "&_
				"Ghi_chu = '"&Ghi_chu&"'"&_

				" WHERE id = '"& id &"'"
		sql_log="INSERT INTO log_action(user, action, Time) VALUES ('"&Session("username")&"','cập nhật "&Ma_nha_tram&"','"&getCurrentDateTime()&"')"
		'Response.Write(sql)
		'Response.Write(sql_log)
		
		
		Set objRS = objConn.Execute(sql)
		objConn.Execute(sql_log)
		Response.Redirect("default.asp?page=JOB_list")
	End if

%>
<style>
<!--
.font_alert {color: #FF0000 ; font-style: italic;}
.font_inform {color: #000066 ;}
-->
</style>
<script type="text/javascript" language="javascript">
var ngay_moc,ngay_khoi_cong,b;
window.onload = function(){
	var Ngay_BGMB =document.getElementById("Ngay_BGMB").value;
	var Ngay_cap_Bulong_mong =document.getElementById("Ngay_cap_Bulong_mong").value;
	var ngay_hom_nay=moment(moment(), "DD-MM-YYYY");
	
	var a = moment(Ngay_BGMB, "DD-MM-YYYY");
	var d = moment(Ngay_cap_Bulong_mong, "DD-MM-YYYY");
	if (a.isValid() && d.isValid()  ) 
		{
			document.getElementById("Ngay_khoi_cong").disabled = false;
		}
	else 
		{
			document.getElementById("Ngay_khoi_cong").disabled = true;
		
		}
  
    tudong_hienthi_ngay_moc();
	tudong_hienthi_thoi_gian_tc();
};
function validateFormOnSubmit() {

  var content= document.getElementById("content")
		if (content.value=="") 
		{	document.getElementById("for_content").innerHTML= "Chưa nhập nội dung công việc";
			content.focus();
			return false;
		}

  var executer= document.getElementById("executer")
		if (executer.value=="") 
		{	document.getElementById("for_executer").innerHTML= "Chưa nhập nhân sự thực hiện";
			executer.focus();
			return false;
		}
		
 var startTime= document.getElementById("startTime")
		if (startTime.value=="") 
		{	document.getElementById("for_startTime").innerHTML= "Chưa nhập thời gian";
			startTime.focus();
			return false;
		}
		if (!isDate(startTime.value)) 
		{			   
			document.getElementById("for_startTime").innerHTML= "Sai định dạng (dd/mm/yyyy)";
			startTime.focus();
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
 
 
 function tudong_hienthi_ngay_moc(){
	var Ngay_BGMB =document.getElementById("Ngay_BGMB").value;
	var Ngay_cap_Bulong_mong =document.getElementById("Ngay_cap_Bulong_mong").value;
	var Ngay_xong_mong_cot =document.getElementById("Ngay_xong_mong_cot").value;
	var Ngay_khoi_cong =document.getElementById("Ngay_khoi_cong").value;
	var ngay_hom_nay=moment(moment(), "DD-MM-YYYY");
	
	var a = moment(Ngay_BGMB, "DD-MM-YYYY");
	var b = moment(Ngay_khoi_cong, "DD-MM-YYYY");
	var c = moment(Ngay_xong_mong_cot, "DD-MM-YYYY");
	var d = moment(Ngay_cap_Bulong_mong, "DD-MM-YYYY");
	if (a.isValid() && d.isValid()  ) 
	{
		if (moment(a).isSameOrBefore(d))
			{
				ngay_moc=d;
			}
		else 
			{
				ngay_moc=a;
			}
		//var x = b.diff(a, 'days') ;
		var moc="Sau 7 ngày kể từ Ngày :"+ngay_moc.get('date')+"-"+(ngay_moc.get('month')+1)+"-"+ngay_moc.get('year')+" phải thực hiện khởi công nhà trạm";
		window.alert(moc);
		//document.getElementById("Ngay_khoi_cong").value="";
		document.getElementById("Ngay_khoi_cong").disabled = false;
		if (b.isValid()  ) 
			{
				//document.getElementById("Ngay_khoi_cong").value="";
				document.getElementById("Ngay_khoi_cong").disabled = true;
			}
	}
	else {
		document.getElementById("Ngay_khoi_cong").value="Chưa có ngày BGMB hoặc ngày cấp bulong móng";
		document.getElementById("Ngay_khoi_cong").disabled = true;
	
	}
  
  
}

function tudong_hienthi_QHKC(){
	//var Ngay_BGMB =document.getElementById("Ngay_BGMB").value;
	//var Ngay_cap_Bulong_mong =document.getElementById("Ngay_cap_Bulong_mong").value;
	//var Ngay_xong_mong_cot =document.getElementById("Ngay_xong_mong_cot").value;

	Ngay_khoi_cong =document.getElementById("Ngay_khoi_cong").value;
	b = moment(Ngay_khoi_cong, "DD-MM-YYYY");
	var ngay_het_han_khoi_cong = moment(ngay_moc,"DD-MM-YYYY");
	ngay_het_han_khoi_cong.add(7, 'days');
	//window.alert(ngay_moc);
	if(b.isValid())
	{
		if (b.isBetween(ngay_moc, ngay_het_han_khoi_cong) || b.isSame(ngay_moc)|| b.isSame(ngay_het_han_khoi_cong))
		{
			document.getElementById("Qua_han_khoi_cong").value = "TRONG HẠN"; 
			document.getElementById("Qua_han_khoi_cong").style.color = "blue";
			document.getElementById("Qua_han_khoi_cong").style.fontWeight = 'bold'; 
		}
		else 
		{	
			if (moment(b).isBefore(ngay_moc))
			{
				window.alert("LỖI:Đang nhập ngày khởi công trước ngày Bàn giao mặt bằng hoặc Ngày cấp bu long móng");
				document.getElementById("Qua_han_khoi_cong").value = ""; 
				document.getElementById("Ngay_khoi_cong").value = ""; 
			}
			else 
			{
				document.getElementById("Qua_han_khoi_cong").value = "QUÁ HẠN"; 
				document.getElementById("Qua_han_khoi_cong").style.color = "red";
				document.getElementById("Qua_han_khoi_cong").style.fontWeight = 'bold';
			}
		}
	}
	else
	{
			window.alert("Kiểm tra lại ngày khởi công đã đúng định dạng hay chưa?");
	}
	
	
}
  
function tudong_hienthi_thoi_gian_tc(){
	var ngay_hom_nay=moment(moment(), "DD-MM-YYYY");
	var Ngay_khoi_cong_day = moment(Ngay_khoi_cong, "DD-MM-YYYY");
	var ngay_ps_text=document.getElementById("Ngay_ps").value;
	var ngay_ps=moment(ngay_ps_text,"DD-MM-YYYY"); 
	if(ngay_ps.isValid() && ngay_ps.isAfter(Ngay_khoi_cong_day, "DD-MM-YYYY"))
		{
			var so_ngay_thi_cong=ngay_ps.diff(Ngay_khoi_cong_day,'days');
			document.getElementById("Time_thi_cong_ht").value=so_ngay_thi_cong;
		}
	else
		{
			if(Ngay_khoi_cong_day.isValid() && moment().isSameOrAfter(Ngay_khoi_cong_day, "DD-MM-YYYY")) 
				{
					var so_ngay_thi_cong=moment().diff(Ngay_khoi_cong_day,'days');
					document.getElementById("Time_thi_cong_ht").value=so_ngay_thi_cong;
				}
			else
				{
					document.getElementById("Time_thi_cong_ht").value="chưa có ngày khởi công,phát sóng hoặc nhập lớn hơn ngày hiện tại";
				}
		}
			
}
function tudong_hienthi_time_tc_sau_gt(){
	var Time_giam_tru=document.getElementById("Time_giam_tru").value;
	var Time_thi_cong_ht=document.getElementById("Time_thi_cong_ht").value;
	if(!isNaN(Time_giam_tru) && Time_giam_tru>0 && !isNaN(Time_thi_cong_ht))
		{
			var time_thi_cong_sau_gt=Number(Time_thi_cong_ht)-Number(Time_giam_tru);
			document.getElementById("Time_thi_cong_sau_gt").value=time_thi_cong_sau_gt;
		}
	else
		{
			document.getElementById("Time_thi_cong_sau_gt").value="chưa có thời gian giảm trừ";
		}
			
}

function tudong_hienthi_QHXMC(){
var Ngay_xong_mong_cot =document.getElementById("Ngay_xong_mong_cot").value;
var c = moment(Ngay_xong_mong_cot, "DD-MM-YYYY");
var Target_xong_mong_cot = document.getElementById("Target_xong_mong_cot").value;
var ngay_qua_han_xong_mong_cot=moment(b, "DD-MM-YYYY");;



  if(b.isValid() && c.isValid() )
	{
		if(Target_xong_mong_cot > 0 )
		{
			ngay_qua_han_xong_mong_cot.add(Target_xong_mong_cot, 'days');
			if (c.isBetween(b, ngay_qua_han_xong_mong_cot) || c.isSame(b)|| b.isSame(ngay_qua_han_xong_mong_cot))
			{
				document.getElementById("Qua_han_xong_MC").value = "TRONG HẠN"; 
				document.getElementById("Qua_han_xong_MC").style.color = "blue";
				document.getElementById("Qua_han_xong_MC").style.fontWeight = 'bold'; 
			}
			else 
			{	
				if (moment(c).isBefore(b))
				{
					window.alert("LỖI:Đang nhập ngày xogng móng cột trước ngày khởi công!");
					document.getElementById("Qua_han_xong_MC").value = ""; 
					document.getElementById("Ngay_xong_mong_cot").value = ""; 
				}
				else 
				{
					document.getElementById("Qua_han_xong_MC").value = "QUÁ HẠN"; 
					document.getElementById("Qua_han_xong_MC").style.color = "red";
					document.getElementById("Qua_han_xong_MC").style.fontWeight = 'bold';
				}
			}
		}
		else
		{
			window.alert("KIỂM TRA ĐÃ CÓ TARGET XONG MÓNG CỘT HAY CHƯA?");
			document.getElementById("Ngay_xong_mong_cot").value="";
			document.getElementById("Qua_han_xong_MC").value="";
		}
		
	}
	else
	{
			window.alert("Kiểm tra lại ngày đã đúng định dạng hay chưa?");
	}
}
function tudong_hienthi_QHXC(){
var Ngay_xong_cot =document.getElementById("Ngay_xong_cot").value;
var c = moment(Ngay_xong_cot, "DD-MM-YYYY");
var Target_xong_cot = document.getElementById("Target_xong_cot").value;
var ngay_qua_han_xong_cot=moment(b, "DD-MM-YYYY");;



  if(b.isValid() && c.isValid() )
	{
		if(Target_xong_cot > 0 )
		{
			ngay_qua_han_xong_cot.add(Target_xong_cot, 'days');
			if (c.isBetween(b, ngay_qua_han_xong_cot) || c.isSame(b)|| b.isSame(ngay_qua_han_xong_cot))
			{
				document.getElementById("Qua_han_xong_cot").value = "TRONG HẠN"; 
				document.getElementById("Qua_han_xong_cot").style.color = "blue";
				document.getElementById("Qua_han_xong_cot").style.fontWeight = 'bold'; 
			}
			else 
			{	
				if (moment(c).isBefore(b))
				{
					window.alert("LỖI:Đang nhập ngày xong cột trước ngày khởi công!");
					document.getElementById("Ngay_xong_cot").value = ""; 
					document.getElementById("Qua_han_xong_cot").value = ""; 
				}
				else 
				{
					document.getElementById("Qua_han_xong_cot").value = "QUÁ HẠN"; 
					document.getElementById("Qua_han_xong_cot").style.color = "red";
					document.getElementById("Qua_han_xong_cot").style.fontWeight = 'bold';
				}
			}
		}
		else
		{
			window.alert("KIỂM TRA ĐÃ CÓ TARGET XONG CỘT HAY CHƯA?");
			document.getElementById("Ngay_xong_cot").value="";
			document.getElementById("Qua_han_xong_cot").value = "";
		}
		
	}
	else
	{
			window.alert("Kiểm tra lại ngày đã đúng định dạng hay chưa?");
	}
}
function tudong_hienthi_QHXN(){
var Ngay_xong_nha =document.getElementById("Ngay_xong_nha").value;
var c = moment(Ngay_xong_nha, "DD-MM-YYYY");
var Target_xong_nha = document.getElementById("Target_xong_nha").value;
var ngay_qua_han_xong_nha=moment(b, "DD-MM-YYYY");;



  if(b.isValid() && c.isValid() )
	{
		if(Target_xong_nha > 0 )
		{
			ngay_qua_han_xong_nha.add(Target_xong_nha, 'days');
			if (c.isBetween(b, ngay_qua_han_xong_nha) || c.isSame(b)|| b.isSame(ngay_qua_han_xong_nha))
			{
				document.getElementById("Qua_han_xong_nha").value = "TRONG HẠN"; 
				document.getElementById("Qua_han_xong_nha").style.color = "blue";
				document.getElementById("Qua_han_xong_nha").style.fontWeight = 'bold'; 
			}
			else 
			{	
				if (moment(c).isBefore(b))
				{
					window.alert("LỖI:Đang nhập ngày xong nhà trước ngày khởi công!");
					document.getElementById("Ngay_xong_nha").value = ""; 
					document.getElementById("Qua_han_xong_nha").value = ""; 
				}
				else 
				{
					document.getElementById("Qua_han_xong_nha").value = "QUÁ HẠN"; 
					document.getElementById("Qua_han_xong_nha").style.color = "red";
					document.getElementById("Qua_han_xong_nha").style.fontWeight = 'bold';
				}
			}
		}
		else
		{
			window.alert("KIỂM TRA ĐÃ CÓ TARGET XONG CỘT HAY CHƯA?");
			document.getElementById("Ngay_xong_nha").value="";
			document.getElementById("Qua_han_xong_nha").value = ""; 
		}
		
	}
	else
	{
			window.alert("Kiểm tra lại ngày đã đúng định dạng hay chưa?");
	}
}
function tudong_hienthi_QHLTB(){
var Ngay_lap_xong_tb =document.getElementById("Ngay_lap_xong_tb").value;
var c = moment(Ngay_lap_xong_tb, "DD-MM-YYYY");
var Target_lap_tb_ngay = document.getElementById("Target_lap_tb_ngay").value;
var ngay_qua_han_lap_xong_tb=moment(b, "DD-MM-YYYY");;



  if(b.isValid() && c.isValid() )
	{
		if(Number(Target_lap_tb_ngay) > 0 )
		{
			ngay_qua_han_lap_xong_tb.add(Target_lap_tb_ngay, 'days');
			if (c.isBetween(b, ngay_qua_han_lap_xong_tb) || c.isSame(b)|| b.isSame(ngay_qua_han_lap_xong_tb))
			{
				document.getElementById("Qua_han_lap_xong_tb").value = "TRONG HẠN"; 
				document.getElementById("Qua_han_lap_xong_tb").style.color = "blue";
				document.getElementById("Qua_han_lap_xong_tb").style.fontWeight = 'bold'; 
			}
			else 
			{	
				if (moment(c).isBefore(b))
				{
					window.alert("LỖI:Đang nhập ngày xong nhà trước ngày khởi công!");
					document.getElementById("Ngay_lap_xong_tb").value = ""; 
					document.getElementById("Qua_han_lap_xong_tb").value = ""; 
				}
				else 
				{
					document.getElementById("Qua_han_lap_xong_tb").value = "QUÁ HẠN"; 
					document.getElementById("Qua_han_lap_xong_tb").style.color = "red";
					document.getElementById("Qua_han_lap_xong_tb").style.fontWeight = 'bold';
				}
			}
		}
		else
		{
			window.alert("KIỂM TRA ĐÃ CÓ TARGET LẮP THIẾT BỊ HAY CHƯA?");
			document.getElementById("Ngay_lap_xong_tb").value="";
			document.getElementById("Qua_han_lap_xong_tb").value = ""; 
		}
		
	}
	else
	{
			window.alert("Kiểm tra lại ngày đã đúng định dạng hay chưa?");
	}
}
function tudong_hienthi() {
  
  var Dia_hinh= document.getElementById("Dia_hinh");
  var str_Dia_hinh =String(Dia_hinh.value);
  var Loai_tram_TM_DD= document.getElementById("Loai_tram_TM_DD");
  var str_Loai_tram_TM_DD =String(Loai_tram_TM_DD.value);
  var Loai_cot= document.getElementById("Loai_cot");
  var str_Loai_cot =String(Loai_cot.value);
  var Do_cao_cot= document.getElementById("Do_cao_cot");
  var str_Do_cao_cot =String(Do_cao_cot.value);
  document.getElementById("Target_phat_song_ngay").value =0;
  document.getElementById("Target_xong_mong_cot").value ="Kiểm tra loại cột";

  if (str_Loai_tram_TM_DD.search("đất")!=-1 && str_Dia_hinh.search("bằng")!=-1) 
	{	document.getElementById("Target_phat_song_ngay").value= 45	;
		
	}
  if (str_Loai_tram_TM_DD.search("đất")!=-1 && str_Dia_hinh.search("núi")!=-1) 
	{	document.getElementById("Target_phat_song_ngay").value= 60;
		
	}
  if (str_Loai_tram_TM_DD.search("tự")!=-1 &&str_Dia_hinh.search("đảo")!=-1) 
	{	document.getElementById("Target_phat_song_ngay").value= 150;
		
	}
  if(str_Loai_tram_TM_DD.search("mái")!=-1)
    {
		document.getElementById("Target_phat_song_ngay").value = 30;
		
		
    }
	tudong_hienthi_xong_mong_cot();
	tudong_hienthi_xong_cot();
	tudong_hienthi_xong_nha();
	tudong_hienthi_target_lap_tb();
	
 
}

function tudong_hienthi_xong_mong_cot() {
  
  var Dia_hinh= document.getElementById("Dia_hinh");
  var str_Dia_hinh =String(Dia_hinh.value);
  var Loai_tram_TM_DD= document.getElementById("Loai_tram_TM_DD");
  var str_Loai_tram_TM_DD =String(Loai_tram_TM_DD.value);
  var Loai_cot= document.getElementById("Loai_cot");
  var str_Loai_cot =String(Loai_cot.value);
  var Do_cao_cot= document.getElementById("Do_cao_cot");
  var str_Do_cao_cot =String(Do_cao_cot.value);
  document.getElementById("Target_xong_mong_cot").value ="Kiểm tra loại cột";

  

	
	
	if (str_Loai_cot.search("600")!=-1&& (str_Do_cao_cot < 19))
    {
		document.getElementById("Target_xong_mong_cot").value =7 ; return ;
		
    }
	if(str_Loai_cot.search("BTLT")!=-1 && str_Do_cao_cot < 23){
				document.getElementById("Target_xong_mong_cot").value = 7;return ;
			}
	if(str_Loai_cot.search("Cóc")!=-1)
				{
					document.getElementById("Target_xong_mong_cot").value = 5;return ;
				}
	if(str_Loai_tram_TM_DD.search("mái")!=-1)
					{
						document.getElementById("Target_xong_mong_cot").value = 7;return ;
					}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Do_cao_cot < 49)
						{
							document.getElementById("Target_xong_mong_cot").value = 10;return ;
						}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Do_cao_cot > 49)
							{
								document.getElementById("Target_xong_mong_cot").value = 12;return ;
							}
							
 
}
function tudong_hienthi_xong_cot() {
  
  var Dia_hinh= document.getElementById("Dia_hinh");
  var str_Dia_hinh =String(Dia_hinh.value);
  var Loai_tram_TM_DD= document.getElementById("Loai_tram_TM_DD");
  var str_Loai_tram_TM_DD =String(Loai_tram_TM_DD.value);
  var Loai_cot= document.getElementById("Loai_cot");
  var str_Loai_cot =String(Loai_cot.value);
  var Do_cao_cot= document.getElementById("Do_cao_cot");
  var str_Do_cao_cot =String(Do_cao_cot.value);
  document.getElementById("Target_xong_cot").value ="Kiểm tra loại cột";
	
	
	if (str_Loai_cot.search("600")!=-1&& (str_Do_cao_cot < 19))
    {
		document.getElementById("Target_xong_cot").value =14 ; return ;
		
    }
	if(str_Loai_cot.search("BTLT")!=-1 && str_Do_cao_cot < 23){
				document.getElementById("Target_xong_cot").value = 10;return ;
			}
	if(str_Loai_cot.search("Cóc")!=-1)
				{
					document.getElementById("Target_xong_cot").value = 10;return ;
				}
	if(str_Loai_tram_TM_DD.search("mái")!=-1)
					{
						document.getElementById("Target_xong_cot").value = 14;return ;
					}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Do_cao_cot < 49)
						{
							document.getElementById("Target_xong_cot").value = 20;return ;
						}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Do_cao_cot > 49)
							{
								document.getElementById("Target_xong_cot").value = 23;return ;
							}
							
 
}
function tudong_hienthi_xong_nha() {
  
  var Dia_hinh= document.getElementById("Dia_hinh");
  var str_Dia_hinh =String(Dia_hinh.value);
  var Loai_tram_TM_DD= document.getElementById("Loai_tram_TM_DD");
  var str_Loai_tram_TM_DD =String(Loai_tram_TM_DD.value);
  var Loai_cot= document.getElementById("Loai_cot");
  var str_Loai_cot =String(Loai_cot.value);
  var Do_cao_cot= document.getElementById("Do_cao_cot");
  var str_Do_cao_cot =String(Do_cao_cot.value);
  var Loai_nha= document.getElementById("Loai_nha");
  var str_Loai_nha =String(Loai_nha.value);
  document.getElementById("Target_xong_nha").value ="Kiểm tra loại nhà";
	
	
	if(str_Loai_nha.search("Cải tạo")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 7;return ;
						}
	if(str_Loai_tram_TM_DD.search("mái")!=-1 && str_Loai_nha.search("ont")!=-1 )
						{
							document.getElementById("Target_xong_nha").value = 25;return ;
						}
	if(str_Loai_tram_TM_DD.search("mái")!=-1 && str_Loai_nha.search("ây")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 25;return ;
						}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Loai_nha.search("ont")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 30;return ;
						}
	if(str_Loai_tram_TM_DD.search("đất")!=-1 && str_Loai_nha.search("ây")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 30;return ;
						}
	if(str_Loai_nha.search("CS")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 2;return ;
						}						
	if(str_Loai_nha.search("mini")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 1;return ;
						}	
	if(str_Loai_nha.search("shelter")!=-1)
						{
							document.getElementById("Target_xong_nha").value = parseInt(document.getElementById("Target_xong_cot").value)+3;return ;
						}	
	if(str_Loai_nha.search("Smallcell")!=-1)
						{
							document.getElementById("Target_xong_nha").value = 1;return ;
						}	

}

 function tudong_hienthi_target_lap_tb() {
	
	var Target_xong_nha = document.getElementById("Target_xong_nha").value;
	if(!isNaN(Target_xong_nha))
	{
		var Target_lap_tb_ngay =Number(Target_xong_nha)+3;
		document.getElementById("Target_lap_tb_ngay").value=Target_lap_tb_ngay;
	} else
	{
		document.getElementById("Target_lap_tb_ngay").value="kiểm tra lại target xong nhà";
	}
	
 }

  
function tudong_hienthi_Nguyen_nhan_cha() {
  
  var Nguyen_nhan_con_QHKC= document.getElementById("Nguyen_nhan_con_QHKC");
  var str_Nguyen_nhan_con_QHKC =String(Nguyen_nhan_con_QHKC.value);
  document.getElementById("Nguyen_nhan_cha_QHKC").value =0;
  
  var Nguyen_nhan_con_QHMC= document.getElementById("Nguyen_nhan_con_QHMC");
  var str_Nguyen_nhan_con_QHMC =String(Nguyen_nhan_con_QHMC.value);
  document.getElementById("Nguyen_nhan_cha_QHMC").value =0;  
  

  var Nguyen_nhan_con_QHXC= document.getElementById("Nguyen_nhan_con_QHXC");
  var str_Nguyen_nhan_con_QHXC =String(Nguyen_nhan_con_QHXC.value);
  document.getElementById("Nguyen_nhan_cha_QHXC").value =0;   



  var Nguyen_nhan_con_QHXN= document.getElementById("Nguyen_nhan_con_QHXN");
  var str_Nguyen_nhan_con_QHXN =String(Nguyen_nhan_con_QHXN.value);
  document.getElementById("Nguyen_nhan_cha_QHXN").value =0;  


  var Nguyen_nhan_con_QHTB= document.getElementById("Nguyen_nhan_con_QHTB");
  var str_Nguyen_nhan_con_QHTB =String(Nguyen_nhan_con_QHTB.value);
  document.getElementById("Nguyen_nhan_cha_QHTB").value =0; 


  var Nguyen_nhan_con_QHXD= document.getElementById("Nguyen_nhan_con_QHXD");
  var str_Nguyen_nhan_con_QHXD =String(Nguyen_nhan_con_QHXD.value);
  document.getElementById("Nguyen_nhan_cha_QHXD").value =0; 

  var Nguyen_nhan_con_QHXQ= document.getElementById("Nguyen_nhan_con_QHXQ");
  var str_Nguyen_nhan_con_QHXQ =String(Nguyen_nhan_con_QHXQ.value);
  document.getElementById("Nguyen_nhan_cha_QHXQ").value =0; 


  var Nguyen_nhan_con_QHPS= document.getElementById("Nguyen_nhan_con_QHPS");
  var str_Nguyen_nhan_con_QHPS =String(Nguyen_nhan_con_QHPS.value);
  document.getElementById("Nguyen_nhan_cha_QHPS").value =0; 

  if (str_Nguyen_nhan_con_QHKC=="Vướng GPXD" || str_Nguyen_nhan_con_QHKC=="Vướng kiện" ||str_Nguyen_nhan_con_QHKC=="Lập PYC chậm" ||
  str_Nguyen_nhan_con_QHKC=="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC" ||str_Nguyen_nhan_con_QHKC=="Vướng hợp đồng thuê" ||
  str_Nguyen_nhan_con_QHKC=="Chưa có hợp đồng" ||str_Nguyen_nhan_con_QHKC=="Chưa có thiết kế") 
	{	document.getElementById("Nguyen_nhan_cha_QHKC").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHKC=="Chưa có đội triển khai" || str_Nguyen_nhan_con_QHKC=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHKC").value= "ĐVTC";
		
	}
	
  if (str_Nguyen_nhan_con_QHKC=="Chưa có NN" )
	{	document.getElementById("Nguyen_nhan_cha_QHKC").value= "Chưa có NN";
		
	}	 

  if (str_Nguyen_nhan_con_QHKC=="Mưa, ngập nước, đường lầy lội" )
	{	document.getElementById("Nguyen_nhan_cha_QHKC").value= "Thời tiết";
		
	}	

	
	
	
  if (str_Nguyen_nhan_con_QHMC=="Vướng GPXD" || str_Nguyen_nhan_con_QHMC=="Vướng kiện" ||str_Nguyen_nhan_con_QHMC=="Chưa đảm bảo VT(bulong mặt bích)" ||
  str_Nguyen_nhan_con_QHMC=="Lập PYC chậm" ||str_Nguyen_nhan_con_QHMC=="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC" ||
  str_Nguyen_nhan_con_QHMC=="Vướng hợp đồng thuê" ||str_Nguyen_nhan_con_QHMC=="Chưa có hợp đồng"||str_Nguyen_nhan_con_QHMC=="Chưa có thiết kế") 
	{	document.getElementById("Nguyen_nhan_cha_QHMC").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHMC=="Chưa có đội triển khai" || str_Nguyen_nhan_con_QHMC=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHMC").value= "ĐVTC";
		
	}
	
  if (str_Nguyen_nhan_con_QHMC=="Chưa có NN" )
	{	document.getElementById("Nguyen_nhan_cha_QHMC").value= "Chưa có NN";
		
	}	 

  if (str_Nguyen_nhan_con_QHMC=="Mưa, ngập nước, đường lầy lội" || str_Nguyen_nhan_con_QHMC=="Mưa triển khai chậm")
	{	document.getElementById("Nguyen_nhan_cha_QHMC").value= "Thời tiết";
		
	}




  if (str_Nguyen_nhan_con_QHXC=="Vướng GPXD" || str_Nguyen_nhan_con_QHXC=="Vướng kiện" ||
  str_Nguyen_nhan_con_QHXC=="Chưa cấp cột"||str_Nguyen_nhan_con_QHXC=="Cột lỗi"||str_Nguyen_nhan_con_QHXC=="Cấp cột không đồng bộ"||
  str_Nguyen_nhan_con_QHXC=="Chưa đảm bảo VT(bulong mặt bích)" ||
  str_Nguyen_nhan_con_QHXC=="Lập PYC chậm" ||str_Nguyen_nhan_con_QHXC=="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC" ||
  str_Nguyen_nhan_con_QHXC=="Vướng hợp đồng thuê" ||str_Nguyen_nhan_con_QHXC=="Chưa có hợp đồng"||str_Nguyen_nhan_con_QHXC=="Chưa có thiết kế") 
	{	document.getElementById("Nguyen_nhan_cha_QHXC").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHXC=="Chưa có đội triển khai" || str_Nguyen_nhan_con_QHXC=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHXC").value= "ĐVTC";
		
	}
	
  if (str_Nguyen_nhan_con_QHXC=="Chưa có NN" )
	{	document.getElementById("Nguyen_nhan_cha_QHXC").value= "Chưa có NN";
		
	}	 

  if (str_Nguyen_nhan_con_QHXC=="Mưa, ngập nước, đường lầy lội" || str_Nguyen_nhan_con_QHXC=="Mưa triển khai chậm")
	{	document.getElementById("Nguyen_nhan_cha_QHXC").value= "Thời tiết";
		
	}




  if (str_Nguyen_nhan_con_QHXN=="Vướng GPXD" || str_Nguyen_nhan_con_QHXN=="Vướng kiện" ||
  str_Nguyen_nhan_con_QHXN=="Chưa cấp nhà"||str_Nguyen_nhan_con_QHXN=="Nhà lỗi"||str_Nguyen_nhan_con_QHXN=="Cấp nhà không đồng bộ"||
  str_Nguyen_nhan_con_QHXN=="Lập PYC chậm" ||str_Nguyen_nhan_con_QHXN=="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC" ||
  str_Nguyen_nhan_con_QHXN=="Vướng hợp đồng thuê" ||str_Nguyen_nhan_con_QHXN=="Chưa có hợp đồng"
  ||str_Nguyen_nhan_con_QHXN=="Chưa có thiết kế"||str_Nguyen_nhan_con_QHXN=="Thay đổi thiết kế") 
	{	document.getElementById("Nguyen_nhan_cha_QHXN").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHXN=="Chưa có đội triển khai" || str_Nguyen_nhan_con_QHXN=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHXN").value= "ĐVTC";
		
	}
	
  if (str_Nguyen_nhan_con_QHXN=="Chưa có NN" )
	{	document.getElementById("Nguyen_nhan_cha_QHXN").value= "Chưa có NN";
		
	}	 

  if (str_Nguyen_nhan_con_QHXN=="Mưa, ngập nước, đường lầy lội" || str_Nguyen_nhan_con_QHXN=="Mưa triển khai chậm")
	{	document.getElementById("Nguyen_nhan_cha_QHXN").value= "Thời tiết";
		
	}


  if (str_Nguyen_nhan_con_QHTB=="Vướng GPXD" || str_Nguyen_nhan_con_QHTB=="Vướng kiện" ||
  str_Nguyen_nhan_con_QHTB=="Chưa cấp thiết bị"||str_Nguyen_nhan_con_QHTB=="Hỏng thiết bị"||str_Nguyen_nhan_con_QHTB=="Cấp thiết bị không đồng bộ"||
  str_Nguyen_nhan_con_QHTB=="Lập PYC chậm" ||str_Nguyen_nhan_con_QHTB=="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC" ||
  str_Nguyen_nhan_con_QHTB=="Vướng hợp đồng thuê" ||str_Nguyen_nhan_con_QHTB=="Chưa có hợp đồng"
  ||str_Nguyen_nhan_con_QHTB=="Chưa có thiết kế"||str_Nguyen_nhan_con_QHTB=="Thay đổi Calloff"
  ||str_Nguyen_nhan_con_QHTB=="Đã điều chuyển thiết bị đi trạm khác")  
	{	document.getElementById("Nguyen_nhan_cha_QHTB").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHTB=="Chưa có đội triển khai" || str_Nguyen_nhan_con_QHTB=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHTB").value= "ĐVTC";
		
	}
	
  if (str_Nguyen_nhan_con_QHTB=="Chưa có NN" )
	{	document.getElementById("Nguyen_nhan_cha_QHTB").value= "Chưa có NN";
		
	}	 

  if (str_Nguyen_nhan_con_QHTB=="Mưa, ngập nước, đường lầy lội" || str_Nguyen_nhan_con_QHTB=="Mưa triển khai chậm")
	{	document.getElementById("Nguyen_nhan_cha_QHTB").value= "Thời tiết";
		
	}	
	
	
	
	
  if (str_Nguyen_nhan_con_QHXD=="Chưa nộp hồ sơ điện" || str_Nguyen_nhan_con_QHXD=="Vướng kiện" ||
  str_Nguyen_nhan_con_QHXD=="Chưa hạ công tơ"||str_Nguyen_nhan_con_QHXD=="Chưa cấp Máy nổ")  
	{	document.getElementById("Nguyen_nhan_cha_QHXD").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHXD=="Chưa mua dây điện" || str_Nguyen_nhan_con_QHXD=="Chưa trồng cột AC"
  || str_Nguyen_nhan_con_QHXD=="Chưa có đội triển khai"|| str_Nguyen_nhan_con_QHXD=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHXD").value= "ĐVTC";
		
	}

	
	
	
	
	  if (str_Nguyen_nhan_con_QHXQ=="Chưa có hợp đồng kéo Quang" || str_Nguyen_nhan_con_QHXQ=="Vướng kiện" ||
  str_Nguyen_nhan_con_QHXQ=="Chưa cấp VT"||str_Nguyen_nhan_con_QHXQ=="Chưa cấp cột"
  ||  str_Nguyen_nhan_con_QHXQ=="Lập PYC chậm"||str_Nguyen_nhan_con_QHXQ=="Cấp VT không đồng bộ"
  ||  str_Nguyen_nhan_con_QHXQ=="Chưa cấp viba"||str_Nguyen_nhan_con_QHXQ=="Chưa hàn nối")  
	{	document.getElementById("Nguyen_nhan_cha_QHXQ").value= "Viettel Tỉnh";
		
	}
	
  if (str_Nguyen_nhan_con_QHXQ=="Chưa trồng cột" || str_Nguyen_nhan_con_QHXQ=="Chưa thông tuyến"|| str_Nguyen_nhan_con_QHXQ=="Đang triển khai"
  || str_Nguyen_nhan_con_QHXQ=="Chưa có đội triển khai"|| str_Nguyen_nhan_con_QHXQ=="Có triển khai nhưng không đủ nhân công")
	{	document.getElementById("Nguyen_nhan_cha_QHXQ").value= "ĐVTC";
		
	}
}  
    
</script>


<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin Hạ Tầng</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl" >
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Tỉnh <font color="red">*</font></strong></td>
     <td width="40%"><input  name="Tinh" id="Tinh" size="40" maxlength="250" value ="<%=objRS.Fields("Tinh")%>" ></input></td>
     <td width="30%"><label class="font_alert" id="for_Tinh">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã nhà trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="Ma_nha_tram" id="Ma_nha_tram" size="40" maxlength="250" value ="<%=objRS.Fields("Ma_nha_tram")%>"/></td>
     <td width="30%"><label class="font_alert" id="for_Ma_nha_tram">&nbsp;</label></td>
   </tr>
      <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="Ma_tram" id="Ma_tram" size="40" maxlength="250" value ="<%=objRS.Fields("Ma_tram")%>"/></td>
     <td width="30%"><label class="font_alert" id="for_Ma_tram">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã công trình</strong></td>
     <td width="40%"><input  name="Ma_cong_trinh" id="Ma_cong_trinh" size="40" maxlength="250" value ="<%=objRS.Fields("Ma_cong_trinh")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> ĐVTC </strong></td>
     <td><select name="DVTC"  class="DVTC" id="DVTC" size="1" />
		<option selected><%=objRS.Fields("DVTC")%></option>
		<option value="UQ">UQ</option>
		<option value="CTCT">CTCT</option>	
		<option value="Lam Sơn">Lam Sơn</option>
		<option value="Minh Ngọc">Minh Ngọc</option>			
		<option value="Khánh Trà">Khánh Trà</option> 	
		</select>  
		</td>
   </tr>
   <tr>
	<td width="30%"><strong><img src="images/maskrow.gif" />Loại trạm(trên mái, dưới đất)</strong> </td>
     <td><select name="Loai_tram_TM_DD" class="Loai_tram_TM_DD" id="Loai_tram_TM_DD" size="1"  onChange="tudong_hienthi()" >
		<option selected><%=objRS.Fields("Loai_tram_TM_DD")%></option>
		<option value="Trên mái">Trên mái</option>
		<option value="Cột tự đứng">Cột tự đứng </option>		
		<option value="Dưới đất">Dưới đất</option> </select>   </td>
    </tr>
<tr>
<td width="30%"><strong><img src="images/maskrow.gif" />Địa hinh</strong> </td>
     <td><select name="Dia_hinh" class="Dia_hinh" id="Dia_hinh" size="1"  onChange="tudong_hienthi()">
	 	<option selected><%=objRS.Fields("Dia_hinh")%></option>
		<option value="Đồng bằng">Đồng bằng</option>
		<option value="Hải đảo">Hải đảo</option>
		<option value="Miền núi">Miền núi</option> 
		</select>    
	   </td>

  </tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại cột</strong></td>
     <td><select name="Loai_cot"  class="Loai_cot" id="Loai_cot" size="1"    onChange="tudong_hienthi()">
		<option selected><%=objRS.Fields("Loai_cot")%></option>
		<option value="600">600</option>
		<option value="300">300</option>	
		<option value="BTLT">BTLT</option>
		<option value="Cóc">Cóc</option>			
		<option value="CS">CS</option> 
		<option value="Hapulico">Hapulico</option>	
		<option value="Tự đứng">Tự đứng</option>
		<option value="1000">1000</option>			
		<option value="Ngụy trang">Ngụy trang</option> 	
		</select>  
		</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Độ cao cột</strong></td>
     <td width="40%"><input  name="Do_cao_cot" id="Do_cao_cot" size="40" maxlength="250" value ="<%=objRS.Fields("Do_cao_cot")%>" onfocusout="tudong_hienthi()">
	 </td>
     <td width="30%">&nbsp;</td>
   </tr>   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại nhà</strong></td>
     <td><select name="Loai_nha"  class="Loai_nha" id="Loai_nha" size="1" onChange="tudong_hienthi()"/>
		<option selected><%=objRS.Fields("Loai_nha")%></option>
		<option value="Cont">Cont</option>
		<option value="Cải tạo">Cải tạo</option>	
		<option value="CS">CS</option>
		<option value="DC mini">DC mini</option>			
		<option value="Minishelter">Minishelter</option> 
		<option value="Xây">Xây</option>	
		<option value="Smallcell">Smallcell</option>
		</select>  
		</td>
	 
   </tr>	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target Phát sóng(Ngày)</strong></td>
     <td width="40%"><input  name="Target_phat_song_ngay" id="Target_phat_song_ngay" size="40" maxlength="250"  value ="<%=objRS.Fields("Target_phat_song_ngay")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     
	 <td width="10%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong móng cột</strong></td>
     <td width="40%"><input  name="Target_xong_mong_cot" id="Target_xong_mong_cot" size="40" maxlength="250" value ="<%=objRS.Fields("Target_xong_mong_cot")%>"  readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong cột</strong></td>
     <td width="40%"><input  name="Target_xong_cot" id="Target_xong_cot" size="40" maxlength="250" value ="<%=objRS.Fields("Target_xong_cot")%>"  readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong nhà</strong></td>
     <td width="40%"><input  name="Target_xong_nha" id="Target_xong_nha" size="40" maxlength="250" value ="<%=objRS.Fields("Target_xong_nha")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Kế hoạch tháng</strong></td>
     <td> <select name="Ke_hoach_thang"  class="Ke_hoach_thang" id="Ke_hoach_thang" size="1" value =""/>
	 		<option selected><%=objRS.Fields("Ke_hoach_thang")%></option>
             <option value="KH T1">KH T1</option>
             <option value="KH T2">KH T2</option>
             <option value="KH T3">KH T3</option>
             <option value="KH T4">KH T4</option>
             <option value="KH T5">KH T5</option>
             <option value="KH T6">KH T6</option>
             <option value="KH T7">KH T7</option>
             <option value="KH T8">KH T8</option>
             <option value="KH T9">KH T9</option>
             <option value="KH T10">KH T10</option>
             <option value="KH T11">KH T11</option>
             <option value="KH T12">KH T12</option>
             <option value="BS KH T1">BS KH T1</option>
             <option value="BS KH T2">BS KH T2</option>
             <option value="BS KH T3">BS KH T3</option>
             <option value="BS KH T4">BS KH T4</option>
             <option value="BS KH T5">BS KH T5</option>
             <option value="BS KH T6">BS KH T6</option>
             <option value="BS KH T7">BS KH T7</option>
             <option value="BS KH T8">BS KH T8</option>
             <option value="BS KH T9">BS KH T9</option>
             <option value="BS KH T10">BS KH T10</option>
             <option value="BS KH T11">BS KH T11</option>
             <option value="BS KH T12">BS KH T12</option>
             
		</select> </td>
   </tr>  
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Ngày BGMB</strong></td>
     <td><input  name="Ngay_BGMB" id="Ngay_BGMB" size="40" maxlength="250" value="<%=(objRS.Fields("Ngay_BGMB"))%>"  onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_BGMB_btn" src="images/calendar.png" width="20" height="20" />	 &nbsp;</td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	 </tr>
	 
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp Bulong móng </strong></td>
     <td ><input  name="Ngay_cap_Bulong_mong" id="Ngay_cap_Bulong_mong" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_cap_Bulong_mong"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_cap_Bulong_mong_btn" src="images/calendar.png" width="20" height="20" />&nbsp;</td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian giảm trừ trước khởi công </strong></td>
     <td width="40%"><input  name="Thoi_gian_giam_tru_truoc_KC" id="Thoi_gian_giam_tru_truoc_KC" size="40" maxlength="250" value ="<%=objRS.Fields("Thoi_gian_giam_tru_truoc_KC")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn khởi công </strong></td>
     <td> <select name="Nguyen_nhan_con_QHKC"  class="Nguyen_nhan_con_QHKC" id="Nguyen_nhan_con_QHKC" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHKC")%></option>
		<option value="Vướng GPXD">Vướng GPXD</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Lập PYC chậm">Lập PYC chậm</option>
		<option value="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC">Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC</option>			
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Mưa, ngập nước, đường lầy lội">Mưa, ngập nước, đường lầy lội</option>
		<option value="Vướng hợp đồng thuê">Vướng hợp đồng thuê</option>	
		<option value="Chưa có hợp đồng">Chưa có hợp đồng</option>
		<option value="Chưa có thiết kế">Chưa có thiết kế</option>	
		<option value="Chưa có NN">Chưa có NN</option>
		</select> </td>
   </tr>   
<tr>
  <td width="40%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn khởi công </strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHKC" id="Nguyen_nhan_cha_QHKC" size="40" maxlength="250"  value ="<%=objRS.Fields("Nguyen_nhan_cha_QHKC")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn khởi công </strong></td>
     <td width="40%"><input  name="Qua_han_khoi_cong" id="Qua_han_khoi_cong" size="40" maxlength="250" value ="<%=objRS.Fields("Qua_han_khoi_cong")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Khởi công </strong></td>
     <td ><input  name="Ngay_khoi_cong" id="Ngay_khoi_cong" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_khoi_cong"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_khoi_cong_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong móng cột </strong></td>
     <td ><input  name="Ngay_xong_mong_cot" id="Ngay_xong_mong_cot" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_xong_mong_cot"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_xong_mong_cot_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong móng cột </strong></td>
     <td width="40%"><input  name="Qua_han_xong_MC" id="Qua_han_xong_MC" size="40" maxlength="250" value ="<%=objRS.Fields("Qua_han_xong_MC")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn móng cột </strong></td>
     <td> <select name="Nguyen_nhan_con_QHMC"  class="Nguyen_nhan_con_QHMC" id="Nguyen_nhan_con_QHMC" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHMC")%></option>
		<option value="Vướng GPXD">Vướng GPXD</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Chưa đảm bảo VT(bulong mặt bích)">Chưa đảm bảo VT(bulong mặt bích)</option>
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Mưa triển khai chậm">Mưa triển khai chậm</option>
		<option value="Lập PYC chậm">Lập PYC chậm</option>
		<option value="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC">Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC</option>			
		<option value="Mưa, ngập nước, đường lầy lội">Mưa, ngập nước, đường lầy lội</option>
		<option value="Vướng hợp đồng thuê">Vướng hợp đồng thuê</option>	
		<option value="Chưa có hợp đồng">Chưa có hợp đồng</option>
		<option value="Chưa có thiết kế">Chưa có thiết kế</option>	
		<option value="Chưa có NN">Chưa có NN</option>
		</select> </td>
   </tr>
   <tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn móng cột </strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHMC" id="Nguyen_nhan_cha_QHMC" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHMC")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp cột </strong></td>
     <td ><input  name="Ngay_cap_cot" id="Ngay_cap_cot" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_cap_cot"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_cap_cot_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong cột </strong></td>
     <td ><input  name="Ngay_xong_cot" id="Ngay_xong_cot" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_xong_cot"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_xong_cot_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong cột </strong></td>
     <td width="40%"><input  name="Qua_han_xong_cot" id="Qua_han_xong_cot" size="40" maxlength="250" value ="<%=objRS.Fields("Qua_han_xong_cot")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

   <tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn xong cột </strong></td>
     <td> <select name="Nguyen_nhan_con_QHXC"  class="Nguyen_nhan_con_QHXC" id="Nguyen_nhan_con_QHXC" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHXC")%></option>
		<option value="Vướng GPXD">Vướng GPXD</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Chưa cấp cột">Chưa cấp cột</option>
		<option value="Cột lỗi">Cột lỗi</option>	
		<option value="Cấp cột không đồng bộ">Cấp cột không đồng bộ</option>		
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Chưa đảm bảo VT(bulong mặt bích)">Chưa đảm bảo VT(bulong mặt bích)</option>
		<option value="Mưa triển khai chậm">Mưa triển khai chậm</option>
		<option value="Lập PYC chậm">Lập PYC chậm</option>
		<option value="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC">Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC</option>			
		<option value="Mưa, ngập nước, đường lầy lội">Mưa, ngập nước, đường lầy lội</option>
		<option value="Vướng hợp đồng thuê">Vướng hợp đồng thuê</option>	
		<option value="Chưa có hợp đồng">Chưa có hợp đồng</option>
		<option value="Chưa có thiết kế">Chưa có thiết kế</option>	
		<option value="Chưa có NN">Chưa có NN</option>
		</select> </td>
   </tr>
   <tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn xong cột </strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHXC" id="Nguyen_nhan_cha_QHXC" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHXC")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp nhà Cont </strong></td>
     <td ><input  name="Ngay_cap_nha_cont" id="Ngay_cap_nha_cont" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_cap_nha_cont"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_cap_nha_cont_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong nhà </strong></td>
     <td ><input  name="Ngay_xong_nha" id="Ngay_xong_nha" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_xong_nha"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_xong_nha_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong nhà </strong></td>
     <td width="40%"><input  name="Qua_han_xong_nha" id="Qua_han_xong_nha" size="40" maxlength="250" value ="<%=objRS.Fields("Qua_han_xong_nha")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn xong nhà </strong></td>
     <td> <select name="Nguyen_nhan_con_QHXN"  class="Nguyen_nhan_con_QHXN" id="Nguyen_nhan_con_QHXN" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHXN")%></option>
		<option value="Vướng GPXD">Vướng GPXD</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Chưa cấp nhà">Chưa cấp nhà</option>
		<option value="Nhà lỗi">Nhà lỗi</option>	
		<option value="Cấp nhà không đồng bộ">Cấp nhà không đồng bộ</option>		
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Lập PYC chậm">Lập PYC chậm</option>
		<option value="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC">Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC</option>			
		<option value="Mưa, ngập nước, đường lầy lội">Mưa, ngập nước, đường lầy lội</option>
		<option value="Vướng hợp đồng thuê">Vướng hợp đồng thuê</option>	
		<option value="Chưa có hợp đồng">Chưa có hợp đồng</option>
		<option value="Chưa có thiết kế">Chưa có thiết kế</option>
		<option value="Thay đổi thiết kế">Thay đổi thiết kế</option>			
		<option value="Chưa có NN">Chưa có NN</option>
		</select> </td>
   </tr>
   
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn xong nhà</strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHXN" id="Nguyen_nhan_cha_QHXN" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHXN")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp TB </strong></td>
     <td ><input  name="Ngay_cap_tb" id="Ngay_cap_tb" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_cap_tb"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_cap_tb_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày lắp xong TB </strong></td>
     <td ><input  name="Ngay_lap_xong_tb" id="Ngay_lap_xong_tb" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_lap_xong_tb"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_lap_xong_tb_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target lắp thiết bị(Ngày) </strong></td>
     <td width="40%"><input  name="Target_lap_tb_ngay" id="Target_lap_tb_ngay" size="40" maxlength="250" value ="<%=objRS.Fields("Target_lap_tb_ngay")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn lắp xong TB </strong></td>
     <td width="40%"><input  name="Qua_han_lap_xong_tb" id="Qua_han_lap_xong_tb" size="40" maxlength="250" value ="<%=objRS.Fields("Qua_han_lap_xong_tb")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn thiết bị </strong></td>
     <td> <select name="Nguyen_nhan_con_QHTB"  class="Nguyen_nhan_con_QHTB" id="Nguyen_nhan_con_QHTB" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHTB")%></option>
		<option value="Vướng GPXD">Vướng GPXD</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Chưa cấp thiết bị">CChưa cấp thiết bị</option>
		<option value="Hỏng thiết bị">Hỏng thiết bị</option>	
		<option value="Cấp thiết bị không đồng bộ">Cấp thiết bị không đồng bộ</option>		
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Lập PYC chậm">Lập PYC chậm</option>
		<option value="Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC">Hàng về kho Tỉnh chưa kịp cấp cho ĐVTC</option>			
		<option value="Mưa, ngập nước, đường lầy lội">Mưa, ngập nước, đường lầy lội</option>
		<option value="Vướng hợp đồng thuê">Vướng hợp đồng thuê</option>	
		<option value="Chưa có hợp đồng">Chưa có hợp đồng</option>
		<option value="Chưa có thiết kế">Chưa có thiết kế</option>
		<option value="Thay đổi Calloff">Thay đổi Calloff</option>	
		<option value="Đã điều chuyển thiết bị đi trạm khác">Đã điều chuyển thiết bị đi trạm khác</option>			
		<option value="Chưa có NN">Chưa có NN</option>
		</select> </td>
   </tr>
   <tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn thiết bị</strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHTB" id="Nguyen_nhan_cha_QHTB" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHTB")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target xong điện(Ngày) </strong></td>
     <td width="40%"><input  name="Target_xong_dien_ngay" id="Target_xong_dien_ngay" size="40" maxlength="250" value ="<%=objRS.Fields("Target_xong_dien_ngay")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Xong điện </strong></td>
     <td ><input  name="Ngay_xong_dien" id="Ngay_xong_dien" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_xong_dien"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_xong_dien_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn lắp xong Điện </strong></td>
     <td width="40%"><input  name="Qua_han_lap_xong_dien" id="Qua_han_lap_xong_dien" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn xong Điện </strong></td>
     <td> <select name="Nguyen_nhan_con_QHXD"  class="Nguyen_nhan_con_QHXD" id="Nguyen_nhan_con_QHXD" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHXD")%></option>
		<option value="Chưa nộp hồ sơ điện">Chưa nộp hồ sơ điện</option>
		<option value="Vướng kiện">Vướng kiện</option>	
		<option value="Chưa hạ công tơ">Chưa hạ công tơ</option>
		<option value="Chưa mua dây điện">Chưa mua dây điện</option>	
		<option value="Chưa trồng cột AC">Chưa trồng cột AC</option>		
		<option value="Chưa có đội triển khai">Chưa có đội triển khai</option>			
		<option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option> 
		<option value="Chưa cấp Máy nổ">Chưa cấp Máy nổ</option>
		</select> </td>    
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn xong Điện </strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHXD" id="Nguyen_nhan_cha_QHXD" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHXD")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
 
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target xong Quang(Ngày) </strong></td>
     <td width="40%"><input  name="Target_xong_quang" id="Target_xong_quang" size="40" maxlength="250" value ="<%=objRS.Fields("Target_xong_quang")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Xong quang </strong></td>
     <td ><input  name="Ngay_xong_quang" id="Ngay_xong_quang" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_xong_quang"))%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_xong_quang_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn xong Quang </strong></td>
     <td> <select name="Nguyen_nhan_con_QHXQ"  class="Nguyen_nhan_con_QHXQ" id="Nguyen_nhan_con_QHXQ" size="1" onChange="tudong_hienthi_Nguyen_nhan_cha()" >
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHXQ")%></option>
        <option value="Chưa có hợp đồng kéo Quang">Chưa có hợp đồng kéo Quang</option>
        <option value="Vướng kiện">Vướng kiện</option>
        <option value="Chưa cấp VT">Chưa cấp VT</option>
        <option value="Chưa cấp cột">Chưa cấp cột</option>
        <option value="Chưa trồng cột">Chưa trồng cột</option>
        <option value="Chưa có đội triển khai">Chưa có đội triển khai</option>
        <option value="Có triển khai nhưng không đủ nhân công">Có triển khai nhưng không đủ nhân công</option>
        <option value="Lập PYC chậm">Lập PYC chậm</option>
        <option value="Cấp VT không đồng bộ">Cấp VT không đồng bộ</option>
        <option value="Chưa cấp viba">Chưa cấp viba</option>
        <option value="Hỏng thiết bị truyền dẫn">Hỏng thiết bị truyền dẫn</option>
        <option value="Chưa hàn nối">Chưa hàn nối</option>
        <option value="Chưa thông tuyến">Chưa thông tuyến</option>
        <option value="Đang triển khai">Đang triển khai</option>

		</select> </td>     
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn xong Quang </strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHXQ" id="Nguyen_nhan_cha_QHXQ" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHXQ")%>" readonly ="true"/></td>
     <td width="30%">&nbsp;</td>
   </tr>

  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày phát sóng </strong></td>
     <td ><input  name="Ngay_ps" id="Ngay_ps" size="40" maxlength="250" value ="<%=(objRS.Fields("Ngay_ps"))	%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "Ngay_ps_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạng thái PS </strong></td>
     <td width="40%"><input  name="Trang_thai_ps" id="Trang_thai_ps" size="40" maxlength="250" value ="<%=objRS.Fields("Trang_thai_ps")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha quá hạn PS</strong></td>
     <td width="40%"><input  name="Nguyen_nhan_cha_QHPS" id="Nguyen_nhan_cha_QHPS" size="40" maxlength="250" value ="<%=objRS.Fields("Nguyen_nhan_cha_QHPS")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con quá hạn PS</strong></td>
     <td> <select name="Nguyen_nhan_con_QHPS"  class="Nguyen_nhan_con_QHPS" id="Nguyen_nhan_con_QHPS" size="1" value =""/>
		<option selected><%=objRS.Fields("Nguyen_nhan_con_QHPS")%></option>
        <option value="Chưa có File cấu hình">Chưa có File cấu hình</option>
        <option value="Chưa có CR">Chưa có CR</option>
        <option value="Chưa Khai luồng">Chưa Khai luồng</option>
        <option value="Chưa Chèn truyền dẫn SRT">Chưa Chèn truyền dẫn SRT</option>
        <option value="Chưa có nhân sự tích hợp">Chưa có nhân sự tích hợp</option>
        <option value="Tích hợp bị lỗi">Tích hợp bị lỗi</option>
        <option value="Đã tích hợp, lỗi thiết bị">Đã tích hợp, lỗi thiết bị</option>
        <option value="Đã tích hợp, chưa đảm bảo điều kiện khác">Đã tích hợp, chưa đảm bảo điều kiện khác</option>

		</select> </td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian thi công đến hiện tại(ngày) </strong></td>
     <td width="40%"><input  name="Time_thi_cong_ht" id="Time_thi_cong_ht" size="40" maxlength="250" value ="<%=objRS.Fields("Time_thi_cong_ht")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian giảm trừ(ngày) </strong></td>
     <td width="40%"><input  name="Time_giam_tru" id="Time_giam_tru" size="40" maxlength="250" value ="<%=objRS.Fields("Time_giam_tru")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian thi công sau giảm trừ </strong></td>
     <td width="40%"><input  name="Time_thi_cong_sau_gt" id="Time_thi_cong_sau_gt" size="40" maxlength="250" value ="<%=objRS.Fields("Time_thi_cong_sau_gt")%>" readonly ="true" style="background-color:#E9E9E9"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Tình trạng </strong></td>
     <td width="40%"><input  name="Tinh_trang" id="Tinh_trang" size="40" maxlength="250" value ="<%=objRS.Fields("Tinh_trang")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạm ưu tiên </strong></td>
     <td width="40%"><input  name="Tram_uu_tien" id="Tram_uu_tien" size="40" maxlength="250" value ="<%=objRS.Fields("Tram_uu_tien")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày phê duyệt vị trí trạm </strong></td>
     <td ><input  name="Ngay_pd_vtri_tram" id="startTime" size="40" maxlength="250" value ="<%=objRS.Fields("Ngay_pd_vtri_tram")%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Công văn phê duyệt trạm </strong></td>
     <td width="40%"><input  name="CV_phe_duyet_vtri_tram" id="CV_phe_duyet_vtri_tram" size="40" maxlength="250" value ="<%=objRS.Fields("CV_phe_duyet_vtri_tram")%>"/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạm đang thi công </strong></td>
     <td width="40%"><input  name="Tram_dang_thi_cong" id="Tram_dang_thi_cong" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạm dừng thi công do vướng </strong></td>
     <td width="40%"><input  name="Tram_dung_thi_cong_do_vuong" id="Tram_dung_thi_cong_do_vuong" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Có đội xây dựng trong ngày </strong></td>
     <td width="40%"><input  name="Co_doi_xay_dung_trong_ngay" id="Co_doi_xay_dung_trong_ngay" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Có đội dựng cột trong ngày  </strong></td>
     <td width="40%"><input  name="Co_doi_dung_cot_trong_ngay" id="Co_doi_dung_cot_trong_ngay" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Có đội lắp thiết bị trong ngày </strong></td>
     <td width="40%"><input  name="Co_doi_lap_thiet_bi_trong_ngay" id="Co_doi_lap_thiet_bi_trong_ngay" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <script type="text/javascript">//<![CDATA[
    var startTime = Calendar.setup({
        inputField : "startTime",
        trigger    : "startTime_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d-%m-%Y"
      });
var Ngay_BGMB = Calendar.setup({
        inputField : "Ngay_BGMB",
        trigger    : "Ngay_BGMB_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  
							  this.redraw();
							  this.hide();
							  tudong_hienthi_ngay_moc();
                          },
        showTime   : 24,		
        dateFormat : "%d-%m-%Y"
      });
var Ngay_cap_Bulong_mong= Calendar.setup({
        inputField : "Ngay_cap_Bulong_mong",
        trigger    : "Ngay_cap_Bulong_mong_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_ngay_moc();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_khoi_cong= Calendar.setup({
        inputField : "Ngay_khoi_cong",
        trigger    : "Ngay_khoi_cong_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_QHKC();
		 tudong_hienthi_thoi_gian_tc();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_xong_mong_cot= Calendar.setup({
        inputField : "Ngay_xong_mong_cot",
        trigger    : "Ngay_xong_mong_cot_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
         tudong_hienthi_QHXMC();
						  },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_cap_cot= Calendar.setup({
        inputField : "Ngay_cap_cot",
        trigger    : "Ngay_cap_cot_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_xong_cot= Calendar.setup({
        inputField : "Ngay_xong_cot",
        trigger    : "Ngay_xong_cot_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_QHXC();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_cap_nha_cont= Calendar.setup({
        inputField : "Ngay_cap_nha_cont",
        trigger    : "Ngay_cap_nha_cont_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_xong_nha= Calendar.setup({
        inputField : "Ngay_xong_nha",
        trigger    : "Ngay_xong_nha_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_QHXN(); 
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_cap_tb= Calendar.setup({
        inputField : "Ngay_cap_tb",
        trigger    : "Ngay_cap_tb_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_QHLTB();    
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_lap_xong_tb= Calendar.setup({
        inputField : "Ngay_lap_xong_tb",
        trigger    : "Ngay_lap_xong_tb_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_xong_dien= Calendar.setup({
        inputField : "Ngay_xong_dien",
        trigger    : "Ngay_xong_dien_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_xong_quang= Calendar.setup({
        inputField : "Ngay_xong_quang",
        trigger    : "Ngay_xong_quang_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_ps= Calendar.setup({
        inputField : "Ngay_ps",
        trigger    : "Ngay_ps_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
		 tudong_hienthi_thoi_gian_tc();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });
var Ngay_pd_vtri_tram= Calendar.setup({
        inputField : "Ngay_pd_vtri_tram",
        trigger    : "Ngay_pd_vtri_tram_btn",
  weekNumbers: true,
  onSelect: function() {
         var date = new Date();
         
         this.redraw();
         this.hide();
                          },
        showTime   : 24,  
        dateFormat : "%d-%m-%Y"
      });


	 var endTime = Calendar.setup({
        inputField : "endTime",
        trigger    : "endTime_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d-%m-%Y"
      });
	
    //]]></script>	
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Ghi chú</strong></td>
     <td width="40%">
	   
       <textarea name="Ghi_chu" cols="50" rows="5" id="Ghi_chu" class="textarea" ><%=objRS.Fields("Ghi_chu")%></textarea></td>
     <td width="30%"><label class="font_alert" id="for_hidden_effect">&nbsp;</label></td>

   </tr> 

<br>   

   <td colspan="3" class="list_nemo_center"> <input id="checkbox" type="checkbox" name="checkbox" value="OK" <%if instr(checkbox,"OK") then Response.Write(sql)%>/><label for="checkbox">Xác nhận </label> </td>
</br> 
   
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Sửa Hạ tầng"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>



<%End if ' End viec kiem tra co du lieu cong viec khong%> 