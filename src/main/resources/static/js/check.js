/*
 *�����ԭ����Vanadium,ԭ�����Ʋ�ǰ��http://vanadiumjs.com/�鿴
 *�������Mr.Think��������,Mr.Think�Ĳ���:http://MrThink.net/
 *ת�ؼ�ʹ�������ע��ԭ����.
*/
$(function(){
	//������Ӻ�*,Mr.Think���,ԭ�����
    $("input[class*=':required']").after("<span> *</span>")
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
   //
    ['checkedTime', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '��ѡ�񷢲�ʱ��!'],
    //ǿ��ѡ�� 
    ['accept', function(v, _p, e) {
      return e.element.checked;
    }, '�������!'],
 
	 //������ѡ��
	 ['checksel', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, '��ѡ��һ����Ŀ.'],
    //������ѡ��λ
	 ['checkse2', function(v) {
		 return Vanadium.validators_types['empty'].test(v) || /^((?!��ѡ������뵥λ).)*$/.test(v)
   }, '��ѡ�������һ����λ.'],
    //�绰
    ['checkphonen', function(v) { 
    	return (Vanadium.validators_types['empty'].test(v) || /^\d{3,4}-\d{5,8}(,\d{3,4}-\d{5,8})|\d{5,8}(,\d{5,8})*$/.test(v));
    	}, '��������ȷ�ĺ���,��:021-12345678,�������Ӣ�Ķ��š�,������'],
    //�绰
     ['checkphone', function(v) { 
        return (Vanadium.validators_types['empty'].test(v) || /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/.test(v));
        }, '��������ȷ����,7λ��8λ�������.'],
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
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*)$/.test(v);
    }, '��������ȷ��������.'],
	//��������ո�
    ['xnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,2})$/.test(v);
    }, '��������ո�.'],
  //ֻ����λС��
    ['xnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,2})$/.test(v);
    }, '���ֺ�ֻ����λС��.'],
    ['onumber', function(v) {
        return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|[0-9]+\.[0-9]{0,1})$/.test(v);
      }, '���ֺ�ֻ��һλС��.'],
    //��+999.99
    ['jnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^[+]?[0-9]\d{0,2}(\.\d{1,2})?%?$/.test(v);
    }, '���ֲ��ܳ���999.99.'],
  //������������ 
    ['gnumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/(([0-9]\d*)|([\u4e00-\u9fa5]))+$/.test(v);
    }, '��������ȷ����Ϣ,���Ļ�����.'],
     //����
    ['snumber', function(v) {
      return Vanadium.validators_types['empty'].test(v) ||/^([0-9]\d*|\d+\.\d+)$/.test(v);
    }, '��������ȷ������.'],
    //���ּӶ���
    ['dnumber', function (v) {
    	return (Vanadium.validators_types['empty'].test(v) || /^\d{1,16}(;\d{1,16})|\d{1,16}(-\d{1,16})*$/.test(v))
      }, '��ʽ:��12;33-36(���ֲ�����16λ)'],
    //Ӣ���ַ�/����/�»���
    ['sname', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^([a-zA-z_\w]{1})([\w]*)$/.test(v);
    }, '������ȷ�ʺ�,������/��ĸ/�»������.'],
    //���ּӺ��
    ['hname', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /(([0-9-])|([\u4e00-\u9fa5]))+$/.test(v);
    }, '������ȷ������,�磺2011-1-12-1111.'],
     //ͼƬ��ʽ��֤ 
    ['pic', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^.*?\.([j,J][p,P][g,G]|[j,J][p,P][e,E][g,G]|[b,B][m,M][p,P]|[g,G][i,I][f,F]|[p,P][n,N][g,G])$/.test(v);
    }, '����ѡ����ȷ��ͼƬ��ʽ.'],
    //�ĵ���ʽ��֤ 
    ['doc', function(v) {
      return !(Vanadium.validators_types['empty'].test(v) || /^.*?\.([j,J][p,P][g,G]|[j,J][p,P][e,E][g,G]|[b,B][m,M][p,P]|[g,G][i,I][f,F]|[p,P][n,N][g,G])$/.test(v));
    }, '����ѡ����ȷ���ĵ���ʽ��������ͼƬ��.'],
    
    //0-65535���ַ������˿�
    ['ports', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^[0-9]$|^([1-9])([0-9]){1,3}$|^([1-5])([0-9]){4}$|^6([0-4])([0-9]){3}$|^65([0-4])([0-9]){2}$|^655([0-2])([0-9]){1}$|^6553([0-4])$/.test(v);
    }, '��������ȷ�ķ������˿�(0-65534).'],
     //0-1֮������
    ['stick', function(v) {
      return Vanadium.validators_types['empty'].test(v) || /^(0(.\d+)?|1(\.0+)?)$/.test(v);
    }, '��������ȷ������(0��1).'],
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
    //�ֻ��绰
    ['iptet', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1[0-9]{10}$)/.test(v))
    }, '��������ȷ����ϵ�绰���ֻ�����'],
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
     return Vanadium.validators_types['empty'].test(v) || /^\d{15}$|^\d{17}(?:\d|x|X)$/.test(v)
    }, '��������ȷ�����֤��,15λ��18λ.'
    ],
    //���ڸ�ʽ
    ['date_au', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)[\/|\-]([1-2]?[0-9]|0[1-9]|30|31)$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011-01-01.'],
  //���ڸ�ʽ
    ['date_aun', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)[\/|\-]([1-2]?[0-9]|0[1-9]|30|31)$/.test(v))
    }, '�����Ϊ��!'],
    //���ڸ�ʽ
    ['date_na', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011-01.'],
  //���ڸ�ʽ
    ['date_nan', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})[\/|\-](0?[1-9]|10|11|12)$/.test(v))
    }, '�����Ϊ��!'],
    //���ڸ�ʽ
    ['date_ye', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})$/.test(v))
    }, '��������ȷ�����ڸ�ʽ,��:2011.'],
  //���ڸ�ʽ
    ['date_yen', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([1-2]\d{3})$/.test(v))
    }, '�����Ϊ��!'],
     //���ڸ�ʽ
    ['date_sf', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/.test(v))
    }, '��������ȷ��ʱ���ʽ,��:00:00'],
    //���ڸ�ʽ
    ['date_sfn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]$/.test(v))
    }, '�����Ϊ��!'],
    //���ڸ�ʽ
    ['date_sfm', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/.test(v))
    }, '��������ȷ��ʱ���ʽ,��:00:00:00'],
    //���ڸ�ʽ
    ['date_sfmn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/.test(v))
    }, '�����Ϊ��!'],
    //������ʱ����
    ['date_nsfm', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/.test(v))
    }, '��������ȷ��ʱ���ʽ,��:2011-01-01 00:00:00'],
    //������ʱ����
    ['date_nsfmn', function(v) {
    	 return (Vanadium.validators_types['empty'].test(v) || /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/.test(v))
    }, '�����Ϊ��!'],
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