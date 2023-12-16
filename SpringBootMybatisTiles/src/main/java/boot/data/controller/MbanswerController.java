package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@RestController
@RequestMapping("/mbanswer")
public class MbanswerController {

	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute MbanswerDto dto,
			HttpSession session)
	{
		String myid=(String)session.getAttribute("myid");
		String loginname=(String)session.getAttribute("loginname");
		
		dto.setMyid(myid);
		dto.setName(loginname);
		
		mapper.insertMbanswer(dto);
	}
	
	@GetMapping("/alist")
	public List<MbanswerDto> alist(@RequestParam String num,
			@RequestParam(value = "currentPage",defaultValue = "1") int currentPage)
	{
		
		 return mapper.getAllAnswers(num);

	}
	
	@PostMapping("/adelete")
	public void delete(@RequestParam String idx)
	{
		mapper.deleteAnswer(idx);
	}
	
	//수정창 content띄우기
	@GetMapping("/adata")
	public MbanswerDto getData(@RequestParam String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/aupdate")
	public void update(@ModelAttribute MbanswerDto dto)
	{
		mapper.updateMbanswer(dto);
	}
}
