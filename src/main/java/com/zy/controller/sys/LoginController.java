package com.zy.controller.sys;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.consumer.Consumer;
import com.zy.entity.consumer.ConsumerSource;
import com.zy.entity.sys.User;
import com.zy.service.consumer.ConsumerService;
import com.zy.service.consumer.ConsumerSourceService;
import com.zy.service.consumer.ConsumerTypeService;

@Controller
public class LoginController {

	@Autowired
	private ConsumerService consumerService;
	@Autowired
	private ConsumerSourceService consumerSourceService;
	@Autowired
	private ConsumerTypeService consumerTypeService;
	
	@RequestMapping(value="login_login")
	public String index(Model model) {
		String jspCode = UUID.randomUUID().toString().replaceAll("-", "");
		model.addAttribute("jspCode", jspCode);
		return "login";
	}

	@RequestMapping("login")
	public String login(String username,String password,HttpServletRequest request,Model model) throws Exception {
		/*//如果 登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
		String exceptionClassName = request.getParameter("shiroLoginFailure");
		//根据shiro返回的异常类路径判断
		if(exceptionClassName!=null) {
			if(UnknownAccountException.class.getName().equals(exceptionClassName)) {
				throw new Exception();
			}else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
				throw new Exception();
			}else {
				throw new Exception();
			}
		}*/
		
		String msg ;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
            	User user = new User();
            	user.setUsername(username);
            	user.setPassword(password);
                request.getSession().setAttribute("user",user);
                SavedRequest savedRequest = WebUtils.getSavedRequest(request);
                // 获取保存的URL
                if (savedRequest == null || savedRequest.getRequestUrl() == null) {
                    return "admin/home";
                } else {
                    //String url = savedRequest.getRequestUrl().substring(12, savedRequest.getRequestUrl().length());
                    return "forward:" + savedRequest.getRequestUrl();
                }
            } else {
                return "login";
            }
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多";
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (DisabledAccountException e) {
            msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (UnknownAccountException e) {
            msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
            model.addAttribute("message", msg);
            System.out.println(msg);
        } catch (UnauthorizedException e) {
            msg = "您没有得到相应的授权！" + e.getMessage();
            model.addAttribute("message", msg);
            System.out.println(msg);
        }
        return "login";
		
	}
	
	@RequestMapping("/main")
	public String main(Model model) throws Exception {
		 
		return "main";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model) throws Exception {
		 
		return "login";
	}
}
