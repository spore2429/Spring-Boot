package data.model.test;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("wadto")
public class WabosoDto {

	private int idx;
	private int num;
	private String name;
}
