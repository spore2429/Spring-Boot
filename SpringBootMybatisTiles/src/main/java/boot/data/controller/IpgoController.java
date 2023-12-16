package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {

   @Autowired
   IpgoMapperInter mapper;

   @GetMapping("/")
   public String start()
   {
      return "/layout/main";  //포트번호만 적어도 알아서 리스트로감
   }

   @GetMapping("/ipgo/list")
   public ModelAndView list()
   {
      ModelAndView model=new ModelAndView();

      int totalcount=mapper.getTotalCount();
      List<IpgoDto> list=mapper.getAllIpgos();

      model.addObject("totalcount", totalcount);
      model.addObject("list", list);

      model.setViewName("/ipgo/ipgolist");

      return model;
   }

   @GetMapping("/ipgo/ipgoform")
   public String ipgoform()
   {
      return "/ipgo/ipgoform";
   }
   
   @PostMapping("/ipgo/insert")
   public String insert(@ModelAttribute IpgoDto dto,
         @RequestParam ArrayList<MultipartFile> photo,
         HttpSession session)
   {

      //실제경로
      String path=session.getServletContext().getRealPath("/upload");
      System.out.println(path);

      SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//시분초까지 표시하므로 이름이 겹칠일이없음


      String uploadName="";

      if(photo.get(0).getOriginalFilename().equals("")) //0번지의 파일이름이 빈문자열이면 uploadName은 no
         uploadName="no";

      else {

         for(MultipartFile f:photo)
         {
            String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
            uploadName+=fName+","; //파일이름에 ,를 추가 db엔 콤마가 들어가서 저장

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

         //photo에서 마지막 컴마 제거"(사진이 나올때는 콤마가 제거되서 나와야함)
         uploadName=uploadName.substring(0, uploadName.length()-1);

      }
      //dto의 photo에 넣기
      dto.setPhotoname(uploadName);

      mapper.insertIpgo(dto);

      return "redirect:list";

   }

   @GetMapping("/ipgo/content")
   public ModelAndView detail(@RequestParam String num)
   {

      ModelAndView model=new ModelAndView();

      IpgoDto dto=mapper.getIpgoData(num);

      model.addObject("dto", dto);

      model.setViewName("/ipgo/detail");


      return model;
   }

   @GetMapping("/ipgo/uform")
   public ModelAndView updateform(@RequestParam String num)
   {
      ModelAndView model= new ModelAndView();

      IpgoDto dto= mapper.getIpgoData(num);

      model.addObject("dto", dto);

      model.setViewName("/ipgo/updateform");

      return model;
   }

   @PostMapping("/ipgo/update")
   public String update(@ModelAttribute IpgoDto dto,
         @RequestParam ArrayList<MultipartFile> photo,
         HttpSession session)
   {

      String path=session.getServletContext().getRealPath("/upload");
      System.out.println(path);
      SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
            
            String uploadName="";
            String pre_photo=mapper.getIpgoData(dto.getNum()).getPhotoname();
            
            
            //사진선택안할경우 null 이전사진 가져오기
            if(photo.get(0).getOriginalFilename().equals(""))
            {
            	uploadName="no";
            	dto.setPhotoname("noimg.jpg");
                
            }
            
            
            else {
               
               
               String []pre_fName=pre_photo.split(",");
               
               for(String f:pre_fName)
               {
                  File file=new File((path+"\\"+f));
                  file.delete();
               }
            
               for(MultipartFile f:photo)
               {
                  String fName=sdf.format(new Date())+"-"+f.getOriginalFilename();
                  uploadName+=fName+",";
                  
                  try {
                     f.transferTo(new File(path+"\\"+fName));
                  } catch (IllegalStateException e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
                  } catch (IOException e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
                  }
               }

            //photo에서 마지막 컴마 제거
            uploadName=uploadName.substring(0, uploadName.length()-1);
            
            dto.setPhotoname(uploadName);
            
            //update
            mapper.updateIpgo(dto);
         }
         
      //수정후 디테일페이지로 이동
      return "redirect:list";
   }
   
   
   @GetMapping("/ipgo/delete")
   public String delete(@RequestParam String num,
         HttpSession session)
   {
      
      String path=session.getServletContext().getRealPath("/upload");
      System.out.println(path);
            
               
      String pre_photo=mapper.getIpgoData(num).getPhotoname();
      
      String []pre_fName=pre_photo.split(",");
      for(String f:pre_fName)
      {
         File file=new File((path+"\\"+f));
         file.delete();
      }

      mapper.deleteIpgo(num);

      return "redirect:list";
   }
}