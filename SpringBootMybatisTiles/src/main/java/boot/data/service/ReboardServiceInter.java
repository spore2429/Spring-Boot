package boot.data.service;

import java.util.List;

import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {

	public int getMaxNum(); //글이하나도 없을때 regroup==0
	public int getTotalCount(String searchcolumn,String searchword); //페이징 ex)게시물+댓글 검색
	public List<ReboardDto> getPaginList(String searchcolumn,String searchword,int startnum,int perpage); //object인이유
	public void insertReboard(ReboardDto dto);
	public void updateRestep(int regroup,int restep);
	public void  updateReadCount(int num);
	public ReboardDto getData(int num); 
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
}
