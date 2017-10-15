/*
 *本插件原作者Vanadium,原文请移步前往http://vanadiumjs.com/查看
 *本插件由Mr.Think中文整理,Mr.Think的博客:http://MrThink.net/
 *转载及使用请务必注明原作者.
*/
$(function(){
	//必填项加红*,Mr.Think添加,原插件无
    $("input[class*=':required']").after("<span> *</span>")
});
 //弹出信息样式设置
Vanadium.config = {
    valid_class: 'rightformcss',//验证正确时表单样式 
    invalid_class: 'failformcss',//验证失败时该表单样式
    message_value_class: 'msgvaluecss',//这个样式是弹出信息中调用值的样式
    advice_class: 'failmsg',//验证失败时文字信息的样式
    prefix: ':',
    separator: ';',
    reset_defer_timeout: 100
}
//验证类型及弹出信息设置
Vanadium.Type = function(className, validationFunction, error_message, message, init) {
  this.initialize(className, validationFunction, error_message, message, init);
};
Vanadium.Type.prototype = {
  initialize: function(className, validationFunction, error_message, message, init) {
    this.className = className;
    this.message = message;
    this.error_message = error_message;
    this.validationFunction = validationFunction;
    this.init = init;
  },
  test: function(value) {
    return this.validationFunction.call(this, value);
  },
  validMessage: function() {
    return this.message;
  },
  invalidMessage: function() {
    return this.error_message;
  },
  toString: function() {
    return "className:" + this.className + " message:" + this.message + " error_message:" + this.error_message
  },
  init: function(parameter) {
    if (this.init) {
      this.init(parameter);
    }
  }
};
Vanadium.setupValidatorTypes = function() {
Vanadium.addValidatorType('empty', function(v) {
    return  ((v == null) || (v.length == 0));
  });
//***************************************以下为验证方法,使用时可仅保留用到的判断
Vanadium.addValidatorTypes([
	//匹配大小写的等值
    ['equal', function(v, p) {
      return v == p;
    }, function (_v, p) {
      return '输入的值必须与<span class="' + Vanadium.config.message_value_class + '">' + p + '相符\(区分大小写\)</span>.'
    }],
    //不匹配大小写的等值
    ['equal_ignore_case', function(v, p) {
      return v.toLowerCase() == p.toLowerCase();
    }, function (_v, p) {
      return '输入的值必须与<span class="' + Vanadium.config.message_value_class + '">' + p + '相符\(不区分大小写\)</span>.'
    }],
    //是否为空
    ['required', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '此项不可为空!'],
   //
    ['checkedTime', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '请选择发病时间!'],
    //强制选中 
    ['accept', function(v, _p, e) {
      return e.element.checked;
    }, '必须接受!'],
 
	 //下拉框选择
	 ['checksel', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '请选择一个栏目.'],
    //下拉框选择单位
	 ['checkse2', function(v) {
		 return Vanadium.validators_types['empty'].test(v) || /^((?!请选择或输入单位).)*$/.test(v)
   }, '请选择或输入一个单位.'],
    //电话
    ['checkphonen', function(v) { 
    	return (Vanadium.validators_types['empty'].test(v) || /^\d{3,4}-\d{5,8}(,\d{3,4}-\d{5,8})|\d{5,8}(,\d{5,8})*$/.test(v));
    	}, '请输入正确的号码,例:021-12345678,多号码用英文逗号“,”隔开'],
    //电话
     ['checkphone', function(v) { 
        return (Vanadium.validators_types['empty'].test(v) || /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/.test(v));
        }, '请输入正确号码,7位或8位或加区号.'],
    //
    ['integer', function(v) {
      if (Vanadium.validators_types['empty'].test(v)) return true;
      var f = parseFloat(v);
      return (!isNaN(f) && f.toString() == v && Math.round(f) == f);
    }, '请输入正确的整数.'],
    //数字
    ['number', function(v) {
      return Vanadium.validators_types['empty'].test(v) || (!isNaN(v) && !/^\s+$/.test(v));
    }, '请输入正确的数字.'],
  //正整数
    ['znumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*)$/.test(v);
    }, '请输入正确的正整数.'],
	//不能输入空格
    ['xnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,2})$/.test(v);
    }, '不能输入空格.'],
  //只能两位小数
    ['xnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,2})$/.test(v);
    }, '数字后只带两位小数.'],
    ['onumber', function(v) {
        return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,1})$/.test(v);
      }, '数字后只带一位小数.'],
    //到+999.99
    ['jnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^[+]?[0-9]\d{0,2}(\.\d{1,2})?%?$/.test(v);
    }, '数字不能超出999.99.'],
  //正整数加中文 
    ['gnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/(([0-9]\d*)|([\u4e00-\u9fa5]))+$/.test(v);
    }, '请输入正确的信息,中文或数字.'],
     //正数
    ['snumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|\d+\.\d+)$/.test(v);
    }, '请输入正确的数字.'],
    //数字加逗号
    ['dnumber', function (v) {
    	return (Vanadium.validators_types['empty'].test(v) || /^\d{1,16}(;\d{1,16})|\d{1,16}(-\d{1,16})*$/.test(v))
      }, '格式:如12;33-36(数字不超过16位)'],
    //英文字符/数字/下划线
    ['sname', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^([a-zA-z_\w]{1})([\w]*)$/.test(v);
    }, '输入正确帐号,由数字/字母/下划线组成.'],
    //数字加横杆
    ['hname', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /(([0-9-])|([\u4e00-\u9fa5]))+$/.test(v);
    }, '输入正确档案号,如：2011-1-12-1111.'],
     //图片格式验证 
    ['pic', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^.*?\.([j,J][p,P][g,G]|[j,J][p,P][e,E][g,G]|[b,B][m,M][p,P]|[g,G][i,I][f,F]|[p,P][n,N][g,G])$/.test(v);
    }, '输入选择正确的图片格式.'],
    //文档格式验证 
    ['doc', function(v) {
      return !(Vanadium.validators_types['empty'].test(v) || /^.*?\.([j,J][p,P][g,G]|[j,J][p,P][e,E][g,G]|[b,B][m,M][p,P]|[g,G][i,I][f,F]|[p,P][n,N][g,G])$/.test(v));
    }, '输入选择正确的文档格式（不能是图片）.'],
    
    //0-65535数字服务器端口
    ['ports', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^[0-9]$|^([1-9])([0-9]){1,3}$|^([1-5])([0-9]){4}$|^6([0-4])([0-9]){3}$|^65([0-4])([0-9]){2}$|^655([0-2])([0-9]){1}$|^6553([0-4])$/.test(v);
    }, '请输入正确的服务器端口(0-65534).'],
     //0-1之间数字
    ['stick', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^(0(.\d+)?|1(\.0+)?)$/.test(v);
    }, '请输入正确的数字(0至1).'],
	 //邮箱
    ['checkmail', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(v);
    }, '请输入正确的邮箱.'],
	// ip
    ['checkip', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/.test(v);
    }, '请输入正确的ip地址,例:192.168.1.1'],
    //
    ['digits', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/[^\d]/.test(v);
    }, '请输入一个非负整数,含0.'],
    //只能输入英文字母
    ['alpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z\u00C0-\u00FF\u0100-\u017E\u0391-\u03D6]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '请输入英文字母.'],
    //仅限ASCII编码模式下输入英文字母
    ['asciialpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '请在ASCII下输入英文字母.'],
	//英文字母或正数
    ['alphanum', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/\W/.test(v)
    }, '请输入英文字母或正数.'],
	//邮箱验证
    ['email', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(v))
    }, '请输入正确的邮箱,例:111@163.cn'],
    //手机电话
    ['iptet', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1[0-9]{10}$)/.test(v))
    }, '请输入正确的联系电话或手机号码'],
   //邮编验证
    ['checkpost', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /^[1-9][0-9]{5}$/.test(v))
    }, '请输入正确的邮编号码(6位)'],
    //手机验证
    ['checkiphone', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /^(1[0-9]{10})$/.test(v))
    }, '请输入正确的手机号(11位),以1开头'],
    //网址
    ['url', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i.test(v)
    }, '请输入正确的网址,例:http://开头'],
    //判断身份证
    ['namecard',function (v){
     return Vanadium.validators_types['empty'].test(v) || /^\d{15}$|^\d{17}(?:\d|x|X)$/.test(v)
    }, '请输入正确的身份证号,15位或18位.'
    ],
    //日期格式
    ['date_au', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)[\/|\-]([1-2]?[0-9]|0[1-9]|30|31)$/.test(v))
    }, '请输入正确的日期格式,例:2011-01-01.'],
  //日期格式
    ['date_aun', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)[\/|\-]([1-2]?[0-9]|0[1-9]|30|31)$/.test(v))
    }, '此项不可为空!'],
    //日期格式
    ['date_na', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)$/.test(v))
    }, '请输入正确的日期格式,例:2011-01.'],
  //日期格式
    ['date_nan', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)$/.test(v))
    }, '此项不可为空!'],
    //日期格式
    ['date_ye', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})$/.test(v))
    }, '请输入正确的日期格式,例:2011.'],
  //日期格式
    ['date_yen', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})$/.test(v))
    }, '此项不可为空!'],
     //日期格式
    ['date_sf', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/.test(v))
    }, '请输入正确的时间格式,例:00:00'],
    //日期格式
    ['date_sfn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/.test(v))
    }, '此项不可为空!'],
    //日期格式
    ['date_sfm', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/.test(v))
    }, '请输入正确的时间格式,例:00:00:00'],
    //日期格式
    ['date_sfmn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/.test(v))
    }, '此项不可为空!'],
    //年月日时分秒
    ['date_nsfm', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/.test(v))
    }, '请输入正确的时间格式,例:2011-01-01 00:00:00'],
    //年月日时分秒
    ['date_nsfmn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/.test(v))
    }, '此项不可为空!'],
    //输入固定长度字符串
    ['length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length == parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度等于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
    //
    ['min_length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length >= parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度不低于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
    ['max_length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length <= parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度不大于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
    
  
	//判断密码是相同
    ['same_as',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          var exemplar = document.getElementById(p);
          if (exemplar)
            return v == exemplar.value;
          else
            return false;
        }
        ;
      },
      function (_v, p) {
        var exemplar = document.getElementById(p);
        if (exemplar)
          return '两次密码输入不相同.';
        else
          return '没有可参考值!'
      },
      "",
      function(validation_instance) {
        var exemplar = document.getElementById(validation_instance.param);
        if (exemplar){
          jQuery(exemplar).bind('validate', function(){
            jQuery(validation_instance.element).trigger('validate');
          });
        }
      }
    ],
    
	//ajax判断是否存在值
    ['ajax',
      function (v, p, validation_instance, decoration_context, decoration_callback) {
        if (Vanadium.validators_types['empty'].test(v)) return true;
        if (decoration_context && decoration_callback) {
          jQuery.getJSON(p, {value: v, id: validation_instance.element.id}, function(data) {
            decoration_callback.apply(decoration_context, [[data], true]);
          });
        }
        return true;
      }
    ],
	//正则匹配,此用法不甚理解
    ['format',
      function(v, p) {
        var params = p.match(/^\/(((\\\/)|[^\/])*)\/(((\\\/)|[^\/])*)$/);        
        if (params.length == 7) {
          var pattern = params[1];
          var attributes = params[4];
          try
          {
            var exp = new RegExp(pattern, attributes);
            return exp.test(v);
          }
          catch(err)
          {
            return false
          }
        } else {
          return false
        }
      },
      function (_v, p) {
        var params = p.split('/');
        if (params.length == 3 && params[0] == "") {
          return '输入的值必须与 <span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span> 相匹配.';
        } else {
          return '提供的值与<span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span>不匹配.';
        }
      }
    ]
  ])
  if (typeof(VanadiumCustomValidationTypes) !== "undefined" && VanadiumCustomValidationTypes) Vanadium.addValidatorTypes(VanadiumCustomValidationTypes);
};