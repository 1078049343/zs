<%--

  @author yulezhisi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user_deatils</title>

    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon"/>
    <script src="<c:url value="/js/jquery-1.9.1.min.js"/>"></script>
    <script src="<c:url value="/layui/layui.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/layui/css/layui.css"/>">

    <script src="<c:url value="/js/my/commons.js"/>"></script>
    <style>
        .container {
            width: 1200px;
            margin: 20px auto;
        }

        html {
            overflow: hidden;
        }
    </style>

    <script>
        layui.use(['form', 'upload'], function () {
            var form = layui.form;
            var upload = layui.upload;
            upload.render({
                field: "avatar"  //字段名,头像
                , elem: '#upload_avatar'     /*根据绑定id，打开本地图片*/
                , data: $("#signupForm").serializeObject()
                , url: '${pageContext.request.contextPath}/complexMail.do'  /*上传后台接受接口*/
                , auto: true        /*true为选中图片直接提交，false为不提交根据bindAction属性上的id提交*/
                //, bindAction: '#formSubmit'   /*提交图片*/
                //预览
                , choose: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#avatar').attr('src', result);
                    })
                }
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    //单独处理无法序列化的富文本内容,content为后台参数名
                    this.data.content = layedit.getContent(index);
                    layer.load(); //上传loading
                }
                , done: function (res, index, upload) {
                    layer.closeAll('loading'); //关闭loading
                }
                , error: function (index, upload) {
                    layer.closeAll('loading'); //关闭loading
                }
            });
        })
    </script>

</head>
<body>

<div class="container">
    <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title" id="LAY_mine">

            <%--按顺序自动绑定选项卡--%>
            <li class="layui-this" lay-id="info">我的资料</li>
            <li lay-id="avatar">头像</li>
            <li lay-id="pass">密码</li>
            <li lay-id="bind">帐号绑定</li>
        </ul>
        <div class="layui-tab-content" style="padding: 20px 0;">

            <%--选项卡1--%>
            <div class="layui-form layui-form-pane layui-tab-item layui-show">
                <form method="post">
                    <div class="layui-form-item"><label for="L_email" class="layui-form-label">手机</label>
                        <div class="layui-input-inline"><input type="text" id="L_phone" name="phone" required=""
                                                               lay-verify="phone" autocomplete="off" value=""
                                                               placeholder="请输入手机号" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">您需要完成手机验证才可进行社区发帖/回帖等操作</div>
                    </div>
                    <div class="layui-form-item"><label for="L_vercode" class="layui-form-label">图形码</label>
                        <div class="layui-input-inline"><input type="text" id="L_imagecode" name="imagecode" required=""
                                                               lay-verify="required" autocomplete="off"
                                                               class="layui-input"></div>
                        <div class="layui-form-mid" style="padding: 0!important;"><img
                                src="/auth/imagecode?t=1565851991206" class="fly-imagecode"></div>
                    </div>
                    <div class="layui-form-item"><label for="L_vercode" class="layui-form-label">验证码</label>
                        <div class="layui-input-inline"><input type="text" id="L_vercode" name="vercode" required=""
                                                               lay-verify="required" placeholder="请输入手机验证码"
                                                               autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid" style="padding: 0!important;">
                            <button type="button" class="layui-btn layui-btn-normal" id="FLY-getvercode">获取验证码</button>
                        </div>
                    </div>
                    <div class="layui-form-item"><label for="L_email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline"><input type="text" id="L_email" name="email" required=""
                                                               lay-verify="email" autocomplete="off" value=""
                                                               class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux"> 您必须填写邮箱，否则无法进行相关操作</div>
                    </div>
                    <div class="layui-form-item"><label for="L_username" class="layui-form-label">昵称</label>
                        <div class="layui-input-inline"><input type="text" id="L_username" name="username" required=""
                                                               lay-verify="required" autocomplete="off" value="娱乐致死"
                                                               class="layui-input"></div>
                        <div class="layui-inline">
                            <div class="layui-input-inline"><input type="radio" name="sex" value="0" title="男">
                                <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                    <div>男</div>
                                </div>
                                <input type="radio" name="sex" value="1" title="女">
                                <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                    <div>女</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item"><label for="L_city" class="layui-form-label">城市</label>
                        <div class="layui-input-inline"><input type="text" id="L_city" name="city" autocomplete="off"
                                                               value="黄冈" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item layui-form-text"><label for="L_sign" class="layui-form-label">签名</label>
                        <div class="layui-input-block"><textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign"
                                                                 autocomplete="off" class="layui-textarea"
                                                                 style="height: 80px;"></textarea></div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit="">确认修改</button>
                    </div>
                </form>
            </div>

            <%--选项卡2--%>
            <div class="layui-form layui-form-pane layui-tab-item">
                <div class="layui-form-item">
                    <div class="avatar-add"><p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                        <button type="button" class="layui-btn upload-img" id="upload_avatar"><i
                                class="layui-icon"></i>
                            上传头像
                        </button>
                        <input class="layui-upload-file" type="file" accept="" name="file">
                        <img id="avatar"
                             src="//thirdqq.qlogo.cn/g?b=oidb&amp;k=C9A4qnrOKuibOxoztLJ55ug&amp;s=100&amp;t=1557242562">
                        <span class="loading"></span></div>
                </div>
            </div>

            <%--选项卡3--%>
            <div class="layui-form layui-form-pane layui-tab-item">
                <div class="layui-form-item"><label for="L_pass" class="layui-form-label">新密码</label>
                    <div class="layui-input-inline"><input type="password" id="L_pass" name="pass" required=""
                                                           lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                </div>
                <div class="layui-form-item"><label for="L_repass" class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline"><input type="password" id="L_repass" name="repass" required=""
                                                           lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit="">确认修改</button>
                </div>
            </div>

            <%--选项卡4--%>
            <div class="layui-form layui-form-pane layui-tab-item">
                <ul class="app-bind">
                    <li class="fly-msg  app-havebind"><i class="iconfont icon-qq"></i> <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span>
                        <a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a></li>
                    <li class="fly-msg "><i class="iconfont icon-weibo"></i> <a href="/app/weibo/" class="acc-weibo"
                                                                                type="weibo_id"
                                                                                onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})">立即绑定</a>
                        <span>，即可使用微博帐号登录Fly社区</span></li>
                </ul>
            </div>
        </div>
    </div>

</div>

</body>
</html>
