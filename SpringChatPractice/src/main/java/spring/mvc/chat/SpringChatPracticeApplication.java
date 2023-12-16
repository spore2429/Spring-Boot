package spring.mvc.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"mvc.*"})
public class SpringChatPracticeApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringChatPracticeApplication.class, args);
	}

}
