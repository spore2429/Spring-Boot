package boot.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	/*@GetMapping("/login/main")
	public String loginform()
	{
		return "/sub/login/loginform";
	}*/
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session,Model model)
	{
		//폼의 아이디
		String myid=(String)session.getAttribute("myid");
		
		//로그인상태 확인
		String loginok=(String)session.getAttribute("loginok");
		
		
		
		//로그인 한번도 실행안하면 null 
		if(loginok==null)
		{
			return "/login/loginform";
			
		} else {
			
			//로그인중이면 request에 name저장(모델로 넘겨야함)
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/login/logoutform";
		}
	
		
	}
	
	 //로그인처리
	 @PostMapping("/login/loginprocess") //아이디,비밀번호,아이디저장 3개 넘겨야함
	 public String loginproc(@RequestParam String id,
			 @RequestParam String pass,
			 @RequestParam(required = false) String cbsave, //체크여부 기본값주기
			 HttpSession session) 
	 { 
		 
		HashMap<String, String> map=new HashMap<>();
		int check=service.LoginPassCheck(id, pass);
		
		if(check==1)
		{
			session.setMaxInactiveInterval(60*60*8); //8시간
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			MemberDto mdto=service.getDataByid(id);
			
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginname", mdto.getName());
			session.setAttribute("loginhp", mdto.getHp());
			session.setAttribute("loginaddr", mdto.getAddr());
			session.setAttribute("loginpass", mdto.getPass());
			
			return "redirect:main";
		}else {
			
			
			return "/member/passfail";
		}
		  

		 
	 }
	 
	 @GetMapping("/login/logoutprocess")
	 public String logout(HttpSession session)
	 {
		 session.removeAttribute("loginok");
		 session.removeAttribute("myid");
		 
		 return "redirect:main";
	 }
}
