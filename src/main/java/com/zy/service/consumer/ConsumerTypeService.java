package com.zy.service.consumer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entity.consumer.ConsumerSource;
import com.zy.entity.consumer.ConsumerType;
import com.zy.mapper.consumer.ConsumerTypeMapper;

@Service
public class ConsumerTypeService {

	@Autowired
	private ConsumerTypeMapper consumerTypeMapper;

	
	/**
	 * 消费类型
	 * @return
	 * @throws Exception
	 */
	public List<ConsumerType> getCsmTypeDataList() throws Exception{
		List<ConsumerType> list = consumerTypeMapper.getCsmTypeDataList();
		return list;
	}
}
