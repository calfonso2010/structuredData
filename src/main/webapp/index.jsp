<%@page import="fr.epita.structuredData.services.XmlTemplateService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/styleSheet.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dynamic Form Example</title>
</head>
<body>
	<header>Identity Creation</header>
<div class="content">
		<h1>New Identity</h1>
		<p>Create new Identity.</p>
		<div id="messageContent"></div>

		<%=new XmlTemplateService().convertXmlTemplateToHtmlString()%>

	</div>
	<script>
		var form = $('#identity');
		form.submit(function() {
			$.ajax({
				type : form.attr('method'),
				url : form.attr('action'),
				data : $(this).serialize(),
				success : function(data) {
					var json = data, obj = JSON.parse(json);
					$('#messageContent').html(
							'ComplementaryData:' + obj.complementaryData
									+ '<br/>' + 'Message:' + obj.message);
				}
			});
			return false;
		});
	</script>
	

</body>
</html>