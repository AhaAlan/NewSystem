<@override name="title">修改管理员信息</@override>
<@override name="content">

	<table class="ui table celled padded fluid ">
		<tbody>
		<tr>
			<td class="three wide fluid"></td>
			<td class="ten wide fluid">

				<form class="ui large form" id="form">
					<table class="ui table celled striped  striped ">
						<thead>
						<tr>
							<th colspan="4"><h1>修改用户信息</h1></th>
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
							<td class="center aligned"> 用户名</td>
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

	<script>


        $('.ui.dropdown').dropdown();

        $('.ui.form').form({
            fields: {
                adminName: {
                    rules: [{
                        type: 'empty',
                        prompt: '用户名不能空'
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
            url: '${base}/admin/DomodifyUserInfo',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/admin/manageUser'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>
</@override>
<@extends name="admin_layout.ftl"></@extends>