package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao{

	@Autowired
	MyCarDaoInter carinter; //inter에서 필요한것만 가져온다
	
	//insert
	public void insertMyCar(MyCarDto dto)
	{
		carinter.save(dto); //id타입 유무에 따라 자동으로 insert(num 유무 insert), or update 
	}
	
	//전체출력
	public List<MyCarDto> getAllDatas()
	{
		//return carinter.findAll();
		return carinter.findAll(Sort.by(Sort.Direction.DESC, "carprice")); //가격이 높은순 정렬
	}
	
	//num에 대한 값반환
	public MyCarDto getData(Long num)
	{
		return carinter.getReferenceById(num);
	}
	
	//update
	public void updateMyCar(MyCarDto dto)
	{
		carinter.save(dto);
	}
	
	//delete
	public void deleteMyCar(Long num)
	{
		carinter.deleteById(num);
	}
	
	
}
