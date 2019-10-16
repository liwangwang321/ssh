/**
 * 通过异步请求渲染下拉框
 * @param url   请求地址
 * @param param  请求参数
 * @param elem   要渲染的目标下拉框
 */
function insertSelect(url, param, elem, value, text) {
    $.ajaxSettings.async = false
    $.getJSON(path + url, param, function (data) {
        console.log(data);
        // 返回处理的方法
        $.each(data, function (index, item) {
            var val = value ? item[value] : item.dict_value;
            var tex = text ? item[text] : item.dict_item;
            $(elem).append("<option value=" + val + ">" + tex + "</option>");
        });
    })
}