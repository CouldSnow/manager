package com.zy.entity.consumer;

import org.springframework.stereotype.Component;

@Component(value="consumeSource")
public class ConsumerSource {

	@Override
	public String toString() {
		return source_id+"_"+source_name;
	}
	/*`id`  int(11) NOT NULL AUTO_INCREMENT ,
	`name`  varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
	`status`  int(1) UNSIGNED ZEROFILL NOT NULL ,*/
	private int source_id;
	private String source_name;
	private int source_status;
	public int getSource_id() {
		return source_id;
	}
	public void setSource_id(int source_id) {
		this.source_id = source_id;
	}
	public String getSource_name() {
		return source_name;
	}
	public void setSource_name(String source_name) {
		this.source_name = source_name;
	}
	public int getSource_status() {
		return source_status;
	}
	public void setSource_status(int source_status) {
		this.source_status = source_status;
	}

	
}
