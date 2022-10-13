package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import user.UserDao;
import user.UserDataBean;

@Controller
public class UserModifyHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("/CI_View/userPage/userModify")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		String userId = request.getParameter("userId");
		UserDataBean dto = userDao.getUser(userId);
		request.setAttribute("userId", userId);
		request.setAttribute("dto", dto);
		
		return new ModelAndView("userPage/userModify");
	}
	
	
	
	

}
