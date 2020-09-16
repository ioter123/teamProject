<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>이메일인증</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
		 
<script>
	$(document).ready(function(){

	  var cus_email = '${cus_email}';

	  alert(cus_email + '회원님이 등록하신 이메일로 가셔서 인증을 완료해 주세요.');

	  window.open('', '_self', ''); // 브라우저창 닫기
	  /* window.close(); // 브라우저 창 닫기 */
	  self.location = '${path}/loginFrm.do';

	});	

</script>
	 
<!-- =========================== -->
	
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
		 
<!-- =========================== -->

	 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>


