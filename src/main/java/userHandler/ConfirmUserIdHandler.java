package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller
public class ConfirmUserIdHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("/CI_View/userPage/confirmUserId")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		String userId = request.getParameter("userId");
		int result = userDao.checkId(userId); //아이디가 있으면 1을 리턴, 없으면 0을 리턴
		
		request.setAttribute("result", result);
		//result 넘기기
		request.setAttribute("userId", userId);
		
		return new ModelAndView("userPage/confirmUserId");
	}
	
	

}
