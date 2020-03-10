<#-- @ftlvariable name="collections" type="java.util.List<model.Collection>" -->
<@override name="title">${topic.title}</@override>
<@override name="content">




	<div class="ui text container ">

	<h2 class="ui header"></h2>

	<h2 class="ui top attached block header">
        ${topic.title}
	</h2>
	<div class="ui bottom attached segment ">


        ${topic.content!'无内容'}

		<div class="ui section divider"></div>
		<label><b>友情链接：</b></label>
		<a class="ui tag label" href="${topic.link}">${topic.linkName}</a>


		<div class="ui section divider"></div>
        <#if (session.user)??>
            <#if collections.isEmpty()>
				<div class="ui labeled button" tabindex="0">
					<a class="ui basic red button "
					   href="${base}/topic/DoCollectTopic/${topic.id}-${session.user.id}">
						<i class="heart icon"></i> 收藏
					</a>
				</div>
				<div class="ui labeled button" tabindex="0">
					<a class="ui basic blue button disabled"
					   href="${base}/topic/CancelCollectTopic/${topic.id}-${session.user.id}">
						<i class="fork icon"></i> 取消收藏
					</a>
				</div>

            <#else >
				<div class="ui labeled button" tabindex="0">
					<a class="ui basic red button disabled"
					   href="${base}/topic/DoCollectTopic/${topic.id}-${session.user.id}">
						<i class="heart icon"></i> 收藏
					</a>
				</div>
				<div class="ui labeled button" tabindex="0">
					<a class="ui basic blue button"
					   href="${base}/topic/CancelCollectTopic/${topic.id}-${session.user.id}">
						<i class="fork icon"></i> 取消收藏
					</a>
				</div>
            </#if>
        </#if>

	</div>
	<div class="ui section divider"></div>

	<div class="ui relaxed divided list">

        <#list page.getList() as reply>
            <#if reply.status==1>
				<div class="ui  minimal  comments">
					<h3 class="ui dividing header">Comments</h3>
					<div class="comment">
						<a class="avatar">
							<img src="${base}/template/image/matt.jpg">
						</a>
						<div class="content">
							<a class="author">${reply.nickName}</a>
							<div class="metadata">
								<span class="date">回复于${reply.pubDate}</span>
							</div>
							<div class="text">
                                ${reply.content}
							</div>
                            <#if (session.user)??><!--判断是否登录-->
                            <#if  reply.userId == session.user.id>
								<div class="actions">
									<a class="reply"
									   href="${base}/topic/deleteReply/${reply.id}-${reply.topicId}">删除</a>
								</div>
                            </#if>
                            </#if>
						</div>
					</div>
				</div>
            </#if>
        </#list>


		<div class="ui divider section hidden"></div>

		<div>
<#--            <#if page.getTotalPage()!=0>-->
<#--                <#if page.getPageNumber() !=1 >-->
<#--					<a href="?page=${page.getPageNumber()-1}">上一页</a>-->
<#--                </#if>-->
<#--                ${page.getPageNumber()}/${page.getTotalPage()}-->
<#--                <#if page.getPageNumber() != page.getTotalPage() >-->
<#--					<a href="?page=${page.getPageNumber()+1}">下一页</a>-->
<#--                </#if>-->
<#--            <#else >-->
<#--                ${page.getPageNumber()}/${page.getTotalPage()+1}-->
<#--            </#if>-->

			<div class="ui right floated pagination menu">
				<a href="#" class="icon item disabled">
                    ${page.getPageNumber()}/${page.getTotalPage()}
				</a>
				<form action="${base}/topic/${topicId}" method="post" class="icon item disabled">
					<input type="text" placeholder="请输入页码 " name="page" >
					<button type="submit"  >跳转</button>
				</form>
			</div>
		</div>

		<div class="ui section divider"></div>
        <#if (session.user)??><!--判断是否登录-->
			<form class="ui reply form">
				<input type="hidden" name="user_id" value="${session.user.id}">
				<input type="hidden" name="topic_id" value="${topic.id}">
				<div class="field">
					<textarea name="content"></textarea>
				</div>
				<div class="ui blue labeled submit icon button">
					<i class="icon edit"></i> Add Reply
				</div>
				<div class="ui error message"></div>
			</form>
        </#if>
	</div>

	<div class="ui section divider"></div>


	<script>
        $('.ui.form').form({
            fields: {
                content: {
                    identifier: 'content',
                    rules: [
                        {
                            type: 'empty', prompt: '内容不能为空'
                        }
                    ]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/topic/reply',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/topic/${(topic.id)}'
                } else {
                    $('#reply').form('add errors', [res.message]);
                }
            }
        })

	</script>


</@override>
<@extends name="../layout.ftl"></@extends>