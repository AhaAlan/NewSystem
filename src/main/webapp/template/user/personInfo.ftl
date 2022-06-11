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
	<title>个人中心</title>
</head>

<script>
    $(document).ready(function () {
        // 鼠标放到 dropdown 时显示下拉菜单，默认只有点击后才显示
        $('.dropdown.item').dropdown({
            on: 'hover'
        });
    });
</script>

<body>
	<div class="ui  top fixed  inverted  menu">
		<div class="ui container">
			<a class="item" href="${base}/">
				<i class="home icon"></i> 主页
			</a>
			<a class="item" href="${base}/category/instantNews">
				<i class="home icon"></i> 即时新闻
			</a>
			<#list categories as category>
				<a class="item" href="${base}/category/${category.id!''}">
					${category.name!''}
				</a>
			</#list>

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


<table class="ui table celled padded fluid ">
	<tbody>
	<tr>
		<td class="three wide fluid"></td>
		<td class="ten wide fluid">
			<div class="ui section divider hidden"></div>

			<table class="ui table celled striped  striped ">
				<thead>
				<tr>
					<th colspan="4"><h1>个人信息</h1></th>
				</tr>
				</thead>
				<tbody>

				<tr>
					<td class="center aligned"> 登录名</td>
					<td class="center aligned">${user.userName!''}</td>
				</tr>
				<tr>
					<td class="center aligned">登陆密码</td>
					<td class="center aligned">${user.password!''}</td>
				</tr>
				<tr>
					<td class="center aligned"> 昵称</td>
					<td class="center aligned">${user.nickName!''}</td>
				</tr>
				<tr>
					<td class="center aligned">电话号码</td>
					<td class="center aligned">${user.tel!''}</td>
				</tr>
				<tr>
					<td class="center aligned"> 邮箱地址</td>
					<td class="center aligned">${user.email!''}</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a href="${base}/user/modifiyPersonInfo/${user.id}" class="ui button primary fluid ">修改信息</a>
					</td>
				</tr>
				</tbody>
			</table>

			<div class="ui section divider"></div>
			<h1>收藏列表</h1>
			<div class="ui section divider"></div>

			<table class="ui table celled striped ">
				<thead>
				<tr>
					<th class=" six wide column ">新闻标题</th>
					<th class="two wide column center aligned ">收藏时间</th>
					<th class="two wide column center aligned">所属类别</th>
				</tr>
				</thead>
				<tbody>
                <#list page.getList() as collection>
					<tr>
						<td><a href="${base}/topic/${(collection.topicId)!''}"><b>${(collection.title)!''}</b></a></td>
						<td class="center aligned">${(collection.collectionTime)!''}</td>
						<td class="center aligned">${(collection.name)!''}</td>
					</tr>
                </#list>
				<tr>
					<td></td>
					<td></td>
					<td>
						<div class="ui right floated pagination menu">
                        <#if page.getPageNumber() !=1 >
							<a class="icon item" href="?page=${page.getPageNumber()-1}">
								<i class="left chevron icon"></i>
							</a>
                        </#if>
                        <#list  1..(page.getTotalPage()) as count >
							<a class="item">
                                <#if page.getPageNumber()==count>
									<b>${count}</b>
                                <#else>
                                    ${count}
                                </#if>
							</a>
                        </#list>
                        <#if page.getPageNumber() != page.getTotalPage() >
							<a class="icon item" href="?page=${page.getPageNumber()+1}">
								<i class="right chevron icon"></i>
							</a>
                        </#if>
						</div>
					</td>
				</tr>
				</tbody>
			</table>

			<div class="ui section divider"></div>
		</td>
		<td class="three wide"></td>
	</tr>
</table>


	<div class="footer ui bottom fixed menu">
		<div class="ui text center aligned container footer ui bottom fixed"><b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@UTSC Project TextClassification 2022 </b></div>
	</div>
</body>
</html>