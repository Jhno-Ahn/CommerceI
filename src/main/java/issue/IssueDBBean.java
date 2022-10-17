package issue;

import java.util.Map;

import java.util.List;

import mybatis.SqlMapClient;

public class IssueDBBean implements IssueDao {
	
	@Override
	public int insertIssue(IssueDataBean dto) {
		return SqlMapClient.getSession().insert("CI_issue.insertIssue", dto);
	}
	@Override
	public List<IssueDataBean> getList(Map<String, Integer> map){
		return SqlMapClient.getSession().selectList("CI_issue.getList", map);
	}
	
	public int getCount() {
		return SqlMapClient.getSession().selectOne("CI_issue.getCount");
	}
	
	@Override
	public List<IssueDataBean> getMyList(String userId){
		return SqlMapClient.getSession().selectList("CI_issue.getMyList", userId);
	}
	
	@Override
	public List<IssueDataBean> getMyWork(String userId){
		return SqlMapClient.getSession().selectList("CI_issue.getMyWork", userId);
	}
	
	@Override
	public IssueDataBean getArticle(int issueNum) {
		return SqlMapClient.getSession().selectOne("CI_issue.getArticle", issueNum);
	}
	
	@Override
	public int doArticle(int issueNum) {
		return SqlMapClient.getSession().update("CI_issue.doArticle", issueNum);
	}
	
	@Override
	public List<IssueDataBean> getRefuseWork(String userId) {
		return SqlMapClient.getSession().selectList("CI_issue.getRefuseWork", userId);
	}
	
	@Override
	public IssueDataBean getIssue(int issueNum) {
		return SqlMapClient.getSession().selectOne("CI_issue.getIssue", issueNum);
	}
	
	@Override
	public int modifyIssue(IssueDataBean dto) {
		return SqlMapClient.getSession().update("CI_issue.modifyIssue", dto);
	}
	
	//@Override
	//public int modifyStmt(int issueNum) {
		//return SqlMapClient.getSession().update("CI_issue.modifyStmt", issueNum);
	//}
	
	
}
