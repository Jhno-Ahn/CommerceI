package issueHandler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import issue.IssueDao;
import issue.IssueDataBean;
import user.UserDao;

@Controller
public class IssueConfirmHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	@Resource
	private IssueDao issueDao;
	
	
	@RequestMapping("/CI_View/issuePage/issueConfirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
				
				String issueNum_A = (String)request.getParameter("issueNum");
				if(issueNum_A != null) {
					int issueNum = Integer.parseInt(issueNum_A);
					issueDao.doArticle(issueNum);
				}
				
			    String userId = (String)request.getParameter("userId");
			    request.setAttribute("userId", userId);
				List<IssueDataBean> dtos = issueDao.getMyList(userId);	//겟마리쿼리문으로 유저아이디 매칭으로 그내용빼오기 
				request.setAttribute("dtos", dtos);
				
				
				List<IssueDataBean> wdtos = issueDao.getMyWork(userId); //이슈매니저가 내 아이디인거 아이디매칭으로 빼오기
				request.setAttribute("wdtos", wdtos);
				
				List<IssueDataBean> refusedtos = issueDao.getRefuseWork(userId); //이슈매니저가 내 아이디인거 아이디매칭으로 빼오기
				request.setAttribute("refusedtos", refusedtos);
		
			
			
		
		return new ModelAndView("issuePage/issueConfirm");
	}
	
	

}
