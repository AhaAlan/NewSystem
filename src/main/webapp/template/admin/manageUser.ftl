<@override name="title">用户信息管理</@override>
<@override name="content">

	<div class="ui section divider"></div>

	<table class="ui table very basic padded fluid ">
		<tbody>
		<tr>
			<td class="two wide fluid"></td>
			<td class="twelve wide fluid">
				<table class="ui table very basic padded fluid ">
					<tbody>
					<tr>
						<td class="six wide fluid"></td>
						<td class="six wide fluid">
							<form class="ui fluid form">
								<div class="ui action input fluid">
									<div class="filed fluid">
										<input type="text" placeholder="按昵称搜索..." name="nickName" >
									</div>
									<a class="ui primary submit button">搜索</a><br>
								</div>
								<div class="ui error message"></div>
							</form>
						</td>
					</tr>
					</tbody>
				</table>

			</td>
			<td class="two wide"></td>
		</tr>
	</table>

	<table class="ui table celled padded fluid ">
		<tbody>
		<tr>
			<td class="two wide fluid"></td>
			<td class="twelve wide fluid">

				<table class="ui green striped table">
					<thead>
					<tr>
						<th class="center aligned  one wide">用户名</th>
						<th class="center aligned  one wide">密码</th>
						<th class="center aligned  two wide">昵称</th>
						<th class="center aligned  two wide">电话号码</th>
						<th class="center aligned  two wide">邮件地址</th>
						<th class="center aligned  three wide">操作</th>

					</tr>
					</thead>
					<tbody>
                    <#list user as user >
						<tr>

							<td class="center aligned">${user.userName!''}</td>
							<td class="center aligned">${user.password!''}</td>
							<td class="center aligned">${user.nickName!''}</td>
							<td class="center aligned">${user.tel!''}</td>
							<td class="center aligned">${user.email!''}</td>
							<td class="center aligned">
								<a href="${base}/admin/modifyUserInfo/${user.id}" class="ui button blue ">修改</a>
								<a href="${base}/admin/deleteUserInfo/${user.id}" class="ui button red ">删除</a>
							</td>
						</tr>
                    </#list>

					</tbody>
				</table>

			</td>
			<td class="two wide"></td>
		</tr>
	</table>


	<script>

        $('.ui.dropdown').dropdown();

        $('.ui.form').form({
            fields:{
                select:{
                    rules:[{
                        type:'empty',
                        prompt:'搜索方式不能为空'
                    }]
                }
            }
        }).api({
            method:'POST',
            url:'${base}/admin/searchUserByNickName',
            serializeForm:true,
            success:function (res) {
                // alert(res.message);
                window.location.href='${base}/admin/searchUserByNickNameResult'
            }
        })

	</script>



</@override>
<@extends name="admin_layout.ftl"></@extends>