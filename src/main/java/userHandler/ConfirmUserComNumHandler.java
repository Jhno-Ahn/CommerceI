package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller
public class ConfirmUserComNumHandler implements CommandHandler{
	@Resource
	private UserDao userDao;
	
	@RequestMapping("/CI_View/userPage/confirmUserComNum")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		String userComNum = request.getParameter("userComNum");
		int result = userDao.checkComNum(userComNum); //아이디가 있으면 1을 리턴, 없으면 0을 리턴
		
		request.setAttribute("result", result);
		//result 넘기기
		request.setAttribute("userComNum", userComNum);
		
		return new ModelAndView("userPage/confirmUserComNum");
	}
	
	

}
