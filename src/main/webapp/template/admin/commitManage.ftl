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


	<table class="ui green striped table">
					<thead>
					<tr>
						<th class="center aligned one wide">用户ID</th>
						<th class="center aligned two wide">用户昵称</th>
						<th class="center aligned one wide">所属新闻ID</th>
						<th class="center aligned six wide">回复内容</th>
						<th class="center aligned two wide">发布时间</th>
						<th class="center aligned three wide">操作</th>
					</tr>
					</thead>
					<tbody>
                    <#list page.getList() as reply >
						<tr>

							<td class="center aligned">${reply.userId!''}</td>
							<td class="center aligned">${reply.nickName!''}</td>
							<td class="center aligned">${reply.topicId!''}</td>
							<td class="center aligned">${reply.content!''}</td>
							<td class="center aligned">${reply.pubDate!''}</td>
							<td class="center aligned">
								<#if reply.status==1>
									<a href="${base}/admin/passReply/${reply.id}" class="ui button blue disabled ">通过</a>
									<a href="${base}/admin/refuseReply/${reply.id}" class="ui button red ">拒绝</a>
								    <#else>
									    <a href="${base}/admin/passReply/${reply.id}" class="ui button blue  ">通过</a>
									    <a href="${base}/admin/refuseReply/${reply.id}" class="ui button red disabled">拒绝</a>
								</#if>


							</td>

						</tr>
                    </#list>
					<tr>
						<td colspan="4"></td>
						<td class="center aligned" >
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




	<script>

        $('.ui.dropdown').dropdown();

        $('.ui.form').form({
            fields:{

                nickName:{
                    rules:[{
                        type:'empty',
                        prompt:'nickName不能为空'
                    }]
                }
            }
        }).api({
            method:'POST',
            url:'${base}/admin/searchReplyByCategoryId',
            serializeForm:true,
            success:function (res) {
                // alert(res.message);
                window.location.href='${base}/admin/manageReplyByCategory'
            }
        })

	</script>



</@override>
<@extends name="admin_layout.ftl"></@extends>