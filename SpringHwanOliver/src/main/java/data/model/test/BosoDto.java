package data.model.test;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bosodto")
public class BosoDto {

	private int num;
	private int c_code;
	private String company;
	private String clevel;
	private int step;
}
