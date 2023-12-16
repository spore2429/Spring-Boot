package test.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@GetMapping("/server/channel")
	public String channe1()
	{
		return "chatform";
	}
	
	@PostMapping("/server/inforead")
	public ModelAndView model(@RequestParam String chatName,
			@RequestParam String message)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", chatName);
		model.addObject("message", message);
		
		
		model.setViewName("chatresult");
		
		return model;

	}
}
