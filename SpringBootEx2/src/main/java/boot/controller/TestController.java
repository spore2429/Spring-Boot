package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", "이민규");
		model.addObject("addr", "사가정역\t1번출구");
		
		model.setViewName("list");
		
		return model;
		
	}
}
