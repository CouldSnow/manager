package com.zy.entity.income;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Income {

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BigDecimal getIcmnumber() {
		return icmnumber;
	}
	public void setIcmnumber(BigDecimal icmnumber) {
		this.icmnumber = icmnumber;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public IncomeSource getIncomeSource() {
		return incomeSource;
	}
	public void setIncomeSource(IncomeSource incomeSource) {
		this.incomeSource = incomeSource;
	}
	public Date getIcmdate() {
		return icmdate;
	}
	public void setIcmdate(Date icmdate) {
		this.icmdate = icmdate;
	}
	/*`id`  int(11) NOT NULL AUTO_INCREMENT ,
	`icmnumber`  decimal(10,2) NOT NULL ,
	`icmdate`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
	`source`  int(11) NULL DEFAULT NULL ,
	`msg`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL ,*/
	private int id;
	private BigDecimal icmnumber;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	private Date icmdate;
	
	private int source;
	private String msg;
	private IncomeSource incomeSource;
	
}
