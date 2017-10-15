package com.meliora.util.cache;


import com.google.common.cache.*;
import com.meliora.util.Util;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

@Slf4j
public class DefaultLoadingCache<K,V> {

    //缓存失效超时时间
    public static final Long DEFAULT_TIME_OUT = 30L;

    //缓存失效超时时间单位
    public static final TimeUnit DEFAULT_TIMEUNIT = TimeUnit.MINUTES;

    //最大缓存对象
    public static final Long DEFAULT_MAXMUNSIZE = 5000L;

    //允许同时并发修改线程个数
    public static final Integer DEFAULT_CONCURRENCY_LEVEL = 10;

    private CacheLoader<K,V> cacheLoader;

    private Long timeOut;

    private TimeUnit unit;

    private Integer concurrenctLevel;

    private Long maxmunsize;

    private LoadingCache<K,V> cache;

    private DefaultLoadingCache(CacheLoader<K,V> cacheLoader , Long timeOut , TimeUnit unit , Integer concurrencyLevel , Long maxmunsize){
        this.cacheLoader=cacheLoader;
        this.timeOut = (Util.valid(timeOut)) ? timeOut : DEFAULT_TIME_OUT;
        this.unit = (Util.valid(unit)) ? unit : DEFAULT_TIMEUNIT;
        this.concurrenctLevel = (Util.valid(concurrencyLevel)) ? concurrencyLevel : DEFAULT_CONCURRENCY_LEVEL;
        this.maxmunsize = (Util.valid(maxmunsize)) ? maxmunsize : DEFAULT_MAXMUNSIZE;
    }

    private DefaultLoadingCache<K,V> buildCache(){
        cache= CacheBuilder.newBuilder()
                .expireAfterAccess(timeOut,unit)
                .concurrencyLevel(concurrenctLevel)
                .initialCapacity(100)
                .maximumSize(maxmunsize)
                .softValues()
                .removalListener(new RemovalListener<K, V>() {
                    @Override
                    public void onRemoval(RemovalNotification<K, V> notification) {
                        RemovalCause cause = notification.getCause();
                        K key = notification.getKey();
                        log.info("{0} is removed , cause : {1}",key,cause );
                    }
                })
                .build(cacheLoader);
        return this;
    }

    public static <K,V> DefaultLoadingCache<K,V> build
            (CacheLoader<K,V> cacheLoader , Long timeOut , TimeUnit unit , Integer concurrencyLevel , Long maxmunsize){
        return new DefaultLoadingCache<K, V>(cacheLoader,timeOut,unit,concurrencyLevel,maxmunsize).buildCache();
    }

    public static <K,V> DefaultLoadingCache<K,V> build(CacheLoader<K,V> cacheLoader){
        return build(cacheLoader,null,null,null,null);
    }

    public void test(){
        cache.invalidateAll();

    }

    public V get(K key)  {
        try {
            return (V)cache.get(key);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void put(K key ,V val){
        cache.put(key,val);
    }

    public void refresh(K key){
        cache.refresh(key);
    }

    public Map<K,V> getAll(List<K> keys)  {
        try {
            return cache.getAll((Iterable<? extends K>) keys.iterator());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void invalidate(K key) {
        cache.invalidate(key);
    }

    public void invalidateAll(){
        cache.invalidateAll();
    }

    public Set<K> keySet(){
        return cache.asMap().keySet();
    }

}
