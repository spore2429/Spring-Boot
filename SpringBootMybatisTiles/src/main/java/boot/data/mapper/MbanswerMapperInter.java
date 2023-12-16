package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MbanswerDto;

@Mapper
public interface MbanswerMapperInter {

	public void insertMbanswer(MbanswerDto dto);
	public List<MbanswerDto> getAllAnswers(String num); //num으로 content 찾아가야함 외래키
	public MbanswerDto getAnswer(String idx); //idx로 데이타얻음
	public void updateMbanswer(MbanswerDto dto);
	public void deleteAnswer(String idx);
}
