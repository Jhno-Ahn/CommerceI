package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;

@Controller
public class LoginProHandler implements CommandHandler{
	
	@Resource
	private UserDao logonDao;
	//패키지 달라서 import
	//객체가 여러개가 생긴건 아님 
	
	@RequestMapping("CI_View/userPage/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {

		//로그인 프로에 있는 코드를 잘라서 옮김
		   String userId = request.getParameter( "userId" );
		   String userPasswd = request.getParameter( "userPassword" );
		  
		   int result = logonDao.check( userId, userPasswd );
		   
		   request.setAttribute("result", result);
		   request.setAttribute("userId", userId);
		   //${id}
		
		return new ModelAndView("userPage/loginPro");
	}

}
