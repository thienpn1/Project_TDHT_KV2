<%
	'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin") or Session("add")<>"1") Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if

'--------------------------------------------
   Dim  cr, sub_depart, executer, ask, typejob, note, fileAtt,total,done_total, regist,createUser,currentDate
	Dim Tinh,	Ma_nha_tram,Ma_tram	,Ma_cong_trinh	,DVTC	,Loai_tram_TM_DD	,Dia_hinh	,Loai_cot,	Do_cao_cot	,Loai_nha,Target_phat_song_ngay
	Dim Target_xong_mong_cot,Target_xong_cot,Target_xong_nha,Ke_hoach_thang,Ngay_BGMB,Ngay_cap_Bulong_mong,Thoi_gian_giam_tru_truoc_KC,Nguyen_nhan_cha_QHKC
	Dim Nguyen_nhan_con_QHKC,Qua_han_khoi_cong,Ngay_khoi_cong,Ngay_xong_mong_cot,Qua_han_xong_MC,Nguyen_nhan_cha_QHMC,Nguyen_nhan_con_QHMC,Ngay_cap_cot,Ngay_xong_cot,Qua_han_xong_cot
	Dim Nguyen_nhan_cha_QHXC,Nguyen_nhan_con_QHXC,Ngay_cap_nha_cont,Ngay_xong_nha,Qua_han_xong_nha,Nguyen_nhan_cha_QHXN,Nguyen_nhan_con_QHXN,Ngay_cap_tb,Ngay_lap_xong_tb,Target_lap_tb_ngay,Qua_han_lap_xong_tb,Nguyen_nhan_cha_QHTB,Nguyen_nhan_con_QHTB,Target_xong_dien_ngay,Ngay_xong_dien,Target_xong_quang,Ngay_xong_quang,Ngay_ps,Trang_thai_ps,Nguyen_nhan_cha_QHPS,Nguyen_nhan_con_QHPS,Time_thi_cong_ht,Time_giam_tru,Time_thi_cong_sau_gt,tinh_trang,Tram_uu_tien,Ngay_pd_vtri_tram,CV_phe_duyet_vtri_tram
	Dim Ghi_chu, Nguyen_nhan_cha_QHXD, Nguyen_nhan_con_QHXD, Nguyen_nhan_cha_QHXQ, Nguyen_nhan_con_QHXQ
	'content = pdb(Server.HTMLEncode(Request.Form("content")))	
	'cr= pdb(Server.HTMLEncode(Request.Form("cr")))	
	'sub_depart = pdb(Server.HTMLEncode(Request.Form("sub_depart")))		
	'startTime = convert2SimpleDateSQL(Request.Form("startTime"))
	'endTime = convert2SimpleDateSQL(Request.Form("endTime"))
	'ask = pdb(Server.HTMLEncode(Request.Form("ask")))	
	'PROCESS = pdb(Server.HTMLEncode(Request.Form("PROCESS")))
	'total = Request.Form("total")
	'done_total = Request.Form("done_total")
	'regist = Request.Form("regist")	
	'typejob = Request.Form("typejob")
	'direct = pdb(Server.HTMLEncode(Request.Form("direct")))	
	'note = pdb(Server.HTMLEncode(Request.Form("note")))	
    'Tinh = pdb(Server.HTMLEncode(Request.Form("Tinh")))
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


	createUser = Session("username")	
	currentDate = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
	IF (Ma_nha_tram<>"") then
		sql = "INSERT INTO tien_do_ha_tang "&_
				"(Tinh ,    Ma_nha_tram ,    Ma_tram ,    Ma_cong_trinh ,    DVTC ,    Loai_tram_TM_DD ,    Dia_hinh ,    Loai_cot ,    Do_cao_cot ,    Loai_nha ,    Target_phat_song_ngay	 ,    Target_xong_mong_cot	 ,    Target_xong_cot	 ,    Target_xong_nha	 ,    Ke_hoach_thang	 ,    Ngay_BGMB	 ,    Ngay_cap_Bulong_mong	 ,    Thoi_gian_giam_tru_truoc_KC	 ,    Nguyen_nhan_cha_QHKC	 ,    Nguyen_nhan_con_QHKC	 ,    Qua_han_khoi_cong	 ,    Ngay_khoi_cong	 ,    Ngay_xong_mong_cot	 ,    Qua_han_xong_MC	 ,    Nguyen_nhan_cha_QHMC	 ,    Nguyen_nhan_con_QHMC	 ,    Ngay_cap_cot	 ,    Ngay_xong_cot	 ,    Qua_han_xong_cot	 ,    Nguyen_nhan_cha_QHXC	 ,    Nguyen_nhan_con_QHXC	 ,    Ngay_cap_nha_cont	 ,    Ngay_xong_nha	 ,    Qua_han_xong_nha	 ,    Nguyen_nhan_cha_QHXN	 ,    Nguyen_nhan_con_QHXN	 ,    Ngay_cap_tb	 ,    Ngay_lap_xong_tb	 ,    Target_lap_tb_ngay	 ,    Qua_han_lap_xong_tb	 ,    Nguyen_nhan_cha_QHTB	 ,    Nguyen_nhan_con_QHTB	 ,    Target_xong_dien_ngay	 ,    Ngay_xong_dien	 ,	Nguyen_nhan_cha_QHXD	 ,    Nguyen_nhan_con_QHXD	 ,    Target_xong_quang	 ,    Ngay_xong_quang	 ,	Nguyen_nhan_cha_QHXQ	 ,    Nguyen_nhan_con_QHXQ	 ,    Ngay_ps	 ,    Trang_thai_ps	 ,    Nguyen_nhan_cha_QHPS	 ,    Nguyen_nhan_con_QHPS	 ,    Time_thi_cong_ht	 ,    Time_giam_tru	 ,    Time_thi_cong_sau_gt	 ,    Tinh_trang	 ,    Tram_uu_tien	 ,    Ngay_pd_vtri_tram	 ,    CV_phe_duyet_vtri_tram	 ,    Ghi_chu)"&_
			   " VALUES "&_
