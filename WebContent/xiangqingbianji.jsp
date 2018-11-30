<%@page import="entity.Book"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class=" js csstransforms3d"><head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>详情编辑</title>
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/page.css">
	<!--[if lte IE 8]>
	<link href="css/ie8.css" rel="stylesheet" type="text/css"/>
	<![endif]-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery.selectui.js"></script>
	
	<script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	
	<link rel="stylesheet" type="text/css" href="js/webuploader/webuploader.css">    
    <link rel="stylesheet" type="text/css" href="js/webuploader/demo.css">
	
	<script>
	$(function($) {
		$("select").selectui({
			// 是否自动计算宽度
			autoWidth: true,
			// 是否启用定时器刷新文本和宽度
			interval: true
		});
	});
	</script>
	<!--[if IE]>
	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
<link href="js/utf8-jsp/themes/default/css/ueditor.css" type="text/css" rel="stylesheet">
<script src="js/utf8-jsp/third-party/codemirror/codemirror.js" type="text/javascript" defer></script>
<link rel="stylesheet" type="text/css" href="js/utf8-jsp/third-party/codemirror/codemirror.css">
<script src="js/utf8-jsp/third-party/zeroclipboard/ZeroClipboard.js" type="text/javascript" defer></script></head>

<body style="background: rgb(246, 245, 250);">
<%List<Category> categories = (List<Category>)request.getAttribute("categories");
 Book book = new Book();
%>
	<!--content S-->
	<div class="super-content">
		<div class="superCtab">
			<div class="publishArt">
				<h4>发布商品</h4>
				<div class="pubMain">
					<a href="BookSerlet" class="backlistBtn"><i class="ico-back"></i>返回列表</a>
					<form action="Upload" enctype="multipart/form-data" method="post">
						<h5 >请选择分类</h5>
						<div  id="category">
							<%
							for(int i =0 ; i<categories.size();i++){
							%>
							<label>
							<input name="Category" type="checkbox" value="<%=i%>" /><%=categories.get(i).getCategory_name() %> </label> 
					
							<%} %>
						</div>
				
						
						<h5 class="pubtitle" >商品标题</h5>
						<div class="pub-txt-bar">
							<input type="text" class="shuruTxt" name="title">
						</div>
						
						<h5 class="pubtitle">书本作者</h5>
						<div class="pub-txt-bar">
							<input type="text" class="shuruTxt" name="author">
						</div>
						
						<h5 class="pubtitle">商品价格</h5>
						<div class="pub-txt-bar">
							<input type="text" class="shuruTxt" name="price">
						</div>
						
						<h5 class="pubtitle">商品库存</h5>
						<div class="pub-txt-bar">
							<input type="text" class="shuruTxt" name="count">
						</div>
						<h5 class="pubtitle">商品封面图片</h5>
						  <div class="Thumblistbg upload-img">
								<input id="fileImage" type="file" size="30" name="file1" >
								<a href="javascript:;" class="Thumbbtn"><i class="ico-download"></i>上传图片</a>	
						</div>
						<input  type="text" id="browsetreaminput"  style="width:400px" readonly="readonly" />
						
						
						<h5 class="pubtitle">商品详情图片</h5>
						<div class="Thumblistbg upload-img">
								<input id="fileImage" type="file" size="30" name="file2" multiple>
								<a href="javascript:;" class="Thumbbtn"><i class="ico-download"></i>上传图片</a>
						</div>
							
						<!--<h5 class="pubtitle">文章内文字容</h5>-->
						<div class="pub-btn">
							<input type="submit" id="release" value="发布" class="saveBtn" >
						</div>
					</form>
				</div>
			</div>
		
		</div>
		<!--main-->
		


<script type="text/javascript">
// 添加全局站点信息
var BASE_URL = '/webuploader';
</script>
<!--引入JS-->
<script type="text/javascript" src="js/webuploader/webuploader.js"></script>
<script type="text/javascript" src="js/webuploader/demo.js"></script>
<script type="text/javascript">
		$('#fileImage').change(function () {
		    $('#browsetreaminput').val($(this).val());
		});


    /* //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    
    
   */
    
</script>

<!--<script type="text/javascript" src="js/zxxFile.js" ></script>
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
					html = html +'<div class="Thumb_li"><div class="bg"><a href="javascript:" class="Thumb_delete" title="删除" data-index="'+ i +'">删除</a></div>' +
						'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" />'+ 
					'</div>';
					
					i++;
					funAppendImage();
					$('.Thumb_li').hover(function(){
				    	$(this).children('.bg').fadeIn();
				    },function(){
				    	$(this).children('.bg').fadeOut();
				    });
				    $(".Thumb_delete").click(function(){
				    	$(this).parent().parent('.Thumb_li').remove();
				    });
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview").html(html);
				if (html) {
					//删除方法
					$(".Thumb_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
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
</script>-->


</body>
</html>