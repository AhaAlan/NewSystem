<@override name="title">首页</@override>
<@override name="content">

	<table class="ui table celled padded fluid ">
		<tbody>
		<tr>
			<td class="one wide fluid"></td>
			<td class="six wide fluid">
				<table class="ui red table very basic ">
					<thead>
					<tr>
						<th><b>热点新闻</b></th>
					</tr>
					</thead>

					<#--首页展示的几个热点新闻，共八条-->
					<tbody>
					<tr>
						<td><a href="${base}/topic/${topies.get(4).id}">${topies.get(4).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(5).id}">${topies.get(5).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(6).id}">${topies.get(6).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(7).id}">${topies.get(7).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(8).id}">${topies.get(8).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(9).id}">${topies.get(9).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(10).id}">${topies.get(10).title}</a></td>
					</tr>
					<tr>
						<td><a href="${base}/topic/${topies.get(11).id}">${topies.get(11).title}</a></td>
					</tr>
					</tbody>
				</table>
			</td>

			<#--滚动栏里的新闻，含有图片，共四条-->
			<td class="eight wide">
				<div class="wrapper" style="width:799px ;height: 400px">
					<div class="box">
						<ul class="carousel-inner">

							<li class="carousel-item">
								<a href="${base}/topic/${topies.get(0).id}">
									<img style="width:799px ;height: 400px" src="${base}${topies.get(0).coverPic}" alt="" title="${topies.get(0).title}">
								</a>
							</li>

							<li class="carousel-item">
								<a href="${base}/topic/${topies.get(1).id}">
									<img style="width:799px ;height: 400px" src="${base}${topies.get(1).coverPic}" alt="" title="${topies.get(1).title}">
								</a>
							</li>

							<li class="carousel-item">
								<a href="${base}/topic/${topies.get(2).id}">
									<img style="width:799px ;height: 400px" src="${base}${topies.get(2).coverPic}" alt="" title="${topies.get(2).title}">
								</a>
							</li>

							<li class="carousel-item">
								<a href="${base}/topic/${topies.get(3).id}">
									<img style="width:799px ;height: 400px" src="${base}${topies.get(3).coverPic}" alt="" title="${topies.get(3).title}">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</td>
			<td class="one wide"></td>
		</tr>
	</table>

	<script>
		$('.box').sowingMap({
			count: 4,
			time: 3000
		});
	</script>

</@override>
<@extends name="layout.ftl"></@extends>