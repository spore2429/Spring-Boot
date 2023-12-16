package mycar.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/car/carlist")  //시작..
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<MyCarDto> list=dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("totalcount", list.size());
		
		model.setViewName("carlist");
		return model;
	}
	
	@GetMapping("/car/carform")
	public String addform()
	{
		return "addform";
	}
	
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute MyCarDto dto,
			MultipartFile carupload,
			HttpSession session)
	{
		//실제경로
		String path=session.getServletContext().getRealPath("/save");  //webapp 쓸필요없음
		System.out.println(path);
				
		//업로드한 파일 dto넣기
		dto.setCarphoto(carupload.getOriginalFilename());
				
		//실제업로드
		try {
			carupload.transferTo(new File(path+"\\"+carupload.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		dao.insertMyCar(dto);
		return "redirect:carlist";
	}
	
	@GetMapping("/car/updateform")
	public String updateform(@RequestParam Long num,Model model)
	{
		
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		
		return "uform";
	}
	
	
	@PostMapping("/car/update")
	public String update(@ModelAttribute MyCarDto dto,
			MultipartFile carupload,
			HttpSession session)
	{
		//실제경로
		String path=session.getServletContext().getRealPath("/save");  //webapp 쓸필요없음
		System.out.println(path);
						
		//업로드한 파일 dto넣기
		dto.setCarphoto(carupload.getOriginalFilename());
						
		//실제업로드
		try {
			carupload.transferTo(new File(path+"\\"+carupload.getOriginalFilename()));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		dao.updateMyCar(dto);
		
		return "redirect:carlist";
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam Long num)
	{
		
		dao.deleteMyCar(num);
		
		return "redirect:carlist";
	}
	
	@GetMapping("/car/detail")
	public ModelAndView detail(@RequestParam Long num)
	{
		ModelAndView model=new ModelAndView();
		
		MyCarDto dto=dao.getData(num);// dto에 dao에서 가져온 num에 해당하는 데이터를 넘김
		
		model.addObject("dto", dto);
		
		model.setViewName("detail");
		
		return model;
	}
}
