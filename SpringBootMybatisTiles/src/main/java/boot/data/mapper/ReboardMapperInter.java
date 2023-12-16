package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReboardDto;

@Mapper
public interface ReboardMapperInter {

	public int getMaxNum(); //글이하나도 없을때 regroup==0
	public int getTotalCount(Map<String, String> map); //페이징 ex)게시물+댓글 검색
	public List<ReboardDto> getPaginList(Map<String, Object> map);
	public void insertReboard(ReboardDto dto);
	public void updateRestep(Map<String, Integer> map);
	public void  updateReadCount(int num);
	public ReboardDto getData(int num); 
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
	
	
	
	
}
