package com.zy.entity.consumer;

import org.springframework.stereotype.Component;

@Component(value="consumeType")
public class ConsumerType {
	
	@Override
	public String toString() {
		return type_id+"_"+type_name;
	}
/*	`id`  int(11) NOT NULL AUTO_INCREMENT ,
	`name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
	`status`  int(1) UNSIGNED ZEROFILL NOT NULL ,*/
	private int type_id;
	private String type_name;
	private int type_status;
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public int getType_status() {
		return type_status;
	}
	public void setType_status(int type_status) {
		this.type_status = type_status;
	}


	
}
