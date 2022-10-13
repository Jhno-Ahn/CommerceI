package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller //@Controller 어노테이션은 클래스를 Controller로 지정
public class UserRegFormHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("CI_View/userPage/userRegForm") //@RequestMapping()은 ()안에 있는 경로와 컨트롤러를 이어주는 역할(매핑)
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		return new ModelAndView("userPage/userRegForm");
		//model, modelAndView 차이점: 
		//model: 데이터만 저장
		//modelAndView: 데이터와 이동하고자 하는 viewPage 저장
	}
	
	

}
