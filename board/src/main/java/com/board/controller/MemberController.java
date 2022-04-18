package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
// 회원db에 관련된것들만 작성하는 곳이라서 mapping을 board로 요청하면 겹쳐서 에러가난다.
// 따라서 회원에 관련된 모든 요청들은 member로 설정한 것.
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	 public void getRegister() throws Exception {
	  logger.info("get register");
	 }
	
	// 회원가입 post
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception  {
		logger.info("post register");
		
		service.register(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(vo);
		
		// service에서 받은 login값이 null 이면 그냥 널이되는것이고(아무것도 안되고)
		// 무언가 받았다면 성공한것으로 쿼리문에 있는 결과가 넘어온다.
		// 값을 받으면 그에 맞게 member에 값을 넣어준다.
		// member에는 매퍼에 있는 쿼리문의 결과가 들어있음.
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void getModify() throws Exception{
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception{
		
		service.modify(vo);
		session.invalidate();
		
		return "redirect:/board/okpage";
	}
	
	@RequestMapping(value="/deleteuser", method=RequestMethod.GET)
	public void getDeleteuser() throws Exception{
		
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value = "/deleteuser", method = RequestMethod.POST)
	public String postdeleteuser(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 
	 String oldPass = member.getUserPass();
	 String newPass = vo.getUserPass();
	     
	 if(!(oldPass.equals(newPass))) {
	  rttr.addFlashAttribute("msg", false);
	  return "redirect:/member/deleteuser";
	 }
	 
	 service.deleteuser(vo);
	 
	 session.invalidate();
	  
	 return "redirect:/";
	}
	
	
	// 중복확인을 현재페이지를 유지한상태로 하려고하니
	// Ajax 기술이 필요함
	// Ajax 기술을 사용하면 jsp파일이 필요없기 때문에 @ResponseBody를 추가.
	
	// Ajax 를사용하게되면 값을 저장할 추가적인 작업을 할필요가 없고,
	// 페이지 전체를 불러오는게아닌 필요한 부분만 불러오는것이라 데이터 전송량이작고 속도도 빨라진다.
	// 그만큼 비용이 줄어들게된다.
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception{
		String userId = req.getParameter("userId");
		
		MemberVO idCheck = service.idCheck(userId);
		
		int result=0;
		
		if(idCheck != null) {
			result = 1;
			
		}
		
		return result;
	}

}
