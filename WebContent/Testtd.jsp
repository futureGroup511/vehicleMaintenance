<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		var data=$("tr[id='tr'] td");
		alert($(data.get(0)).text());
	});
</script>
<title>尝试是否能得到td的所有子类</title>
</head>
<body>
			<table cellpadding="0" cellspacing="0" border="1">
				<tr id="tr">
						<td>1</td>
						<td>2</td>
						<td>3</td>
				</tr>
			</table>
</body>
</html>