package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReboardDto;
import boot.data.mapper.ReboardMapperInter;

@Service
public class ReboardService implements ReboardServiceInter {

	@Autowired
	ReboardMapperInter mapperInter;
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getTotalCount(map);
	}

	@Override
	public List<ReboardDto> getPaginList(String searchcolumn, String searchword, int startnum, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		return mapperInter.getPaginList(map);
	}

	@Override
	public void insertReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0)//새글일경우
		{
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else { //답글일경우
			
			//같은그룹중에서 전달받은 restep보다 큰값들은 모두 일괄적으로 +1
			this.updateRestep(regroup, restep);
			//그리고 나서 전달받은 값보다 1크게 db에 저장
			restep++;
			relevel++;
		}
		
		//변경된 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		mapperInter.insertReboard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		mapperInter.updateRestep(map);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadCount(num);
	}

	@Override
	public ReboardDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateReboard(dto);
	}

	@Override
	public void deleteReboard(int num) {
		// TODO Auto-generated method stub
		mapperInter.deleteReboard(num);
	}

	@Override
	public void updateLikes(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateLikes(num);
	}

}
