<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css"/>
    <title>注册</title>
    <style>
        .body{
            background: #dfd7ff;
        }
        .margintop{
            margin-top: 100px;
        }
    </style>
</head>

<body class="body">
    <div class="margintop">
        <div class="ui grid container  "><!--container 是一个容器，里面的内容会自动的居中-->
          <div class="eight wides  centered column" >

              <div class="ui middle aligned center aligned grid">
                  <div class="column" >
                      <div class="ui  segment">
                          <div class="ui   very relaxed stackable grid">
                              <div class="column left aligned  ">
                                  <form class="ui form" id="login-form">
                                      <div class="field">
                                          <label>用户名</label>
                                          <div class="ui left icon input">
                                              <input type="text" placeholder="username" name="username">
                                              <i class="user icon"></i>
                                          </div>
                                      </div>
                                      <div class="field">
                                          <label>密码</label>
                                          <div class="ui left icon input">
                                              <input type="password" placeholder="password" name="password">
                                              <i class="lock icon"></i>
                                          </div>
                                      </div>
                                      <div class="field">
                                          <label>再次输入密码</label>
                                          <div class="ui left icon input">
                                              <input type="password" placeholder="password" name="password2">
                                              <i class="lock icon"></i>
                                          </div>
                                      </div>
                                      <div class="field">
                                          <label>昵称</label>
                                          <div class="ui left icon input">
                                              <input type="text" placeholder="nickName" name="nickName">
                                              <i class="lock icon"></i>
                                          </div>
                                      </div>
                                      <div class="field">
                                          <label>邮件</label>
                                          <div class="ui left icon input">
                                              <input type="text" placeholder="email" name="email">
                                              <i class="user icon"></i>
                                          </div>
                                      </div>
                                      <div class="field">
                                          <label>电话</label>
                                          <div class="ui left icon input">
                                              <input type="text" placeholder="tel" name="tel">
                                              <i class="user icon"></i>
                                          </div>
                                      </div>
                                      <div class="ui error message"></div>
                                      <div class="ui blue submit button fluid  ">注册</div>
                                  </form>
                              </div>

                          </div>

                      </div>
                  </div>
              </div>
          </div>
        </div>
    </div>
</body>

<script>
    $('.ui.form').form({
        fields:{
            username:{
            rules:[{
                type:'minLength[3]',
                prompt:'用户名至少包含3个字符'
            }]
            },
            password:{
                rules:[{
                    type:'minLength[6]',
                    prompt:'密码至少包含6个字符'
                }]
            },
            password2:{
                rules:[{
                    type:'match[password]',
                    prompt:'密码不一致'
                }]
            },
            nickName:{
                rules:[{
                    type:'empty',
                    prompt:'昵称不能为空'
                }]
            },
            email:{
                rules:[{
                    type:'empty',
                    prompt:'电子邮件不能为空'
                }]
            },
            tel:{
                rules:[{
                    type:'empty',
                    prompt:'电话信息不为空'
                }]
            }
        }
    }).api({
        method:'POST',
        url:'${base}/doRegister',
        serializeForm:true,
        success:function (res) {
            if(res.success){
                alert(res.message);
                window.location.href='${base}/login'
            }else{
                $('.ui.form').form('add errors',[res.message]);
            }
        }
    })


</script>

</html>