package createBean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import issue.IssueDBBean;
import issue.IssueDao;
import user.UserDBBean;
import user.UserDao;


@Configuration
public class CreateBean {
	
	
	@Bean
	public UserDao userDao() {
		return new UserDBBean();
	}
	
	@Bean
	public IssueDao issueDao() {
		return new IssueDBBean();
	}
	
	/*
	@Bean
	public MatchBoardDao matchBoardDao() {
		return new MatchBoardDBBean();
	}
	
	@Bean
	public StoryDao storyDao() {
		return new StoryDBBean();
	}
	*/
	
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/CI_View/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	

}
