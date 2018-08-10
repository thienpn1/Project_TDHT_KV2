<!-- styles needed by jScrollPane - include in your own sites -->
<link type="text/css" href="js/jScrollPane/style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
<style type="text/css" id="page-css">
	/* Styles specific to this particular page */
	.scroll-pane
	{
		width: 100%;
		height: 300px;
		overflow: auto;
	}
	.horizontal-only
	{
		height: auto;
		max-height: 300px;
	}
</style>
<!-- the mousewheel plugin -->
<script type="text/javascript" src="js/jScrollPane/jquery.mousewheel.js"></script>
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jScrollPane/jquery.jscrollpane.min.js"></script>

<script type="text/javascript" id="sourcecode">
	$(function()
	{
		$('.scroll-pane').jScrollPane();
	});
</script>
<STYLE>
.comment {}
a.morelink {
	color:blue;
	text-decoration:none;
	outline: none;
}
.morecontent span {
	display: none;
}
</STYLE>
<script type="text/javascript" charset="utf-8">
//Show more/less text
$(document).ready(function() {
	var showChar = 350;
	var ellipsestext = "...";
	var moretext = "more";
	var lesstext = "less";
	$('.more').each(function() {
		var content = $(this).html();
		if(content.length > showChar) {
			var c = content.substr(0, showChar);
			var h = content.substr(showChar, content.length - showChar);
			var html = c + '<span class="moreelipses">'+ellipsestext+'</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">'+moretext+'</a></span>';
			$(this).html(html);		}
	});

	$(".morelink").click(function(){
		if($(this).hasClass("less")) {
			$(this).removeClass("less");
			$(this).html(moretext);
		} else {
			$(this).addClass("less");
			$(this).html(lesstext);
		}
		$(this).parent().prev().toggle();
		$(this).prev().toggle();
		return false;
	});
});
</SCRIPT>
<% 'Kiem tra nguoi dung co login hay chua (luon co dong nay o tat ca cac trang)
	If (not Session("isLogin")) Then
		Response.Redirect("default.asp?page=login&mess=notLogin")
	End if
	'Xoa thong tin thong bao chung

%>
<div class ="font_tieude"> CHÀO MỪNG BẠN ĐẾN VỚI PHẦN MỀM QL ĐÀO TẠO  </div>
<table width="100%">


  <tr>
    <td colspan="2">
	  <div class="home_bar"><img src="images/support-32.png" /> Thông tin hỗ trợ</div>
	  <div class="home_bar_child_bottom">
			<table border="0" width="100%">
              <tr>
                <td width="60%"><p><strong> Địa chỉ liên hệ</strong>:<p>
                   <p> <strong><img src="images/maskrow.gif" /> Cao Đăng Hiếu </strong>&nbsp;&nbsp;  Điện thoại: 0982000911.     Email: hieucd@viettel.com.vn</p>
				</td>
				<td>
				   <strong>Tài liệu hướng dẫn</strong>:<br /><br>
                   <a href="./HDSD phan mem quan ly dao tao KV2.docx"><em>Hướng dẫn sử dụng </em></a> </td>
				</td>
              </tr>               
            </table>
		</div>
	</td>
  </tr>
</table>
