//加载板块信息
$(function () {


    $.getJSON("section/1/10.do", function (sections) {
        var card = '';
        $.each(sections, function (index, section) {
            if (index % 2 === 0) {
                card += '<div class="layui-card layui-inline layui-col-md5  layui-bg-gray">\n';
            } else {
                card += '<div class="layui-card layui-inline layui-col-md5 col-lg-offset-1 layui-bg-gray">\n';
            }
            card += '            <div class="layui-card-header"><a href="section/' +
                '' + section.sid + '.do">' + section.sectionName + '</a></div>\n' +
                '            <div class="layui-card-body">' +
                '<ul>\n';

            var topics = section.topics;
            for (let i = 0; i < topics.length && i < 5; i++) {
                card += ' <li> <a href="topic/' + topics[i].tid + '.do">' + topics[i].topicName + '</a></li>'
            }
            card += '</ul>            </div>\n' +
                '        </div>'
        });
        $('#div_sections').html(card);
    })
});

