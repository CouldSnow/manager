package com.zy.entity.consumer;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Consumer {

    private int id;
	
	private BigDecimal csmnumber;
	//前台string转成date类型
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	private Date csmDate;
	
	private String msg;
	private int label;
	private int type;
	private int source;
	private ConsumerSource consumerSource;
	private ConsumerType consumerType;
	
	@Override
	public String toString() {
		String result = id+"_"+csmDate+"_"+msg+"_"+consumerSource.getSource_name()+"_"+csmnumber+"_"+consumerType.getType_name()+"_"+type;
		return result;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BigDecimal getCsmnumber() {
		return csmnumber;
	}
	public void setCsmnumber(BigDecimal csmnumber) {
		this.csmnumber = csmnumber;
	}
	
	public Date getCsmDate() {
		return csmDate;
	}
	public void setCsmDate(Date csmDate) {
		this.csmDate = csmDate;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getLabel() {
		return label;
	}
	public void setLabel(int label) {
		this.label = label;
	}
	public ConsumerSource getConsumeSource() {
		return consumerSource;
	}
	public void setConsumeSource(ConsumerSource consumeSource) {
		this.consumerSource = consumeSource;
	}
	public ConsumerType getConsumeType() {
		return consumerType;
	}
	public void setConsumeType(ConsumerType consumeType) {
		this.consumerType = consumeType;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}

}
