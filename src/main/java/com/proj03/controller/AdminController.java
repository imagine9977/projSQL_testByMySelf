package com.proj03.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.proj03.biz.BoardBiz;
import com.proj03.biz.FileboardService;
import com.proj03.biz.FreeBiz;
import com.proj03.biz.InventoryBiz;
import com.proj03.biz.MemberService;
import com.proj03.biz.ProductBiz;
import com.proj03.biz.SalesBiz;
import com.proj03.dto.Board;
import com.proj03.dto.CategoryVO;
import com.proj03.dto.Fileboard;
import com.proj03.dto.Inventory;
import com.proj03.dto.Member;
import com.proj03.dto.Product;
import com.proj03.dto.ProductVO;


@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private FileboardService fileboardService;
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	private HttpSession session;
		
	@Autowired
	private BoardBiz boardService;
	
	@Autowired
	private FreeBiz freeService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private ProductBiz productService;
	
	@Autowired
	private InventoryBiz inventoryService;
	
	@Autowired
	private SalesBiz salesService;
	
	String uploadLoc = "/resources/upload/";
	
	
	@GetMapping("memberList.do")
	public String getMemberList(Model model) {
		List<Member> list = memberService.getMemberList();
		model.addAttribute("list", list);
		return "admin/member/list";
	}
	
	@GetMapping("getMember.do")
	public String getMemberDetail(@RequestParam("id") String id, Model model) {
		Member dto = memberService.getMember(id);
		model.addAttribute("dto", dto);
		return "admin/member/get";
	}
	
	@GetMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id, Model model) {
		memberService.delMember(id);
		return "redirect:memberList.do";
	}
	
	
	@GetMapping("insertBoard.do")
	public String insBoard(Board board, Model model) {
		return "admin/board/insert";
	}
	
	@PostMapping("insertBoardPro.do")
	public String insBoardPro(Board board, Model model) {
		boardService.insBoard(board);
		return "redirect:/board/list.do";
	}

	@GetMapping("updateBoard.do")
	public String upBoard(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("board", boardService.getBoard(bno));
		return "admin/board/edit";
	}
	
	@PostMapping("updateBoardPro.do")
	public String upBoardPro(Board board, Model model) {
		log.info(board.toString());
		boardService.upBoard(board);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("delBoard.do")
	public String delBoard(@RequestParam("bno") int bno, Model model) {
		boardService.delBoard(bno);
		return "redirect:/board/list.do";
	}
	
	
	
	@GetMapping("insertFileboard.do")
	public String insBoard(Model model) {
		return "admin/fileboard/insert";
	}
	
	@PostMapping("insertFileboardPro.do")
	public String insBoardPro(@RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file, Model model) {

		String author = (String) session.getAttribute("sid");
        String fileRealName = file.getOriginalFilename();
        long size = file.getSize();
        
        log.info("제목: {}", title);
        log.info("내용: {}", content);
        log.info("파일명: {}", fileRealName);
        log.info("파일 크기(byte): {}", size);
        
        // 서버에 저장할 파일 이름 생성
        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
        String uploadFolder = servletContext.getRealPath("/resources/upload");

        UUID uuid = UUID.randomUUID();
        String uniqueName = uuid.toString().split("-")[0];
        String uuidName = uploadFolder + "\\" + uniqueName + fileExtension;
        
        // 파일 저장
        File saveFile = new File(uuidName);
        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        
        //도메인(DTO)에 추가
        Fileboard fileboard = new Fileboard();
        fileboard.setTitle(title);
        fileboard.setContent(content);
        model.addAttribute("fileRealName", fileRealName);
        model.addAttribute("size", size);
        fileboard.setAuthor(author);
        fileboard.setUrl(uniqueName+fileExtension);
		
        /* 서비스 호출 영역 시작 */
        fileboardService.write(fileboard);
        /* 서비스 호출 영역 끝 */

		return "redirect:/fileboard/list.do?pageNo=1";
	}

	@GetMapping("updateFileboard.do")
	public String upFileBoard(@RequestParam("no") int no, @RequestParam("pageNo") String pageNo, HttpServletRequest req, HttpServletResponse res, Model model) {
		
		String id = (String) session.getAttribute("sid");
		
		Cookie viewCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("|"+id+"fileboard"+no+"|")) {
					log.info("쿠키 이름 : "+cookies[i].getName());
					viewCookie=cookies[i];
				}	
			}
		} else {
			log.info("아직 방문한 적이 없습니다.");
		}
		
		if(viewCookie==null) {
            try {
            	//쿠키 생성
				Cookie newCookie=new Cookie("|"+id+"fileboard"+no+"|","readCount");
				res.addCookie(newCookie);
                //쿠키가 없으니 증가 로직 진행
				model.addAttribute("board", fileboardService.getPostDetailHasHits(no));	
			} catch (Exception e) {
				log.info("쿠키 확인 불가 : "+e.getMessage());
				e.getStackTrace();
			}
        //만들어진 쿠키가 있으면 증가로직 진행하지 않음
		} else {
			model.addAttribute("board", fileboardService.getPostDetailNoHits(no));
			log.info("viewCookie 확인 로직 : 쿠키 있음");
			String value=viewCookie.getValue();
			log.info("viewCookie 확인 로직 : 쿠키 value : "+value);
		}
		
		model.addAttribute("pageNo", pageNo);
		
		return "admin/fileboard/edit";
	}
	
	@PostMapping("updateFileboardPro.do")
	public String upFileboardPro(@RequestParam("no") int no, 
			@RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("file") MultipartFile file,
            @RequestParam("pageNo") String pageNo, Model model) {
		
		String author = (String) session.getAttribute("sid");
        String fileRealName = file.getOriginalFilename();
        long size = file.getSize();
        
        log.info("번호: {}", no);
        log.info("제목: {}", title);
        log.info("내용: {}", content);
        log.info("파일명: {}", fileRealName);
        log.info("파일 크기(byte): {}", size);
        
        // 서버에 저장할 파일 이름 생성
        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
        String uploadFolder = servletContext.getRealPath("/resources/upload");

        UUID uuid = UUID.randomUUID();
        String uniqueName = uuid.toString().split("-")[0];
        String uuidName = uploadFolder + "\\" + uniqueName + fileExtension;
        
        // 파일 저장
        File saveFile = new File(uuidName);
        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        
        // 데이터 모델에 추가
        Fileboard fileboard = new Fileboard();
        fileboard.setNo(no);
        fileboard.setTitle(title);
        fileboard.setContent(content);
        model.addAttribute("fileRealName", fileRealName);
        model.addAttribute("size", size);
        fileboard.setAuthor(author);
        fileboard.setUrl(uniqueName+fileExtension);
		
		fileboardService.updatePost(fileboard);
		return "redirect:/fileboard/list.do?pageNo="+pageNo;
	}
	
	@RequestMapping("delFileboard.do")
	public String delFileBoard(@RequestParam("no") int no, @RequestParam("pageNo") String pageNo, Model model) {
		fileboardService.deletePost(no);
		return "redirect:/fileboard/list.do?pageNo="+pageNo;
	}
	
	
	@GetMapping("insertProduct.do")
	public String insProduct(Product product, Model model) {
		return "admin/product/insert";
	}
	
	@PostMapping("insertProductPro.do")
	public String insProductPro(
			@RequestParam("cate") String cate,
			@RequestParam("pname") String pname,
			@RequestParam("com") String com,
			@RequestParam("price") int price,
			@RequestParam("img") MultipartFile img,
			@RequestParam("img2") MultipartFile img2,
			@RequestParam("img3") MultipartFile img3, 
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		
		String uploadDir = request.getServletContext().getRealPath(uploadLoc);
		File dir = new File(uploadDir);
		
		String imgName="", img2Name="", img3Name="";
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			if(!img.isEmpty()) {
				imgName = saveFile(img, uploadDir);
				log.info("업로드 파일1 이름 : {}", imgName);
			}
			if(!img2.isEmpty()) {
				img2Name = saveFile(img2, uploadDir);
				log.info("업로드 파일2 이름 : {}", img2Name);
			}
			if(!img3.isEmpty()) {
				img3Name = saveFile(img3, uploadDir);
				log.info("업로드 파일3 이름 : {}", img3Name);
			}
		} catch (IOException e) {
			log.error("예외 : {}", e);
		}
		
		Product product = new Product();
		product.setCate(cate);
		product.setPname(pname);
		product.setCom(com);
		product.setPrice(price);
		product.setImg(imgName);
		product.setImg2(img2Name);
		product.setImg3(img3Name);
		
		productService.insProduct(product);
		return "redirect:/product/list.do?cate="+product.getCate();
	}

	public String saveFile(MultipartFile file, String uploadDir) throws IOException {
		String originalFilename = file.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		String newFilename = UUID.randomUUID().toString() + ext;
		File serverFile = new File(uploadDir + newFilename);
		file.transferTo(serverFile);
		return newFilename;
	}
	
	@GetMapping("updateProduct.do")
	public String upProduct(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("product", productService.getProduct(pno));
		return "admin/product/edit";
	}
	
	@PostMapping("updateProductPro.do")
	public String upProductPro(@RequestParam("pno") int pno,
			@RequestParam("cate") String cate,
			@RequestParam("pname") String pname,
			@RequestParam("com") String com,
			@RequestParam("price") int price,
			@RequestParam("img") MultipartFile img,
			@RequestParam("img2") MultipartFile img2,
			@RequestParam("img3") MultipartFile img3, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		
		ProductVO before = productService.getProduct(pno);
		
		String uploadDir = request.getServletContext().getRealPath(uploadLoc);
		File dir = new File(uploadDir);
		
		String imgName="", img2Name="", img3Name="";
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			if(!img.isEmpty()) {
				imgName = saveFile(img, uploadDir);
				log.info("변경 파일1 이름 : {}", imgName);
			} else {
				imgName = before.getImg();
			}
			if(!img2.isEmpty()) {
				img2Name = saveFile(img2, uploadDir);
				log.info("변경 파일2 이름 : {}", img2Name);
			} else {
				img2Name = before.getImg2();
			}
			if(!img3.isEmpty()) {
				img3Name = saveFile(img3, uploadDir);
				log.info("변경 파일3 이름 : {}", img3Name);
			} else {
				imgName = before.getImg3();
			}
		} catch (IOException e) {
			log.error("예외 : {}", e);
		}
		
		Product product = new Product();
		product.setCate(cate);
		product.setPname(pname);
		product.setCom(com);
		product.setImg(imgName);
		product.setImg2(img2Name);
		product.setImg3(img3Name);
		
		productService.upProduct(product);
		return "redirect:/product/list.do?cate="+product.getCate();
	}
	
	@RequestMapping("delProduct.do")
	public String delProduct(@RequestParam("pno") int pno, @RequestParam("cate") String cate, Model model) {
		productService.delProduct(pno);
		return "redirect:/product/list.do?cate="+cate;
	}
	
	
	
	@RequestMapping("productReturn.do")
	public String productReturn(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("product", productService.getProduct(pno));
		return "admin/inventory/return";
	}
	
	@PostMapping("productReturnPro.do")
	public String productReturnPro(Inventory inventory, Model model) {
		inventory.setAmount(inventory.getAmount()*-1);
		inventoryService.insInventory(inventory);
		return "redirect:listInventory.do";
	}
	
	@RequestMapping("listInventory.do")
	public String getInventoryList(Model model) {
		model.addAttribute("list", inventoryService.getInventoryList());
		return "admin/inventory/list";
	}
	
	@RequestMapping("detailInventory.do")
	public String getInventory(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("inventory", inventoryService.getInventory(pno));
		return "admin/inventory/get";
	}

	@GetMapping("insertInventory.do")
	public String insInventory(Model model) {
		return "admin/inventory/insert";
	}
	
	@PostMapping("insertInventoryPro.do")
	public String insInventoryPro(Inventory inventory, Model model) {
		inventoryService.insInventory(inventory);
		return "redirect:listInventory.do";
	}
	
	@GetMapping("updateInventory.do")
	public String upInventory(@RequestParam("ino") int ino, Model model) {
		model.addAttribute("inventory", inventoryService.getInventory(ino));
		return "admin/inventory/edit";
	}
	
	@PostMapping("updateInventoryPro.do")
	public String upInventoryPro(@RequestAttribute("inventory") Inventory inventory, Model model) {
		inventoryService.upInventory(inventory);
		return "redirect:listInventory.do";
	}
	
	@RequestMapping("delInventory.do")
	public String delInventory(@RequestParam("ino") int ino, Model model) {
		inventoryService.delInventory(ino);
		return "redirect:listInventory.do";
	}
	
	@GetMapping("categoryLoading.do")
	public void categoryLoading(@RequestParam("cate") String cate, HttpServletResponse response, Model model) throws IOException{
		
		log.info("카테고리 : {}", cate);
		
		List<CategoryVO> category = inventoryService.categoryLoading(cate);
		
		for(CategoryVO item : category) {
			log.info(item.toString());
		}
		
	    Gson gson = new Gson();		
	    String jsonString = gson.toJson(category);
	    
	    response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(jsonString);
	    out.flush();
	}	
	
	//관리자 판매 전체 목록
	@GetMapping("allSalesList.do")
	public String getAllSalesList(Model model) {
		model.addAttribute("list",salesService.getAllSalesList());
		return "admin/sales/list";
	}
	
	//관리자 상품별 판매 목록
	@GetMapping("pnoSalesList.do")
	public String getPnoSalesList(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("list", salesService.getPnoSalesList(pno));
		return "admin/sales/list";
	}
	
	//관리자 회원별 판매 전체 목록
	@GetMapping("memberSalesList.do")
	public String getSalesList(@RequestParam("id") String id, Model model) {
		model.addAttribute("list", salesService.getSalesList(id));
		return "admin/sales/list";
	}
	
	//관리자 판매 진행 상태별 목록
	@GetMapping("stSalesList.do")
	public String getStList(@RequestParam("st") String st, Model model) {
		model.addAttribute("list", salesService.getStSalesList(st));
		return "admin/sales/list";
	}

	//고객별 구매 목록
	@GetMapping("delStatusSalesList.do")
	public String getDelStatusSalesList(@RequestParam("delStatus") String delStatus, Model model) {
		model.addAttribute("list", salesService.getDelstSalesList(delStatus));
		return "admin/sales/list";
	}
	
	//특정 판매 건수 조회
	@GetMapping("sales.do")
	public String getSales(@RequestParam("sno") int sno, Model model) {
		model.addAttribute("dto", salesService.getSales(sno));
		return "admin/sales/get";
	}

	
	
	
}