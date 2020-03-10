<@override name="title">帖子列表</@override>
<@override name="content">



	<table class="ui table celled padded fluid ">
		<tbody>
		<tr>
			<td class="three wide fluid"></td>
			<td class="ten wide fluid">
				<table class="ui table celled  ">
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
								<form action="${base}/category/instantNews" method="post" class="icon item disabled">
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
			</td>
			<td class="three wide"></td>
		</tr>
	</table>



	<script>

        <#--function tiaozhuan() {-->
        <#--    $.ajax({-->
        <#--        //几个参数需要注意一下-->
        <#--        type: "POST",//方法类型-->
        <#--        dataType: "json",//预期服务器返回的数据类型-->
        <#--        url: '${base}/user/queryNew',-->
        <#--        data: $('#quert1').serialize(),-->
        <#--        success:function (res) {-->
        <#--            if(res.success){-->
        <#--                window.location.href='${base}/user/queryNewResult'-->
        <#--            }else{-->
        <#--                $('.ui.form').form('add errors',[res.message]);-->
        <#--            }-->
        <#--        }-->
        <#--    });-->
        <#--}-->


        <#--.api({-->
        <#--    method:'POST',-->
        <#--    url:'${base}/user/queryNew',-->
        <#--    serializeForm:true,-->
        <#--    success:function (res) {-->
        <#--        if(res.success){-->
        <#--                window.location.href='${base}/user/queryNewResult'-->
        <#--        }else{-->
        <#--            $('.ui.form').form('add errors',[res.message]);-->
        <#--        }-->
        <#--    }-->

        <#--});-->
	</script>



</@override>
<@extends name="../layout.ftl"></@extends>