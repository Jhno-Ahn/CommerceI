package issue;

import java.sql.Date;

public class IssueDataBean {
	private int issueNum;			// 업무요청 번호 pk
	private String issueType;		// 업무요청 구분 
	private String issueOpt;		// 업무요청 공개여부 
	private String issueTitle;		// 업무요청 제목
	private String issueContent; 	// 업무요청 내용
	private String issueWriter;		// 업무요청 작성자
	private String issueFile;		// 업무요청 파일
	private Date issueDate;	// 업무요청 날짜
	private Date issueEndDate;	// 업무요청 완료날짜
	private String issueStmt;		// 업무요청 진행상태
	private String issueManager;	// 업무요청 담당자
	private String issueDpmt;		// 업무요청 담당부서
	private String issueClearStep;	// 업무요청 완료단계
	private String issueRefuse;
	
	
	
	public int getIssueNum() {
		return issueNum;
	}
	public void setIssueNum(int issueNum) {
		this.issueNum = issueNum;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public String getIssueOpt() {
		return issueOpt;
	}
	public void setIssueOpt(String issueOpt) {
		this.issueOpt = issueOpt;
	}
	public String getIssueTitle() {
		return issueTitle;
	}
	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
	}
	public String getIssueContent() {
		return issueContent;
	}
	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
	}
	public String getIssueWriter() {
		return issueWriter;
	}
	public void setIssueWriter(String issueWriter) {
		this.issueWriter = issueWriter;
	}
	public String getIssueFile() {
		return issueFile;
	}
	public void setIssueFile(String issueFile) {
		this.issueFile = issueFile;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public Date getIssueEndDate() {
		return issueEndDate;
	}
	public void setIssueEndDate(Date issueEndDate) {
		this.issueEndDate = issueEndDate;
	}
	public String getIssueStmt() {
		return issueStmt;
	}
	public void setIssueStmt(String issueStmt) {
		this.issueStmt = issueStmt;
	}
	public String getIssueManager() {
		return issueManager;
	}
	public void setIssueManager(String issueManager) {
		this.issueManager = issueManager;
	}
	public String getIssueDpmt() {
		return issueDpmt;
	}
	public void setIssueDpmt(String issueDpmt) {
		this.issueDpmt = issueDpmt;
	}
	public String getIssueClearStep() {
		return issueClearStep;
	}
	public void setIssueClearStep(String issueClearStep) {
		this.issueClearStep = issueClearStep;
	}
	public String getIssueRefuse() {
		return issueRefuse;
	}
	public void setIssueRefuse(String issueRefuse) {
		this.issueRefuse = issueRefuse;
	}
	
	
}
