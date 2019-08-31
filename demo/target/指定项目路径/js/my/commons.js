//获取项目根目录
var localObj = window.location;
var protocol = location.protocol;
var host = localObj.host;
var contextPath = localObj.pathname.split("/")[1];
var basePath = protocol + "//" + host + "/" + contextPath;

//<%--自定义序列表单的方法--%>
$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

var ids = [0];
//左边角色的功能菜单
layui.use(['layer', 'element', 'form'], function () {

    var layer = layui.layer;
    var form = layui.form;
    var element = layui.element;
    var str = '';

    //1. 添加三级菜单点击
    $(".menu_three").on("click", function () {
        $(this).next().toggle();
    });
    $("ol").on("click", "li a", function () {
        $.each($(this).parent().siblings(), function (i, e) {
            $(e).find("a").removeClass('three_this')
        });
        $(this).addClass('three_this');                            // 添加当前元素的样式
    });
    element.init();

    //2. 动态选项卡  给 lay-filter=actTab 添加选项卡, 由指定 .site-actTab-active样式  a标签触发
    //触发事件

    var active = {
        //在这里给active绑定几项事件，后面可通过active调用这些事件
        tabAdd: function (url, id, name) {
            //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
            //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
            element.tabAdd('actTab', {
                title: name,
                content: '<iframe data-frameid="' + id + '" scrolling="no" frameborder="0" src="' + url +
                    '" style="width:100%;height: 100%;"></iframe>',
                id: id //规定好的id
            });
            ids.push(id);

            element.render('tab');
        },
        tabChange: function (id) {
            //切换到指定Tab项
            element.tabChange('actTab', id); //根据传入的id传入到指定的tab项
        },
        tabDelete: function (id) {
            element.tabDelete("actTab", id);//删除
        }
        , tabDeleteAll: function (ids) {//删除所有
            $.each(ids, function (i, item) {
                element.tabDelete("actTab", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
            });
        }
    };

    //当点击有site-actTab-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
    $('.site-actTab-active').on('click', function () {
        var dataid = $(this);

        //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
        if ($(".layui-tab-title li[lay-id]").length <= 0) {
            //如果比零小，则直接打开新的tab项
            active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));

        } else {
            //否则判断该tab项是否以及存在
            var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
            $.each($(".layui-tab-title li[lay-id]"), function () {
                //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                    isData = true;
                }
            });
            if (!isData) {
                //标志为false 新增一个tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            }
        }
        //最后不管是否新增tab，最后都转到要打开的选项页面上
        active.tabChange(dataid.attr("data-id"));
    });
    //添加一个关闭所有标签页的动作
    $('#close_tab').on('click', function () {
        active.tabDeleteAll(ids);
        console.log(ids);
        ids = [];
        $('.layui-show').remove();
        element.render('tab');
    });
    element.init();
});




