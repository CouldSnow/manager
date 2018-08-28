package com.zy.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Test {
	
	public static void main(String[]args) {
		String source = "admin";
		String salt="admin";
		int hashIterations=2;
		
		Md5Hash md5  = new Md5Hash(source, salt, hashIterations);
		System.out.println(md5);
		
		SimpleHash simpleHash = new SimpleHash("md5",source, salt, hashIterations);
		System.out.println(simpleHash);
	}
}
