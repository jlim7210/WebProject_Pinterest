package com.mp.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.mp.chat.vo.Greeting;
import com.mp.chat.vo.Hello;


@Controller
public class ChatController {

	@MessageMapping("/hello")
	@SendTo("/topic/greetings")
	public Greeting greeting(Hello hello) throws Exception {
		Thread.sleep(1000);
		return new Greeting("hello, " + HtmlUtils.htmlEscape(hello.getName() + "!"));
	}

}
