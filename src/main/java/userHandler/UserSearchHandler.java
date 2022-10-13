package userHandler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.UserDao;
import user.UserDataBean;

@Controller
public class UserSearchHandler implements CommandHandler{
	
	@Resource
	private UserDao userDao;
	
	@RequestMapping("/CI_View/userPage/userSearch")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null) {
			List<UserDataBean> dtos = userDao.getList();
			request.setAttribute("dtos", dtos);
		} else {
			List<UserDataBean> dtos = userDao.getSearchList(searchWord);
			request.setAttribute("dtos", dtos);
		}
		
		return new ModelAndView("userPage/userSearch");
	}
}