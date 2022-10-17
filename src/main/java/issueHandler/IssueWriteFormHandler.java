package issueHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IssueWriteFormHandler implements CommandHandler {
	
	@RequestMapping("CI_View/issuePage/issueWriteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
	HttpSession session = request.getSession();   // 세션을 가져오는 구문 
    String userId = (String)session.getAttribute("memId");
    
    request.setAttribute("userId", userId);
    
    
		return new ModelAndView("issuePage/issueWriteForm");
	}
}
