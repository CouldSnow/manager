package com.zy.service.income;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entity.income.IncomeSource;
import com.zy.mapper.income.IncomeSourceMapper;

@Service
public class IncomeSourceService {

	@Autowired
	private IncomeSourceMapper incomeSourceMapper;
	
	public List<IncomeSource> getIncomeSoureDataList()throws Exception{
		return incomeSourceMapper.getIncomeSoureDataList();
	};
}
