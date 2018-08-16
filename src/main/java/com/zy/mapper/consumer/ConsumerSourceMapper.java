package com.zy.mapper.consumer;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zy.entity.consumer.ConsumerSource;

@Component
public interface ConsumerSourceMapper {

	List<ConsumerSource> getCsmSourceDataList()throws Exception;
}
