<@override name="title">新闻管理中心</@override>
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
						<td class="ten wide fluid"></td>
						<td class="two wide fluid">
							<form class="ui fluid form">
								<div class="ui action input">
									<div class="filed">
										<select class="ui dropdown" name="select">
											<option value="">按类型查看</option>
											<#list  categories as category >
											<option value="${category.id}">${category.name}</option>
											</#list>
										</select>
									</div>
									<a class="ui primary submit button">查看</a><br>
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
						<th>标题</th>
						<th class="center aligned">所属板块</th>
						<th class="center aligned">发布时间</th>
						<th class="center aligned">发布者昵称</th>
						<th class="center aligned">操作</th>
					</tr>
					</thead>
					<tbody>
                    <#list page.getList() as topic >
						<tr>

							<td>${topic.title!''}</td>
							<td class="center aligned">${topic.name!''}</td>
							<td class="center aligned">${topic.pubDate!''}</td>
							<td class="center aligned">${topic.nickName!''}</td>
							<td class="center aligned">
								<a href="${base}/admin/ModifyNew/${topic.id}" class="ui button green ">修改</a>
								<a href="${base}/admin/deleteNew/${topic.id}" class="ui button red ">删除</a>
							</td>

						</tr>
                    </#list>
					<tr>
						<td colspan="4"></td>
						<td>
							<div class="ui right floated pagination menu">
                                <#if page.getPageNumber() !=1 >
									<a class="icon item" href="?page=${page.getPageNumber()-1}">
										<i class="left chevron icon"></i>
									</a>
                                </#if>

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
            url:'${base}/admin/searchNewByCategoryId',
            serializeForm:true,
            success:function (res) {
                // alert(res.message);
                window.location.href='${base}/admin/manageNewByCategory'
            }
        })

	</script>



</@override>
<@extends name="admin_layout.ftl"></@extends>