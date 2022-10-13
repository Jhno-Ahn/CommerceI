package issueHandler;


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
public class IssueConfirmProHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	@Resource
	private IssueDao issueDao;
	
	@RequestMapping("CI_View/issuePage/issueConfirmPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		    IssueDataBean wdto = new IssueDataBean();
		    wdto.setIssueNum(Integer.parseInt(request.getParameter("issueNum")));
			//int result = issueDao.doArticle(wdto); //이슈매니저가 내 아이디인거 아이디매칭으로 빼오기
			//request.setAttribute("result", result);
			
		return new ModelAndView("issuePage/issueConfirmPro");
	}
}
