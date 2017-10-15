String.prototype.render = function(dta) {
	var format = {
		name : function(x) {
			return x
		}
	};
	return this.replace(/{(\w+)}/g, function(m1, m2) {
		if (!m2)
			return "";
		return (format && format[m2]) ? format[m2](dta[m2]) : dta[m2];
	});
}