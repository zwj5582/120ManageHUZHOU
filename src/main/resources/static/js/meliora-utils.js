/*
 * Created by ZhongWenjie on 2017/10/7.
 */



/*
* 自定义 select 标签
*
* 例：
*      <select
*           name="emp.degree"
*           v="${emp.degree}"                               // 值
*           map="学士:学士,硕士:硕士,博士:博士,无位:无"          // map字符串
*           headKey=""                                      // 默认 key
*           headValue="--请选择--"                           // 默认 value
*       ></select>
*
* */
$(function () {
    var elements=$("select[map]");
    $.each(elements,function(i,node) {
        node = $(node);
        var val = node.attr("v");
        var map_str = node.attr("map");
        var head_key = node.attr("headKey");
        var head_value = node.attr("headValue");
        var key_val_str_arr = map_str.split(",");
        node.append("<option value='"+head_key+"'>"+head_value+"</option>");
        for (var k=0;k<key_val_str_arr.length;k++){
            var key_val_str=key_val_str_arr[k];
            var key_val = key_val_str.split(":");
            if (val!=null && val!= '' && key_val[0]==val ){
                node.append("<option value='"+key_val[0]+"' selected >"+key_val[1]+"</option>");
            }else {
                node.append("<option value='"+key_val[0]+"'>"+key_val[1]+"</option>");
            }
        }
    });
});



/*
 * 自定义 select 标签
 *
 * 例：
 *      <select
 *           name="emp.degree"
 *           v="${emp.departmentByDepartmentId.id}"         // 值
 *           jsonList="${sectionlist}"                      // json字符串 必须为后端传入的json串
 *           listKey="id"                                   // json属性  作为key
 *           listVal="name"                                 // json属性  作为value
 *           headKey=""                                     // 默认 key
 *           headValue="--请选择--"                          // 默认 value
 *       ></select>
 *
 * */
$(function () {
    var elements=$("select[jsonList]");
    $.each(elements,function(i,node) {
        node=$(node);
        var val = node.attr("v");
        var json = node.attr("jsonList");
        var obj_arr=eval(json);
        var listKey = node.attr("listKey");
        var listVal = node.attr("listVal");
        var head_key = node.attr("headKey");
        var head_value = node.attr("headValue");
        node.append("<option value='"+head_key+"'>"+head_value+"</option>");
        for(var n=0;n<obj_arr.length;n++){
            var obj = obj_arr[n];
            var _k = obj[listKey];
            var _v = obj[listVal];
            if (val!=null && val!= '' && _k == val ){
                node.append("<option value='"+ _k +"' selected >"+ _v +"</option>");
            }else{
                node.append("<option value='"+ _k +"'>"+ _v +"</option>");
            }
        }
    });
});