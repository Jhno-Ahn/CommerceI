package issue;

import java.util.List;
import java.util.Map;

public interface IssueDao {
	public int insertIssue(IssueDataBean dto);
	public List<IssueDataBean> getList(Map<String, Integer> map);
	public int getCount();
	public List<IssueDataBean> getMyList(String userId);
	public List<IssueDataBean> getMyWork(String userId);
	public List<IssueDataBean> getRefuseWork(String userId);
	public IssueDataBean getArticle(int IssueNum); // 글보기
	public int doArticle(int issueNum);  // 글승낙
	public IssueDataBean getIssue(int issueNum);	
	public int modifyIssue(IssueDataBean dto);
	//public int modifyStmt(int issueNum);
}
