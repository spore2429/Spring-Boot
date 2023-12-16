package data.model.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OliverController {

	@Autowired
	OliverInter oliver;
	
	@GetMapping("/oliver/level")
	@ResponseBody
	public Map<String, Integer> levelform(@RequestParam int cnt) {
		
		cnt++;
		
		Map<String, Integer> map=new HashMap<>();
		map.put("cnt", cnt);
		
		return map;
	}
	
	@GetMapping("/oliver/leveladdform")
	public String levelform() {
		return "leveladdform";
	}
	
	@PostMapping("/oliver/levelinsert")
	public ModelAndView insert(@RequestParam String company,String clevel,String step) {
		ModelAndView model=new ModelAndView();
		model.setViewName("view");
		
		clevel=clevel.substring(0, clevel.length()-1);
		step=step.substring(0, step.length()-1);
		BosoDto bosodto=new BosoDto();
		bosodto.setCompany(company);
		
		//model.addObject("company", company);
		//model.addObject("clevel", clevel);
		//model.addObject("step", step);
		String [] levels=clevel.split(",");
		String [] idxarr1=step.split(",");
		int [] idxarr=new int [idxarr1.length];
		
		int j=0;
		for(String idx:idxarr1) {
			int idxnum=Integer.parseInt(idx);
			idxarr[j]=idxnum;
			j++;
		}
		
		for(int i=0;i<levels.length;i++) {
			bosodto.setClevel(levels[i]);
			bosodto.setStep(idxarr[i]+1);
			oliver.insertBoso(bosodto);
		}
		
	return model;
	}
	
	@GetMapping("/oliver/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView model=new ModelAndView();
		model.setViewName("view");
		
		session.setAttribute("logincompany", "영환기업");
		String company=(String)session.getAttribute("logincompany");
		List<BosoDto> list=oliver.getAllBoso(company);
		model.addObject("list", list);
		
		List<WabosoDto> list2=oliver.getAllWasboso();
		model.addObject("list2", list2);
		
		return model;
	}
}
