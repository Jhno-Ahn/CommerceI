package user;

import java.util.List;

	
public interface UserDao {
	public int insertUser(UserDataBean dto);				// 회원가입
	public int checkId(String userId);							// 아이디 중복체크
	public int checkComNum(String userComNum);						// 사번 중복체크
	public int check(String userId, String userPasswd);				// <로그인단> 아이디 비번체크
	public UserDataBean getUser(String userId);				//	
	//public int insertMember(MemberDataBean dto);			//
	//public MemberDataBean getMember_num(int member_num);	//
	public List<UserDataBean> getList(); // 유저 리스트
	public int modifyUser(UserDataBean dto);
	public List<UserDataBean> getSearchList(String searchWord);
	
	
}
