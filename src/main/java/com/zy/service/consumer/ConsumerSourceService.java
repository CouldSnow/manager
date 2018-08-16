package com.zy.service.consumer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entity.consumer.ConsumerSource;
import com.zy.mapper.consumer.ConsumerSourceMapper;
import com.zy.mapper.consumer.ConsumerTypeMapper;

@Service
public class ConsumerSourceService {

	@Autowired
	private ConsumerSourceMapper consumerSourceMapper;

	/**
	 * 消费方式
	 * @return
	 * @throws Exception
	 */
	public List<ConsumerSource> getCsmSourceDataList() throws Exception{
		List<ConsumerSource> list = consumerSourceMapper.getCsmSourceDataList();
		return list;
	}
}
