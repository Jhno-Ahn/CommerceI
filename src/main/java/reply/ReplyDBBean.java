package reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class ReplyDBBean implements ReplyDao{
	@Override
	public int getCount() {
		return SqlMapClient.getSession().selectOne("CI_reply.getCount");
	}
	
	@Override
	public int insertReply(Map<String, Object> map) {
		// 글 등록
		return SqlMapClient.getSession().insert("CI_reply.insertReply", map);
	}
	
	public List<ReplyDataBean> getReplyList(int replyIssueNum){
		return SqlMapClient.getSession().selectList("CI_reply.getReplyList", replyIssueNum);
	}
	
	@Override
	public ReplyDataBean getReply(int replyNum) {
		return SqlMapClient.getSession().selectOne("CI_reply.getReply", replyNum);
	}
	/*
	 * public int check(int replyNum, String replyWriter) { ReplyDataBean dto =
	 * getReplyWriter(replyWriter); int result = 0;
	 * 
	 * if(dto.getReplyWriter().equals(replyWriter)) { result = 1; //작성자가 같으면 }else {
	 * result = 0; //작성자가 다르면 } return result; }
	 * 
	 */
	
	@Override
	public int modifyReply(ReplyDataBean rmDto) {
		return SqlMapClient.getSession().update("CI_reply.modifyReply", rmDto);
	}
	
	// 글 삭제
	public int deleteReply(int replyNum) {
		//					ref		re_step		re_level
		//제목글				10		0			0
		//ㄴ나중에 쓴 답글		10		1			1
		//ㄴ답글				10		2			1
		// ㄴ재답글			10		3			2
		
		// ref 같다		re_step + 1 같다		re_level 크다.
		
		// 답글이 있는경우	삭제된 글 입니다.
		// 답글이 없는경우	삭제
		
		ReplyDataBean dto = getReply(replyNum); // ref, re_step, re_level 값을 가져오지 못하고 num값을 가져오기 때문에 getArticle을 가져옴
		// 답글 유무 확인
		int count = SqlMapClient.getSession().selectOne("CI_reply.checkReply", dto);
		
		if(count != 0) {
			// 답글이 있는경우
			return SqlMapClient.getSession().update("CI_reply.deleteReply", replyNum);
			
		} else {
			// 답글이 없는경우
			SqlMapClient.getSession().update("CI_reply.deleteReReply", dto);
			
			// 삭제
			return SqlMapClient.getSession().delete("CI_reply.deleteReply", dto);
		}
	}
	
	
}
