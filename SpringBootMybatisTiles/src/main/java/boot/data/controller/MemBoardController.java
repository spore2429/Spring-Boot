package boot.data.controller;


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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.service.MemBoardService;
import boot.data.service.MemberService;

@Controller
@RequestMapping("/memboard")
public class MemBoardController {

	@Autowired
	MemBoardService service;
	
	@Autowired
	MemberService mservice;
	
	

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage
			)
	{
		
		ModelAndView model=new ModelAndView();
		
		 //페이징처리에 필요한 변수선언
	      int totalCount=service.getTotalCount(); //전체갯수
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
	      List<MemBoardDto> list=service.getList(startNum, perPage);

	      //각페이지에서 보여질 시작번호   
	      int no=totalCount-(currentPage-1)*perPage;
				          
	      model.addObject("totalCount", totalCount);
	      model.addObject("list", list); //댓글포함후 전달
	      model.addObject("startPage", startPage);
	      model.addObject("endPage", endPage);
	      model.addObject("totalPage", totalPage);
	      model.addObject("currentPage", currentPage);
	      model.addObject("no", no);

	      model.setViewName("/memboard/memlist");
	      return model;

	}
	
	@GetMapping("/form")
	public String form()
	{
		return "/memboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemBoardDto dto,
			HttpSession session)
	{
		
		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/savefile");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//시분초까지 표시하므로 이름이 겹칠일이없음
		
		//업로드안한경우
		if(dto.getUpload().getOriginalFilename()==null)
		{
			dto.setUploadfile("no");
			
		//업로드한경우
		} else {
			
			//사진명 구해서 넣기
			String uploadFile=sdf.format(new Date())+dto.getUpload().getOriginalFilename();

			dto.setUploadfile(uploadFile);

			try {
				dto.getUpload().transferTo(new File(path+"/"+uploadFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 아이디 얻어서 dto에저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//이름값얻기 (세션도가능)
		String name=mservice.getName(myid);
		dto.setName(name);
		
		//String name=(String)session.getAttribute("loginname");
		//dto.setName(name);
		
		
		service.insertBoard(dto);
		
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//조회수 증가
		service.updatereadcount(num);
		
		MemBoardDto dto=service.getData(num);
		model.addObject("dto", dto);
		
		//업로드 파일의 확장자 얻기
		int dotLoc=dto.getUploadfile().lastIndexOf('.'); //마지막 점의 위치
		String ext=dto.getUploadfile().substring(dotLoc+1); //jsp 다음글자부터 끝까지 추출
				
		System.out.println(dotLoc+","+ext);
				
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || 
				ext.equalsIgnoreCase("webp") || ext.equalsIgnoreCase("jpeg"))
		
			model.addObject("bupload", true);
		else
			model.addObject("bupload", false);
		
		
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/memboard/content");
		
		return model;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/uform")
	public String updateform(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		return "/memboard/updateform?currentPage="+currentPage;
	}
}
