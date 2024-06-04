package com.proj03.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj03.biz.QnaBiz;
import com.proj03.dto.Qna;

@Controller
@RequestMapping("/qna/")
public class QnaController {

	@Autowired
	private QnaBiz qnaService;
	
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
	public String getqna(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("qna", qnaService.getQna(bno));
		return "qna/getQna";
	}

	@GetMapping("insertQues.do")
	public String insqna(Qna qna, Model model) {
		return "qna/qIns";
	}
	
	@PostMapping("insertQuesPro.do")
	public String insqnaPro(Qna qna, Model model) {
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
	public String upqna(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("qna", qnaService.getQna(bno));
		return "qna/editQna";
	}
	
	@PostMapping("updatePro.do")
	public String upqnaPro(@RequestAttribute("Qna") Qna qna, Model model) {
		qnaService.editProQna(qna);
		return "redirect:list.do";
	}
	
	@RequestMapping("delqna.do")
	public String delqna(@RequestParam("bno") int bno, Model model) {
		qnaService.delQues(bno);
		return "redirect:list.do";
	}
}