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
}
