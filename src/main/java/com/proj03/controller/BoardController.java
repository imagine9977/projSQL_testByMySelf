package com.proj03.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj03.biz.BoardBiz;
import com.proj03.dto.Board;
import com.proj03.dto.Member;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	private BoardBiz boardService;
	
	@RequestMapping("list.do")
	public String getBoardList(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "board/list";
	}
	
	@RequestMapping("detail.do")
	public String getBoard(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("board", boardService.getBoard(bno));
		return "board/get";
	}
	
	@GetMapping("insertBoard.do")
	public String insboard(Board board, Model model) {
		return "board/board_ins";

	}

	@PostMapping("insertBoardPro.do")
	public String insboardPro(Board board, HttpSession session, @RequestParam("cate") String cate, Model model) {

		String id = (String) session.getAttribute("sid");
		String name = (String) session.getAttribute("sname");
		Member member = new Member();
		member.setId(id);
		member.setName(name);

		boardService.insBoard(board);
		return "redirect:list.do";
	}
	
	
	@GetMapping("update.do")
	public String upboard(@RequestParam("qno") int qno, Model model) {
		model.addAttribute("board", boardService.getBoard(qno));
		return "board/editboard";
	}

	@PostMapping("updatePro.do")
	public String upboardPro(Board board, Model model) {
		boardService.editBoard(board);
		return "redirect:list.do";
	}

	@RequestMapping("delBoard.do")
	public String delboard(@RequestParam("qno") int qno, Model model) {
		
		boardService.delBoard(qno);
		
		
		return "redirect:list.do";
	}
}