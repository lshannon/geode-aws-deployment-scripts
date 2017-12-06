package com.example.lukeshannon;
import java.time.LocalDateTime;

import org.springframework.data.gemfire.repository.GemfireRepository;

public interface ChatRepo extends GemfireRepository<Chat,LocalDateTime>{

}
