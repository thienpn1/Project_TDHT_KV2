<%
'-----------------------------------------
DIM sBASE_64_CHARACTERS
sBASE_64_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwx yz0123456789+/"
' --------------------------------------
function Base64decode(ByVal asContents)
Dim lsResult
Dim lnPosition
Dim lsGroup64, lsGroupBinary
Dim Char1, Char2, Char3, Char4
Dim Byte1, Byte2, Byte3
dim sql_qhmc
if Len(asContents) Mod 4 > 0 Then asContents = asContents & String(4 - (Len(asContents) Mod 4), " ")
lsResult = ""

For lnPosition = 1 To Len(asContents) Step 4
lsGroupBinary = ""
lsGroup64 = Mid(asContents, lnPosition, 4)
Char1 = INSTR(sBASE_64_CHARACTERS, Mid(lsGroup64, 1, 1)) - 1
Char2 = INSTR(sBASE_64_CHARACTERS, Mid(lsGroup64, 2, 1)) - 1
Char3 = INSTR(sBASE_64_CHARACTERS, Mid(lsGroup64, 3, 1)) - 1
Char4 = INSTR(sBASE_64_CHARACTERS, Mid(lsGroup64, 4, 1)) - 1
Byte1 = Chr(((Char2 And 48) \ 16) Or (Char1 * 4) And &HFF)
Byte2 = lsGroupBinary & Chr(((Char3 And 60) \ 4) Or (Char2 * 16) And &HFF)
Byte3 = Chr((((Char3 And 3) * 64) And &HFF) Or (Char4 And 63))
lsGroupBinary = Byte1 & Byte2 & Byte3

lsResult = lsResult + lsGroupBinary
Next
Base64decode = lsResult
End function
' ---------------------------------------
function Base64encode(ByVal asContents)
Dim lnPosition
Dim lsResult
Dim Char1
Dim Char2
Dim Char3
Dim Char4
Dim Byte1
Dim Byte2
Dim Byte3
Dim SaveBits1
Dim SaveBits2
Dim lsGroupBinary
Dim lsGroup64

if Len(asContents) Mod 3 > 0 Then asContents = asContents & String(3 - (Len(asContents) Mod 3), " ")
lsResult = ""

For lnPosition = 1 To Len(asContents) Step 3
lsGroup64 = ""
lsGroupBinary = Mid(asContents, lnPosition, 3)

Byte1 = Asc(Mid(lsGroupBinary, 1, 1)): SaveBits1 = Byte1 And 3
Byte2 = Asc(Mid(lsGroupBinary, 2, 1)): SaveBits2 = Byte2 And 15
Byte3 = Asc(Mid(lsGroupBinary, 3, 1))

Char1 = Mid(sBASE_64_CHARACTERS, ((Byte1 And 252) \ 4) + 1, 1)
Char2 = Mid(sBASE_64_CHARACTERS, (((Byte2 And 240) \ 16) Or (SaveBits1 * 16) And &HFF) + 1, 1)
Char3 = Mid(sBASE_64_CHARACTERS, (((Byte3 And 192) \ 64) Or (SaveBits2 * 4) And &HFF) + 1, 1)
Char4 = Mid(sBASE_64_CHARACTERS, (Byte3 And 63) + 1, 1)
lsGroup64 = Char1 & Char2 & Char3 & Char4

lsResult = lsResult + lsGroup64
Next

Base64encode = lsResult
End function
'------------------------------------------------------
Function convert2SimpleDateSQL(dateASP) 'dateASP: dd/mm/yyyy, SimpleDateSQL: yyyy-mm-dd
  Dim DateArray, DateSQL, i
  DateArray = Split(dateASP, "/")
  For i=1 To uBound(DateArray) 
      DateSQL = Trim(DateArray(2))+"-"+Trim(DateArray(1))+"-"+Trim(DateArray(0))
  Next 
  convert2SimpleDateSQL = DateSQL
