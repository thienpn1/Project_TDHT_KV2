 <link class="include" rel="stylesheet" type="text/css" href="js/jChart/jquery.jqplot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jChart/excanvas.js"></script><![endif]-->
 
<!-- Don't touch this! -->
    <script class="include" type="text/javascript" src="js/jChart/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="js/jChart/data/syntaxhighlighter/scripts/shCore.min.js"></script>
    <script type="text/javascript" src="js/jChart/data/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
    <script type="text/javascript" src="js/jChart/data/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
<!-- Additional plugins go here -->
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.logAxisRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.dateAxisRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script class="include" type="text/javascript" src="js/jChart/plugins/jqplot.barRenderer.min.js"></script>
<!-- End additional plugins -->

 <div id="chart4"></div>  
<!-- Example scripts go here -->

<style type="text/css">
  .jqplot-point-label {white-space: nowrap;}
  div.jqplot-target {
	height: 300px;
	width: 100%;
	margin: 0px;
}
</style>

<table width="100%">
  <tr>
    <td width="40%"> </td>
  </tr>
  </table>
 
<%
  'Response.write(getData2CharYear)
  Set objRS= objConn.Execute(getData2CharYear())
  If Not objRS.EOF then      
%>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	var m = <%=month(Date())%>;
	var y = <%=year(Date())%>;
	var myMonth=new Array();
    var i;	
	for (i=0;i<=12;i++)
	{	
		if ((m+i)>12)
		{
		 myMonth[i] = (m+i) - 12 + "/" + y%1000;		 		 
		}
		else
		{	
		 myMonth[i] = i+m;
		}
		
	}
	//For su co 
    var line = [[myMonth[0], <%=objRS.Fields("1_INC")%>], [myMonth[1] , <%=objRS.Fields("2_INC")%>], [myMonth[2], <%=objRS.Fields("3_INC")%>], 
				[myMonth[3], <%=objRS.Fields("4_INC")%>], [myMonth[4] , <%=objRS.Fields("5_INC")%>], [myMonth[5], <%=objRS.Fields("6_INC")%>],
				[myMonth[6], <%=objRS.Fields("7_INC")%>], [myMonth[7] , <%=objRS.Fields("8_INC")%>], [myMonth[8], <%=objRS.Fields("9_INC")%>], 
				[myMonth[9], <%=objRS.Fields("10_INC")%>],[myMonth[10], <%=objRS.Fields("11_INC")%>],[myMonth[11], <%=objRS.Fields("12_INC")%>],
				[myMonth[12], <%=objRS.Fields("13_INC")%>]];
		
	//For su co ton
    var line2 =  [[myMonth[0], <%=objRS.Fields("1_OLD_INC")%>], [myMonth[1], <%=objRS.Fields("2_OLD_INC")%>], [myMonth[2], <%=objRS.Fields("3_OLD_INC")%>],
				  [myMonth[3], <%=objRS.Fields("4_OLD_INC")%>], [myMonth[4], <%=objRS.Fields("5_OLD_INC")%>], [myMonth[5], <%=objRS.Fields("6_OLD_INC")%>], 
				  [myMonth[6],<%=objRS.Fields("7_OLD_INC")%>], [myMonth[7], <%=objRS.Fields("8_OLD_INC")%>], [myMonth[8], <%=objRS.Fields("9_OLD_INC")%>], 
				  [myMonth[9], <%=objRS.Fields("10_OLD_INC")%>],[myMonth[10], <%=objRS.Fields("11_OLD_INC")%>],[myMonth[11], <%=objRS.Fields("12_OLD_INC")%>],
				  [myMonth[12], <%=objRS.Fields("13_OLD_INC")%>]];
				  
    var plot4 = $.jqplot('chart4', [line, line2], {
        title: ' ',
		series:[{renderer:$.jqplot.BarRenderer}, {xaxis:'x2axis', yaxis:'y2axis'}],
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                label: '',
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                tickRenderer: $.jqplot.CanvasAxisTickRenderer,
              	tickOptions: {angle: 0}
			},
            x2axis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                label: '',
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                tickOptions: {
                    angle: 0
                }
            },
            yaxis: {
                autoscale:true,
                label: 'Số lượng cần kiểm tra',
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                tickRenderer: $.jqplot.CanvasAxisTickRenderer,                
				tickOptions: {
                    angle: 0
                }
            },
            y2axis: {
                autoscale:true,
                label: 'Số lượng lỗi',
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                tickRenderer: $.jqplot.CanvasAxisTickRenderer,               
				tickOptions: {
                    angle: 0
                }
            }
        }
    });
});
</script>
<%End if%>
