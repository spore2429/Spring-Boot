package boot.data.mapper;

import java.util.List;

import boot.data.dto.SmartDto;

public interface SmartMapperInter {

	public void insertSshop(SmartDto dto);
	public List<SmartDto> getAllSangpums(int num); //num으로 content 찾아가야함 외래키
	public SmartDto getSdata(int num); //idx로 데이타얻음
	public void updateSshop(SmartDto dto);
	public void deleteSshop(int num);
}
