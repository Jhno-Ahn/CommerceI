package issueHandler;

import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import issue.IssueDao;
import issue.IssueDataBean;

@Controller
public class IssueWriteProHandler implements CommandHandler {
	
	@Resource
	private IssueDao issueDao;
	
	@RequestMapping("CI_View/issuePage/issueWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse respones) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String path = "/C:\\AI\\Workspace\\Commerce_I\\src\\main\\webapp\\image"; 
		MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*30, "utf-8", new DefaultFileRenamePolicy() );
		String sysFileName = multi.getFilesystemName("issueFile");
		
		
		IssueDataBean dto = new IssueDataBean();
//		dto.setIssueNum(Integer.parseInt(request.getParameter("issueNum")));
		
		//Jsp단에서 파일전송을 위한 인코딩을 위해서는 MultipartRequest를 통해 데이터를 받아야한다.
		dto.setIssueType(multi.getParameter("issueType"));
		dto.setIssueOpt(multi.getParameter("issueOpt"));
		dto.setIssueTitle(multi.getParameter("issueTitle"));
		dto.setIssueContent(multi.getParameter("issueContent"));
		dto.setIssueWriter(multi.getParameter("issueWriter"));
		dto.setIssueFile(sysFileName);
		dto.setIssueDate(new Date(System.currentTimeMillis()));
		dto.setIssueEndDate(new Date(System.currentTimeMillis()));
		dto.setIssueStmt(multi.getParameter("issueStmt"));
		dto.setIssueManager(multi.getParameter("issueManager"));
		dto.setIssueDpmt(multi.getParameter("issueDpmt"));
		dto.setIssueClearStep(multi.getParameter("issueClearStep"));
		
		int result = issueDao.insertIssue(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("issuePage/issueWritePro");
	}
}
