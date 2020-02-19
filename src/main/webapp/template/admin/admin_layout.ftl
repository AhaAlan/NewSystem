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
	<title><@block name="title"></@block></title>
</head>
<body>

<div class="ui  top fixed  inverted  menu">
	<div class="ui container">
		<a class="item" href="${base}/admin/">
			<i class="home icon"></i>主页
		</a>
		<a class="item" href="${base}/admin/addNew">发布新闻</a>
		<a class="item" href="${base}/admin/manageNew">新闻管理</a>
		<a class="item" href="${base}/admin/commitManage">
			评论管理
		</a>
        <#if (session.user)??>
            <#if session.user.super==1>
				<div class=" ui dropdown item">
					管理员信息管理
					<div class="menu">
						<a class="item" href="${base}/admin/addAdmin">添加管理员</a>
						<a class="item" href="${base}/admin/manageAdmin">查看管理员</a>
					</div>
				</div>
            </#if>
        </#if>
		<div class=" ui dropdown item">
			用户信息管理
			<div class="menu">
				<a class="item" href="${base}/admin/addUser">添加用户</a>
				<a class="item" href="${base}/admin/manageUser">查看用户</a>
			</div>
		</div>


		<div class="right menu ">
			<div class="ui dropdown item">
				<i class="user icon"></i>
                <#if (session.user)??>
					<a href="${base}/user/personInfo"> 个人中心 </a>
                </#if>
				<i class="icon dropdown"></i>
				<div class="menu">
                    <#if (session.user)??>
						<a href="${base}/logout" class="item">退出</a>
                    <#else>
						<a href="${base}/register" class="item">注册</a>
						<a href="${base}/login" class="item">登录</a>
                    </#if>

				</div>
			</div>
		</div>
	</div>
</div>


<@block name="content">

</@block>
<script>
    $('.ui.dropdown').dropdown();

</script>
</body>
</html>