package com.zy.controller.income;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.entity.consumer.ConsumerType;
import com.zy.entity.income.Income;
import com.zy.entity.income.IncomeSource;
import com.zy.service.consumer.ConsumerService;
import com.zy.service.consumer.ConsumerSourceService;
import com.zy.service.consumer.ConsumerTypeService;
import com.zy.service.income.IncomeService;
import com.zy.service.income.IncomeSourceService;
import com.zy.utils.Msg;

@Controller
@RequestMapping("/income")
public class IncomeController {

	//@Resource(name="consumeService")
		@Autowired
		private IncomeService incomeService;
		@Autowired
		private IncomeSourceService incomeSourceService;
		
		@RequestMapping("/add")
		@ResponseBody
		public Msg insertIncomeData(Income income) throws Exception {
			incomeService.insertIncomeData(income);
			return Msg.success();
		}
		@RequestMapping("/update")
		@ResponseBody
		public Msg updateIncomeData(Income income) throws Exception {
			incomeService.updateIncomeData(income);
			return Msg.success();
		}
		@RequestMapping("/delete")
		@ResponseBody
		public Msg deleteIncomeData(@RequestParam("id")int id) throws Exception {
			incomeService.deleteIncomeData(id);
			return Msg.success();
		}
		/**
		 * 收入列表
		 * @param pg
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/incomeList")
		@ResponseBody
		public Msg getIncomeDataList(@RequestParam(value="pg",defaultValue="1")int pg) throws Exception{
			//引入pagehelper分页插件
			//传入页码以及每页大小
			PageHelper.startPage(pg, 10);
			List<Income> list = incomeService.getIncomeDataList();
			//只需要将pageinfo交给页面
			//封装详细的分页信息，包括查询查询出来的数据，传入连续显示的页数
			PageInfo<Income> pageInfo = new PageInfo<Income>(list,10);
			return Msg.success().add("pageInfo",pageInfo);
		  }
		/**
		 * 获取类型和方式的下拉框数据
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/sourceList")
		@ResponseBody
		public Msg getSourceDataList() throws Exception{
			List<IncomeSource> list = incomeSourceService.getIncomeSoureDataList();
			Msg msg = Msg.success();
			msg.add("source", list);
			return msg;
		  }
		
		/**
		 * 根据id返回消费对象
		 * @param id
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/IncomeById")
		@ResponseBody
		public Msg selectconsumerbyid(@RequestParam("id")int id) throws Exception{
			Income income =incomeService.getIncomeDataById(id);
			List<IncomeSource> list = incomeSourceService.getIncomeSoureDataList();
			Msg msg = Msg.success();
			msg.add("income", income);
			msg.add("source", list);
			return msg;
		  }
}
