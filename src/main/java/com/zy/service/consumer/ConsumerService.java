package com.zy.service.consumer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerMap;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.entity.consumer.ConsumerType;
import com.zy.mapper.consumer.ConsumerMapper;

@Service
public class ConsumerService {

	@Autowired
	private ConsumerMapper consumerMapper;
	
	/**
	 * 消费数据列表
	 * @return
	 * @throws Exception
	 */
	public List<Consumer> getConsumerDataList() throws Exception{
		List<Consumer> list = consumerMapper.getConsumerDataList();
		return list;
	}
	/**
	 * 添加消费数据
	 * @param consume
	 * @throws Exception
	 */
	public void insertConsumerData(Consumer consumer) throws Exception{
		consumerMapper.insertConsumerData(consumer);
	}
	/**
	 * 更新消费记录
	 * @param consume
	 * @throws Exception
	 */
	public void updateConsumerDate(Consumer consumer)throws Exception{
		consumerMapper.updateConsumerDate(consumer);
	}
	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Consumer getConsumerDateById(int id)throws Exception{
		return consumerMapper.getConsumerDateById(id);
	}
	public void deleteConsumerData(int id) throws Exception{
		consumerMapper.deleteConsumerData(id);
		
	}
	/**
	 * 每月统计
	 * @return
	 * @throws Exception
	 */
	 public List<ConsumerMap> getMonthTotal()throws Exception{
		 return consumerMapper.getMonthTotal();
	 }
	 
	public List<ConsumerMap> getWeekType() throws Exception{
		return consumerMapper.getWeekType();
	}
	
	public List<ConsumerMap> getWeekSource() throws Exception{
		// TODO Auto-generated method stub
		return consumerMapper.getWeekSource();
	};
}
