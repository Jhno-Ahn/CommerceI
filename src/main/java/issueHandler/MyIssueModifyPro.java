package issueHandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import issue.IssueDao;
import issue.IssueDataBean;

@Controller
public class MyIssueModifyPro implements CommandHandler{
	@Resource
	private IssueDao issueDao;
	
	@RequestMapping("CI_View/issuePage/myIssueModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String path = "/C:\\Users\\BIT\\git\\CommerceI\\src\\main\\webapp\\image"; 
		MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*30, "utf-8", new DefaultFileRenamePolicy() );
		String sysFileName = multi.getFilesystemName("issueFile");
		
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("memId");
	    request.setAttribute("userId", userId);

		IssueDataBean dto = new IssueDataBean();
		
		dto.setIssueNum(Integer.parseInt(multi.getParameter("issueNum")));
		dto.setIssueTitle(multi.getParameter("issueTitle"));
		dto.setIssueWriter(multi.getParameter("issueWriter"));
		dto.setIssueType(multi.getParameter("issueType"));
		dto.setIssueOpt(multi.getParameter("issueOpt"));
		dto.setIssueContent(multi.getParameter("issueContent"));
		dto.setIssueDpmt(multi.getParameter("issueDpmt"));
		dto.setIssueFile(sysFileName);
		
		int result = issueDao.modifyIssue(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("issuePage/myIssueModifyPro");
	}
}
