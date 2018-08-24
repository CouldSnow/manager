package com.zy.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {

	/**
	 * 从main页面跳转到消费管理页面
	 * @return
	 */
	@RequestMapping("/consumerMain")
	public String toConsumerMain() {
		return "/consumer/consumer_main";
	}
	
	/**
	 * 从main页面跳转到收入管理页面
	 * @return
	 */
	@RequestMapping("/incomeMain")
	public String toIncomeMain() {
		return "/income/income_main";
	}

	/**
	 * 从main页面跳转到收入周消费页面
	 * @return
	 */
	@RequestMapping("/weekMain")
	public String toWeekMain() {
		return "/consumer/consumer_weekanalyse";
	}
	/**
	 * 从main页面跳转到收入周消费页面
	 * @return
	 */
	@RequestMapping("/monthMain")
	public String toMonthMain() {
		return "/consumer/consumer_monthanalyse";
	}
	/**
	 * 从main页面跳转到收入页面构建页面
	 * @return
	 */
	@RequestMapping("/formBuilder")
	public String toFormBuilder() {
		return "/system/tools/formbuilder/formbuilder";
	}
	
	/**
	 * 从main页面跳转到接口测试页面
	 * @return
	 */
	@RequestMapping("/interfaceTest")
	public String toInterfaceTest() {
		return "/system/tools/interfaceTest/interfaceTest";
	}
	
	/**
	 * 从main页面跳转到上传页面
	 * @return
	 */
	@RequestMapping("/upload")
	public String toUpLoad() {
		return "/system/upload/upload";
	}
	/**
	 * 从main页面跳转到上传页面
	 * @return
	 */
	@RequestMapping("/websocket")
	public String towebsocket() {
		return "/system/websocket/websocket";
	}
}