End function
'------------------------------------------------------
Function convert2DateSQL(dateASP) 'dateASP: mm/dd/yyyy, SimpleDateSQL: yyyy-mm-dd
  Dim DateArray, DateSQL,i
  DateArray = Split(dateASP, "/")
  For i=1 To uBound(DateArray) 
      DateSQL = Trim(DateArray(2))+"-"+Trim(DateArray(0))+"-"+Trim(DateArray(1))
  Next 
  convert2DateSQL = DateSQL
End function
'-----------------------------------------
Function convert2SimpleDateASP(dateSQL) 'dateSQL: yyyy-mm-dd, dateASP: dd/mm/yyy
  Dim DateArray, DateASP, i , dateSQL_value
  
	
		DateArray = Split(dateSQL, "-")
		For i=1 To uBound(DateArray) 
			DateASP = DateArray(2)+"/"+DateArray(1)+"/"+DateArray(0)
		Next 
		convert2SimpleDateASP = DateASP
		
  
End function

'-----------------------------------------
Function convert2DateTimeSQL(datetimeASP) 'dateASP: dd/mm/yyyy hh:mm, SimpleDateSQL: yyyy-mm-dd hh:mm:ss
  Dim DateArray, DateTimeSQL,i
  DateArray = Split(datetimeASP, " ")
  For i=1 To uBound(DateArray) 
      DateTimeSQL = convert2SimpleDateSQL(DateArray(0))+ " "+ DateArray(1)
  Next 
  convert2DateTimeSQL = DateTimeSQL
End function
'-----------------------------------------
Function convert2ASPDateTime(datetimeASP) 'date input: dd/mm/yyyy hh:mm:ss, Date ASP: mm/dd/yyyy hh:mm:ss,
  Dim DateArray, DateTimeSQL,i
  DateArray = Split(datetimeASP, " ")
  For i=1 To uBound(DateArray) 
      DateTimeSQL = Split(DateArray(0),"/")(1)+"/"+Split(DateArray(0),"/")(0)+"/"+Split(DateArray(0),"/")(2)&" "+ DateArray(1)
  Next 
  convert2ASPDateTime = DateTimeSQL
End function
'-----------------------------------------
Function getCurrentDate()  'dd/mm/yyyy
	Dim Datemmddyyyy,Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date()
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= ngay&"/"&thang&"/"&year(Datemmddyyyy)
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getCurrentDate = Dateddmmyyyy
End function
'---------------------------------------getmonthandyear
Function getmonthandyear(Datemmddyyyy)  
	
	
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= thang&"-"&year(Datemmddyyyy)
	getmonthandyear = Dateddmmyyyy
End function
Function getcurrentmonthandyear()  
	Dim Datemmddyyyy,Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date()
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= thang&"-"&year(Datemmddyyyy)
	getcurrentmonthandyear = Dateddmmyyyy
End function
'-----------------------------------------
Function getCurrentDate_export()  'dd_mm_yyyy
	Dim Datemmddyyyy,Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date()
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= ngay&"_"&thang&"_"&year(Datemmddyyyy)
	getCurrentDate_export = Dateddmmyyyy
End function
'-----------------------------------------
Function getYesterdayDate()  'dd/mm/yyyy
	Dim Datemmddyyyy,Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date() - 1
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= ngay&"/"&thang&"/"&year(Datemmddyyyy)
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getYesterdayDate = Dateddmmyyyy
End function
'-----------------------------------------
Function getTomorowDate()  'dd/mm/yyyy
	Dim Datemmddyyyy,Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date() + 1
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= ngay&"/"&thang&"/"&year(Datemmddyyyy)
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getTomorowDate = Dateddmmyyyy
End function
'-----------------------------------------
Function getCurrentDateTime() 'dd/mm/yyyy hh:mm
	getCurrentDateTime = getCurrentDate() & " " & FormatDateTime(now(), 3)
