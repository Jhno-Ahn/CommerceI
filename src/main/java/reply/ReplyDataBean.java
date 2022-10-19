package reply;

public class ReplyDataBean {
	private int replyNum;			// 댓글 번호
	private String replyWriter;		// 댓글 작성자
	private String replyContent;	// 댓글 내용
	private int replyId; 			// 그룹화 아이디
	private int replyStep; 			// 글순서
	private int replylevel; 		// 글레벨
	private int replyIssueNum;		
	
	
	
	
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyIssueNum() {
		return replyIssueNum;
	}
	public void setReplyIssueNum(int replyIssueNum) {
		this.replyIssueNum = replyIssueNum;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getReplyStep() {
		return replyStep;
	}
	public void setReplyStep(int replyStep) {
		this.replyStep = replyStep;
	}
	public int getReplylevel() {
		return replylevel;
	}
	public void setReplylevel(int replylevel) {
		this.replylevel = replylevel;
	}
	
}
