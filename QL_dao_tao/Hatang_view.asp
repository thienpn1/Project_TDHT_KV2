<HTML>
<HEAD>
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
     self.close();
  }
 </script> 
<BODY>
<fieldset class="Khung_upload">
<legend class="mau_chu_legen">Check list tracert lsp </legend>
<FORM ACTION = "#" ENCTYPE="multipart/form-data" METHOD="POST">
	<%
	sql = "SELECT tracerlsp FROM 	timesheet.tbl_hatang where id =" & Request.QueryString("id") 
	Set objRS1 = objConn.Execute(sql)	
	%>
	<table border="0"  >
          <tr>
		  <% If Not objRS1.EOF then%>
 		    <td>
			<%=replace(objRS1.Fields("tracerlsp")&" ","$","<br>")%><br>			
			</td> 
		  <% End if		 
			objRS1.Close
			Set objRS1 = Nothing
			objConn.Close
			Set objConn = Nothing
		  %>	
			<td nowrap></td> 		
      	  </tr>
          <tr>
            <td><input name="button" type = "button" class="hieu_ung_nut2" onClick="CloseAndRefresh();" value="Close"></td>
            <td nowrap>&nbsp;</td>
          </tr>
    </table>	
	<br>
</form>
</fieldset>
</BODY>
</HTML>