package userHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;
import user.UserDataBean;

@Controller //@Controller 어노테이션은 클래스를 Controller로 지정
public class UserRegProHandler implements CommandHandler{
	
	@Resource //@Resource 어노테이션은 빈 이름을 이용해서 의존성을 주입함.
	private UserDao userDao;
	
	@RequestMapping("CI_View/userPage/userRegPro") //@RequestMapping()은 ()안에 있는 경로와 컨트롤러를 이어주는 역할(매핑)
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		
		UserDataBean dto = new UserDataBean();
		dto.setUserId(request.getParameter("userId"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserPasswd(request.getParameter("userPasswd"));
		dto.setUserComNum(request.getParameter("userComNum"));
		dto.setUserLevel(request.getParameter("userLevel"));
		dto.setUserDpmt(request.getParameter("userDpmt"));
		dto.setUserTel(request.getParameter("userTel"));
		dto.setUserEmail(request.getParameter("userEmail"));
		
		int result = userDao.insertUser(dto);
		
		request.setAttribute("userId", userId);
		request.setAttribute("result", result);
		
		return new ModelAndView("userPage/userRegPro");
	}
	

}
