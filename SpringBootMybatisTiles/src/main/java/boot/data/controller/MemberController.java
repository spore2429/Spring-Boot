package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller

public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/myinfo")
	public String info(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		
		
		return "/member/myinfo";
		
	}
	
	@GetMapping("/member/list")
	public ModelAndView memberlist()
	{
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addObject("list", list);
		model.addObject("totalcount", list.size());
		
		model.setViewName("/member/memberlist");
		
		return model;
	}
	
	@GetMapping("/member/memberform")
	public String form()
	{
		return "/member/addform";
	}
	
	@GetMapping("/member/idcheck") 
	@ResponseBody
	public Map<String, Integer> id(@RequestParam String id)
	{
		Map<String, Integer> map=new HashMap<>();
		
		int n=service.getSearchId(id);
		
		map.put("count", n);  //0 or 1
		
		return map;
	}
	
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			MultipartFile myphoto,
			HttpSession session,Model model)
	{
		

	    //업로드 경로구하기
			String path=session.getServletContext().getRealPath("/save");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//시분초까지 표시하므로 이름이 겹칠일이없음
			System.out.println(path);

				//사진명 구해서 넣기
				String fileName=sdf.format(new Date())+myphoto.getOriginalFilename();

				dto.setPhoto(fileName);
						
				//업로드
				try {
					myphoto.transferTo(new File(path+"/"+fileName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	     
	
		service.insertMember(dto);
		
		//name값 넘기기
		
		String name=service.getName(dto.getId());
		
		model.addAttribute("name", name);
		
		return "/member/gaipsuccess";
	}
	
	@GetMapping("/member/detail")
	public ModelAndView detail(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		MemberDto dto=service.getMemberData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("/member/myinfo");
		
		return model;
	}
	
	//삭제
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num)
	{
		service.deleteMember(num);
		
	}
	
	//사진만수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(@RequestParam String num, //photo는 DB명
			MultipartFile photo,
			HttpSession session)
	{
		//업로드할 경로
		String path=session.getServletContext().getRealPath("/save");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+photo.getOriginalFilename();
		session.setAttribute("loginphoto", fileName);

		//이전사진
		String pre_photo=service.getMemberData(num).getPhoto();
		
		//이전사진 삭제
		File file=new File(path+"/"+pre_photo);
		file.delete();
		
		//업로드
		try {
			photo.transferTo(new File(path+"/"+fileName));
			
			service.updatePhoto(num, fileName); //photo에서 받아온 fileName을 넘겨준다 //db사진수정
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void photodelete(@RequestParam String num,
			HttpSession session)
	{
		//업로드할 경로
		String path=session.getServletContext().getRealPath("/save");
				
		//이전사진
		String pre_photo=service.getMemberData(num).getPhoto();
				
		//이전사진 삭제
		File file=new File(path+"/"+pre_photo);
		file.delete();

		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
		
		
	}
	
	
	//수정폼에 출력할 dto반환
		@GetMapping("/member/updateform") //ajax는 포워드가없으므로 타입 String x
		@ResponseBody
		public MemberDto getData(String num)
		{
			return service.getMemberData(num); //return값 dto
		}

		//수정
		@PostMapping("/member/update")
		@ResponseBody
		public void update(MemberDto dto)  //넘어올값이없음
		{
			service.updateMember(dto);
			
		}
	
	
	
	
	
}
