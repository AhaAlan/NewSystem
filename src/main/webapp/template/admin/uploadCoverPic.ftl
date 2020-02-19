
<@override name="title">添加新闻封面</@override>
<@override name="content">


	<div class="ui hidden divider"></div>

	<div class="ui raised very padded text container segment center aligned">
		<h2 class="ui header">上传新闻封面</h2>
		<form class="ui form" id="form">
			<div class="ui placeholder segment">
				<div class="ui icon header">
					<i class="pdf file outline icon"></i>
					<input type="file" name="file" lass="a-upload" id="img-upload">
				</div>
			</div>
			<input style="text-align:center;padding:10px 20px;width:300px;" onclick="upload()" type="button" class="ui button primary" value="上传" >
		</form>
	</div>




	<script type="text/javascript">

        function upload() {
            //封装表单数据
            var formData = new FormData($("#form")[0]);
            //发送ajax请求
            $.ajax({
                url: "${base}/admin/DouploadCoverPic",
                type: "post",
                data: formData,
                //将文件类型设置为二进制类型
                contentType: false,
                processData: false,
                success: function (res) {
                    alert(res.message);
                    window.location.href='${base}/admin/manageNew'
                }
            });
        }
	</script>


</@override>
<@extends name="admin_layout.ftl"></@extends>