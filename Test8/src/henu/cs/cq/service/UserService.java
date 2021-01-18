package henu.cs.cq.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import henu.cs.cq.domain.User;


@Service
public class UserService {
	@Autowired
	private SqlSession sqlSession;
	
	
	public User userLogin(String username,String password){
		System.out.println("现在是service的方法"+username+password);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username",username);
		map.put("password", password);
		return sqlSession.selectOne("henu.cs.cq.dao.userLogin",map);
	}

	
	public User findUserByName(String username) {
		System.out.println("现在是service的方法"+username);
		return sqlSession.selectOne("henu.cs.cq.dao.judgeUser",username);
	}

	
	public int addUser(Map<String, Object> map) {
		return sqlSession.insert("henu.cs.cq.dao.addUser",map);
	}
}
