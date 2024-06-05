package com.proj03.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj03.biz.QnaBiz;
import com.proj03.dto.Member;
import com.proj03.dto.Qna;

@Controller
@RequestMapping("/qna/")
public class QnaController {

	private static final Logger log = LoggerFactory.getLogger(FreeController.class);
	
	@Autowired
	private QnaBiz qnaService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("list.do")
	public String getQnaList(Model model) {
		model.addAttribute("qnaList", qnaService.getQnaList());
		return "qna/qnaList2";
	}
	
	@RequestMapping("catelist.do")
	public String getCatQnaList(Model model, String cat) {
		model.addAttribute("qnaList", qnaService.getCateQnaList(cat));
		return "qna/qnaList2byCat";
	}
	
	@RequestMapping("detail.do")
	public String getqna(@RequestParam("qno") int qno, Model model) {
		model.addAttribute("qna", qnaService.getQna(qno));
		return "qna/detail";
	}

	@GetMapping("insertQues.do")
	public String insqna(Qna qna, Model model) {
		return "qna/qna_ins";
		
	}
	
	@PostMapping("insertQuesPro.do")
	public String insqnaPro(Qna qna, HttpSession session,@RequestParam("cate") String cate, Model model) {
		
		String id = (String) session.getAttribute("sid");
		String name = (String) session.getAttribute("sname");
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		qna.setMember(member);
		   qna.setCate(cate);
		qnaService.insQues(qna);
		return "redirect:list.do";
	}

	@GetMapping("insertAnsw.do")
	public String insAnsw(Qna qna, Model model) {
		return "qna/aIns";
	}
	
	@PostMapping("insertAnswPro.do")
	public String insqnaAnswPro(Qna qna, Model model) {
		qnaService.insAnsw(qna);
		return "redirect:list.do";
	}
	@GetMapping("update.do")
	public String upqna(@RequestParam("qno") int qno, Model model) {
		model.addAttribute("qna", qnaService.getQna(qno));
		return "qna/editQna";
	}
	
	@PostMapping("updatePro.do")
	public String upqnaPro(@RequestAttribute("Qna") Qna qna, Model model) {
		qnaService.editProQna(qna);
		return "redirect:list.do";
	}
	
	@RequestMapping("delqna.do")
	public String delqna(@RequestParam("qno") int qno, Model model) {
		qnaService.delQues(qno);
		return "redirect:list.do";
	}
}