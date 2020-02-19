
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

</head>
<body>
<#--为了让form居中，需要给它加上一个div，然后在div中设置居中-->

<div class="ui middle aligned center aligned grid " >
    <div class="centered four wides column">
        <form  class="ui  fluid form " id="category-form">
            <div class="field">
                <#--<label>板块名称</label>-->
                <input type="text" name="name" placeholder="请输入板块名称" autocomplete="off">
            </div>
            <div class="ui error message"></div>
            <input type="button" value="添加板块" class="ui fluid button blue" onclick="addCategory()"><br>
            <a  href="${base}/category/list"  class="ui fluid button blue" >返回列表</a>
        </form>
    </div>
</div>
<#--快捷键div.twelve.wides.column+tab-->

</body>
<script>
    $('#category-form')
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
    function addCategory() {
        $('#category-form').form('validate form');
        if ($('#category-form').form('is valid')) {
            $.ajax({
                url: '${base}/category/save',
                type: 'POST',
                data: $('#category-form').serialize(),
                success: function (res) {
                    // if(!res.success)
                    alert(res.message);

                }
            });
        }
    }
</script>

</html>