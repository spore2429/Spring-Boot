package test.mvc.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"test.*"})
public class SpringChatTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringChatTestApplication.class, args);
	}

}
