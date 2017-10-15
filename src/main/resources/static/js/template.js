String.prototype.render = function(obj) {
    var s = this.toString(),
    html = "",
    fn = function(obj) {
        s = s.replace(/{if\s+(\w+)}([\s\S]+?){\/if}/g,
        function($1, $2, $3) {
            if (obj[$2]) {
                return $3.replace(/{else}.+/, "");
            } else {
                return $3.replace(/.+{else}|.+/, "");
            }
        });
        var ts = s;
        ts = ts.replace(/\{(\w+)\}/g,
        function($1, $2) {
            if (obj[$2]) {
                return obj[$2];
            } else {
                return "";
            }
        });
        return ts;
    };
    if ($.isArray(obj)) {
        for (var i = 0,
        l = obj.length; i < l; i++) {
            html += fn(obj[i]);
        }
    } else {
        html = fn(obj);
    }
    return html;
}