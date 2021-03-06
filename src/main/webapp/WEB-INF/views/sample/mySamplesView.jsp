<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="../head/head.jsp" />
		
		<link href="${pageContext.request.contextPath}/resources/fullcalendar-3.9.0/fullcalendar.min.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/resources/fullcalendar-3.9.0/lib/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/fullcalendar-3.9.0/fullcalendar.min.js"></script>
	<title>스케줄러 - 내 일정</title>
	
	<script>
		function doSubmit() {
			var param = {};
			param.memberNo = ${param.seq};
			
			var contextPath = "${pageContext.request.contextPath}";
		    var memberNo = ${member};
			
			$.ajax({
				url: "${pageContext.request.contextPath}/sample/mySamples.do",
				type: "POST",
				data: param,
				dataType: "json",
				success: function(data) {
					setCalendar(data, contextPath, memberNo);
				},
				error: function(data) {
					alert(data.responseText);
				}
			});
		}
	</script>
	</head>
<body>
	<jsp:include page="../navbar/sampleNavbar.jsp" />
	<jsp:include page="../sample/sampleCalendar.jsp" />
	<jsp:include page="../footer/footer.jsp" />
	
	<script>
		$(function() {
			doSubmit();
		});
	</script>
</body>
</html>