"('"&Tinh&"', "&_
"'"&Ma_nha_tram&"', "&_
"'"&Ma_tram&"', "&_
"'"&Ma_cong_trinh&"', "&_
"'"&DVTC&"', "&_
"'"&Loai_tram_TM_DD&"', "&_
"'"&Dia_hinh&"', "&_
"'"&Loai_cot&"', "&_
"'"&Do_cao_cot&"', "&_
"'"&Loai_nha&"', "&_
"'"&Target_phat_song_ngay&"', "&_
"'"&Target_xong_mong_cot&"', "&_
"'"&Target_xong_cot&"', "&_
"'"&Target_xong_nha&"', "&_
"'"&Ke_hoach_thang&"', "&_
"'"&Ngay_BGMB&"', "&_
"'"&Ngay_cap_Bulong_mong&"', "&_
"'"&Thoi_gian_giam_tru_truoc_KC&"', "&_
"'"&Nguyen_nhan_cha_QHKC&"', "&_
"'"&Nguyen_nhan_con_QHKC&"', "&_
"'"&Qua_han_khoi_cong&"', "&_
"'"&Ngay_khoi_cong&"', "&_
"'"&Ngay_xong_mong_cot&"', "&_
"'"&Qua_han_xong_MC&"', "&_
"'"&Nguyen_nhan_cha_QHMC&"', "&_
"'"&Nguyen_nhan_con_QHMC&"', "&_
"'"&Ngay_cap_cot&"', "&_
"'"&Ngay_xong_cot&"', "&_
"'"&Qua_han_xong_cot&"', "&_
"'"&Nguyen_nhan_cha_QHXC&"', "&_
"'"&Nguyen_nhan_con_QHXC&"', "&_
"'"&Ngay_cap_nha_cont&"', "&_
"'"&Ngay_xong_nha&"', "&_
"'"&Qua_han_xong_nha&"', "&_
"'"&Nguyen_nhan_cha_QHXN&"', "&_
"'"&Nguyen_nhan_con_QHXN&"', "&_
"'"&Ngay_cap_tb&"', "&_
"'"&Ngay_lap_xong_tb&"', "&_
"'"&Target_lap_tb_ngay&"', "&_
"'"&Qua_han_lap_xong_tb&"', "&_
"'"&Nguyen_nhan_cha_QHTB&"', "&_
"'"&Nguyen_nhan_con_QHTB&"', "&_
"'"&Target_xong_dien_ngay&"', "&_
"'"&Ngay_xong_dien&"', "&_
"'"&Nguyen_nhan_cha_QHXD&"', "&_
"'"&Nguyen_nhan_con_QHXD&"', "&_
"'"&Target_xong_quang&"', "&_
"'"&Ngay_xong_quang&"', "&_
"'"&Nguyen_nhan_cha_QHXQ&"', "&_
"'"&Nguyen_nhan_con_QHXQ&"', "&_
"'"&Ngay_ps&"', "&_
"'"&Trang_thai_ps&"', "&_
"'"&Nguyen_nhan_cha_QHPS&"', "&_
"'"&Nguyen_nhan_con_QHPS&"', "&_
"'"&Time_thi_cong_ht&"', "&_
"'"&Time_giam_tru&"', "&_
"'"&Time_thi_cong_sau_gt&"', "&_
"'"&Tinh_trang&"', "&_
"'"&Tram_uu_tien&"', "&_
"'"&Ngay_pd_vtri_tram&"', "&_
"'"&CV_phe_duyet_vtri_tram&"', "&_
"'"&Ghi_chu&"') "

					
		'Response.Write(sql)
		Set objRS = objConn.Execute(sql)
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
function validateFormOnSubmit() {
  var Dia_hinh= document.getElementById("Dia_hinh")
  var Loai_tram= document.getElementById("Loai_tram")
		if (Loai_tram.value.toLowerCase()=="trên mái") 
		{	document.getElementById("Target_phat_song_ngay").innerHTML= "30";
			Loai_tram.focus();
			return false;
		}
		if (Loai_tram.value.toLowerCase()=="dưới đất"&&Dia_hinh.value.toLowerCase()=="đồng bằng") 
		{	document.getElementById("Target_phat_song_ngay").innerHTML= "45";
			Loai_tram.focus();
			return false;
		}
		if (Loai_tram.value.toLowerCase()=="dưới đất"&&Dia_hinh.value.toLowerCase()=="miền núi") 
		{	document.getElementById("Target_phat_song_ngay").innerHTML= "60";
			Loai_tram.focus();
			return false;
		}
		if (Loai_tram.value.toLowerCase()=="cột tự đứng"&&Dia_hinh.value.toLowerCase()=="ven biển") 
		{	document.getElementById("Target_phat_song_ngay").innerHTML= "150";
			Loai_tram.focus();
			return false;
		}

  var Tinh = document.getElementById("Tinh")
		if (Tinh.value=="") 
		{	document.getElementById("for_Tinh").innerHTML= "Chưa nhập Tỉnh";
			Tinh.focus();
			return false;
		}
		
  var Ma_nha_tram = document.getElementById("Ma_nha_tram")
		if (Ma_nha_tram.value=="") 
		{	document.getElementById("for_Ma_nha_tram").innerHTML= "Chưa nhập Mã Nhà trạm";
			Ma_nha_tram.focus();
			return false;
		}

var Ma_tram = document.getElementById("Ma_tram")
		if (Ma_tram.value=="") 
		{	document.getElementById("for_Ma_tram").innerHTML= "Chưa nhập Mã trạm";
			Ma_tram.focus();
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
</script>

<fieldset class="Khung1">
<legend class="mau_chu_legen">Thông tin Hạ Tầng</legend>
<div align = "left">
<form id="frm_search" name="frm_search" method="post"  onsubmit="return validateFormOnSubmit()"  action="">
<div class="container">
<table width="70%" border="0"id="list_tbl" >
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Tỉnh <font color="red">*</font></strong></td>
     <td width="40%"><input  name="Tinh" id="Tinh" size="40" maxlength="250" value ="" /></td>
     <td width="30%"><label class="font_alert" id="for_Tinh">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã nhà trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="Ma_nha_tram" id="Ma_nha_tram" size="40" maxlength="250" value =""/></td>
     <td width="30%"><label class="font_alert" id="for_Ma_nha_tram">&nbsp;</label></td>
   </tr>
      <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã trạm <font color="red">*</font> </strong></td>
     <td width="40%"><input  name="Ma_tram" id="Ma_tram" size="40" maxlength="250" value =""/></td>
     <td width="30%"><label class="font_alert" id="for_Ma_tram">&nbsp;</label></td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Mã công trình</strong></td>
     <td width="40%"><input  name="Ma_cong_trinh" id="Ma_cong_trinh" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> ĐVTC </strong></td>
     <td><select name="DVTC"  class="DVTC" id="DVTC" size="1" value =""/>
		<option selected>-----Chọn-----</option>
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
     <td><select name="Loai_tram_TM_DD" class="Loai_tram_TM_DD" id="Loai_tram_TM_DD" size="1" onChange="tudong_hienthi()" >
		<option selected>-----Chọn-----</option>
		<option value="Trên mái">Trên mái</option>
		<option value="Cột tự đứng">Cột tự đứng </option>		
		<option value="Dưới đất">Dưới đất</option> </select>   </td>
    </tr>
<tr>
<td width="30%"><strong><img src="images/maskrow.gif" />Địa hinh</strong> </td>
     <td><select name="Dia_hinh" class="Dia_hinh" id="Dia_hinh" size="1" onChange="tudong_hienthi()">
	 	<option selected>-----Chọn-----</option>
		<option value="Đồng bằng">Đồng bằng</option>
		<option value="Hải đảo">Hải đảo</option>
		<option value="Miền núi">Miền núi</option> 
		</select>    
	   </td>

  </tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại cột</strong></td>
     <td><select name="Loai_cot"  class="Loai_cot" id="Loai_cot" size="1"   onChange="tudong_hienthi()">
		<option selected>-----Chọn-----</option>
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
     <td width="40%"><input  name="Do_cao_cot" id="Do_cao_cot" size="40" maxlength="250" onfocusout="tudong_hienthi()">
	 </td>
     <td width="30%">&nbsp;</td>
   </tr>   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Loại nhà</strong></td>
     <td><select name="Loai_nha"  class="Loai_nha" id="Loai_nha" size="1" onChange="tudong_hienthi()"/>
		<option selected>-----Chọn-----</option>
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
     <td width="40%"><input  name="Target_phat_song_ngay" id="Target_phat_song_ngay" size="40" maxlength="250"  value ="" disabled/></td>
     
	 <td width="10%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong móng cột</strong></td>
     <td width="40%"><input  name="Target_xong_mong_cot" id="Target_xong_mong_cot" size="40" maxlength="250" value =""  disabled/></td>
     <td width="30%">&nbsp;</td>
   </tr>   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong cột</strong></td>
     <td width="40%"><input  name="Target_xong_cot" id="Target_xong_cot" size="40" maxlength="250" value =""  disabled/></td>
     <td width="30%">&nbsp;</td>
   </tr>	 <td width="30%"><strong><img src="images/maskrow.gif" /> Target xong nhà</strong></td>
     <td width="40%"><input  name="Target_xong_nha" id="Target_xong_nha" size="40" maxlength="250" value ="" disabled/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Kế hoạch tháng</strong></td>
     <td> <select name="Ke_hoach_thang"  class="Ke_hoach_thang" id="Ke_hoach_thang" size="1" value =""/>
	 		<option selected>-----Chọn-----</option>
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
     <td ><input  name="Ngay_BGMB" id="Ngay_BGMB" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
	 </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp Bulong móng </strong></td>
     <td ><input  name="Ngay_cap_Bulong_mong" id="Ngay_cap_Bulong_mong" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian giảm trừ trước khởi công </strong></td>
     <td width="40%"><input  name="Thoi_gian_giam_tru_truoc_KC" id="Thoi_gian_giam_tru_truoc_KC" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="40%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha(quá hạn khởi công) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con(Quá hạn khởi công) </strong></td>
     <td> <select name="Nguyen_nhan_con"  class="Nguyen_nhan_con" id="Nguyen_nhan_con" size="1" value =""/>
		<option selected>-----Chọn-----</option>
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
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn khởi công </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Khởi công </strong></td>
     <td ><input  name="Ngay_khoi_cong" id="Ngay_khoi_cong" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong móng cột </strong></td>
     <td ><input  name="Ngay_xong_mong_cot" id="Ngay_xong_mong_cot" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong móng cột </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha(Quá hạn móng cột) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con(Quá hạn móng cột) </strong></td>
     <td> <select name="Nguyen_nhan_con_QHMC"  class="Nguyen_nhan_con_QHMC" id="Nguyen_nhan_con_QHMC" size="1" value =""/>
		<option selected>-----Chọn-----</option>
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
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp cột </strong></td>
     <td ><input  name="Ngay_cap_cot" id="Ngay_cap_cot" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong cột </strong></td>
     <td ><input  name="Ngay_xong_cot" id="Ngay_xong_cot" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong cột </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha(Quá hạn xong cột) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con(Quá hạn xong cột) </strong></td>
     <td> <select name="Nguyen_nhan_con_QHXC"  class="Nguyen_nhan_con_QHXC" id="Nguyen_nhan_con_QHXC" size="1" value =""/>
		<option selected>-----Chọn-----</option>
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
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp nhà Cont </strong></td>
     <td ><input  name="Ngay_cap_nha_cont" id="Ngay_cap_nha_cont" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày xong nhà </strong></td>
     <td ><input  name="Ngay_xong_nha" id="Ngay_xong_nha" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn xong nhà </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha</strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày cấp TB </strong></td>
     <td ><input  name="Ngay_cap_tb" id="Ngay_cap_tb" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày lắp xong TB </strong></td>
     <td ><input  name="Ngay_lap_xong_tb" id="Ngay_lap_xong_tb" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target lắp thiết bị(Ngày) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Quá hạn lắp xong TB </strong></td>
     <td width="40%"><input  name="Qua_han_lap_xong_tb" id="Qua_han_lap_xong_tb" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target xong điện(Ngày) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Xong điện </strong></td>
     <td ><input  name="startTime" id="startTime" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Target xong điện(Ngày) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày Xong quang </strong></td>
     <td ><input  name="startTime" id="startTime" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày phát sóng </strong></td>
     <td ><input  name="startTime" id="startTime" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạng thái PS </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân cha </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Nguyên nhân con </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian thi công đến hiện tại(ngày) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian giảm trừ(ngày) </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Thời gian thi công sau giảm trừ </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Tình trạng </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Trạm ưu tiên </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Ngày phê duyệt vị trí trạm </strong></td>
     <td ><input  name="startTime" id="startTime" size="40" maxlength="250" value ="<%=getCurrentDate()%>" onChange="onChaneText(this.value,'for_startTime')"/>&nbsp;<img id= "startTime_btn" src="images/calendar.png" width="20" height="20" /></td>
     <td ><label class="font_alert" id="for_startTime">&nbsp;</label></td>
   </tr>
<tr>
  <td width="30%"><strong><img src="images/maskrow.gif" />  Công văn phê duyệt trạm </strong></td>
     <td width="40%"><input  name="cr" id="cr" size="40" maxlength="250" value =""/></td>
     <td width="30%">&nbsp;</td>
   </tr>
   <script type="text/javascript">//<![CDATA[
    var startTime = Calendar.setup({
        inputField : "startTime",
        trigger    : "startTime_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  this.args.max = date;
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	  
	 var endTime = Calendar.setup({
        inputField : "endTime",
        trigger    : "endTime_btn",
		weekNumbers: true,
		onSelect: function() {
							  var date = new Date();
							  this.args.max = date;
							  this.redraw();
							  this.hide();
                          },
        showTime   : 24,		
        dateFormat : "%d/%m/%Y"
      });
	
    //]]></script>	
   <tr>
	 <td width="30%"><strong><img src="images/maskrow.gif" /> Ghi chú</strong></td>
     <td width="40%">
	   <span class="font_inform"  id="label_INCEffect"></span>
       <textarea name="ask" cols="50" rows="5" id="ask" class="textarea"></textarea></td>
     <td width="30%"><label class="font_alert" id="for_hidden_effect">&nbsp;</label></td>
   </tr>   
   
   
   <tr>
     <td colspan="3" class="list_nemo_center" >
	    <input type="submit" class="hieu_ung_nut2" name="Submit" value="Tạo Hạ tầng"/>
       <input name="Reset" type="reset" class="hieu_ung_nut2" id="Reset" value="Reset"/>
	   <input name="back" type="button" class="hieu_ung_nut2" id="back" value="Quay lại" ONCLICK="history.go(-1)"/>	 </td>
    </tr>
</table>
</div>
</form> 
</div>
</fieldset>