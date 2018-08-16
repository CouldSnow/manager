package com.zy.controller.consumer;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.entity.consumer.MonthsTotal;
import com.zy.entity.consumer.WeekSource;
import com.zy.entity.consumer.WeekType;
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
	
	@RequestMapping("/anaylseMonthInfo")
	@ResponseBody
	public Msg getMonthsTotal() throws Exception{
		List<MonthsTotal> list = consumerService.getMonthTotal();
		return Msg.success().add("monthtotal", list);
	}
	
	@RequestMapping("/anaylseWeekInfo")
	@ResponseBody
	public Msg getWeekTotal() throws Exception{
		List<WeekType> type = consumerService.getWeekType();
		List<WeekSource> source = consumerService.getWeekSource();
		Msg msg = Msg.success();
		msg.add("weekType", type);
		msg.add("weekSource", source);
		return msg;
	}
	
}
