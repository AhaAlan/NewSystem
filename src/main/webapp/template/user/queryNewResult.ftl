<@override name="title">查询结果</@override>
<@override name="content">

	<table class="ui table celled padded striped fluid ">
		<tbody>
		<tr>
			<td class="three wide fluid"></td>
			<td class="ten wide fluid">
                <#if  page.getList().isEmpty() >
					<div class="ui negative message">
						<i class="close icon"></i>
						<div class="header">没有搜索到相关信息</div>
					</div>

                <#else >
	                <table class="ui table celled striped ">
		                <thead>
		                <tr>
			                <th class=" six wide column ">标题</th>
			                <th class="two wide column center aligned ">发布时间</th>
			                <th class="two wide column center aligned">板块名称</th>
		                </tr>
		                </thead>
		                <tbody>
                        <#list page.getList() as topic>
			                <tr>
				                <td><a href="${base}/topic/${(topic.id)!''}"><b>${(topic.title)!''}</b> </a></td>
				                <td class="center aligned">${(topic.pubDate)!''}</td>
				                <td class="center aligned">${(topic.name)!''}</td>
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
                </#if>
			</td>
			<td class="three wide"></td>
		</tr>
	</table>


</@override>
<@extends name="../layout.ftl"></@extends>