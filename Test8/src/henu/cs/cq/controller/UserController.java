 package henu.cs.cq.controller;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import henu.cs.cq.domain.User;
import henu.cs.cq.service.UserService;


//让控制器成为一个bean
@Controller
//这个控制器是接受user_reg页面传过来的参数去操作数据库
public class UserController {
	@Autowired
	private UserService us;
	@Autowired
	private HttpServletRequest req;
	@RequestMapping("/userReg.action")
	//jsp页面通过userReg.action找到这个方法
	public String userReg(User user){
		System.out.println(user.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username", user.getUsername());
		map.put("password", user.getPassword());
		
		System.out.println(user.toString());
               
		//判断页面传回的数据要求
		Pattern pattern = Pattern.compile("^[^0-9][\\w_]{5,9}$");
	     Matcher matcher = pattern.matcher(user.getUsername());
	    System.out.println("正则表达式过滤："+matcher.matches());
		if(user.getUsername()==null || user.getPassword()==null || !matcher.matches()){
			return "index.jsp";
		}
		
		//获取当前注册时间
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("register_time", df.format(date));
		
		System.out.println("正在生成唯一识别码");
		
		//生成唯一识别码
		 String s = UUID.randomUUID().toString(); 
    	 String user_code =  s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24); 
    	 map.put("user_code", user_code);
    	 
    	 //将数据添加到数据库中
    	 System.out.println("即将数据插入数据库");
    	 int rows = us.addUser(map);
		
		req.setAttribute("username", user.getUsername());
		req.setAttribute("password", user.getPassword());
		return "pages/register_success.jsp";
	}


	//处理用户名唯一性的判断                                                                     
	@RequestMapping("/userJudge.action")
	@ResponseBody
	public User userJudge(String username) {
		User u = null;
		try {
			System.out.println("尝试查询用户");
			u = us.findUserByName(username);
		} catch (Exception e) {
			System.out.println("异常！");
			e.printStackTrace();
		}
		if(u==null)
			System.out.println("查无此人");
		return u;
	}
	
	//用户登录的判断
	@RequestMapping("/userLogin.action")
	public String userLogin(String username,String password){
		System.out.println(username);
		System.out.println(password);
	     
		if(username==null || password==null){
			return "pages/user-login-no.jsp";
		}
		System.out.println("能到达查询数据库的方法之前");
		User u = us.userLogin(username, password);
		System.out.println("查询用户信息如下");
		System.out.println(u.toString());
		req.getSession().setAttribute("u", u);
		return "pages/user-login-ok.jsp";
	}
	
	//用户退出销毁session 跳转到登录页
	@RequestMapping("/userExit.action")
	public String userExit(HttpSession session){
		session.invalidate();
		return "index.jsp";
	}
}
