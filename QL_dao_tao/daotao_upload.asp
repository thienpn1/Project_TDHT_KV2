<HTML>
<HEAD>
<!--#include file="clsUpload.asp"-->
<!--#Include file = "db_common.asp"-->
<!--#Include file = "db_connect.asp"-->
<!--#Include file = "common.asp"-->
<link href="css/index.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body {
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 10px;
}
-->
</style></HEAD>
<script>
 function CloseAndRefresh(){     
	 opener.location.reload(true);
     self.close();
  }
 </script>
 <script>
 function validateFormOnSubmit() {
	var linkfilename= document.getElementById("txtFile")
	if (linkfilename.value=="") 
		{			
			alert("Tên file không được trống!");
			return false;
		}
 
 }
 </script>
<BODY>
<fieldset class="Khung_upload">
<legend class="mau_chu_legen">Upload file đính kèm</legend>
<FORM ACTION = "#" ENCTYPE="multipart/form-data" METHOD="POST">
	<table border="0"  >
          <tr>
 		    <td>		
			    File Name: <INPUT TYPE=FILE NAME="txtFile" size="30" id="txtFile">
			</br>Yêu cầu định dạng file .rar,.zip		</td> 	
			<td nowrap>&nbsp;</td> 		
      	  </tr>
          <tr>
            <td><input type = "SUBMIT" class="hieu_ung_nut2" name="cmdSubmit" value="Import" onClick=" return validateFormOnSubmit()" >
            <input name="button" type = "button" class="hieu_ung_nut2" onClick="CloseAndRefresh();" value="Close"></td>
            <td nowrap>&nbsp;</td>
          </tr>
    </table>	
	
