package com.zy.controller.consumer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.entity.consumer.ConsumerType;
import com.zy.service.consumer.ConsumerService;
import com.zy.service.consumer.ConsumerSourceService;
import com.zy.service.consumer.ConsumerTypeService;
import com.zy.utils.Msg;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

	//@Resource(name="consumeService")
		@Autowired
		private ConsumerService consumerService;
		@Autowired
		private ConsumerSourceService consumerSourceService;
		@Autowired
		private ConsumerTypeService consumerTypeService;
		
		@RequestMapping("/add")
		@ResponseBody
		public Msg insertConsumerData(Consumer consumer) throws Exception {
			consumerService.insertConsumerData(consumer);
			return Msg.success();
		}
		@RequestMapping("/update")
		@ResponseBody
		public Msg updateConsumerData(Consumer consumer) throws Exception {
			consumerService.updateConsumerDate(consumer);
			return Msg.success();
		}
		@RequestMapping("/delete")
		@ResponseBody
		public Msg deleteConsumerData(@RequestParam("id")int id) throws Exception {
			consumerService.deleteConsumerData(id);
			return Msg.success();
		}
		/**
		 * 消费列表
		 * @param pg
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/consumerList")
		@ResponseBody
		public Msg getConsumerDataList(@RequestParam(value="pg",defaultValue="1")int pg) throws Exception{
			//引入pagehelper分页插件
			//传入页码以及每页大小
			PageHelper.startPage(pg, 10);
			List<Consumer> list = consumerService.getConsumerDataList();
			//只需要将pageinfo交给页面
			//封装详细的分页信息，包括查询查询出来的数据，传入连续显示的页数
			PageInfo<Consumer> pageInfo = new PageInfo<Consumer>(list,10);
			return Msg.success().add("pageInfo",pageInfo);
		  }
		/**
		 * 获取类型和方式的下拉框数据
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/sourceAndTypeList")
		@ResponseBody
		public Msg getSourceAndTypeDataList() throws Exception{
			List<ConsumerSource> list = consumerSourceService.getCsmSourceDataList();
			List<ConsumerType> list1 = consumerTypeService.getCsmTypeDataList();
			Msg msg = Msg.success();
			msg.add("source", list);
			msg.add("type", list1);
			return msg;
		  }
		
		/**
		 * 根据id返回消费对象
		 * @param id
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/consumerById")
		@ResponseBody
		public Msg selectconsumerbyid(@RequestParam("id")int id) throws Exception{
			Consumer consumer =consumerService.getConsumerDateById(id);
			List<ConsumerSource> list = consumerSourceService.getCsmSourceDataList();
			List<ConsumerType> list1 = consumerTypeService.getCsmTypeDataList();
			Msg msg = Msg.success();
			msg.add("consumer", consumer);
			msg.add("source", list);
			msg.add("type", list1);
			return msg;
		  }
}
