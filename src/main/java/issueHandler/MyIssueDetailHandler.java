package issueHandler;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import issue.IssueDao;
import issue.IssueDataBean;
import reply.ReplyDao;
import reply.ReplyDataBean;
import user.UserDao;

@Controller
public class MyIssueDetailHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	@Resource
	private IssueDao issueDao;
	@Resource
	private ReplyDao replyDao;
	
	@RequestMapping("CI_View/issuePage/myIssueDetail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
			// 글 번호
			int issueNum = Integer.parseInt(request.getParameter("issueNum"));
			// 세션
			HttpSession session = request.getSession();    
			String loginId = (String)session.getAttribute("memId");	
			
		/*----------------------------댓글 작성-----------------------------------*/
			
		  String replyContent = request.getParameter("replyContent");
		  String A = request.getParameter("A");
		  if(A != null) {
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("replyContent", replyContent);
			  map.put("replyWriter", loginId);
			  map.put("replyIssueNum", issueNum);
			  replyDao.insertReply(map);
		  }
		/*-----------------------------------------------------------------------*/  
		  
		  
		  
		  
		  
	    /*----------------------------댓글 출력-----------------------------------*/
		  int replyIssueNum = Integer.parseInt(request.getParameter("issueNum"));
		  List<ReplyDataBean> rdto = replyDao.getReplyList(replyIssueNum);
		  request.setAttribute("rdto", rdto);
		/*--------------------------------------------------------------------------*/	  
		  
		  
		  
		
		/*----------------------------내 업무 상세글-----------------------------------*/
		
		  IssueDataBean dto = issueDao.getArticle(issueNum);
		  request.setAttribute("dto", dto);
		  
		/*--------------------------------------------------------------------------*/
		
		
		return new ModelAndView("issuePage/myIssueDetail");
	}
}
