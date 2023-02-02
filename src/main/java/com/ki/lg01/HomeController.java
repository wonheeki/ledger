package com.ki.lg01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ki.lg01.ledger.Ledger;
import com.ki.lg01.ledger.LedgerDAO;
import com.ki.lg01.ledger.Monthly;

@Controller
public class HomeController {
	
	@Autowired
	private LedgerDAO lDAO;
	
	// 프로그램 띄웠을 때 처음 보이는 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Ledger lg,Monthly m,HttpServletRequest req) {
		lDAO.getAllLedger(req);
		lDAO.goView(req,lg);
		lDAO.monthResult(req, m);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
	// 로고 눌렀을 때 메인 홈으로 가기
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String home2(Ledger lg,Monthly m,HttpServletRequest req) {
		lDAO.getAllLedger(req);
		lDAO.goView(req,lg);
		lDAO.monthResult(req, m);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
}
