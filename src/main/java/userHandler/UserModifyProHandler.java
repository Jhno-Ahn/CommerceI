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
public class UserModifyProHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("CI_View/userModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		UserDataBean dto = new UserDataBean();
		dto.setUserId((String)request.getSession().getAttribute("memId"));
		dto.setUserPasswd(request.getParameter("userPasswd"));
		dto.setUserTel(request.getParameter("userTel"));
		dto.setUserEmail(request.getParameter("userEmail"));
		
		int result = userDao.modifyUser(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("userPage/userModifyPro");
	}
	
	

}
