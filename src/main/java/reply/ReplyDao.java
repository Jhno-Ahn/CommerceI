package reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public interface ReplyDao {
	
	public List<ReplyDataBean> getReplyList(int replyIssueNum);
	public int getCount() ;
	public int insertReply(Map<String, Object> map); 		//댓글 작성
	public ReplyDataBean getReply(int replyNum);	//댓글 가져오기
	public int modifyReply(ReplyDataBean rmDto);	//댓글 수정
	public int deleteReply(int replyNum);			//댓글 삭제
}
