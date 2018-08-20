package com.zy.controller.sys.tools;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.utils.Msg;

@Controller
@RequestMapping("tool")
public class ToolsController {

	@RequestMapping("interfaceTest")
	@ResponseBody
	public Msg interfaceTest(@RequestBody Map<String,String> map) {
		 Msg success = Msg.success();
		 Msg fail = Msg.fail();
		 String result="",rTime="";
		 try {
			 long startTime = System.currentTimeMillis(); 	
			 URL url = new URL( map.get("serverUrl"));
			 HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			 connection.setRequestMethod(map.get("requestMonthed"));
			 /*connection.setRequestMethod("adasdas");*/
			 BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
			 long endTime = System.currentTimeMillis(); 
			 String line="";
			 while((line = in.readLine())!=null) {
				 result += line;
			 }
			  rTime = String.valueOf(endTime-startTime);
		 }catch(Exception e) {
			 return fail.add("result", e.getMessage());
		 }
		 return success.add("result", result).add("rTime", rTime);
	}
}
