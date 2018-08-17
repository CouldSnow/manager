package com.zy.entity.consumer;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class ConsumerMap implements Map{

	private Map map;
	
	public ConsumerMap(){
		 map = new HashMap();
	}
	
	public int size() {
		// TODO Auto-generated method stub
		return map.size();
	}

	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return map.isEmpty();
	}

	public boolean containsKey(Object key) {
		// TODO Auto-generated method stub
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		// TODO Auto-generated method stub
		return map.containsValue(value);
	}

	public Object get(Object key) {
		// TODO Auto-generated method stub
		return map.get(key);
	}

	public Object put(Object key, Object value) {
		// TODO Auto-generated method stub
		return map.put(key, value);
	}

	public Object remove(Object key) {
		// TODO Auto-generated method stub
		return map.remove(key);
	}

	public void putAll(Map m) {
		// TODO Auto-generated method stub
		map.putAll(m);
	}

	public void clear() {
		// TODO Auto-generated method stub
		map.clear();
	}

	public Set keySet() {
		// TODO Auto-generated method stub
		return map.keySet();
	}

	public Collection values() {
		// TODO Auto-generated method stub
		return map.values();
	}

	public Set entrySet() {
		// TODO Auto-generated method stub
		return map.entrySet();
	}

	public static void main(String[] args) {
		ConsumerMap map = new ConsumerMap();
		map.put("1", "123");
		System.out.println(map.get("1"));
	}
	
}
