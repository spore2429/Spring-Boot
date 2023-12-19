package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpServletRequest;

//react와 연결하기 때문에 @RestController 사용
@RestController
//서로 다른 도메인을 연결해주는 어노테이션
@CrossOrigin
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	//다른메서드에서도 사용하기위해 빼놓음
	String photoName; //리액트에서 업로드한 이미지명(혹은 변경한 이미지명..)
	
	@PostMapping("/upload")
	public String fileUpload(@RequestParam MultipartFile uploadFile,
			HttpServletRequest request)
	{
		//업로드할 폴더 위치
		String path=request.getServletContext().getRealPath("/save");
		
		//파일명
		String fileName=uploadFile.getOriginalFilename();
		
		//파일명변경
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		photoName=sdf.format(new Date())+fileName;
		
		System.out.println("fileName: "+fileName+"==>"+photoName);
		
		//save폴더에 업로드
		try {
			uploadFile.transferTo(new File(path+"/"+photoName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return photoName;
	}
	
	@PostMapping("/insert")
	public void insertShop(@RequestBody ShopDto dto) //@RequestBody는 json으로 보낸걸 자바클래스로 변환해야할때사용
	{
		//업로드한 사진(프론트에서 axios.post에 안넣어됨,여기서 이미 추가)
		dto.setPhoto(photoName);
		//insert
		shopService.insertShop(dto);
	}
	
	@GetMapping("/list")
	public List<ShopDto> list()
	{
		return shopService.getShopDataes();
	}
	
	@GetMapping("/detail")
	public ShopDto detailPage(int num)
	{
		return shopService.getData(num);
	}
	
	@DeleteMapping("/delete")
	public void deleteShop(@RequestParam int num,HttpServletRequest request)
	{
		//save경로구하기
		String path=request.getServletContext().getRealPath("/save");
		
		//num에 해당하는 photo
		String photo=shopService.getData(num).getPhoto();
		
		//해당파일이 존재할경우 삭제
		File file=new File(path+"/"+photo);
		
		//파일이존재한다면
		if(file.exists())
			file.delete();
		
		//db삭제
		shopService.deleteShop(num);
	}
}
