package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@RequestMapping("/reboard")
@Controller
public class ReBoardController {

	@Autowired
	ReboardService service;
	
	@GetMapping("/list")
	public ModelAndView boardlist(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value="searchcolumn",required = false) String sc,
			@RequestParam(value="searchword",required = false) String sw) //(required=false)로 지정하면 해당 키값이 존재하지 않다고 해서 BadRequest가 발생하지 않는다.
	{
		ModelAndView model=new ModelAndView();
		
		//페이징처리에 필요한 변수선언
	      int totalCount=service.getTotalCount(sc, sw); //전체갯수
	      int totalPage; //총 페이지
	      int startPage; //각블럭에서 보여질 시작페이지
	      int endPage; //각블럭에서 보여질 끝페이지
	      int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
	      int perPage=5; //한페이지당 보여질 글의 갯수
	      int perBlock=5; //한블럭당 보여질 페이지 개수
	      
	      //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	        
	        //각블럭당 보여야할 시작페이지
	        //perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
	        //현재페이지 13  시작:11  끝:15
	        startPage=(currentPage-1)/perBlock*perBlock+1;
	          
	        endPage=startPage+perBlock-1;

	        if (endPage > totalPage)
	            endPage = totalPage;
	        
	      //1페이지: 0,2페이지:5 3페이지:10....
	      startNum=(currentPage-1)*perPage;
	      
	      //각페이지에서 필요한 게시글 가져오기
	      List<ReboardDto> list=service.getPaginList(sc, sw, startNum, perPage);

	      //각페이지에서 보여질 시작번호   
	      int no=totalCount-(currentPage-1)*perPage;
	          
	      model.addObject("totalCount", totalCount);
	      model.addObject("list", list); //댓글포함후 전달
	      model.addObject("startPage", startPage);
	      model.addObject("endPage", endPage);
	      model.addObject("totalPage", totalPage);
	      model.addObject("currentPage", currentPage);
	      model.addObject("no", no);
		
	      System.out.println("totalCount="+totalCount);
	      
		model.setViewName("/reboard/boardlist");
		
		return model;
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam int num,
			@RequestParam int currentPage)
	{
		
		ModelAndView model=new ModelAndView();
		//조회수 증가
		service.updateReadCount(num);
		
		ReboardDto dto= service.getData(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/reboard/content");
		return model;
	}
	
	@GetMapping("/form")
	public String reform(@RequestParam(defaultValue = "0") int num, //num이없는 경우null
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model)
	{
		//답글일경우에만 넘어오는 값들이다
		
		//새글일경우는 모두 null이므로 defaultValue만 값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("relevel", relevel);
		model.addAttribute("restep", restep);
		model.addAttribute("currentPage", currentPage);
		
		//새글일경우에는 "",답글일 경우에는 원글제목 가져오기
		String subject="";
		if(num>0)//답글일경우
		{
			subject=service.getData(num).getSubject();
		}
		
		model.addAttribute("subject", subject);
	

		return "/reboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReboardDto dto,
			@RequestParam int currentPage,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		
		//실제경로
				String path=session.getServletContext().getRealPath("/rephoto");
				System.out.println(path);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
				
				String photo="";
				
				//사진선택안했을경우
				if(upload.get(0).getOriginalFilename().equals(""))
					photo=null;
				
				//사진선택한경우
				else {
				
					for(MultipartFile f:upload)
					{
						String fName=sdf.format(new Date())+"-"+f.getOriginalFilename();
						photo+=fName+",";
						
						
							try {
								f.transferTo(new File(path+"/"+fName));
							} catch (IllegalStateException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						
					}

				//photo에서 마지막 컴마 제거
				photo=photo.substring(0, photo.length()-1);
				}//else
				

				//dto의 photo에 넣기
				dto.setPhoto(photo);
				
				String loginok=(String)session.getAttribute("loginok");
				
				String id=(String)session.getAttribute("myid");
				String name=(String)session.getAttribute("loginname");
				
				if(loginok==null)
				{
					dto.setId("guest");
					dto.setName("비회원");
				}else {
					
					dto.setId(id);
					dto.setName(name);
				}
				
				//insert
				service.insertReboard(dto);
				
				//맥스넘
				int num=service.getMaxNum();
				
				return "redirect:content?num="+num+"&currentPage="+currentPage;
			}
			
			@ResponseBody
			@GetMapping("/updatelike")
			public Map<String, Integer> like(@RequestParam int num)
			{
				Map<String, Integer> map=new HashMap<>();
				
				service.updateLikes(num);
				int likes=service.getData(num).getLikes();
				
				map.put("likes", likes);
				
	
				
				return map;
			}
			
	}
