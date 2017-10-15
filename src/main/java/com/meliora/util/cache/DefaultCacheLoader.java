package com.meliora.util.cache;

import com.google.common.cache.CacheLoader;
import com.meliora.exception.BusinessException;
import com.meliora.util.SpringUtils;
import com.meliora.util.Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;

@Slf4j
public class DefaultCacheLoader<K,V> extends CacheLoader<K,V> {

    private Object bean;

    private String methodName;

    public DefaultCacheLoader(String beanName, String methodName){
        if (!Util.valid(methodName)||!Util.valid(beanName)){
            log.error("can not initialize DefaultCacheLoader with params : [{},{}]",beanName,methodName);
            throw new BusinessException
                    (String.format("can not initialize DefaultCacheLoader with params : [{0},{1}]",beanName,methodName));
        }
        bean = SpringUtils.getBean(beanName);
        if (bean==null){
            log.error(" {} is not Found in ApplicationContext",beanName);
            throw new BusinessException
                    (String.format(" {0} is not Found in ApplicationContext",beanName));
        }
        this.methodName=methodName;
    }

    @Override
    @SuppressWarnings("unchecked")
    public V load(K key) throws Exception {
        Method method=ReflectionUtils.findMethod(bean.getClass(),methodName,key.getClass());
        return (V)ReflectionUtils.invokeMethod(method,bean,key);
    }

}
