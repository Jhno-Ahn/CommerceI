package issueHandler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import issue.IssueDao;
import issue.IssueDataBean;
import user.UserDao;

@Controller
public class IssueListHandler implements CommandHandler{

   @Resource
   private UserDao userDao;
   @Resource
   private IssueDao issueDao;
   
   @RequestMapping("/CI_View/issueList")
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
      
      int pageSize = 5;          // 한 페이지의 출력할 갯수
      int pageBlock = 5;         // 한 페이지에 나타낼 페이지 갯수
      
      int count = 0;            // 등록되어 있는 글의 갯수
      String pageNum = null;      // 현재 페이지(처음 입장 시 에는 pageNum이 1)
      int currentPage = 0;      // 현재 페이지(pageNum을 숫자화)
      int start = 0;            // 각 페이지 당 시작하는 글의 no
      int end = 0;            // 각 페이지 당 끝나는 글의 no
      int number = 0;            // 각 페이지 당 가장 위에 있는 글의 no
      
      int pageCount = 0;         // 페이지의 실질적 갯수(count, pageSize에 따라 달라짐)
      int startPage = 0;         // pageBlock에서 시작되는 페이지의 no
      int endPage = 0;         // pageBlock에서 끝나는 페이지의 no

      pageNum = request.getParameter("pageNum");
      
      if(pageNum == null){
         // 페이지가 안넘어올 시
         pageNum = "1";
      }
      currentPage = Integer.parseInt(pageNum);
      
      start = (currentPage -1 ) * pageSize + 1;      //(5-1) * 10 + 1          41
      
      end = start + pageSize - 1;                  //41 + 10 - 1            50
      
      count = issueDao.getCount();
      if(end > count)end = count;
      
      number = count - (currentPage - 1) * pageSize;         //50 - (5 - 1) * 10         10
      
      pageCount = (count / pageSize) + (count % pageSize > 0 ? 1 : 0);
      
      startPage = (currentPage/pageBlock) * pageBlock + 1;   //      (5/10) * 10 + 1
      if(currentPage % pageBlock == 0)startPage -= pageBlock; 
      endPage = startPage + pageBlock - 1;
      if(endPage > pageCount) endPage = pageCount;
      
      request.setAttribute("count", count);            // 등록되어 있는 글의 갯수
      request.setAttribute("number", number);            // 각 페이지 당 가장 위에 있는 글의 no
      request.setAttribute("startPage", startPage);      // pageBlock에서 시작되는 페이지의 no
      request.setAttribute("endPage", endPage);         // pageBlock에서 끝나는 페이지의 no
      request.setAttribute("pageBlock", pageBlock);      // 한 페이지에 나타낼 페이지 갯수
      request.setAttribute("currentPage", currentPage);   // 현재 페이지(pageNum을 숫자화)
      request.setAttribute("pageNum", pageNum);         // 현재 페이지(처음 입장 시 에는 pageNum이 1)
      request.setAttribute("pageCount", pageCount);      // 페이지의 실질적 갯수(count, pageSize에 따라 달라짐)
      
      if(count != 0) {
         Map<String, Integer> map = new HashMap<String, Integer>();
         map.put("start", start);
         map.put("end", end);
         
         List<IssueDataBean> dtos = issueDao.getList(map);
         request.setAttribute("dtos", dtos);
      }
      
      return new ModelAndView("issueList");
   }

}