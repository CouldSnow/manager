package com.zy.controller.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.service.consumer.ConsumerService;
import com.zy.service.consumer.ConsumerSourceService;
import com.zy.service.consumer.ConsumerTypeService;

@Controller
public class LoginController {

	@Autowired
	private ConsumerService consumerService;
	@Autowired
	private ConsumerSourceService consumerSourceService;
	@Autowired
	private ConsumerTypeService consumerTypeService;
	
	@RequestMapping(value="login_login")
	public String index() {
		return "main";
	}

	@RequestMapping("/login")
	public String login(Model model) throws Exception {
		 List<Consumer> list = consumerService.getConsumerDataList();
		 PageHelper.startPage(1, 10);
		 PageInfo<Consumer> pageInfo = new PageInfo<Consumer>(list,10);
		//List<ConsumerSource>list = consumerSourceService.getCsmSourceDataList();
		model.addAttribute("list", pageInfo);
		return "login";
	}
}
