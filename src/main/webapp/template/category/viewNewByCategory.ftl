<#-- @ftlvariable name="collections" type="java.util.List<model.Collection>" -->
<#-- @ftlvariable name="topics" type="java.util.List<model.Topic>" -->
<@override name="title">${topics.get(0).name}</@override>
<@override name="content">

	<link rel="stylesheet" href="${base}/styles/style.css">
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>


	<table class="ui table  padded very basic fluid " rules=none>
		<tbody>
		<tr>
			<td class="three wide "></td>
			<td class="ten wide">
				<#--滚动栏-->
				<div id="container" style="margin: auto auto">
					<div id="list" style="left: -1155px">
						<a href="${base}/topic/${topics.get(4).id!''}">
							<img src="${base}${topics.get(4).coverPic}" alt="5" title="${topics.get(4).title}">
						</a>
						<a href="${base}/topic/${topics.get(0).id!''}">
							<img src="${base}${topics.get(0).coverPic}" alt="1" title="${topics.get(0).title}">
						</a>
						<a href="${base}/topic/${topics.get(1).id!''}">
							<img src="${base}${topics.get(1).coverPic}" alt="2" title="${topics.get(1).title}">
						</a>
						<a href="${base}/topic/${topics.get(2).id!''}">
							<img src="${base}${topics.get(2).coverPic}" alt="3" title="${topics.get(2).title}">
						</a>
						<a href="${base}/topic/${topics.get(3).id!''}">
							<img src="${base}${topics.get(3).coverPic}" alt="4" title="${topics.get(3).title}">
						</a>
						<a href="${base}/topic/${topics.get(4).id!''}">
							<img src="${base}${topics.get(4).coverPic}" alt="5" title="${topics.get(4).title}">
						</a>
						<a href="${base}/topic/${topics.get(0).id!''}">
							<img src="${base}${topics.get(0).coverPic}" alt="1" title="${topics.get(0).title}">
						</a>

					</div>
					<p id="desc" style="font-size: 24px;font-family: 微软雅黑;">${topics.get(4).title}</p>
					<div id="buttons">
						<span index="1" class="on"></span>
						<span index="2"></span>
						<span index="3"></span>
						<span index="4"></span>
						<span index="5"></span>
					</div>
					<a href="javascript:;" class="arrow" id="prev">&lt;</a>
					<a href="javascript:;" class="arrow" id="next">&gt;</a>
				</div>
			</td>
			<td class="three wide"></td>
		</tr>

		<tr>
			<td class="three wide "></td>
			<td class="ten wide">
				<table class="ui table  padded very basic fluid " rules=none>
					<thead>
						<tr>
							<th>标题</th>
							<th class="center aligned">发布者</th>
							<th class="center aligned">发布时间</th>
						</tr>
					</thead>
					<tbody>
					<#--显示前几条新闻-->
                    <#list page.getList() as topic>
						<tr>
							<td>
								<a style="color: black;font-size: 20px"
								   href="${base}/topic/${topic.id}"><b>${base}${topic.title}</b></a>
							</td>
							<td class="center aligned">${base}${topic.nickName}</td>
							<td class="center aligned">${base}${topic.pubDate}</td>
						</tr>
                    </#list>
					<tr>
						<td></td>
						<td></td>
						<td>

<#--							<div class="ui right floated pagination menu">-->
<#--                                <#if page.getPageNumber() !=1 >-->
<#--									<a class="icon item" href="?page=${page.getPageNumber()-1}">-->
<#--										<i class="left chevron icon"></i>-->
<#--									</a>-->
<#--                                </#if>-->
<#--                                <#list  1..(page.getTotalPage()) as count >-->
<#--									<a class="item">-->
<#--                                        <#if page.getPageNumber()==count>-->
<#--											<b>${count}</b>-->
<#--                                        <#else>-->
<#--                                            ${count}-->
<#--                                        </#if>-->
<#--									</a>-->
<#--                                </#list>-->
<#--                                <#if page.getPageNumber() != page.getTotalPage() >-->
<#--									<a class="icon item" href="?page=${page.getPageNumber()+1}">-->
<#--										<i class="right chevron icon"></i>-->
<#--									</a>-->
<#--                                </#if>-->
<#--							</div>-->


							<div class="ui right floated pagination menu">
                                <#--                                <#if page.getPageNumber() !=1 >-->
                                <#--									<a class="icon item" href="?page=${page.getPageNumber()-1}">-->
                                <#--										<i class="left chevron icon"></i>-->
                                <#--									</a>-->
                                <#--                                </#if>-->

								<a href="#" class="icon item disabled">
                                    ${page.getPageNumber()}/${page.getTotalPage()}
								</a>
                                <#--								<a href="#" class="icon item disabled">-->
                                <#--                                    ${page.getPageNumber()}/${page.getTotalPage()}-->
                                <#--								</a>-->
								<form action="${base}/category/" method="post" class="icon item disabled">
									<input type="text" placeholder="请输入页码 " name="page" >
									<button type="submit"  >跳转</button>
								</form>
                                <#--                                <#if page.getPageNumber() != page.getTotalPage() >-->
                                <#--									<a class="icon item" href="?page=${page.getPageNumber()+1}">-->
                                <#--										<i class="right chevron icon"></i>-->
                                <#--									</a>-->
                                <#--                                </#if>-->


							</div>

						</td>
					</tr>
					</tbody>
				</table>


				<div class="ui section divider"></div>
			</td>
			<td class="three wide "></td>
		</tr>
	</table>

	<script src="${base}/scripts/script.js"></script>
</@override>
<@extends name="../layout.ftl"></@extends>