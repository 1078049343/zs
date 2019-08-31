//noinspection JSJQueryEfficiency  更改自动登录选项cooki状态
layui.use(['form'], function () {
    var form = layui.form;
    //实现自动登录
    if ($.cookie("rmbUser") === "true") {
        $("#rememberMe").attr("checked", true);
        $(":input[name=account]").val($.cookie("username"));
        $(":input[name=pwd]").val($.cookie("password"));
    }
    if ($.cookie("auto") === "true") {
        $("#autoLogin").attr("checked", true);
        layer.msg('3秒后自动登录');
        setTimeout(function () {
            if ($.cookie("auto") === "true")
                loginAuth();
        }, 3000);
    }
    //更改了开关状态就必须重新渲染
    form.render();
});

//记住用户名密码
function save() {
    var str_username = $(":input[name=account]").val();//用户名
    var str_password = $(":input[name=pwd]").val();//密码
    console.log(str_password);
    if ($("#rememberMe").prop("checked")) {
        $.cookie("rmbUser", "true", {expires: 7}); //存储一个带7天期限的cookie
        $.cookie("username", str_username, {expires: 7});
        $.cookie("password", str_password, {expires: 7});
    } else {
        $.cookie("rmbUser", "false", {expire: -1});
        $.cookie("username", "", {expires: -1});
        $.cookie("password", "", {expires: -1});
    }
    if ($("#autoLogin").prop("checked")) {
        $.cookie("auto", "true", {expires: 7}); //存储一个带7天期限的cookie
        $.cookie("username", str_username, {expires: 7});
        $.cookie("password", str_password, {expires: 7});
    } else {
        $.cookie("auto", "false", {expire: -1});
        $.cookie("username", "", {expires: -1});
        $.cookie("password", "", {expires: -1});
    }
}

function loginAuth() {
    var account = $(':input[name=account]').val();
    var pwd = $(':input[name=pwd]').val();
    $.post(basePath + '/user/login.do', {
        account: account
        , password: pwd
    }, function (data) {
        save();
        if (data === 'success') {
            window.parent.location.reload();
        } else {
            layer.msg(("账号或者密码错误"));
        }
    });



}



