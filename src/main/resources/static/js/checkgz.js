/*
 *�����ԭ����Vanadium,ԭ�����Ʋ�ǰ��http://vanadiumjs.com/�鿴
 *�������Mr.Think��������,Mr.Think�Ĳ���:http://MrThink.net/
 *ת�ؼ�ʹ�������ע��ԭ����.
*/
$(function(){
	//������Ӻ�*,Mr.Think���,ԭ�����
   
});
 //������Ϣ��ʽ����
Vanadium.config = {
    valid_class: 'rightformcss',//��֤��ȷʱ����ʽ 
    invalid_class: 'failformcss',//��֤ʧ��ʱ�ñ���ʽ
    message_value_class: 'msgvaluecss',//�����ʽ�ǵ�����Ϣ�е���ֵ����ʽ
    advice_class: 'failmsg',//��֤ʧ��ʱ������Ϣ����ʽ
    prefix: ':',
    separator: ';',
    reset_defer_timeout: 100
}
//��֤���ͼ�������Ϣ����
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
//***************************************����Ϊ��֤����,ʹ��ʱ�ɽ������õ����ж�
Vanadium.addValidatorTypes([
	//ƥ���Сд�ĵ�ֵ
    ['equal', function(v, p) {
      return v == p;
    }, function (_v, p) {
      return '�����ֵ������<span class="' + Vanadium.config.message_value_class + '">' + p + '���\(���ִ�Сд\)</span>.'
    }],
    //��ƥ���Сд�ĵ�ֵ
    ['equal_ignore_case', function(v, p) {
      return v.toLowerCase() == p.toLowerCase();
    }, function (_v, p) {
      return '�����ֵ������<span class="' + Vanadium.config.message_value_class + '">' + p + '���\(�����ִ�Сд\)</span>.'
    }],
    //�Ƿ�Ϊ��
    ['required', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '�����Ϊ��!'],
      //�Ƿ�Ϊ��
    ['requiredz', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '����򲻿�Ϊ��!'],
    //ǿ��ѡ�� 
    ['accept', function(v, _p, e) {
      return e.element.checked;
    }, '�������!'],
 
	 //������ѡ��
	 ['checksel', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '��ѡ��һ����Ŀ.'],
    //�绰
    ['checkphone', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /\d{3}-\d{8}|\d{4}-\d{7}/.test(v);
    }, '��������ȷ�ĺ���,��:021-12345678'],
    //
    ['integer', function(v) {
      if (Vanadium.validators_types['empty'].test(v)) return true;
      var f = parseFloat(v);
      return (!isNaN(f) && f.toString() == v && Math.round(f) == f);
    }, '��������ȷ������.'],
    //����
    ['number', function(v) {
      return Vanadium.validators_types['empty'].test(v) || (!isNaN(v) && !/^\s+$/.test(v));
    }, '��������ȷ������.'],
  //������
    ['znumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^(\+|-)?\d+($|\.\d+$)/.test(v);
    }, '��������ȷ��������.'],
    //0-65535���ַ������˿�
    ['ports', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^[0-9]$|^([1-9])([0-9]){0,3}$|^65535$/.test(v);
    }, '��������ȷ�ķ������˿�(0-65535).'],
	 //����
    ['checkmail', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(v);
    }, '��������ȷ������.'],
	// ip
    ['checkip', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/.test(v);
    }, '��������ȷ��ip��ַ,��:192.168.1.1'],
    //
    ['digits', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/[^\d]/.test(v);
    }, '������һ���Ǹ�����,��0.'],
    //ֻ������Ӣ����ĸ
    ['alpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z\u00C0-\u00FF\u0100-\u017E\u0391-\u03D6]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '������Ӣ����ĸ.'],
    //����ASCII����ģʽ������Ӣ����ĸ
    ['asciialpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '����ASCII������Ӣ����ĸ.'],
	//Ӣ����ĸ������
    ['alphanum', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/\W/.test(v)
    }, '������Ӣ����ĸ������.'],
	//������֤
    ['email', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(v))
    }, '��������ȷ������,��:111@163.cn'],
   //�ʱ���֤
    ['checkpost', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /^[1-9][0-9]{5}$/.test(v))
    }, '��������ȷ���ʱ����(6λ)'],
    //�ֻ���֤
    ['checkiphone', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /^(1[0-9]{10})$/.test(v))
    }, '��������ȷ���ֻ���(11λ),��1��ͷ'],
    //��ַ
    ['url', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i.test(v)
    }, '��������ȷ����ַ,��:http://��ͷ'],
    //�ж����֤
    ['namecard',function (v){
     return Vanadium.validators_types['empty'].test(v) || /^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?$/.test(v)
    }, '��������ȷ�����֤��,15λ��18λ.'
    ],
    //���ڸ�ʽ
    ['date_au', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)[\/|\-]([1-2]?[0-9]|0[1-9]|30|31)$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011-01-01.'],
    //���ڸ�ʽ
    ['date_na', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011-01.'],
    //���ڸ�ʽ
    ['date_ye', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011.'],
    //����̶������ַ���
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
        return '�����ַ����ȵ���<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>��.'
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
        return '�����ַ����Ȳ�����<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>��.'
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
        return '�����ַ����Ȳ�����<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>��.'
      }
    ],
 
	//�ж���������ͬ
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
          return '�����������벻��ͬ.';
        else
          return 'û�пɲο�ֵ!'
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
	//ajax�ж��Ƿ����ֵ
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
	//����ƥ��,���÷��������
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
          return '�����ֵ������ <span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span> ��ƥ��.';
        } else {
          return '�ṩ��ֵ��<span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span>��ƥ��.';
        }
      }
    ]
  ])
  if (typeof(VanadiumCustomValidationTypes) !== "undefined" && VanadiumCustomValidationTypes) Vanadium.addValidatorTypes(VanadiumCustomValidationTypes);
};