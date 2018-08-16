package com.zy.service.income;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entity.income.Income;
import com.zy.mapper.income.IncomeMapper;

@Service
public class IncomeService {

	@Autowired
	private IncomeMapper incomeMapper;
	
    public List<Income> getIncomeDataList () throws Exception{
	     return incomeMapper.getIncomeDataList();
    };
	
	public void insertIncomeData(Income income)throws Exception{
		incomeMapper.insertIncomeData(income);
	};
	
	public Income getIncomeDataById(int id)throws Exception{
		return incomeMapper.getIncomeDataById(id);
	};
	
	public void updateIncomeData(Income income)throws Exception{
		incomeMapper.updateIncomeData(income);
	};
	
	public void deleteIncomeData(int id)throws Exception{
		incomeMapper.deleteIncomeData(id);
	};
}
