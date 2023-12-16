package boot.controller;



import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.dto.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1()
	{
		return "form/form1";
	}
	
	@PostMapping("/sist/read1")
	public ModelAndView result1(@RequestParam String irum,
			@RequestParam int java,
			@RequestParam int spring)
	{
		ModelAndView model=new ModelAndView();
		model.addObject("irum", irum);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");
		
		return model;
	}
	
	@GetMapping("/sist/form2")
	public String form2()
	{
		return "form/form2";
	}
	
	/*
	 * @PostMapping("/sist/write2") public String formread2(@ModelAttribute PersonDto
	 * dto,Model model) { model.addAttribute("name",dto.getName());
	 * model.addAttribute("addr",dto.getAddr());
	 * model.addAttribute("hp",dto.getHp());
	 * 
	 * return "result/result2"; }
	 */
	
	@PostMapping("/sist/write2")
	public String formread2(@ModelAttribute("dto") PersonDto dto)
	{
		
		return "result/result2";
	}
	
	@GetMapping("/sist/form3")
	public String form3()
	{
		return "form/form3";
	}
	
	@PostMapping("/sist/myread")
	public String formread3(@RequestParam Map<String, String> map,Model model)
	{

		model.addAttribute("name", map.get("name")); //form의 name이 key값이 되므로 ""
		model.addAttribute("blood", map.get("blood"));
		model.addAttribute("age", map.get("age"));
		
		return "result/result3";
	}
}
