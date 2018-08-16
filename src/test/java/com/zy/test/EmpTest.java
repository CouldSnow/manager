package com.zy.test;



import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zy.entity.consumer.Consumer;
import com.zy.mapper.consumer.ConsumerMapper;
import com.zy.service.consumer.ConsumerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath*:spring/ApplicationContext-main.xml","classpath*:spring/ApplicationContext-mvc.xml","classpath*:spring/ApplicationContext-dataSource.xml"})
public class EmpTest {

	@Autowired		
	private ConsumerService consumerService;

//	//穿件springIOC容器
//	ApplicationContext ioc = new ClassPathXmlApplicationContext("/applicationContext.xml");
//	//从容器中获得bean
//	EmployeeMapper employeeMapper = ioc.getBean(EmployeeMapper.class);
//	
	@Test
	public void testCRUD() throws Exception {
	
		List<Consumer> list = consumerService.getConsumerDataList();
		
		System.err.println(list);
	
	}
}
