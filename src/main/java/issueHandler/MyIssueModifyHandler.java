package issueHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import issue.IssueDao;
import issue.IssueDataBean;

@Controller
public class MyIssueModifyHandler implements CommandHandler {
	@Resource
	private IssueDao issueDao; 
	
	
	@RequestMapping("CI_View/issuePage/myIssueModify")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("memId");
	    
		int issueNum = Integer.parseInt(request.getParameter("issueNum"));
		IssueDataBean dto = issueDao.getIssue(issueNum);
	    
	    request.setAttribute("issueNum", issueNum);
	    request.setAttribute("userId", userId);
	    request.setAttribute("dto", dto);
		
		return new ModelAndView("issuePage/myIssueModify");
	}
}
