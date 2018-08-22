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

import com.zy.utils.HttpClientUtils;
import com.zy.utils.Msg;

@Controller
@RequestMapping("tool")
public class ToolsController {

	@RequestMapping("interfaceTest")
	@ResponseBody
	public Msg interfaceTest(@RequestBody Map<String,String> map) {
		String url = map.get("serverUrl");
		String method = map.get("requestMonthed");
		if(method.equals("GET")) {
			return HttpClientUtils.doGet(url);
		}else {
			String jsonStr = map.get("requestBody");
			return HttpClientUtils.doPost(url, jsonStr);
		}
	}
}
