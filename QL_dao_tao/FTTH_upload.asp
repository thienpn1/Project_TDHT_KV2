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
 <%
 'Kiem tra tai khoan ton tai
function checkExistCR(cr)
  Dim  objRS
  sql = "SELECT distinct cr FROM tbl_checklog WHERE cr = '"&cr&"'"
  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  If (objRS.EOF) then
     checkExistCR = false
  Else
  	 checkExistCR = true
  End if 
  Set objRS = Nothing  
END FUNCTION 
 
 %>
<BODY>
<fieldset class="Khung_upload">
<legend class="mau_chu_legen">Upload file danh sách cần khai báo </legend>
<FORM ACTION = "#" ENCTYPE="multipart/form-data" METHOD="POST">
	<table border="0"  >
          <tr>
 		    <td>		
			    File Name: <INPUT TYPE=FILE NAME="txtFile" size="30" id="txtFile">
			</br>Yêu cầu định dạng file .xls, .xlsx			</td> 	
			<td nowrap>&nbsp;</td> 		
      	  </tr>
          <tr>
            <td><input type = "SUBMIT" class="hieu_ung_nut2" name="cmdSubmit" value="Import" onClick=" return validateFormOnSubmit()" >
            <input name="button" type = "button" class="hieu_ung_nut2" onClick="CloseAndRefresh();" value="Close"></td>
            <td nowrap>&nbsp;</td>
          </tr>
    </table>	
	<br>* Nếu định dạng file .xlsx không được, hãy thử chuyển sang định dạng .xls		
	<br>
	* Chú ý phải điền đầy đủ các cột như trong file mẫu [<a href="Import_checklog.xls"><font color=red>Tải file mẫu</font></a>]<br>
	* Sẽ không import những CR đã tồn tại 
</form>
</fieldset>
<%
	set o = new clsUpload
	
	if o.Exists("cmdSubmit") then

	'get client file name without path
	sFileSplit = split(o.FileNameOf("txtFile"), "\")
	sFile = sFileSplit(Ubound(sFileSplit))
	
	o.FileInputName = "txtFile"
	'response.write(sFile)
	'thay doi ten file randomn khi luu
	nRandom = Int((1000000 - 1 + 1) * Rnd + 1000000)	
	if ( Right(sFile,3)="xls") then
		sFile = "file" & CStr(nRandom) & ".xls"
	elseif ( Right(sFile,4)="xlsx") then
		sFile = "file" & CStr(nRandom) & ".xlsx"
	end if
	
	
	o.FileFullPath = Server.MapPath(".") & "\upload\" & sFile
	o.save

		If o.Error = "" then
			'response.write ".:Upload thanh cong." 
			'Demo Input = " & o.ValueOf("Demo")
		Dim sFile, count, counterror, fs
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
							.ConnectionString = "Data Source="&sFile&";" & "Extended Properties=&#34;Excel 12.0;IMEX=1;&#34;"
							.Open			
						End With
					end if
					
					'strQuery = "SELECT * FROM [Sheet1$]"
					strQuery = "SELECT * FROM A4:J200"

					With adoRs
						Set .ActiveConnection = adoCn
						.Open strQuery
					End With
					adoRs.movefirst		
					
				'adoRs.movenext		
				'adoRs.movenext	
				Response.Write("::B&#7843;ng ghi l&#7895;i- c&#243; c&#7897;t b&#7855;t bu&#7897;c b&#7883; r&#7895;ng:<br>")
				Dim startttime
				currentDate = convert2SimpleDateSQL(split(getCurrentDateTime()," ")(0)) & " " & split(getCurrentDateTime()," ")(1)&":00"
				dim existAccount
				existAccount=""
				if not adoRs is nothing then
					while not adoRs.eof
					If (checkExistCR(Trim(Cstr(adoRs.Fields(1).Value&" ")))) then
					   existAccount = existAccount & Trim(Cstr(adoRs.Fields(2).Value&" ")) &"; "
					else
						if (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(1).Value&" ")))<>"") and _
						     not checkExistCR(Trim(Cstr(adoRs.Fields(1).Value&" ")))  and _
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(2).Value&" ")))<>"") and _							
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(3).Value&" ")))<>"") and _	
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(4).Value&" ")))<>"") and _							
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(6).Value&" ")))<>"") and _	
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(7).Value&" ")))<>"") and _					   
						   (Server.HTMLEncode(Trim(Cstr(adoRs.Fields(8).Value&" ")))<>"") then					  
						    startttime =  split((Server.HTMLEncode(Trim(Cstr(adoRs.Fields(3).Value&" "))))," ")(0)
							startttime = convert2SimpleDateSQL(startttime) & " " & split((Server.HTMLEncode(Trim(Cstr(adoRs.Fields(3).Value&" "))))," ")(1)															
							
							sql= "INSERT INTO tbl_checklog (cr, crname, starttime,inserttime, useraction,userprepare,checker,note,userexplain) "&_
								 " VALUES ('"&_
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(1).Value&" "))))&"','"&_									
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(2).Value&" "))))&"','"&_
										 pdb(startttime)&"','"&_
										 pdb(currentDate)&"','"&_
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(4).Value&" "))))&"','"&_
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(5).Value&" "))))&"','"&_
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(6).Value&" "))))&"','"&_	
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(8).Value&" "))))&"','"&_											 
										 pdb(Server.HTMLEncode(Trim(Cstr(adoRs.Fields(9).Value&" "))))&"')"
							'Response.write(sql)							
							objConn.Execute(sql)
							count = count + 1
						else				
							counterror = counterror + 1
						end if
					end if
					adoRs.MoveNext
					wend
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