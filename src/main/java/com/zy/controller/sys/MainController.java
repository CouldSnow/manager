package com.zy.controller.sys;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.utils.websocket.MyWebSocketHandler;

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
	public String toFormBuilder(Model model) {
		model.addAttribute("onlineUsers", MyWebSocketHandler.onlineUsers());
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
	@RequiresPermissions("main:upload")
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
	
	/**
	 * 从main页面跳转到生成代码页面
	 * @return
	 */
	@RequestMapping("/createcode")
	public String tocreatecode() {
		return "/system/tools/createcode/createcode";
	}
	
	/**
	 * 从main页面跳转到影视页面
	 * @return
	 */
	@RequestMapping("/movie")
	public String tomovie() {
		return "/system/tools/movie/movie";
	}
}
