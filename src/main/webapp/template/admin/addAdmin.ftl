<@override name="title">添加管理员</@override>
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
							<th colspan="4"><h1>添加管理员</h1></th>
						</tr>
						</thead>
						<tbody>

						<tr>
							<td class="center aligned"> 用户名</td>
							<td class="center aligned">
								<div class="field ">
									<input type="text" name="adminName">
								</div>
							</td>
						</tr>
						<tr>
							<td class="center aligned">登陆密码</td>
							<td class="center aligned">
								<div class="field ">
									<input type="text" name="password">
								</div>
							</td>
						</tr>
						<tr>
							<td class="center aligned"> 昵称</td>
							<td class="center aligned">
								<div class="field ">
									<input type="text" name="nickName" >
								</div>
							</td>
						</tr>
						<tr>
							<td class="center aligned">电话号码</td>
							<td class="center aligned">
								<div class="field ">
									<input type="text" name="tel">
								</div>
							</td>
						</tr>
						<tr>
							<td class="center aligned"> 邮箱地址</td>
							<td class="center aligned">
								<div class="field ">
									<input type="text" name="email" >
								</div>
							</td>
						</tr>
						<tr>
							<td class="center aligned"> 设置超级管理员</td>
							<td class="center aligned">
								<div class="field ">
									<select class="ui dropdown" name="super">
										<option value="">选择类型</option>
										<option value="1">是</option>
										<option value="0">否</option>
									</select>
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
                },
                super: {
                    rules: [{
                        type: 'empty',
                        prompt: 'super不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/admin/DoAddAdminInfo',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/admin/manageAdmin'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>
</@override>
<@extends name="admin_layout.ftl"></@extends>