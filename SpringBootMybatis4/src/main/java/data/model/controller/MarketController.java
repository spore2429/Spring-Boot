package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

	/*
	 * @Autowired MarketMapperInter mapper;
	 */
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:market/list";
	}
	
	
	@GetMapping("/market/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//db로부터 총갯수 얻기
		int totalcount=service.getTotalCount();
		
		List<MarketDto> list=service.getAllSangpums();
		
		model.addObject("totalcount", totalcount);
		model.addObject("list", list);

		model.setViewName("market/marketlist");
		
		return model;
		
	}
	
	@GetMapping("/market/writeform")
	public String insertform()
	{
		return "market/addform";
	}
	
	
	@PostMapping("/market/add")
	public String insert(@ModelAttribute MarketDto dto,
			MultipartFile photo,
			HttpSession session)
	{
		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);

		//사진선택을 안했을경우 no..
		if(photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			
			//사진명 구해서 넣기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+photo.getOriginalFilename();

			dto.setPhotoname(photoname);
			
			//업로드
			try {
				photo.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//db저장
		service.insertMarket(dto);		
		return "redirect:list"; //가상경로  list
	}
	
	
	@GetMapping("/market/uform")
	public ModelAndView updateform(@RequestParam String num)
	{
		
		ModelAndView model=new ModelAndView();
		
		MarketDto dto=service.getDataSangpum(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("market/updateform");
		
		return model;
	}

	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto,
			MultipartFile photo,
			HttpSession session)
	{
		
		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		//이전사진 구하기
		String pre_photo=service.getDataSangpum(dto.getNum()).getPhotoname();
		
		//사진선택을 안했을경우 no..
		if(photo.getOriginalFilename().equals(""))
		
			dto.setPhotoname(null);
				
		else {
					
			//사진명 구해서 넣기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			
			//이전사진 삭제
			File file=new File(path+"/"+pre_photo);
			file.delete();
	
			//업로드
			try {
				photo.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
		//수정폼에서 이미지선택안하고 수정을하면 이전이미지가 남아있음
		if(dto.getPhotoname()==null)
		{
					
			dto.setPhotoname(pre_photo);
			/*
			* //이전사진 삭제 File file=new File(path+"/"+pre_photo); file.delete();
			*/
		}
		
		
		service.updateMarket(dto);
		return "redirect:list";
	}
	
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,
			HttpSession session)
	{
		
		String pre_photo=service.getDataSangpum(num).getPhotoname(); //해당넘버에 해당하는 포토
		
		//파일삭제
		String path=session.getServletContext().getRealPath("/save");
			
		File file=new File(path+"\\"+pre_photo);
		file.delete();
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
}
	

