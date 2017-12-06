/**
 * 
 */
package com.example.lukeshannon;

import java.io.Serializable;
import java.time.LocalDateTime;
import org.springframework.data.annotation.Id;
import org.springframework.data.gemfire.mapping.Region;

/**
 * @author lshannon
 *
 */
@Region("Chats")
public class Chat implements Serializable {
	
	@Id
	private LocalDateTime timestamp = LocalDateTime.now();
	private String message;
	
	public Chat(String message) {
		this.message = message;
	}
	
	public Chat() { }
	
	@Override
	public String toString() {
		return "Chat [timestamp=" + timestamp + ", message=" + message + "]";
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
