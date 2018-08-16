package com.zy.mapper.consumer;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.MonthsTotal;
import com.zy.entity.consumer.WeekSource;
import com.zy.entity.consumer.WeekType;

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
	 
	 List<MonthsTotal> getMonthTotal()throws Exception;
	 
	 List<WeekType> getWeekType() throws Exception;
	
	 List<WeekSource> getWeekSource()throws Exception;
	
}
