<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>추천 상품 추가</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		$("#nameck").hide();
		$("#bodyck").hide();
		$("#imgck").hide();
		
		$("#product_name").keyup(function(){
			$("#nameck").text("");
			$("#nameck").hide();
		});
		$("#product_detail").keyup(function(){
			$("#bodyck").text("");
			$("#bodyck").hide();
		});
		$("#file").click(function(){
			$("#imgck").text("");
			$("#prev_View_area").hide()
			$("#imgck").hide();
		});
		
		$('#ibtn').click(function(){
			var reg_ck_pw=/^[\w]{8,20}$/;
			var product_name=$("#product_name").val();
			var product_detail = $("#product_detail").val();
			var file = $("#file").val();
			var namecnt=product_name.length;
			var detailcnt=product_detail.length;
			var filecnt=file.length;
			var ckmsg = $(".error").text()
			if(namecnt==0){
				$("#nameck").show();
				$("#nameck").text("상품 이름은 필수 입력사항입니다.");
				$("#product_name").focus();
			}else if(detailcnt==0){
				$("#bodyck").show();
				$("#bodyck").text("상품 설명은 필수 입력사항입니다.");
				$("#product_detail").focus();;
			}else if(filecnt==0 || file==null){
				$("#imgck").show();
				$("#imgck").text("상품 이미지는 필수 입력사항입니다.");
				$("#file").focus();;
			}else if( ckmsg != "" ){
				alert("오류 없이 입력바랍니다.");
			}else{
				$("#pfrm").submit();
			}
		});
		
	});
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;

	  //ie일때(IE8 이하에서만 작동)
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
				var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(View_area); //이미지가 뿌려질 곳

				//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
	  //ie가 아닐때(크롬, 사파리, FF)
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img"); 
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '200px'; 
				img.style.height = '200px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
	</script>
	<style>
	#m2 > a{
		color: #fff !important;
	}
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	.input{
		text-align:left;
	}
	#View_area{
		position:relative; 
		width: 200px; 
		height: 200px; 
		color: black; 
		border: 0px solid black; 
		dispaly: inline; 
	}
	#imgtemp{
		width:200px; 
		height:200px;
	}
	.hidden1{
	 	display:none;
	 }
	 @media ( max-width: 480px ) {
		 .hidden2{
		 	display:none;
		 }
		 .hidden1{
		 	display:block;
		 }
	 }
	 
	  table{
	  	
	  	text-align:center;
	  }
	 tr{
	 	border:1px solid sandyBrown;
	 }
	  input, textarea{
	  	border:0px;
	  	width:100%;
	  }
	 

	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	
	<div id="fh5co-blog">
		<div class="container">
			<h3 id="weatherjisu"> 메뉴 추가 </h3>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="fh5co-blog animate-box">
						<div class="blog-text">
							<form action="addProductProc.do", method="post" enctype="multipart/form-data" id="pfrm">
								<table class="table">
									<tr>
										<th class="hidden2">메뉴 이름 </th>
										<td>
										<div class="hidden1">* 메뉴 이름 </div>
										<input type="text" name="product_name" id="product_name"/><p id="nameck" class="error"></p></td>
									</tr>
									<tr>
										<th class="hidden2">메뉴 설명 </th>
										<td>
										<div class="hidden1">* 메뉴 설명 </div>
										<textarea name="product_detail" id="product_detail" cols="30" rows="8"></textarea><p id="bodyck" class="error"></p></td>
									</tr>
									<tr>
										<th class="hidden2">메뉴 이미지</th>
										<td>
										<div class="hidden1">* 메뉴 이미지 </div>
										<input type="file" name="file" id="file" onchange="previewImage(this,'View_area')" accept="image/gif, image/jpeg, image/png"/>
										<div id='View_area'></div>
										<p id="imgck" class="error"></p>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<button type="button" id="ibtn" class="btn btn-primary">입력</button>
										</td>
									</tr>
								</table>								
							</form>
						</div> 
					</div>
				</div>				
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

