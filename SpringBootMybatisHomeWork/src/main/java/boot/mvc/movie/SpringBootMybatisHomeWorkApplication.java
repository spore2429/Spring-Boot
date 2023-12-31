package boot.mvc.movie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.model.*"})
@MapperScan("data.model.mapper")
public class SpringBootMybatisHomeWorkApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMybatisHomeWorkApplication.class, args);
	}

}
