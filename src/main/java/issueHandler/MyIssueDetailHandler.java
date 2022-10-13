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
public class MyIssueDetailHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	@Resource
	private IssueDao issueDao;
	
	@RequestMapping("CI_View/issuePage/myIssueDetail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {

		int issueNum = Integer.parseInt(request.getParameter("issueNum"));
		
		IssueDataBean dto = issueDao.getArticle(issueNum);
	
		request.setAttribute("dto", dto);
		
		return new ModelAndView("issuePage/myIssueDetail");
	}
}