End function
'-----------------------------------------
Function getFirstDateInMonth() 'dd/mm/yyyy
	Dim Datemmddyyyy, Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date()
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= "01"&"/"&thang&"/"&year(Datemmddyyyy)
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getFirstDateInMonth = Dateddmmyyyy
End function
'-----------------------------------------
Function getLastDateInMonth() 'dd/mm/yyyy
	Dim Datemmddyyyy, Dateddmmyyyy,ngay,thang
	Datemmddyyyy = Date()
	ngay= day(Datemmddyyyy)
	thang= month(Datemmddyyyy)
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateddmmyyyy= GetLastDay(Date())&"/"&thang&"/"&year(Datemmddyyyy)
	getLastDateInMonth = Dateddmmyyyy
End function
'-------------------------------------------
function GetLastDay(aDate)
    dim intMonth
    dim dteFirstDayNextMonth

    dtefirstdaynextmonth = dateserial(year(adate),month(adate) + 1, 1)
    GetLastDay = Day(DateAdd ("d", -1, dteFirstDayNextMonth))
end function
'-----------------------------------------
Function CalDay(tungay, denngay) 'Format dd/mm/yyyy
  Dim DateArray,songay, nam1, thang1, ngay1, nam2, thang2, ngay2
  DateArray = Split(tungay, "/")
  ngay1= clng(DateArray(0))
  thang1=clng(DateArray(1))
  nam1=clng(DateArray(2))      
  DateArray =Split(denngay, "/")
  ngay2=clng(DateArray(0))
  thang2=clng(DateArray(1))
  nam2=clng(DateArray(2))
  songay= (nam2-nam1)*365 + (thang2- thang1)*30+ ngay2-ngay1
  CalDay=songay
End function
'-----------------------------------------
Function CalTime(tugio, dengio) 'Format hh:mm
  Dim sogio,DateArray, gio1, gio2, phut1, phut2
  DateArray = Split(tugio, ":")
  gio1=clng(DateArray(0))
  phut1=clng(DateArray(1))
  DateArray = Split(dengio, ":")
  gio2=clng(DateArray(0))
  phut2=clng(DateArray(1))
  sogio = (gio2-gio1)+ round((phut2-phut1)/60,2)
  CalTime= round(sogio,1)
End function
'-----------------------------------------
Function CalHHMM(tugio, dengio) 'Format hh:mm
  Dim DateArray, gio1, gio2, phut1, phut2, gio, phut
  DateArray = Split(tugio, ":")
  gio1=clng(DateArray(0))
  phut1=clng(DateArray(1))
  DateArray = Split(dengio, ":")
  gio2=clng(DateArray(0))
  phut2=clng(DateArray(1))
  if (phut2 >= phut1) then
  	gio = gio2-gio1
	phut= phut2-phut1 	
  else
    gio = gio2-gio1-1
	phut= phut1-phut2 	 
  end if 
  if (gio<10) then gio= "0" + cStr(gio) end if
  if (phut<10) then phut= "0" + cStr(phut) end if
  CalHHMM = cStr(gio) + ":" + cStr(phut)
End function
'-----------------------------------------
Function SumHHMM(tugio, dengio) 'Format hh:mm
  Dim DateArray, gio1, gio2, phut1, phut2, gio, phut
  DateArray = Split(tugio, ":")
  gio1=clng(DateArray(0))
  phut1=clng(DateArray(1))
  DateArray = Split(dengio, ":")
  gio2=clng(DateArray(0))
  phut2=clng(DateArray(1))
  phut = phut1 + phut2
  gio = gio1 + gio2
  if (phut >= 60) then
  	gio = gio + 1
	phut = phut - 60	  
  end if 
  if (gio<10) then gio= "0" + cStr(gio) end if
  if (phut<10) then phut= "0" + cStr(phut) end if
  SumHHMM = cStr(gio) + ":" + cStr(phut)
End function
'-----------------------------------------
Function CalDateTime(tungay, denngay) 'Format dd/mm/yyyy hh:mm
  Dim sogio,DateArray, ngay1, ngay2, gio1, gio2
  DateArray = Split(tungay, " ")
  ngay1=DateArray(0)
  gio1=DateArray(1)
  DateArray = Split(denngay, " ")
  ngay2=DateArray(0)
  gio2=DateArray(1)
  sogio = CalDay(ngay2, ngay1)*24 + CalTime(gio2,gio1)
  CalDateTime = sogio
