package cn.chou;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

@MapperScan("cn.chou.mapper")
@SpringBootApplication
@EnableSwagger2
public class SpringsecurityLoginApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringsecurityLoginApplication.class, args);
	}
}
