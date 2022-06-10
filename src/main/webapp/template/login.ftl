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
	<title>登录</title>
	<style type="text/css">
		body {
			background-image: url("../template/image/bg.jpg");
		background-size :100% 100%;
		}

		body > .grid {
			height: 100%;
		}

		.column {
			max-width: 1000px;
		}

		.mybox{
			position: relative;
		}
		.mybox span{
			position:absolute;
			display: block;
			height: 34px;
			right:2px;
			top:2px;
			line-height: 34px;
		}
	</style>
</head>

<body>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<div class="ui placeholder segment">
				<div class="ui two column very relaxed stackable grid">
					<div class="column  left aligned">
						<form class="ui form" id="login-form">
							<div class="field">
								<label>用户名</label>
								<div class="ui left icon input">
									<input type="text" placeholder="username" name="username">
									<i class="user icon"></i>
								</div>
							</div>
							<div class="field">
								<label>密码</label>
								<div class="ui left icon input">
									<input type="password" placeholder="password" name="password">
									<i class="lock icon"></i>
								</div>
							</div>

							<div class="mybox">
								<div class="field grid eleven wide red">
									<input type="text" name="captcha" placeholder="请输入验证码" autocomplete="off">
								</div>
								<span> <img src="${base}/captcha" id="captcha-img" onclick="refreshCaptcha()"></span>
							</div>

							<div class="inline fields">
								<label for="usertype">选择用户类型</label>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="usertype" id="" value="1">
										<label for="">用户</label>
									</div>
								</div>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="usertype" id="" value="2">
										<label for="">管理员</label>
									</div>
								</div>
							</div>
							<div class="ui error message"></div>
							<div class="ui blue submit button">Login</div>
						</form>
					</div>
					<div class="middle aligned column">
						<a class="ui big button" href="${base}/register">
							<i class="signup icon"></i>
							Sign Up
						</a>
					</div>
				</div>
				<div class="ui vertical divider">
					Or
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$('.ui.form').form({
		fields: {
			username: {
				identifier: 'username',
				rules: [
					{
						type: 'empty', prompt: '用户名不能为空'
					}
				]
			},
			captcha: {
				identifier: 'captcha',
				rules: [
					{
						type: 'empty', prompt: '验证码不能为空'
					}
				]
			},
			password: {
				identifier: 'password',
				rules: [{
					type: 'empty', prompt: '密码不能为空'
				}]
			}
			,
			usertype: {
				identifier: 'usertype',
				rules: [{
					type: 'checked', prompt: '用户类型不能为空'
				}]
			}
		}
	}).api({
		method: 'POST',
		url: '${base}/loginCheck',
		serializeForm: true,
		success: function (res) {
			if (res.success) {
				alert(res.message);
				if (res.flag == 1) {
					window.location.href = '${base}/user'
				} else {
					window.location.href = '${base}/admin'
				}

			} else {
				$('.ui.form').form('add errors', [res.message]);
			}
		}

	});

	function refreshCaptcha() {
		$('#captcha-img').attr('src','${base}/captcha?a'+Math.random())
	}
</script>

</html>