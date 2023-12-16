package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public MemberDto getMemberData(String num);
	public void deleteMember(String num);
	public int LoginPassCheck(String id,String pass);  //Service에서만 map을 풀어쓸수있음 inter는 Mybatis때문에 map으로만가능
	public String getName(String id);
	public MemberDto getDataByid(String id);
	public void updatePhoto(String num,String photo);
	public void updateMember(MemberDto dto);
}
