package com.zy.mapper.income;

import java.util.List;

import com.zy.entity.income.Income;

public interface IncomeMapper {

	List<Income> getIncomeDataList()throws Exception;
	
	void insertIncomeData(Income income)throws Exception;
	
	Income getIncomeDataById(int id)throws Exception;
	
	void updateIncomeData(Income income)throws Exception;
	
	void deleteIncomeData(int id)throws Exception;
	
}
