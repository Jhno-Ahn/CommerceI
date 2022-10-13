package user;

import java.util.List;

import mybatis.SqlMapClient;

public class UserDBBean implements UserDao{
	
	public int insertUser(UserDataBean dto) {
		return SqlMapClient.getSession().insert("CI_user.insertUser", dto);
	}

	//public String getcnum(String id) {
	//	return SqlMapClient.getSession().selectOne("CI_user.getcnum", id);
	// }
	@Override
	public int checkId(String id) {
		return SqlMapClient.getSession().selectOne("CI_user.checkId", id);
	}
	@Override
	public int checkComNum(String userComNum) {
		return SqlMapClient.getSession().selectOne("CI_user.checkComNum", userComNum);
	}
	@Override
	public UserDataBean getUser(String userId) {
		return SqlMapClient.getSession().selectOne("CI_user.getUser", userId);
	}
	
	public int check(String userId, String userPasswd) {
		int result;
		int count = checkId(userId);
		if(count == 1) {
			//아이디가 있다
			UserDataBean dto = getUser(userId);
			if(dto.getUserPasswd().equals(userPasswd)) {
				//비밀번호가 같다
				result = 1;
			} else {
				//비밀번호가 다르다
				result = 0;
			}
		} else {
			//아이디가 없다
			result = -1;
		}
		return result;
	
		}
	
	@Override
	public List<UserDataBean> getList() {
		return SqlMapClient.getSession().selectList("CI_user.getList");
	}
	
	@Override
	public List<UserDataBean> getSearchList(String searchWord) {
		return SqlMapClient.getSession().selectList("CI_user.getSearchList", searchWord);
	}
	
	@Override
	public int modifyUser(UserDataBean dto) {
		return SqlMapClient.getSession().update("CI_user.modifyUser", dto);
	}
	

}
