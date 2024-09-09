package com.won.wonpick.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService mService;
	private final BCryptPasswordEncoder bCrypt;
	
	// 생성자 주입 방식으로 의존성 주입
	@Autowired
	public MemberController(MemberService mService, BCryptPasswordEncoder bCrypt) {
		this.mService = mService;
		this.bCrypt = bCrypt;
	}
	
	@RequestMapping("/login")
	 public String loginMember(Member m, Model model, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if (loginUser != null && bCrypt.matches(m.getPassword(), loginUser.getPassword())) {	// 로그인 성공

			session.setAttribute("loginUser", loginUser);

			return "redirect:/";
			
		} else { 					// 로그인 실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다.");

			return "redirect:/";
		}
	 }
	/**
	 * 회원가입 페이지로 이동
	 * @return "member/joinPage"
	 */
	@RequestMapping("/join")
	public String enrollForm() {
		return "member/joinPage";
	}
	
	/**
	 * 회원가입 기능 구현
	 * @param m
	 * @param session
	 * @return "redirect:/"
	 */
	@RequestMapping("/insertMember")
	public String insertMember(Member m, HttpSession session) {
		
		
		m.setPassword(bCrypt.encode(m.getPassword()));
		
		int result = mService.insertMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(Member m, HttpServletResponse response) {
		int count = mService.idCheck(m.getUserId());
		
		// 중복되는 데이터인 경우 "NNN" 응답 ---------------------------------------------------------
		if (count > 0) {
			try {
				response.getWriter().print("NNN");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
		// 중복되지 않는 데이터인 경우 "NNY" 응답
			try {
				response.getWriter().print("NNY");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/findIdForm")
	public String findIdForm() {
		return "member/findId";
	}
	
	@RequestMapping("/findId")
	public String findId(Member m, HttpSession session) {
		
		String userId = mService.findId(m);
		
		 if (userId != null) {
			 session.setAttribute("userId", userId);
	         return "member/findIdResult";
	     } else {
	         return "member/findIdResult";
	     }
	}
	
	@RequestMapping("/changePwdUserForm")
	public String changePwdUserForm() {
		return "member/changePasswordUser";
	}
	
	@RequestMapping("/changePwdForm")
	public String changePwdForm(Member m, HttpSession session, Model model) {
		
		int result = mService.changePwdUser(m);
		if (result > 0) {
			model.addAttribute("userId", m.getUserId());
	         return "member/changePassword";
	     } else {	
	    	 session.setAttribute("alertMsg", "회원정보가 일치하지 않습니다.");
	         return "member/changePasswordUser";
	     }
	}
	
	@RequestMapping("/changePassword")
	public String changePassword(Member m, HttpSession session) {
		
		m.setPassword(bCrypt.encode(m.getPassword()));
		
		int result = mService.changePassword(m);
		
		if (result > 0) {
			session.setAttribute("result", "비밀번호 변경에 성공하였습니다.");
	         return "member/changePasswordResult";
	     } else {	
	    	 session.setAttribute("result", "비밀번호 변경에 실패하였습니다.");
	         return "member/changePasswordResult";
	     }
	}

}
