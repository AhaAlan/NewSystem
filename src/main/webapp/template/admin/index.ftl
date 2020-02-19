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
	<title>wangEditor demo</title>


</head>
<body>

<form class="ui form" id="uploadForm " nctype="multipart/form-data" >
	<div class="field">
		<label>标题</label>
		<input type="text" placeholder="title" name="title">
	</div>

<#--	<div class="field">-->
<#--		<label>封面</label>-->
<#--		<input type="file" placeholder="avatar" name="avatar" multiple>-->
<#--	</div>-->

	<div class="field">
		<label>内容</label>
		<textarea id="text1" style="width:100%; height:200px;" name="content"></textarea>
	</div>

	<div class="ui error message"></div>
	<div class="ui blue submit button" onclick="upload()">提交</div>
<#--	<div class="ui blue submit button" >提交</div>-->
</form>

<div id="div1">
	<p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
</div>

<script type="text/javascript" src="${base}/scripts/wangEditor.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1')

    // 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = false
    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = false
    // 自定义处理粘贴的文本内容

    //配置onfocus函数之后，用户点击富文本区域会触发onfocus函数执行。
    editor.customConfig.onfocus = function () {
        console.log("onfocus")
    }

    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    // editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.uploadImgServer = '${base}/admin/upload'  // 上传图片到服务器
    // 隐藏“网络图片”tab


    //menu
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'list',  // 列表
        'justify',  // 对齐方式
        'emoticon',  // 表情
        'image',  // 插入图片
        'undo',  // 撤销
        'redo'  // 重复
    ]

    editor.customConfig.onchange = function (html) {
        // html 即变化之后的内容
        console.log(html)
    }
    //debug
    editor.customConfig.debug = location.href.indexOf('wangeditor_debug_mode=1') > 0
    //


    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }


    editor.customConfig.uploadImgHooks = {
        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            editor.txt.append('<p>追加的内容1</p>')
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：

            var url = result.url
            insertImg(url)
            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }

    editor.create()
    // 初始化 textarea 的值
    $text1.val(editor.txt.html())


</script>

<script>
    $('.ui.form').form({
        fields: {
            title: {
                identifier: 'title',
                rules: [
                    {
                        type: 'empty', prompt: 'title不能为空'
                    }
                ]
            },
            content: {
                identifier: 'content',
                rules: [
                    {
                        type: 'empty', prompt: 'content不能为空'
                    }
                ]
            }
            ,
            avatar: {
                identifier: 'avatar',
                rules: [
                    {
                        type: 'empty', prompt: 'avatar不能为空'
                    }
                ]
            }
        }
    }).api({
        method: 'POST',
        url: '${base}/admin/saveNew',
        serializeForm: true,
        success: function (res) {
            if (res.success) {
                // alert(res.message);
                window.location.href = '${base}/admin/display'
            } else {
                $('.ui.form').form('add errors', [res.message]);
            }
        }

    });
</script>
</body>
</html>