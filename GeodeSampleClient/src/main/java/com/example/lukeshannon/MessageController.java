package com.example.lukeshannon;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {
	
	private ChatRepo chatRepo;
	
	public MessageController(ChatRepo chatRepo) {
		this.chatRepo = chatRepo;
	}
	
	@GetMapping("/add/{message}")
	public String addMessage(@PathVariable("message") String message) {
		chatRepo.save(new Chat(message));
		return "redirect/messages";
	}
	
	@GetMapping("/messages")
	public Iterable<Chat> getMessages() {
		return chatRepo.findAll();
	}

}
