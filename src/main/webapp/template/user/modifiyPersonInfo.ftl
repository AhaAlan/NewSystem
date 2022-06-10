<#--用户的首页-->
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
	<title>修改个人信息</title>
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

				<form class="ui large form" id="form">
					<table class="ui table celled striped  striped ">
						<thead>
							<tr>
								<th colspan="4"><h1>修改个人信息</h1></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="center aligned">ID</td>
								<td class="center aligned">
									<div class="field disabled">
										<input type="text" name="id" value="${user.id!''}" placeholder="${user.id!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td class="center aligned"> 登录名</td>
								<td class="center aligned">
									<div class="field ">
										<input type="text" name="userName" value="${user.userName!''}"
											   placeholder="${user.userName!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td class="center aligned">登陆密码</td>
								<td class="center aligned">
									<div class="field ">
										<input type="text" name="password" value="${user.password!''}"
											   placeholder="${user.password!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td class="center aligned"> 昵称</td>
								<td class="center aligned">
									<div class="field ">
										<input type="text" name="nickName" value="${user.nickName!''}"
											   placeholder="${user.nickName!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td class="center aligned">电话号码</td>
								<td class="center aligned">
									<div class="field ">
										<input type="text" name="tel" value="${user.tel!''}" placeholder="${user.tel!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td class="center aligned"> 邮箱地址</td>
								<td class="center aligned">
									<div class="field ">
										<input type="text" name="email" value="${user.email!''}" placeholder="${user.email!''}">
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="ui error message"></div>
								</td>
								<td>
									<button class="ui button primary fluid  submit" type="submit"> 保存</button>
								</td>
							</tr>
						</tbody>

					</table>
				</form>
				<div class="ui section divider"></div>
			</td>
			<td class="three wide"></td>
		</tr>
	</table>

	<#--补充：JavaScript 通常用于图像操作、表单验证以及动态内容更改。-->
	<script>
		$('.ui.dropdown').dropdown();
		$('.ui.form').form({
			fields: {
				userName: {
					rules: [{
						type: 'empty',
						prompt: 'userName不能为空'
					}]
				},
				password: {
					rules: [
						{
							type: 'empty',
							prompt: 'password不能为空'
						}]
				},
				nickName: {
					rules: [{
						type: 'empty',
						prompt: 'nickName不能为空'
					}]
				},
				tel: {
					rules: [{
						type: 'empty',
						prompt: 'tel没填写'
					}]
				},
				email: {
					rules: [{
						type: 'empty',
						prompt: '邮件不能为空'
					}]
				}
			}
		}).api({
			method: 'POST',
			url: '${base}/user/DomodifiyPersonInfo',
			serializeForm: true,
			success: function (res) {
				if (res.success) {
					alert(res.message);
					window.location.href = '${base}/user/personInfo'
				} else {
					$('.ui.form').form('add errors', [res.message]);
				}
			}
		})
	</script>
</body>

</html>