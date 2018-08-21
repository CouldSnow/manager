package com.zy.mapper.consumer;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerMap;

@Component
public interface ConsumerMapper {

	/**
	 * 消费数据列表
	 * @return
	 * @throws Exception
	 */
	 List<Consumer> getConsumerDataList() throws Exception;
	/**
	 * 添加消费数据
	 * @param consume
	 * @throws Exception
	 */
	 void insertConsumerData(Consumer consumer) throws Exception;
	/**
	 * 更新消费记录
	 * @param consume
	 * @throws Exception
	 */
	 void updateConsumerDate(Consumer consumer)throws Exception;
	/**
	 * 根据id返回对象
	 * @param id
	 * @return
	 * @throws Exception
	 */
	 Consumer getConsumerDateById(int id)throws Exception;
	
	 void deleteConsumerData(int id)throws Exception;
	 
	 List<ConsumerMap> getMonthTotal(ConsumerMap consumerMap)throws Exception;
	 
	 List<ConsumerMap> getWeekType() throws Exception;
	
	 List<ConsumerMap> getWeekSource()throws Exception;
	
	 List<ConsumerMap> getSevenDays()throws Exception;
	
}
