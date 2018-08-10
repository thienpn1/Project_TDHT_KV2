<%
'*************************************************************************
' Create bay NguyenTD - 07/07/2012
' Store common function access to mySQL Database
'**************************************************************************
%>
<%
' Xoa cac dau nhay trong chuoi
FUNCTION pdb(str)
  Dim output 
  output= Replace(str, "'", "''")
  output= Replace(output, "\", "\\")  
  pdb = output 
END FUNCTION
'---------------------------------------------
'Kiem tra tai khoan login
function checkLogin(username, password)

  Dim sql,objRS, isLogin, creatTime
  isLogin = false
  If (username<>"" and password<>"") then
	  sql = "SELECT * FROM tbl_user  WHERE tbl_user.islock = 0 AND tbl_user.username='"&pdb(username)&"'" & " and tbl_user.PASSWORD ='"&Base64encode(password)&"'"
	  'response.write(sql)    
	  Set objRS = objConn.Execute(sql) 
	  'Kiem tra co du lieu tra ve khong
	  If (objRS.EOF) then
		 isLogin= false
	  Else
		 isLogin = true
	  End if  
	  While Not objRS.EOF
		Session("username")= username
		Session("password")= password
		Session("fullname")= objRS.Fields("fullname")
		Session("phong")= (objRS.Fields("phong"))
		Session("isLogin")= true		
		objRS.MoveNext
	  Wend   
	  objRS.Close
	  Set objRS = Nothing
	  objConn.Close
	  Set objConn = Nothing
  End if
  checkLogin =  isLogin
END FUNCTION 
'---------------------------------------------
'Kiem tra tai khoan ton tai
function checkExistAcc(username)
  Dim  objRS
  sql = "SELECT username FROM tbl_user WHERE username = '"&pdb(username)&"'"
  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  If (objRS.EOF) then
     checkExistAcc = false
  Else
  	 checkExistAcc = true
  End if 
  objRS.Close
  Set objRS = Nothing  
END FUNCTION 
'======================================
'xoa het du lieu bang Ha_tang

'---------------------------------------------
'Kiem tra group name ton tai chua
function checkExistGroup(groupname)
  Dim  objRS
  sql = "SELECT groupname FROM tbl_usergroup WHERE groupname = '"&pdb(groupname)&"'"
  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  If (objRS.EOF) then
     checkExistGroup = false
  Else
  	 checkExistGroup = true
  End if 
  objRS.Close
  Set objRS = Nothing  
END FUNCTION 
'--------------------------------------------
Function listGroup(cbname, selected)
  sql= "Select groupname from tbl_usergroup"  
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
  While Not objRS.EOF	
	Response.Write("<option value='"&objRS.Fields("groupname")&"'>"&objRS.Fields("groupname")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function	
'--------------------------------------------
Function listProvin(cbname, selected)
  Dim sql,objRS 
  sql= "SELECT 	IdProvince, NameProvince FROM tbl_province order by stt"   
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
  While Not objRS.EOF	
	Response.Write("<option "& iff (selected=objRS.Fields("IdProvince"),"selected","")&" value='"&objRS.Fields("IdProvince")&"'>"&objRS.Fields("IdProvince")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listIncClass(cbname, selected)
  Dim sql,objRS 
  sql= "SELECT 	id, INCClass FROM tbl_incclass order by INCClass"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
  While Not objRS.EOF	
	Response.Write("<option "& iff (selected=objRS.Fields("id"),"selected","")&" value='"&objRS.Fields("id")&"'>"&objRS.Fields("INCClass")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listIncLevel(cbname, selected)
  sql= "SELECT id,inclevel FROM tbl_inclevel WHERE depart='"&Session("depart")&"' order by inclevel"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
  While Not objRS.EOF	
	Response.Write("<option value='"&objRS.Fields("id")&"'>"&objRS.Fields("inclevel")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listIncLevel_edit(cbname, selected)
  sql= "SELECT id, inclevel FROM tbl_inclevel WHERE depart='"&Session("depart")&"' order by inclevel"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown1"">")
  While Not objRS.EOF	
	Response.Write("<option value='"&objRS.Fields("inclevel")&"'>"&objRS.Fields("inclevel")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listMang(cbname, selected)
  sql= "SELECT distinct _array FROM tbl_maintain"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown1"">")
  While Not objRS.EOF	
    Response.Write("<option "& iff (selected=objRS.Fields("_array"),"selected","")&" value='"&objRS.Fields("_array")&"'>"&objRS.Fields("_array")&"</option>")
	objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listChungloai(cbname, selected)
  sql= "SELECT distinct array_sub FROM tbl_maintain WHERE array_sub<>''"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown1"">")
  Response.Write("<option value=''>---ALL---</option>")
  While Not objRS.EOF	
    Response.Write("<option "& iff (selected=objRS.Fields("array_sub"),"selected","")&" value='"&objRS.Fields("array_sub")&"'>"&objRS.Fields("array_sub")&"</option>")
	objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
Function listChuky(cbname, selected)
  sql= "SELECT distinct _round FROM tbl_maintain"
  Set objRS= objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown1"">")
  While Not objRS.EOF	
    Response.Write("<option "& iff (selected=objRS.Fields("_round"),"selected","")&" value='"&objRS.Fields("_round")&"'>"&objRS.Fields("_round")&"</option>")
	objRS.MoveNext
  Wend
  Response.Write("</select>") 
End function
'--------------------------------------------
'Lay doi tuong bi su co
Function getINCObject(idINC)
  Dim objects, objRS1, sql1
  objects = ""
  sql1= "SELECT nameObject FROM tbl_incobject WHERE idInc = "&idINC
  Set objRS1 = objConn.Execute(sql1)
  While Not objRS1.EOF	
	If (objects="") then
	    objects = objRS1.Fields("nameObject")
	Else
		objects =  objects + "<br>" + objRS1.Fields("nameObject")
	End if
    objRS1.MoveNext
  Wend
  getINCObject= objects
End function
'--------------------------------------------
'Lay doi tuong bi su co cho truong hop edit
Function getINCObject_edit(idINC)
  Dim objects, objRS1, sql1
  sql1= "SELECT nameObject FROM tbl_incobject WHERE idInc = "&idINC
  Set objRS1 = objConn.Execute(sql1)
  While Not objRS1.EOF	
	objects =  objects  + objRS1.Fields("nameObject")+ vbCrLF
    objRS1.MoveNext
  Wend
  getINCObject_edit= objects
End function
'--------------------------------------------
'Lay INCLevel cua truong anh huong
Function getEffect_level(idINC)
  Dim effects, objRS2, sql2
  sql2= "SELECT INClevel FROM tbl_inceffect WHERE idINC=" & idINC 
  'response.write(sql2)
  Set objRS2 = objConn.Execute(sql2)
  While Not objRS2.EOF	
	effects =  effects + objRS2.Fields("INClevel") + "<br>" 
    objRS2.MoveNext
  Wend
  getEffect_level= effects
End function
'--------------------------------------------
'Lay content cua truong anh huong
Function getEffect_content(idINC)
  Dim effects, objRS2, sql2
  sql2= "SELECT content FROM tbl_inceffect WHERE idINC=" & idINC
  Set objRS2 = objConn.Execute(sql2)
  While Not objRS2.EOF	
	effects =  effects + objRS2.Fields("content") + "<br>" 
    objRS2.MoveNext
  Wend
  getEffect_content= effects
End function
'--------------------------------------------
'Lay anh huong
Function getINCEffect(idINC)
  Dim effects, objRS2, sql2
  sql2= "SELECT INClevel, content FROM tbl_inceffect WHERE idINC=" & idINC
  Set objRS2 = objConn.Execute(sql2)
  While Not objRS2.EOF	
	effects =  effects +objRS2.Fields("INClevel") + ": "+ objRS2.Fields("content") + "<br>" 
    objRS2.MoveNext
  Wend
  getINCEffect= effects
End function
'--------------------------------------------
'Lay anh huong cho list form
Function getINCEffect_forList(idINC)
  Dim effects, objRS2, sql2
  sql2= "SELECT INClevel, content FROM tbl_inceffect WHERE idINC=" & idINC
  Set objRS2 = objConn.Execute(sql2)
  While Not objRS2.EOF	
	effects =  effects +"<strong>" + objRS2.Fields("INClevel") + "</strong>: "+ objRS2.Fields("content") + "<br>" 
    objRS2.MoveNext
  Wend
  getINCEffect_forList= effects
End function
'--------------------------------------------
'Lay danh sach loai su co TD
Function getINCType_TD(cbname, selected)
  Dim  objRS, sql
  sql= "SELECT Id, code, INCtype_TD FROM tbl_inctype_td order by  code"
  Set objRS = objConn.Execute(sql)
  Response.Write("<select name='"&cbname&"' id='"&cbname&"' class=""dropdown"">")
  While Not objRS.EOF		
	Response.Write("<option "& iff (selected=objRS.Fields("id"),"selected","")&" value='"&objRS.Fields("id")&"'>"&objRS.Fields("INCtype_TD")&"</option>")
    objRS.MoveNext
  Wend
  Response.Write("</select>")
End function
'--------------------------------------------
'Chuyen sang su co ton neu dien ra >=24h
Function move2OldInc()
  Dim subTime
  sql= "SELECT 	idInc,DATE_FORMAT(startTime,'%d/%m/%Y %k:%i:%s') as startTime FROM tbl_incident WHERE ISNULL(CLOSE) and ISNULL(isOldinc)"  
  Set objRS= objConn.Execute(sql)
  While Not objRS.EOF	  
    subTime =(CalMinute(objRS.Fields("startTime"),getCurrentDateTime()))
    If ((subTime) >= 1440) then
	  objConn.Execute("update tbl_incident set isOldinc = 1 WHERE	idInc =  "&objRS.Fields("idInc")&"")
	End if
    objRS.MoveNext
  Wend
End function
'--------------------------------------------
'Lay cac bao cao co trong database
Function getLinkReport()
  Dim link 
  sql= "SELECT 	id, link, tbl_name FROM tbl_dynamic "  
  Set objRS= objConn.Execute(sql)
  While Not objRS.EOF	  
    link = link + " <li><a href=""default.asp?page=dynamic_page_list&id="&objRS.Fields("id")&""">"&objRS.Fields("link")&"</a></li>"
    objRS.MoveNext
  Wend
  getLinkReport = link
End function

'--------------------------------------------
'Kiem tra quyen cap nhap cong viec
Function check_action(nguoi_tao,muc_nhin_thay,tien_do)
	Dim isOK 
	
	
	isOK = false
	if (Session("username")= nguoi_tao or Session("usergroup")="ADMIN" ) then
		if ( muc_nhin_thay="Cập nhật thông tin"  and  Session("usergroup") = "CNVT" and tien_do="Chờ gửi đi" )then
			isOK =true
		end if
	end if
	if (Session("username")= nguoi_tao or Session("usergroup")="ADMIN" ) then
		if ( muc_nhin_thay="Cập nhật thông tin"  and  Session("usergroup") = "CNVT" and tien_do="Chờ tiếp nhận thực hiện" )then
			isOK =true
		end if
	end if
	
	if (Session("username")= nguoi_tao or Session("usergroup")="ADMIN" ) then
		if ( muc_nhin_thay="Đóng yêu cầu"  and  Session("usergroup") = "CNVT" and tien_do="Đã hoàn thành" )then
			isOK =true
		end if
	end if
	if (Session("usergroup")= "Phong_HT" or Session("usergroup")="ADMIN") then
		if ( muc_nhin_thay="Cập nhật tiến độ" and tien_do="Đang thực hiện" )then
			isOK =true
		end if
	end if
	if (Session("usergroup")= "Phong_HT" or Session("usergroup")="ADMIN" ) then
		if ( muc_nhin_thay="Tiếp nhận thực hiện" and tien_do="Chờ tiếp nhận thực hiện" )then
			isOK =true
		end if
	end if

	check_action=isOK
  
End function

Function JOB_action(action, id)
  Dim isOK 
 
  isOK = false
  sql= "SELECT tbl_job.approve, tbl_job.CLOSE, tbl_user.depart, tbl_job.createUser, tbl_job.executer "&_
	   " FROM tbl_job INNER JOIN tbl_user ON (tbl_job.createUser = tbl_user.username)  "&_
       " where id = "&id
	  ' Response.write(sql)
  Set objRS= objConn.Execute(sql)
  If Not objRS.EOF	 then    
	  Select Case action 
	  		 case "assign"
			 	If(isNull(objRS.Fields("approve")) and (isNull(objRS.Fields("CLOSE")) or objRS.Fields("CLOSE")<>"") and (Session("usergroup")="TRUONGBAN")) then
				'If(Session("usergroup")="TRUONGBAN") then
				    isOK = true 
				End if
			 Case "direct"
				If (Session("direct")="1") then isOK = true end if
			 case "edit"
				If(isNull(objRS.Fields("approve")) and objRS.Fields("depart")= Session("depart")) then 
					isOK = true 
				end if
			 case "process"
				If(isNull(objRS.Fields("CLOSE")) ) then isOK = true end if
				
			 case "close"
			    If(isNull(objRS.Fields("approve")) and (isNull(objRS.Fields("CLOSE")) or objRS.Fields("CLOSE")="") ) then
				   If (Session("usergroup")="TRUONGBAN") then
				      isOK = true 
				   End if
				End if
			 case "open"
			    If(isNull(objRS.Fields("approve")) and (objRS.Fields("CLOSE")<>"") and (Session("approve")="1")) then
				    isOK = true 
				End if
			 case "approve"
			 	If(isNull(objRS.Fields("approve")) and (objRS.Fields("CLOSE")<>"") and (Session("approve")="1")) then
				    isOK = true 
				End if
	  End select
  End if	
   if (Session("username")="admin")  then 
	isOK = true
  end if
  JOB_action = isOK
End function

'--------------------------------------------
'Kiem tra quyen cap nhap tr?m 3G
Function Check_action_3G(action, id)
  Dim isOK 
  isOK = false
  sql= "Select finish from tbl_integrated3g"&_
       " where id = "&id
	   'Response.write(sql)
  Set objRS= objConn.Execute(sql)
  If Not objRS.EOF	 then    
	  Select Case action 			
			 case "edit"
				If((isNull(objRS.Fields("finish")) or objRS.Fields("finish") = "0") and (Session("depart")= "BSS" or Session("depart")= "DVCD"  or Session("usergroup")="ADMIN")) then 
					isOK = true 
				end if
			 case "notfinish"
				If(objRS.Fields("finish") = "1") then isOK = true end if				
			 case "finish"
			    If((isNull(objRS.Fields("finish")) or objRS.Fields("finish") = "0") and (Session("depart")= "BSS" or Session("depart")= "DVCD" or Session("usergroup")="ADMIN")) then
				   isOK = true 
				End if			 
	  End select
  End if	
  Check_action_3G = isOK
End function
'--------------------------------------------
'Tao cau SQL cho char
Function getData2CharYear()
  Dim sql, j, n, startTime, endTime
  n = 1
  For j= month(Date()) to (month(Date())+ 12) step 1
    If (j > 12) then 
	   startTime = year(Date())&"-"&(j-12)&"-01 00:00:00"
	   endTime   = year(Date())&"-"&(j-12)&"-31 23:59:59"
	Else
	   startTime = (year(Date()) -1)&"-"&(j)&"-01 00:00:00"
	   endTime   = (year(Date()) -1)&"-"&(j)&"-31 23:59:59"
	End if
	If (sql<>"") then
		sql = sql & "," & " ( SELECT COUNT(id) FROM tbl_checklog WHERE (inserttime BETWEEN '"& startTime &"' AND '"& endTime &"')) AS "&n&"_INC, "&_
             " (SELECT COUNT(isfault) FROM tbl_checklog WHERE (inserttime BETWEEN '"& startTime & "' AND '" & endTime & "')) AS "&n&"_OLD_INC"
    Else
		sql = " ( SELECT COUNT(id) FROM tbl_checklog WHERE (inserttime BETWEEN '"& startTime &"' AND '"& endTime &"') ) AS "&n&"_INC, "&_
                 " (SELECT COUNT(isfault) FROM tbl_checklog WHERE (inserttime BETWEEN '"& startTime & "' AND '" & endTime & "')) AS "&n&"_OLD_INC"
	End if
  
   n = n + 1
  Next    	
	sql = "SELECT " & sql
	getData2CharYear = sql
End function


'-----------lay danh sach user tu bang user-----------
function listuser()
	sql2= "SELECT username FROM tbl_user WHERE 1=1"
	Set objRS2 = objConn.Execute(sql2)
	Response.Write("<datalist id='user'>")
	'Response.Write("<option value=''>-----T&#7845;t c&#7843;-----</option>")
	While Not objRS2.EOF	
		Response.Write("<option value='"&objRS2.Fields("username")&"'>"&objRS2.Fields("username")&"</option>")
		objRS2.MoveNext
	Wend
	Response.Write("</datalist>")
end function
'------------Tu define-------------
'Xoa cong viec
function delCV(idCV)
  Dim  objRS
  	objConn.Execute("DELETE FROM tbl_nightplan WHERE idPlan = "&idCV)
  Set objRS = Nothing
END FUNCTION

'Ham cho phep an hien
function isShow(typeAction,ngay)
	Dim show
	show=0
	Dim curHour	
	curHour = hour(now) 
		if (ngay>=NgaySelectKH()) then
			'neu thoi gian tu >18h-23h nay 1 va 0h->8h thi duoc  quyen note va save
			if (curHour>=0 and curHour <=8 ) or (curHour>=10 and curHour <=23 ) then 
				if (typeAction="note" or typeAction="save" or typeAction="status") then 
					show=1	
				'fix danh cho truong ca tu 18h-23	
				'elseif(curHour>=18 and curHour <=22 and ((typeAction="delete" or typeAction="modified" or typeAction="upload" or typeAction="taoviecdem" )) and Session("approve")="1") then 
					'show=1
				End if		
			End if	
				'thoi gion tu 0h-> =11h thi duoc quyen xoa,edit (upload, tao viec dem)
			'If (curHour>=0 and curHour<=11) then 
				if (typeAction="delete" or typeAction="modified" or typeAction="upload" or typeAction="taoviecdem" ) then show=1	
			'End if
			
			'tutq08062013 them (or Session("approve")="1") de truong ca up bat cu gio nao
			If (Session("approve")="1")  then
				show=1
			End if
		End if	
	isShow=show	
	'isShow= 1
END FUNCTION

function isShowButton(typeAction)
	Dim show
	show=0
	Dim curHour	
	curHour = hour(now) 	
	'neu thoi gian tu >17h-23h nay 1 va 0h->8h thi duoc  quyen note va save
	if (curHour>=0 and curHour <=7 ) or (curHour>=18 and curHour <=23 ) then 
		if (typeAction="note" or typeAction="save") then 
			show=1	
		'fix danh cho truong ca tu 11h-23	
		End if
	elseif(curHour>=11 and curHour <=22 and ((typeAction="delete" or typeAction="modified" or typeAction="upload" or typeAction="taoviecdem" )) and Session("approve")="1") then
	   show=1	
	End if
		'thoi gion tu 0h-> =11h thi duoc quyen xoa,edit (upload, tao viec dem)
	'If (curHour>=0 and curHour<=11) then
		if (typeAction="delete" or typeAction="modifi" or typeAction="upload" or typeAction="taoviecdem") then show=1	
	'End if	
	'tutq08062013 them (or Session("approve")="1") de truong ca up bat cu gio nao
	If (Session("approve")="1")  then
		show=1
	End if
	isShowButton=show	
	'isShowButton=1		
END FUNCTION


' xac dinh ngay can show
function NgaySelectKH()
	Dim ngayshow, curHour
	ngayshow=""
	curHour = hour(now) 
	if (curHour>=8 and curHour <=23 ) then 
		ngayshow=convert2SimpleDateSQL(getCurrentDate())
	elseif (curHour>=0 and curHour <=7 ) then
		ngayshow=getDateyesterday()
	end if		
		NgaySelectKH=ngayshow
END FUNCTION

'xac dinh ngay cua ke hoach dem
function NgayUploadKH()
	Dim ngayupload, curHour
	ngayupload=""
	curHour = hour(now) 
	if (Session("usergroup")="TRUONGCA") then
		ngayupload=convert2SimpleDateSQL(getCurrentDate())		
	else
		if (curHour>=9 and curHour <=23 ) then 
			ngayupload=getDateTomorrow()
		elseif (curHour>=0 and curHour <=8 ) then
			ngayupload=convert2SimpleDateSQL(getCurrentDate())
		end if	
	end if
		NgayUploadKH=convert2SimpleDateSQL(getCurrentDate())
END FUNCTION

' tutq'  convert 2012-9-6  yyyy-m-d ->yyyy-mm-dd
Function getDateyesterday()
	Dim Dateyyyymmdd,Dateyyyymd,ngay,thang
	Dateyyyymd = DateAdd("d",-1,Date())
	ngay= day(Dateyyyymd)
	thang= month(Dateyyyymd)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateyyyymmdd= year(Dateyyyymd)&"-"&thang&"-"&ngay
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getDateyesterday = Dateyyyymmdd
End function

' tutq'  convert 2012-9-6  yyyy-m-d ->yyyy-mm-dd
Function getDateTomorrow()
	Dim Dateyyyymmdd,Dateyyyymd,ngay,thang
	Dateyyyymd = DateAdd("d",1,Date())
	ngay= day(Dateyyyymd)
	thang= month(Dateyyyymd)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	Dateyyyymmdd= year(Dateyyyymd)&"-"&thang&"-"&ngay
	'&" "&FormatDateTime(Datemmddyyyy,3)
	getDateTomorrow = Dateyyyymmdd
End function
'tutq

'convert m/d/yyyy yyyy-mm-dd
Function covertdate_tu(strDate)  'Format yyyy-dd-mm
	dim ngay, thang, nam, DateArray
	DateArray= Split(strDate, "/")
	ngay= DateArray(1)
	thang= DateArray(0)
	nam= DateArray(2)
	if len(ngay) = 1 then
       ngay = "0"&ngay
	end if
	if len(thang) = 1 then
       thang = "0"&thang
	end if
	covertdate_tu = nam+"-"&thang&"-"&ngay
End function


'Kiem tra co cung ban hay khong' cong ban thi xem duoc KH dem
function getDepart(username)
  Dim  objRS  
  sql = "SELECT tbl_user.depart FROM tbl_user WHERE tbl_user.username = '"&username&"'"
  Set objRS = objConn.Execute(sql) 
   While Not objRS.EOF     
	 	getDepart=Cstr(objRS.Fields("depart"))
	objRS.Movenext
  Wend
  objRS.Close
  Set objRS = Nothing   
END FUNCTION 

'Ham kiem tra co trung CR
function isExistCR(strCR)
	dim objRS, isExist
	isExist=false
	sql = "SELECT CR FROM tbl_nightplan WHERE datecreate='"&convert2SimpleDateSQL(getCurrentDate())&"'"	
	Set objRS = objConn.Execute(sql) 
	While Not objRS.EOF     
		if(inStr(Cstr(objRS.Fields("CR")),strCR) <> 0) then isExist=true
	objRS.Movenext
	Wend
	objRS.Close
	Set objRS = Nothing  	
	isExistCR = isExist
END FUNCTION 
'Lay chuoi CR trong file EXEL
function getStringCR(strIn)
	Dim vt,s,vtSpace  ', strIn
	s=""
	'strIn="Theo CR CR_ML_NSS_084_VTT-TTTDTC-PKDQT"
	if(Trim(strIn)<>"") then
		vt=inStr(Trim(strIn),"CR_")	
		s=Mid(strIn,vt)
		vtSpace=inStr(s," ")
		'kiem tra neu co ky tu space o sau so CR
		if (vtSpace>vt) then s=Mid(strIn,vt,vtSpace-1)
	end if
	getStringCR =s 	
END FUNCTION 

'Kiem tra trung ke hoach dem
function isExistNightPlan(strNamePlan,strCR, strImpl)
	dim objRS, isExist
	isExist=false
	''sql = "SELECT namePlan,CR,implement FROM tbl_nightplan WHERE datecreate='"&convert2SimpleDateSQL(getCurrentDate())&"'"	
	sql = "SELECT namePlan,CR,implement FROM tbl_nightplan WHERE datecreate='"&NgayUploadKH()&"'"	
	Set objRS = objConn.Execute(sql) 
	While Not objRS.EOF   
		if (Cstr(objRS.Fields("namePlan"))=Server.HTMLEncode(strNamePlan) and _
		Cstr(objRS.Fields("CR"))=Server.HTMLEncode(strCR) and _
		Cstr(objRS.Fields("implement"))=Server.HTMLEncode(strImpl)) then isExist=true
	objRS.Movenext
	Wend
	objRS.Close
	Set objRS = Nothing  	
	isExistNightPlan = isExist
END FUNCTION 
%>