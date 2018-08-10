<%
Dim sConnection, objConn, objRS
sConnection = "Driver={MySQL ODBC 5.3 Unicode Driver};Server=localhost;Database=ql_daotao;port:3306;User=root;Password=admin; Option=3;"
Set objConn = Server.CreateObject("ADODB.Connection")
objConn.Open(sConnection)

%>
