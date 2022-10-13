package userHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LogoutHandler implements CommandHandler{
	//세션 지우고 메인으로 돌리면 됨
	@RequestMapping("CI_View/userPage/logOut")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		request.getSession().removeAttribute("memId");
		//세션 객체 얻어오기, 없애기

		return new ModelAndView("userPage/loginForm");
	}
	

}
