$(function () {
    //短信验证码倒计时
    var countdownHandler = function () {
        var $button = $(".sendVerifyCode");
        var number = 60;
        var countdown = function () {
            if (number == 0) {
                $button.attr("disabled", false);
                $button.html("发送验证码");
                number = 60;
                return;
            } else {
                $button.attr("disabled", true);
                $button.html(number + "秒 重新发送");
                number--;
            }
            setTimeout(countdown, 1000);
        };
        setTimeout(countdown, 1000);
    };
    //发送短信验证码
    $(".sendVerifyCode").on("click", function () {
        var $mobile = $("input[name=mobile]");
        var data = {};
        data.mobile = $.trim($mobile.val());
        if (data.mobile == '') {
            alert('请输入手机号码');
            return;
        }
        var reg = /^1\d{10}$/;
        if (!reg.test(data.mobile)) {
            alert('请输入合法的手机号码');
            return;
        }
        $.ajax({
            url: "user/sendSms.do",
            async: true,
            type: "post",
            dataType: "text",
            data: data,
            success: function (data) {
                if (data == 'success') {
                    countdownHandler();
                    return;
                }
                alert(data);
            }
        });
    });

    $('#btn_login').click(function () {
        $.ajax({
            url: 'user/register.do',
            async: true,
            type: "post",
            dataType: "text",
            data: $('#register_from').serialize(),
            success: function (data) {
                if (data === 'success') {
                    window.parent.location.reload();
                } else {
                    layer.msg(("信息有误"));
                }
            }
        });
    });
});