End function
'-----------------------------------------
Function ToHours(strTime)
	Dim gio,TimeArray
	TimeArray = split(strTime,":")
	gio = clng(TimeArray(0)) + clng(TimeArray(1))/60
	ToHours= round(gio,2)
End function
'-----------------------------------------
Function DisplayDate(strDate)  'Format yyyy-dd-mm
	dim ngay, thang, nam, DateArray
	DateArray= Split(strDate, "-")
	ngay= DateArray(2)
	thang= DateArray(1)
	nam= DateArray(0)
	DisplayDate = "ng&agrave;y "+ngay+" th&aacute;ng "+thang+" n&#259;m "+ nam	
End function
'-----------------------------------------
Function iff(dk, value1, value2)
	if (dk) then 
	  iff = value1
	 else 
	  iff= value2
	 end if
End function
'------------------------------------------
function getDaysInMonth(strMonth,strYear)
dim strDays	 
    Select Case cint(strMonth)
        Case 1,3,5,7,8,10,12:
			strDays = 31
        Case 4,6,9,11:
		strDays = 30
        Case 2:
		if  ((cint(strYear) mod 4 = 0  and  _
                 cint(strYear) mod 100 <> 0)  _
                 or ( cint(strYear) mod 400 = 0) ) then
		  strDays = 29
		else
		  strDays = 28 
		end if	
    End Select 
    
    getDaysInMonth = strDays

end function
'------------------------------------------
function lay_danh_gia(danh_gia)
	if (danh_gia="đạt" or danh_gia="") then 
		Response.Write("<option selected value='đạt'>Đạt</option>")
		Response.Write("<option value='không đạt'>Không đạt</option>")
		
	else 
		Response.Write("<option value='đạt'>Đạt</option>")
		Response.Write("<option selected value='không đạt'>Không đạt</option>")
	 end if
   
end function
'------------------------------------------
function listDonVi(cbname, selected,multiple,size)
     Response.Write("<select "&size&" "&multiple&" name='"&cbname&"' id='"&cbname&"'>")
     Response.Write("<option value='P.TDCD'"& iff(selected="P.TD","selected","")&">Phòng Truyền Dẫn và cơ điện</option>")
     Response.Write("<option value='P.NOC'"&iff(selected="P.NOC","selected","")&">Phòng NOC</option>")
     Response.Write("<option value='TT.HK'"& iff(selected="P.TT","selected","")&">Tổng trạm Hòa Khánh</option>")
     Response.Write("<option value='TT.NTH'"& iff(selected="P.TT","selected","")&">Tổng trạm NTH</option>")
	 Response.Write("<option value='P.TH'"& iff(selected="P.TH","selected","")&">Phòng Tổng hợp</option>")
	 Response.Write("<option value='P.TKTU'"& iff(selected="P.TKTU","selected","")&">Phòng TKTU</option>")	
	 Response.Write("<option value='P.IPCDBR'"& iff(selected="P.QLTS","selected","")&">Phòng IPCDBR</option>")
	 Response.Write("<option value='P.DD'"& iff(selected="P.VAS","selected","")&">Phong Di động</option>")	 
	 Response.Write("<option value='P.TDHT'"& iff(selected="P.KTKT","selected","")&">Phong TĐHT</option>")
	 Response.Write("<option value='P.HT'"& iff(selected="P.VAS","selected","")&">Phong Hạ tầng</option>")	 
	 Response.Write("<option value='P.VT'"& iff(selected="P.VAS","selected","")&">Phong Vô tuyến</option>")	 
	 Response.Write("<option value='P.KSVHKT'"& iff(selected="P.VAS","selected","")&">Phong kiểm soat VHKT </option>")	
     Response.Write("</select>")
