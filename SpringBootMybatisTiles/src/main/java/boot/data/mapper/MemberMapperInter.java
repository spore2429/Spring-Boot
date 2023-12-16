package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public MemberDto getMemberData(String num);
	public void deleteMember(String num);
	public int LoginPassCheck(Map<String, String> map);
	public String getName(String id);
	public MemberDto getDataByid(String id);
	public void updatePhoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
}
