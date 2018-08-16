package com.zy.entity.consumer;

import java.math.BigDecimal;

public class WeekSource {

	private String name;
	private BigDecimal count;
	private int source;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getCount() {
		return count;
	}
	public void setCount(BigDecimal count) {
		this.count = count;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
}