</form>
</fieldset>
<%
	Dim sFile, count, counterror, fs 
	set o = new clsUpload
	
	if o.Exists("cmdSubmit") then
	
	'get client file name without path
	sFileSplit = split(o.FileNameOf("txtFile"), "\")
	sFile = sFileSplit(Ubound(sFileSplit))
	'response.write(sFile)
	o.FileInputName = "txtFile"
	
	'thay doi ten file randomn khi luu
	nRandom = Int((1000000 - 1 + 1) * Rnd + 1000000)	
	if ( Right(sFile,3)="xls") then
		
		sFile = "file" & CStr(nRandom) & ".xls"
	elseif ( Right(sFile,4)="xlsx") then
		sFile = "file" & CStr(nRandom) & ".xlsx"
	end if
	
	
	o.FileFullPath = Server.MapPath(".") & "\upload\" & sFile
	response.write(o.FileFullPath)
	o.save

		If o.Error = "" then
			'response.write ".:Upload thanh cong." 
			'Demo Input = " & o.ValueOf("Demo")
		
		Set fs=Server.CreateObject("Scripting.FileSystemObject")
		sFile = o.FileFullPath
		count = 0
		counterror=0
			If (sFile <> "") Then   
			  If ( Right(sFile,3)="xls" or Right(sFile,4)="xlsx") then	
			  
				Set adoCn = CreateObject("ADODB.Connection")
				Set adoRs = CreateObject("ADODB.Recordset")		      		
				
					if ( Right(sFile,3)="xls") then
						
							
						With adoCn
							.Provider = "Microsoft.Jet.OLEDB.4.0"						
							.ConnectionString = "Data Source="&sFile&";" & "Extended Properties=&#34;Excel 8.0;IMEX=1;&#34;"
							.Open				
						End With		
					elseif ( Right(sFile,4)="xlsx") then
						With adoCn
							.Provider = "Microsoft.ACE.OLEDB.12.0"						
							.ConnectionString = "Data Source="&sFile&";" & "Extended Properties=&#34;Excel 12.0 Xml;HDR=YES;IMEX=1;&#34;"
							.Open			
						End With
					end if
					
					'strQuery = "SELECT * FROM [Sheet1$]"
					strQuery = "SELECT * FROM A1:BP500"
					
					With adoRs
						Set .ActiveConnection = adoCn
						.Open strQuery
					End With
					adoRs.movefirst		
					
				'adoRs.movenext		
				'sadoRs.movenext	
				'Response.Write("::B&#7843;ng ghi l&#7895;i- c&#243; c&#7897;t b&#7855;t bu&#7897;c b&#7883; r&#7895;ng:<br>")
				'currentDate = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
				'dim existAccount, startdate, enddate
				'existAccount=""
				
				
				if not adoRs is nothing then
				
					while not adoRs.eof	
						if  (Trim(Cstr(adoRs.Fields(0).Value&" ")))<>"" and (Trim(Cstr(adoRs.Fields(2).Value&" ")))<>""   then		
						
					

					
				sql = "INSERT INTO tien_do_ha_tang "&_
				
				"(Tinh, Ma_nha_tram, Ma_tram, Ma_cong_trinh, DVTC, Loai_tram_TM_DD, Dia_hinh, Loai_cot, Do_cao_cot, Loai_nha, Target_phat_song_ngay, Target_xong_mong_cot, Target_xong_cot, Target_xong_nha, Ke_hoach_thang, Ngay_BGMB, Ngay_cap_Bulong_mong, Thoi_gian_giam_tru_truoc_KC, Nguyen_nhan_cha_QHKC, Nguyen_nhan_con_QHKC, Qua_han_khoi_cong, Ngay_khoi_cong, Ngay_xong_mong_cot, Qua_han_xong_MC, Nguyen_nhan_cha_QHMC, Nguyen_nhan_con_QHMC, Ngay_cap_cot, Ngay_xong_cot, Qua_han_xong_cot, Nguyen_nhan_cha_QHXC, Nguyen_nhan_con_QHXC, Ngay_cap_nha_cont, Ngay_xong_nha, Qua_han_xong_nha, Nguyen_nhan_cha_QHXN, Nguyen_nhan_con_QHXN, Ngay_cap_tb, Ngay_lap_xong_tb, Target_lap_tb_ngay, Qua_han_lap_xong_tb, Nguyen_nhan_cha_QHTB, Nguyen_nhan_con_QHTB, Target_xong_dien_ngay, Ngay_xong_dien, Qua_han_lap_xong_dien, Nguyen_nhan_cha_QHXD, Nguyen_nhan_con_QHXD, Target_xong_quang, Ngay_xong_quang, Nguyen_nhan_cha_QHXQ, Nguyen_nhan_con_QHXQ, Ngay_ps, Trang_thai_ps, Nguyen_nhan_cha_QHPS, Nguyen_nhan_con_QHPS, Time_thi_cong_ht, Time_giam_tru, Time_thi_cong_sau_gt, Tinh_trang, Tram_uu_tien, Ngay_pd_vtri_tram, CV_phe_duyet_vtri_tram, Tram_dang_thi_cong, Tram_dung_thi_cong_do_vuong, Co_doi_xay_dung_trong_ngay, Co_doi_dung_cot_trong_ngay, Co_doi_lap_thiet_bi_trong_ngay, Ghi_chu, Nguoi_tao)"&_
			   " VALUES ('"&_																
										 pdb((Trim(Cstr(adoRs.Fields(0).Value&" "))))&"','"&_	
										 pdb((Trim(Cstr(adoRs.Fields(1).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(2).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(3).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(4).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(5).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(6).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(7).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(8).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(9).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(10).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(11).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(12).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(13).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(14).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(15).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(16).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(17).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(18).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(19).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(20).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(21).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(22).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(23).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(24).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(25).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(26).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(27).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(28).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(29).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(30).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(31).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(32).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(33).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(34).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(35).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(36).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(37).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(38).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(39).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(40).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(41).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(42).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(43).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(44).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(45).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(46).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(47).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(48).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(49).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(50).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(51).Value&" "))))&"','"&_									
										 pdb((Trim(Cstr(adoRs.Fields(52).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(53).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(54).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(55).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(56).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(57).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(58).Value&" "))))&"','"&_										
										 pdb((Trim(Cstr(adoRs.Fields(59).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(60).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(61).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(62).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(63).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(64).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(65).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(66).Value&" "))))&"','"&_
										 pdb((Trim(Cstr(adoRs.Fields(67).Value&" "))))&"','"&_										 
										 pdb(Trim(Cstr("admin_import")))&"')"
													
							objConn.Execute(sql)
						
							response.write(	adoRs(2).Value&"   ")
								
							count = count + 1
							'Response.write(Trim(Cstr(adoRs(0).Value&" ")))			
							counterror = counterror + 1
					 
						adoRs.MoveNext
						end if
					wend
				sql_log="INSERT INTO log_action(user, action, Time) VALUES ('"&Session("username")&"','IMport"&o.FileFullPath&"','"&getCurrentDateTime()&"')"	
				objConn.Execute(sql_log)
					
				 end if	
				
				
				
				Response.Write("<br>.:T&#7893;ng s&#7889; b&#7843;n ghi import &#273;&#432;&#7907;c l&#224;: "&count&_
				"<br>.:T&#7893;ng s&#7889; b&#7843;n ghi l&#7895;i ho&#7863;c account &#273;&#227; t&#7891;n t&#7841;i: "& existAccount)
									
					adoRs.Close
					set adoRs=nothing
					adoCn.Close
					set adoCn=nothing
				Else
				    Response.write ".:Sai dinh dang file. Phai la xls hoac xlsx"
				End if
			End If	
				if( Err.number <> 0 ) then
						Response.write( "Import Unsuccessful!"&Err.raise())
					end if
				 on error goto 0

			'Xoa file da upload len
			fs.DeleteFile(sFile)
				
		Else
			response.write ".:Khong upload thanh cong."
		End if
	End if
	set fs=nothing
	set o = nothing
%> 

</BODY>
</HTML>