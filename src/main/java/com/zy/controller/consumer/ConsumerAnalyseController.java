package com.zy.controller.consumer;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.entity.consumer.ConsumerMap;
import com.zy.service.consumer.ConsumerService;
import com.zy.utils.Msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("anaylse")
public class ConsumerAnalyseController {

	@Autowired
	private ConsumerService consumerService;
	
    /**
     * 分析每月消费情况
     * @return
     * @throws Exception
     */
	@RequestMapping("/anaylseMonthInfo")
	@ResponseBody
	public Msg getMonthsTotal() throws Exception{
		List<ConsumerMap> list = consumerService.getMonthTotal();
		return Msg.success().add("monthtotal", list);
	}
	
	/**
	 * 分析周消费情况
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/anaylseWeekInfo")
	@ResponseBody
	public Msg getWeekTotal() throws Exception{
		List<ConsumerMap> type = consumerService.getWeekType();
		List<ConsumerMap> source = consumerService.getWeekSource();
		List<ConsumerMap> days = consumerService.getSevenDays();
		Msg msg = Msg.success();
		msg.add("weekType", type);
		msg.add("weekSource", source);
		msg.add("daysInfo", days);
		return msg;
	}
	
}
