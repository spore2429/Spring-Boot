package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("member")
public class MemberDto {

	private int num;
	private String name;
	private String id;
	private String pass;
	private String hp;
	private String addr;
	private String email;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Timestamp gaipday;
}
