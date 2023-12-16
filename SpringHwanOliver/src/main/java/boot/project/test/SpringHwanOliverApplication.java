package boot.project.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("data.model.test")
@MapperScan("data.model.test")
public class SpringHwanOliverApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringHwanOliverApplication.class, args);
	}

}