end function
'------------------------------------------
function listdep(cbname, selected)
     Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
     Response.Write("<option value='0'>-----T&#7845;t c&#7843;-----</option>")
     Response.Write("<option value='DD'"& iff(selected="DD","selected","")&">Ban DD</option>")     
     Response.Write("<option value='CNTT'"&iff(selected="CNTT","selected","")&">Ban CNTT</option>")
     Response.Write("<option value='DVCD'"& iff(selected="DVCD","selected","")&">Ban DVCD</option>")
     Response.Write("<option value='TD'"& iff(selected="TD","selected","")&">Ban TD</option>")
	 Response.Write("<option value='VAS-PS'"& iff(selected="VAS-PS","selected","")&">Ban VAS-PS</option>")
	 Response.Write("<option value='TH'"& iff(selected="TH","selected","")&">Ban TH</option>")
	 Response.Write("<option value='QLTD'"& iff(selected="QLTD","selected","")&">Ban QLTD</option>")	 
	 Response.Write("<option value='KTKT'"& iff(selected="KTKT","selected","")&">P.KTKT</option>")
     Response.Write("</select>")
end function
function liststt(cbname, selected,stt)
	Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
     Response.Write("<option value='Lựa chọn'>-----Lựa Chọn-----</option>")
	 if (stt="Chờ gửi đi" and (Session("usergroup") = "CNVT" or Session("usergroup") = "ADMIN"))then 
		Response.Write("<option value='Gửi đi'"&iff(selected="Gửi đi","selected","")&">Gửi đi</option>")
		
	 end if
	 if (stt="Chờ tiếp nhận thực hiện" and (Session("usergroup") = "Phong_HT" or Session("usergroup") = "ADMIN")) then 
		Response.Write("<option value='Tiếp nhận thực hiện'"&iff(selected="Tiếp nhận thực hiện","selected","")&">Tiếp nhận thực hiện</option>")
		Response.Write("<option value='Trả về đơn vị tạo'"&iff(selected="Trả về đơn vị tạo","selected","")&">Trả về đơn vị tạo</option>")
	 end if
	 if (stt="Đang thực hiện" and (Session("usergroup") = "Phong_HT" or Session("usergroup") = "ADMIN")) then 
		Response.Write("<option value='Hoàn thành'"& iff(selected="Hoàn thành","selected","")&">Hoàn thành</option>")
		Response.Write("<option value='Cập nhật work log'"& iff(selected="Cập nhật work log","selected","")&">Cập nhật work log</option>")
	 end if
	 if (stt="Hoàn thành" and (Session("usergroup") = "CNVT" or Session("usergroup") = "ADMIN")) then 
		Response.Write("<option value='Đóng'"& iff(selected="Đóng","selected","")&">Đóng</option>")
	 end if
	 if (stt="Đã hoàn thành" and (Session("usergroup") = "CNVT" or Session("usergroup") = "ADMIN")) then 
		Response.Write("<option value='Đóng'"& iff(selected="Đóng","selected","")&">Đóng</option>")
		Response.Write("<option value='Mở lại yêu cầu'"& iff(selected="Đóng","selected","")&">Mở lại yêu cầu</option>")
	 end if
	 
     Response.Write("</select>")
end function
'-----------------------------------------
'"yyyy"	Year
'"m"	Month
'"d"	Day
'"h"	Hour
'"n"	Minute
'"s"	Second
'"w"	Weekday
'"ww"	Week of the year
'"q"	Quarter
'DateDiff(date_type, date1, date2, first_dow, first_woy)
Function CalDateTime2(fromTime, toTime) 'Format dd/mm/yyyy hh:mm:ss  output d hh:mm
  Dim sophut, songay, sogio, mm,ss, strOuput
  sophut = CalMinute(fromTime,toTime)
  
  sogio=0  
  If (sophut>=60) then
    sogio = floor(sophut/60)
	sophut = sophut  mod 60
  End if

  If (sogio>=24) then
	songay = floor(sogio/24)
	sogio = sogio mod 24
  End if
  
  If (sophut<0) then
    sophut = 0
  End if
  
  If (songay>0) then
    strOuput = songay&" "&iff(sogio<10,"0"&Cstr(sogio),sogio)&":"&iff(sophut<10,"0"&Cstr(sophut),sophut)
  Else
	strOuput = iff(sogio<10,"0"&Cstr(sogio),sogio)&":"&iff(sophut<10,"0"&Cstr(sophut),sophut)
  End if

  CalDateTime2 = strOuput 
