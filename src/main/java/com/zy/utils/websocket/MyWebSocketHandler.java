package com.zy.utils.websocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.alibaba.fastjson.JSON;

public class MyWebSocketHandler implements WebSocketHandler{
	
	//保存所有的user
	private static final ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();

	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		
		System.out.println("connection close.................");
		 users.remove(arg0);
	}

	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {
		System.out.println("connection success...........");
		users.add(arg0);
		
	}

	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
		Map<String, Object> map =JSON.parseObject(arg1.getPayload().toString());
		System.out.println(arg1.getPayload().toString());
		
		System.out.println((String)map.get("msgContent"));
		// 处理消息 msgContent消息内容
        TextMessage textMessage = new TextMessage((String)map.get("msgContent"), true);
        // 调用方法（发送消息给所有人）
        sendMsgToAllUsers(textMessage);
		
	}

	public void handleTransportError(WebSocketSession arg0, Throwable arg1) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}

	 // 给所有用户发送 信息
    public void sendMsgToAllUsers(WebSocketMessage<?> message) throws Exception{

        for (WebSocketSession user : users) {
            user.sendMessage(message);
        }

    }
}
