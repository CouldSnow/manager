package com.zy.controller.sys;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.service.consumer.ConsumerService;
import com.zy.service.consumer.ConsumerSourceService;
import com.zy.service.consumer.ConsumerTypeService;

@Controller
public class LoginController {

	/**
	 * 跳转到登录页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="login_login")
	public String index(Model model) {
		return "login";
	}

	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(@RequestParam("username")String username,@RequestParam("password")String password,  Model model) throws Exception {
		if(username.equals("admin")) {
			if(password.equals("inet-eyed")) {
				String jspCode = UUID.randomUUID().toString().replaceAll("-", "");
				model.addAttribute("jspCode", jspCode);
				return "main";
			}else {
				return "login";
			}
		}else {
			return "login";
		}
	}
}
