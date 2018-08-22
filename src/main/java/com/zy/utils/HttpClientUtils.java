package com.zy.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpClientUtils {

	/**
	 * get方法
	 * @param url
	 * @return
	 */
	public static Msg doGet(String url){
		String msg="",rTime="";
		try {
			long startTime = System.currentTimeMillis(); 
			URL url1= new URL(url);
			HttpURLConnection connection = (HttpURLConnection)url1.openConnection();
			/* 3. 设置请求参数（过期时间，输入、输出流、访问方式），以流的形式进行连接 */
			// 设置是否向HttpURLConnection输出
			connection.setDoOutput(false);
			// 设置是否从httpUrlConnection读入
			connection.setDoInput(true);
			connection.setRequestMethod("GET");
			// 设置此 HttpURLConnection 实例是否应该自动执行 HTTP 重定向
			connection.setInstanceFollowRedirects(true);
			connection.setConnectTimeout(3000);
			connection.connect();
			int code = connection.getResponseCode();
			long endTime = System.currentTimeMillis(); 
			if(code==200) {
				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String line =null;
				while((line=reader.readLine())!=null) {
					msg += line + "\n";
				}
				reader.close();
			}
			rTime = String.valueOf(endTime-startTime);
			connection.disconnect();
		}catch(Exception e) {
			return Msg.fail().add("result", e.getMessage());
		}
		return Msg.success().add("result", msg).add("rTime", rTime);
	}
	
	/**
	 * post方法
	 * @param url
	 * @param jsonStr
	 * @return
	 */
	public static Msg doPost(String url,String jsonStr) {
		long startTime = System.currentTimeMillis(); 
		String msg="",rTime="";
		try {
			URL url1 = new URL(url);
			HttpURLConnection connection = (HttpURLConnection)url1.openConnection();
			connection.setRequestMethod("POST");
			connection.setConnectTimeout(3000);
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			//connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type", "application/json;charset=utf-8");
			connection.connect();
			//参数写入请求
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream(), "UTF-8"));
            writer.write(jsonStr);
            writer.close();
			
			int code = connection.getResponseCode();
			long endTime = System.currentTimeMillis(); 
			if(code==200) {
				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String line =null;
				while((line=reader.readLine())!=null) {
					msg += line + "\n";
				}
				reader.close();
			}
			rTime = String.valueOf(endTime-startTime);
			connection.disconnect();
		} catch (Exception e) {
			return Msg.fail().add("result", e.getMessage());
		}
		return Msg.success().add("result", msg).add("rTime", rTime);
	}
	
	public static void main(String[] args) {
		Msg msg=HttpClientUtils.doPost("http://localhost:8081/manager/anaylse/anaylseMonthInfo","{\"csmDate1\":\"2018-08\",\"csmDate2\":\"2018-09\"}");
		System.out.println(msg.getExtend().get("result"));
	}
}
