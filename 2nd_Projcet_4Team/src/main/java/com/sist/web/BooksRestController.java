package com.sist.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.B_CartServiceImpl;
import com.sist.service.BooksServiceImpl;
import com.sist.vo.BooksVO;
@RestController
@RequestMapping("books/")
public class BooksRestController {
	@Autowired
	private BooksServiceImpl service;

	@Autowired
	private B_CartServiceImpl cService;

	@GetMapping(value="list_vue.do", produces = "text/plain;charset=UTF-8")
	public String books_list_vue(@RequestParam("page") int page,
	                             @RequestParam(value = "filter", required = false) String filter,
	                             @RequestParam(value = "keyword", required = false) String keyword) throws Exception {
	    int rowSize = 12;
	    int start = (rowSize * page) - (rowSize - 1);
	    int end = rowSize * page;

	    // 필터와 키워드를 처리하는 서비스 메서드로 변경
	    List<BooksVO> list = service.booksListData(start, end, filter, keyword);

	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    return json;
	}

	@GetMapping(value="page_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_page_vue(int page) throws Exception
	{
		final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   int totalpage=service.booksTotalPage();
		   if(endPage>totalpage)
			   endPage=totalpage;

		   map=new HashMap();
		   map.put("curpage",page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);

		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json;
	}

	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String books_detail_vue(int no) throws Exception
	{
		BooksVO vo=service.booksDetailData(no);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}


	@GetMapping(value="search_vue.do", produces = "text/plain;charset=UTF-8")
	public String booksSearch_vue(String ss) throws Exception {
	    List<BooksVO> list = service.searchBooks(ss); // 검색어를 매개변수로 하는 서비스 계층의 검색 메소드 호출
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    return json;
	}

	@GetMapping(value="search_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String search_books_page_vue(int page) throws Exception
	{
		final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   int totalpage=service.booksTotalPage();
		   if(endPage>totalpage)
			   endPage=totalpage;

		   map=new HashMap();
		   map.put("curpage",page);
		   map.put("totalpage", totalpage);
		   map.put("startPage", startPage);
		   map.put("endPage", endPage);

		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json;
	}



}
