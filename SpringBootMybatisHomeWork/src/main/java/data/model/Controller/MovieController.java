package data.model.Controller;

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

import data.model.dto.MovieDto;
import data.model.mapper.MovieMapperInter;

@Controller
public class MovieController {

	@Autowired
	MovieMapperInter mapper;
	
	//리스트
	@GetMapping("/movie/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		int totalcount=mapper.getMoiveTotalCount();
		List<MovieDto> list=mapper.getAllMovies();
		
		model.addObject("totalcount", totalcount);
		model.addObject("list", list);
		
		model.setViewName("movie/movielist");
		
		return model;
	}
	
	@GetMapping("/movie/writeform")
	public String writeform()
	{
		return "movie/addform";
	}
	
	@PostMapping("/movie/insert")
	public String write(@ModelAttribute MovieDto dto,
			MultipartFile mv_upload,
			HttpSession session)
	{
		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/moviephoto");
		System.out.println(path);

		
			//사진명 구해서 넣기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String postername=sdf.format(new Date())+mv_upload.getOriginalFilename();

			dto.setMv_poster(postername);
					
			//업로드
			try {
				mv_upload.transferTo(new File(path+"/"+postername));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					

		mapper.insertMovie(dto);
		
		return "redirect:list";
	}
	
	
	@GetMapping("movie/detail")
	public ModelAndView detailpage(@RequestParam String mv_num)
	{
		ModelAndView model=new ModelAndView();
		
		MovieDto dto= mapper.getMovieData(mv_num);
		
		model.addObject("dto", dto);
		
		model.setViewName("movie/content");
		
		return model;
	}
}
