package com.zy.utils.websocket;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
import org.springframework.web.socket.sockjs.frame.Jackson2SockJsMessageCodec;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

/*	这个的主要作用是可以在握手前做一些事，把所需要的东西放入到attributes里面，
	然后可以在WebSocketHandler的session中， 取到相应的值，具体可参考HttpSessionHandshakeInterceptor，
	这儿也可以实现HandshakeInterceptor 接口。*/
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		// TODO Auto-generated method stub
		super.afterHandshake(request, response, wsHandler, ex);
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse arg1, WebSocketHandler arg2,
			Map<String, Object> attributes) throws Exception {
		
		String jspCode = ((ServletServerHttpRequest) request).getServletRequest().getParameter("jspCode");//这里放到session域中，一个session对应多个请求，一个请求可以获取它的session
		if(jspCode!=null) {
			attributes.put("jspCode",jspCode);
		}else {
			attributes.put("jspCode", "chat");
		}
		// TODO Auto-generated method stub
		return super.beforeHandshake(request, arg1, arg2, attributes);
	}

}
