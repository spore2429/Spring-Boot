package data.model.test;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OliverInter {

	public List<BosoDto> getAllBoso(String company);
	public int getTotalCount();
	public List<WabosoDto> getAllWasboso();
	public void insertBoso(BosoDto dto);
}
