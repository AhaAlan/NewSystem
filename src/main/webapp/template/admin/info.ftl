<#-- @ftlvariable name="test" type="model.Test" -->
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="${base}/scripts/jquery.min.js"></script>
	<script src="${base}/scripts/semantic.min.js"></script>
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>
	<title>wangEditor demo</title>


</head>
<body>

<p>${test.avatar!''}</p>
<p>${test.title}</p>
<p>${test.info}</p>


</body>
</html>