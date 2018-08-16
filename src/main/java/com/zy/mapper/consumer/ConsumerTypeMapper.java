package com.zy.mapper.consumer;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zy.entity.consumer.ConsumerType;
@Component
public interface ConsumerTypeMapper {

	 List<ConsumerType> getCsmTypeDataList()throws Exception;
}
