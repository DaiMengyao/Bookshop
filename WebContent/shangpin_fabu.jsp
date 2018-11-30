<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="entity.Book,java.lang.*,java.util.List"%>   
<!DOCTYPE html>
<html class=" js csstransforms3d"><head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>商品发布</title>
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/page.css">
	<!--[if lte IE 8]>
	<link href="css/ie8.css" rel="stylesheet" type="text/css"/>
	<![endif]-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<!--[if IE]>
	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<%
List<Book> books = (List<Book>)request.getAttribute("books");

%>
<body style="background: #f6f5fa;">

	<!--content S-->
	<div class="super-content RightMain" id="RightMain">
		
		<!--header-->
		<div class="superCtab">
			<div class="ctab-title clearfix"><h3>商品发布</h3></div>
			
			<div class="ctab-Main">

				
				<div class="ctab-Mian-cont">
					<div class="Mian-cont-btn clearfix">
						<div class="operateBtn">
							<a href="CategoryServlet" class="greenbtn publish">发布商品</a>
						</div>
						<div class="searchBar">
							<input type="text" id="search" value="" class="form-control srhTxt" 
							placeholder="输入标题关键字搜索" >
	                        <input type="button" class="srhBtn"  value="" onclick="search()">						</div>
					</div>

					
					<div class="Mian-cont-wrap">
						<div class="defaultTab-T">
						 <table border="0" cellspacing="0" cellpadding="0" class="defaultTable" > 
							<tbody>
								<tr>
									<th class="t_1">商品ID</th>
									<th class="t_2">商品标题</th>
									<th class="t_3">商品价格</th>
									<th class="t_4">商品类别</th>
									<th class="t_5">作者</th>
									<th class="t_6">库存</th>
									<th class="t_7">操作</th>
								</tr>
							</tbody>
						</table>
						</div>
						<table border="0" cellspacing="0" cellpadding="0" class="defaultTable defaultTable2"> 
							<tbody>
							
							<%
							int totalpage = (int)request.getAttribute("totalpage");
							int currentpage = (int)request.getAttribute("currentpage");
							int size = books.size();
							int start = (currentpage-1) * 10;
							int end = start;
							String type = (String)request.getAttribute("type");
							if(currentpage == totalpage && size % 10 != 0){
								end = size; 
							}else{
								end = currentpage * 10;
							}
							for (int i=start;i<end;i++){
							%>
							<tr>
								<td class="t_1"><%=books.get(i).getId() %></td>
								<td class="t_2"><a href="#"><%=books.get(i).getName()%></a></td>
								<td class="t_3"><%=books.get(i).getPrice() %></td>
								<td class="t_4"><%=books.get(i).getCategory() %></td>
								<td class="t_5"><%=books.get(i).getAuthor() %></td>
								<td class="t_6"><%=books.get(i).getCount() %></td>
								<td class="t_7"><div class="btn"><a href="xiangqingbianji.html" class="modify">修改</a><a href="BookServlet?type=delete&id=<%=books.get(i).getId() %>" class="delete">删除</a></div></td>
							</tr>
							<%
							}
							%>

						</tbody>
						</table>
						<!--pages S-->
						<div class="pageSelect">
						
 						<span>共 <b><%=books.size()%></b> 条 每页 <b>10</b>条   <%=currentpage+"/"+totalpage%></span>
					<div class="pageWrap">
						<!--向前一页  -->
							<a onclick="pagepre()" class="pagepre"  value=""  ><i class="ico-pre">&nbsp;</i></a>
						<!--当前页  -->
							<a  href= "pagecurrent()" class="pagenumb cur"  id="currentpage"><%=currentpage%></a>
						<!-- 向后一页 -->
							<a onclick="pagenext()" class="pagenext"  value=""  ><i class="ico-next">&nbsp;</i></a>
					</div> 
							 
					</div>
						<!--pages E-->
						<input type="hidden" id = "type" value="<%=type %>">
					</div>
				
				</div>
			</div>
		</div>
		<!--main-->
		
	</div>
	<!--content E-->
	

			



<script type="text/javascript" src="js/zxxFile.js"></script>

<script>
var params = {
	fileInput: $("#fileImage").get(0),
	upButton: $("#fileSubmit").get(0),
	url: $("#uploadForm").attr("action"),
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			if (file.type.indexOf("image") == 0) {
				if (file.size >= 512000) {
					alert('您这张"'+ file.name +'"图片大小过大，应小于500k');	
				} else {
					arrFiles.push(file);	
				}			
			} else {
				alert('文件"' + file.name + '"不是图片。');	
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		var html = '', i = 0;
		$("#preview").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader()
				reader.onload = function(e) {
					$('.XgfileImg img').attr('src', e.target.result);
					$('.sp-photo').addClass('cur');
					html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><span>' + file.name + '</span>'+ 
						'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a>' +
					'</div>';
					
					i++;
					funAppendImage();
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview").html(html);
				if (html) {
					//删除方法
					$(".upload_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
						$('.sp-photo').removeClass('cur').html('栏目图片');
						return false;	
					});
					//提交按钮显示
					$("#fileSubmit").show();	
				} else {
					//提交按钮隐藏
					$("#fileSubmit").hide();	
				}
			}
		};
		funAppendImage();		
	},
	onDelete: function(file) {
		$("#uploadList_" + file.index).fadeOut();
	},
	onDragOver: function() {
		$(this).addClass("upload_drag_hover");
	},
	onDragLeave: function() {
		$(this).removeClass("upload_drag_hover");
	},
	onProgress: function(file, loaded, total) {
		var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded / total * 100).toFixed(2) + '%';
		eleProgress.show().html(percent);
	},
	onSuccess: function(file, response) {
		$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
	},
	onFailure: function(file) {
		$("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");	
		$("#uploadImage_" + file.index).css("opacity", 0.2);
	},
	onComplete: function() {
		//提交按钮隐藏
		$("#fileSubmit").hide();
		//file控件value置空
		$("#fileImage").val("");
		$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
	}
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();



function search(){
	var search=$("#search").val();
	window.location.href='BookServlet?type=search&sub_bookname='+search;
}

function pagepre(){
	var type = $("#type").val();
	console.log(type);
	var currentpage = parseInt($("#currentpage").text());
	console.log(currentpage);
	window.location.href='BookServlet?type='+type+'&currentpage='+(currentpage-1);
}

function pagenext(){
	var type = $("#type").val();
	console.log(type);
	var currentpage = parseInt($("#currentpage").text());
	console.log(currentpage);
	window.location.href='BookServlet?type='+type+'&currentpage='+(currentpage+1);
}

</script>

</body></html>