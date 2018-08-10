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
 Dim Type_action
 
 Type_action = request.QueryString("type")
 
SUB insertNew(RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, Note)
  Dim  objRS
  sql = "INSERT INTO tbl_3gbw  (RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, Note) VALUES "&_
         " ('"&RNC&"',"&nodeBID&",'"&nodeBName&"','"&nodeBIP&"',"&RNCBW&","&nodeBW&",'"&Note&"')"
  
  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  Set objRS = Nothing  
END Sub 

SUB updateInfo(RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, Note)
  Dim  objRS
  sql = "Update tbl_3gbw SET RNC='"&RNC&"', nodeBID="&nodeBID&", nodeBName='"&nodeBName&"',"&_
          " RNCBW = "&RNCBW&", nodeBW = "&RNCBW&", Note ='"&Note&"'  where nodeBIP ='"&nodeBIP&"'"

  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  Set objRS = Nothing  
END Sub 


SUB updateNew(nodeBIP, TransType, TransBW, TransOrigin, VibaBW, Note)

	   
  if (TransType<>"") then 
     objConn.Execute("UPDATE tbl_3gbw SET TransType = '"&TransType&"' WHERE nodeBIP = '"&nodeBIP&"'")
  end if
  
  if (TransBW<>"") then 
     objConn.Execute("UPDATE tbl_3gbw SET TransBW ="&TransBW&" WHERE nodeBIP = '"&nodeBIP&"'")
  end if
  
  if (TransOrigin<>"") then 
     objConn.Execute("UPDATE tbl_3gbw SET TransOrigin ='"&TransOrigin&"' WHERE nodeBIP = '"&nodeBIP&"'")
  end if
  
  if (VibaBW<>"") then 
      objConn.Execute("UPDATE tbl_3gbw SET VibaBW ="&VibaBW&" WHERE nodeBIP = '"&nodeBIP&"'")
  end if
  
  if (Note<>"") then 
      objConn.Execute("UPDATE tbl_3gbw SET Note ='"&Note&"' WHERE nodeBIP = '"&nodeBIP&"'")
  end if
  

END Sub 
  'Kiem tra tai khoan ton tai
function checkExist(nodeBIP)
  Dim  objRS
  sql = "SELECT distinct nodeBName FROM tbl_3gbw WHERE nodeBIP = '"&nodeBIP&"'"
  'response.write(sql)    
  Set objRS = objConn.Execute(sql) 
  'Kiem tra co du lieu tra ve khong
  If (objRS.EOF) then
     checkExist = false
  Else
  	 checkExist = true
  End if 
  Set objRS = Nothing  
END FUNCTION 
 
 
 %>
<BODY>
<fieldset class="Khung_upload">
<legend class="mau_chu_legen">Upload file danh sách trạm 3G </legend>
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
	<%if (Type_action="import") then %><br><font color=red>* Kiểm tra dữ liệu trước khi import tránh trùng.</font>
		
	<br>* Các cột màu vàng phải điều đầy đủ dữ liệu như file mẫu [<a href="ImportDL3G.xls"><font color=red>Tải file mẫu</font></a>] 
	<%Else%>
	<br>
	* Dữ liệu cột NodeB IP phải chính xác và đầy đủ [<a href="ImportDL3G.xls"><font color=red>Tải file mẫu</font></a>]
	<%End if%>
	<br>* Nếu định dạng file .xlsx không được, hãy thử chuyển sang định dạng .xls	
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
					strQuery = "SELECT * FROM A1:L10000"

					With adoRs
						Set .ActiveConnection = adoCn
						.Open strQuery
					End With
					adoRs.movefirst		
					
				'adoRs.movenext		
				'adoRs.movenext	
				Response.Write("::B&#7843;ng ghi l&#7895;i- c&#243; c&#7897;t b&#7855;t bu&#7897;c b&#7883; r&#7895;ng:<br>")
				
				Dim RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, TransType, TransBW, TransOrigin, VibaBW, Note
				
				if not adoRs is nothing then
					while not adoRs.eof
						RNC = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(1).Value&" ")))
						nodeBID = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(2).Value&" ")))
						nodeBName = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(3).Value&" ")))
						nodeBIP = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(4).Value&" ")))
						RNCBW = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(5).Value&" ")))
						nodeBW = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(6).Value&" ")))
						TransType = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(7).Value&" ")))
						TransBW =Server.HTMLEncode(Trim(Cstr(adoRs.Fields(8).Value&" ")))
						TransOrigin = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(9).Value&" ")))
						VibaBW = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(10).Value&" ")))
						Note = Server.HTMLEncode(Trim(Cstr(adoRs.Fields(11).Value&" ")))
					
						if (Type_action="import" and RNC<>"" and nodeBID<>"" and nodeBName<>"" and nodeBIP<>"" and RNCBW<>"" and nodeBW<>"") then
							If (checkExist(nodeBIP)) then
							  Call updateInfo(RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, Note)
							Else
							  Call insertNew(RNC, nodeBID, nodeBName, nodeBIP, RNCBW, nodeBW, Note)
							End if
							  count = count + 1
						 elseif (Type_action="update" and nodeBName<>"" ) then	
							Call updateNew(nodeBIP, TransType, TransBW, TransOrigin, VibaBW,Note)
							count = count + 1
						else		
							counterror = counterror + 1
						end if
					
						adoRs.MoveNext
					Wend
					
				end if	
				
				Response.Write("<br>.:T&#7893;ng s&#7889; b&#7843;n ghi import/update &#273;&#432;&#7907;c l&#224;: "&count&_
				"<br>.:T&#7893;ng s&#7889; b&#7843;n ghi l&#7895;i ho&#7863;c &#273;&#227; t&#7891;n t&#7841;i: "&counterror)
									
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