package boot.data.mapper;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberMapper {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id);
	public int loginPassCheck(Map<String, String> map);
	
}
