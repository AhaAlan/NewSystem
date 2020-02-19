<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css"/>
    <title>添加板块</title>
</head>
<body>
<div class="ui middle aligned center aligned grid " >
    <div class="centered four wides column">
        <form  class="ui  fluid form " id="category-modify">
            <input type="hidden" name="id" value="${category.id}"><!--此语句起到一个传递ID的作用-->
            <div class="field">
            <#--<label>板块名称</label>-->
                <input type="text" name="name" placeholder="请输入板块名称" autocomplete="off">
            </div>
            <div class="ui error message"></div>
            <input type="submit" value="修改板块" class="ui fluid button blue" onclick="modifyCategory()"><br>
            <a  href="${base}/category/list"  class="ui fluid button blue" >返回列表</a>
        </form>
    </div>
</div>

</body>
<script>
    $('#category-modify')
            .form({
                        fields:{
                            name:{
                                rules:[{
                                    type:'empty',
                                    prompt:'板块名称不能为空'
                                }]
                            }
                        }
                    }
            );
    function modifyCategory() {
        $('#category-modify').form('validate form');
        if ($('#category-modify').form('is valid')) {
            $.ajax({
                url: '${base}/category/update',
                type: 'POST',
                data: $('#category-modify').serialize(),
                success: function (res) {
                    // if(!res.success)
                    alert(res.message);
                    window.location.href='${base}/category/list'

                }
            });
        }
    }
</script>

</html>