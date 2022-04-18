package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dao.BoardDAO;
import com.board.domain.Page;
import com.board.domain.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

 @Inject
 private BoardService service;

 @RequestMapping(value = "/list", method = RequestMethod.GET)
 public void getList(Model model) throws Exception {
  
  List list = null;
  list = service.list();
  model.addAttribute("list", list);
 }
 
 @RequestMapping(value = "/write", method=RequestMethod.GET)
 public void getWrite(HttpSession session, Model model) throws Exception{
	 Object loginInfo = session.getAttribute("member");
	 
	 if (loginInfo == null) {
		 model.addAttribute("msg", false);
	 }
 }
 
 // 게시물작성의 post 메서드 (서버에서 사용자로올땐 get, 사용자가 서버로 보낼땐 post)
 @RequestMapping(value="/write", method=RequestMethod.POST)
 public String postWrite(BoardVO vo) throws Exception {
	 service.writer(vo);
	 
	 // 모든 작업을 마치고 /board/list (게시물 목록) 화면으로 이동해라.
	 return "redirect:/board/list";
 }
 
 @RequestMapping(value="/view", method=RequestMethod.GET)
 // @RequestParam(문자열) 을 사용하면 주소에 있는 특정한 값을 가져올수 있다.
 // view로 매핑을 요청해서 게시물 조회사이트로 가게되면 bno=? 의 값이 있고, 그 bno의 특정한 ? 값을
 // RequestParam("bno") 로 받아 오는것이다.
 public void getView(@RequestParam("bno") int bno, Model model) throws Exception{
	 //service에서 데이터를 받고 vo에게 전해준다.
	 BoardVO vo = service.view(bno);
	 
	 // model을 이용해 vo에 데이터를 넘겨준다.
	 // 이때 넘겨주는 모델의 이름은 view 로 설정.
	 model.addAttribute("view", vo);
 }
 
 @RequestMapping(value="/modify", method=RequestMethod.GET)
 public void getModify(@RequestParam("bno") int bno, Model model) throws Exception{
	 
	 BoardVO vo = service.view(bno);
	 
	 model.addAttribute("view", vo);
	 
 }
 
 @RequestMapping(value="/modify", method=RequestMethod.POST)
 public String postModify(BoardVO vo) throws Exception {
	 service.modify(vo);
	 
	 return "redirect:/board/view?bno=" + vo.getBno();
 }
 
 @RequestMapping(value="/delete", method=RequestMethod.GET)
 public String getDelete(@RequestParam("bno") int bno) throws Exception{
	 service.delete(bno);
	 
	 return "redirect:/board/list";
 }
 
 
//게시물 목록 + 페이징 추가
@RequestMapping(value = "/listPage", method = RequestMethod.GET)
public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
	Page page = new Page();
	
	page.setNum(num);
	page.setCount(service.count());  

	List list = null; 
	list = service.listPage(page.getDisplayPost(), page.getPostNum());

	model.addAttribute("list", list);
	
	/*
	model.addAttribute("pageNum", page.getPageNum());

	model.addAttribute("startPageNum", page.getStartPageNum());
	model.addAttribute("endPageNum", page.getEndPageNum());
	 
	model.addAttribute("prev", page.getPrev());
	model.addAttribute("next", page.getNext());  
	*/
	// 위에 주석처리들은 모두 Page page의 데이터들이라 한줄로 정리가 가능함.
	model.addAttribute("page", page);

	model.addAttribute("select", num);
}	
@RequestMapping(value="/okpage", method=RequestMethod.GET)
public void getOkpage() throws Exception{
	
}
}