package com.meliora.util.cache;


import com.google.common.cache.CacheLoader;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Set;

@Repository
public class DefaultCachePool<K,V> {

    private Map<String,DefaultLoadingCache<K,V>> cacheMap = Maps.newConcurrentMap();

    public DefaultCachePool(){}

    public void putCache(String cacheName, CacheLoader<K,V> cacheLoader){
        cacheMap.put(cacheName,DefaultLoadingCache.build(cacheLoader));
    }

    public DefaultLoadingCache<K, V> getCache(String cacheName){
        return cacheMap.get(cacheName);
    }

    public void removeCache(String cacheName){
        cacheMap.remove(cacheName);
    }

    public V get(String cacheName ,K key) {
        DefaultLoadingCache<K, V> cache = getCache(cacheName);
        if (cache==null)return null;
        return cache.get(key);
    }

    public void put(String cacheName,K key ,V val){
        DefaultLoadingCache<K, V> cache = getCache(cacheName);
        if (cache==null)return ;
        cache.put(key,val);
    }

    public void refresh(String cacheName,K key){
        DefaultLoadingCache<K, V> cache = getCache(cacheName);
        if (cache==null)return ;
        cache.invalidate(key);
    }

    public void invalidate(String cacheName,K key){
        DefaultLoadingCache<K, V> cache = getCache(cacheName);
        if (cache==null)return ;
        cache.invalidate(key);
    }

    public Set<K> getCachekeySet(String cacheName){
        DefaultLoadingCache<K, V> cache = getCache(cacheName);
        if (cache==null)return null;
        return cache.keySet();
    }

}
