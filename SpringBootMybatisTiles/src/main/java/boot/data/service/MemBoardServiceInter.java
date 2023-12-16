package boot.data.service;

import java.util.List;

import boot.data.dto.MemBoardDto;

public interface MemBoardServiceInter {

	public int getTotalCount();
	public void updatereadcount(String num);
	public void insertBoard(MemBoardDto dto);
	public MemBoardDto getData(String num);
	public int getMaxNum(); //maxnum값을 알아야 content로 이동가능
	public List<MemBoardDto> getList(int start,int perpage); //limit 0,2 0번지부터 총2개조회
	public List<MemBoardDto> getAllDatas();
}
