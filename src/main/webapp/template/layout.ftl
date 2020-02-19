<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="${base}/scripts/jquery.min.js"></script>
	<script src="${base}/scripts/semantic.min.js"></script>
	<script src="${base}/template/script.js"></script>
	<script src="${base}/template/demo.js"></script>
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>

	<title><@block name="title"></@block></title>


	<style type="text/css">

		ul,
		ol,
		li,
		div {
			margin: 0;
			padding: 0;
		}

		ul,
		ol {
			list-style: none;
		}

		.box {
			width: 100%;
			height: 100%;
			position: relative;
			overflow: hidden;
		}

		.carousel-inner {
			height: 100%;
			left: 0;
			top: 0;
			position: absolute;
		}

		.carousel-item {
			height: 100%;
			float: left;

		}

		.carousel-item img {
			height: 100%;
		}

		.carousel-indicators {
			position: absolute;
			width: 100%;
			height: 12px;
			left: 0;
			bottom: 20px;
			text-align: center;
		}

		.carousel-indicators span {
			width: 12px;
			height: 12px;
			background-color: #fff;
			border-radius: 50%;
			display: inline-block;
			margin-right: 5px;
		}

		.carousel-indicators span.active {
			background-color: #de3a3a;
		}

		.carousel-btn {
			width: 50px;
			height: 45px;
			position: absolute;
			top: 50%;
			margin-top: -25px;
			cursor: pointer;
		}

		.carousel-prev-btn {
			left: 0;
			background-image: url('${base}/template//images/prev.png');
		}

		.carousel-next-btn {
			right: 0;
			background-image: url('${base}/template//images/next.png');
		}

		/*body {*/
		/*	background-color: #DADADA;*/
		/*}*/
	</style>

</head>

<script>
    $(document).ready(function() {
        // 鼠标放到 dropdown 时显示下拉菜单，默认只有点击后才显示
        $('.dropdown.item').dropdown({
            on: 'hover'
        });
    });
</script>
<body>


<div class="ui fluid container middle aligned " style="height: 200px;">
	<div class="ui grid ">


		<div class="eight wide column center aligned centered middle aligned "
		     style="margin: 25px auto;background-color:white"  >

			<div class="ui center two wide ">
				<img src="${base}/template/image/logo.png" alt="" style="width: 200px;height: 60px">
			</div>
			<form class="ui fluid form">

				<div class="ui action input fluid ">
					<div class="filed" >
						<input type="text" placeholder="搜索..." name="search" style="width: 600px;height: 60px">
					</div>
					<div class="filed ">
						<select class="ui dropdown " name="year" style="width: 100px;height: 60px" >
							<option selected="" value=""> &nbsp;&nbsp;&nbsp;&nbsp;年度</option>
							<option value="2020"> &nbsp;&nbsp;&nbsp;&nbsp;2020</option>
							<option value="2019"> &nbsp;&nbsp;&nbsp;&nbsp;2019</option>
							<option value="2018"> &nbsp;&nbsp;&nbsp;&nbsp;2018</option>
							<option value="2017"> &nbsp;&nbsp;&nbsp;&nbsp;2017</option>
							<option value="2016"> &nbsp;&nbsp;&nbsp;&nbsp;2016</option>
						</select>
					</div>
					<a class="ui primary submit button" >搜索</a><br
<#--					<div type="submit" class="ui button">搜索</div>-->
				</div>

			</form>
		</div>

	</div>
</div>

<div class="ui attached stackable menu inverted nav fluid">
	<div class="ui container">
		<a class="item" href="${base}/">
			<i class="home icon"></i> 主页
		</a>
		<a class="item" href="${base}/category/instantNews">
			<i class="home icon"></i> 即时新闻
		</a>
        <#list categories as category>
			<a class="item" href="${base}/category/${category.id!''}">
                ${category.name!''}
			</a>
        </#list>

		<div class="right menu ">
			<div class="ui dropdown item">
				<i class="user icon"></i>
                <#if (session.user)??>
					<a href="${base}/user/personInfo"> 个人中心 </a>
                </#if>
				<i class="icon dropdown"></i>
				<div class="menu">
                    <#if (session.user)??>
						<a href="${base}/logout" class="item">退出</a>
                    <#else>
						<a href="${base}/register" class="item">注册</a>
						<a href="${base}/login" class="item">登录</a>
                    </#if>

				</div>
			</div>
		</div>
	</div>
</div>
<@block name="content">
</@block>
<div class="footer ui bottom fixed menu">

	<div class="ui text center aligned container footer ui bottom fixed"><b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宁夏大学信息工程学院XXX同学毕业设计
			&copy;2019-2020 </b></div>

</div>
</body>


<script>
    $('.ui.form').form({
        fields:{
            search :{
                identifier:'search',
                rules:[
                    {
                        type:'empty',prompt:'搜索内容不能为空'
                    }
                ]
            },
            year: {
                identifier: 'year',
                rules: [{
                    type: 'empty', prompt: '年份不能为空'
                }]
            }

        }
    }).api({
        method:'POST',
        url:'${base}/user/queryNew',
        serializeForm:true,
        success:function (res) {
            if(res.success){
                    window.location.href='${base}/user/queryNewResult'
            }else{
                $('.ui.form').form('add errors',[res.message]);
            }
        }

    });
</script>


</html>