End function
'-----------------------------------------
'"yyyy"	Year
'"m"	Month
'"d"	Day
'"h"	Hour
'"n"	Minute
'"s"	Second
'"w"	Weekday
'"ww"	Week of the year
'"q"	Quarter
'DateDiff(date_type, date1, date2, first_dow, first_woy)
Function CalMinute(fromTime, toTime) 'Format dd/mm/yyyy hh:mm:ss output mm 
  Dim sophut
  'Dung cho may o cty
  sophut = DateDiff("n",convert2ASPDateTime(fromTime),convert2ASPDateTime(toTime))  
  
  'Dung cho may o nha
  'sophut = DateDiff("n",(fromTime),(toTime))  
  
  CalMinute = sophut 
End function
'-----------------------------------------------
' Dung de chuyen du lieu html tu database ra web
Function HTMLDecode(sText)
    Dim I
    sText = Replace(sText, "&quot;", Chr(34))
    sText = Replace(sText, "&lt;"  , Chr(60))
    sText = Replace(sText, "&gt;"  , Chr(62))
    sText = Replace(sText, "&amp;" , Chr(38))
    sText = Replace(sText, "&nbsp;", Chr(32))
    For I = 1 to 255
        'sText = Replace(sText, "&#" & I & ";", Chr(I))
    Next
    HTMLDecode = sText
End Function

'-----------------------------------------------
' Lay hinh anh cua su co
Function getImageINC(IncType, time)
    Dim str, n
	Select Case cint(IncType)
        Case 0
			If (time>=4) then
			  str = "<img src=""images/111.png"" width=""25"" height=""25"" />"
			Elseif (time>=3.5 and time<4) then
			  str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
			Else
			  str = "<img src=""images/0.png"" width=""25"" height=""25"" />"
			End if
        Case 101,102
			If (time>=4) then
			  str = "<img src=""images/111.png"" width=""25"" height=""25"" />"
			Elseif (time>=3.5 and time<4) then
			  str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
			Else
			  str = "<img src=""images/10.png"" width=""25"" height=""25"" />"
			End if
		Case 103
	  	   If (time>=3) then
			  str = "<img src=""images/111.png"" width=""25"" height=""25"" />"
			Elseif (time>=2.5 and time<3) then
			  str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
			Else
			  str = "<img src=""images/10.png"" width=""25"" height=""25"" />"
			End if
        Case 111,112
			If (time>=2) then
			  str = "<img src=""images/111.png"" width=""25"" height=""25"" />"
			Elseif (time>=1.5 and time<2) then
			  str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
			Else
			  str = "<img src=""images/11.png"" width=""25"" height=""25"" />"
			End if
		Case 113
			If (time>=1) then
			  str = "<img src=""images/111.png"" width=""25"" height=""25"" />"
			Elseif (time>=0.5 and time<1) then
			  str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
			Else
			  str = "<img src=""images/11.png"" width=""25"" height=""25"" />"
			End if
		Case Else
			str = "<img src=""images/101.gif"" width=""25"" height=""25"" />"
    End Select 
    getImageINC = str
End Function
'-----------------------------------------------
' Tinh thoi gian su co
Function parseTime(time)
  Dim arr
  arr = Split(time, ":")
  parseTime = arr(0)+arr(1)/60
End Function
'-----------------------------------------------
' Returns the largest integer less than or equal to the specified number.
Function floor(x)
	dim temp
	temp = Round(x)
	if temp > x then
		temp = temp - 1
	end if
	floor = temp
End function
%>
