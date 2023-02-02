package com.ki.lg01.ledger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ki.lg01.TokenMaker;

@Controller
public class LedgerController {
	
	@Autowired
	private LedgerDAO lDAO;
	
	// 가계부 등록하기
	@RequestMapping(value = "/write.go", method = RequestMethod.POST)
	public String LedgerWrite(Monthly m,Ledger lg, HttpServletRequest req) {
		lDAO.getAllLedger(req);
		lDAO.write(lg, req);
		lDAO.monthResult(req, m);
		lDAO.getAllLedger(req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}

	// 가계부 목록 보기
	@RequestMapping(value = "/list.go", method = RequestMethod.GET)
	public String LedgerList(Ledger lg,HttpServletRequest req) {
		lDAO.goView(req, lg);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "list.jsp");
		return "index";
	}
	
	// 가계부 상세 보기
	@RequestMapping(value = "/view.go", method = RequestMethod.GET)
	public String LedgerView(Ledger lg, HttpServletRequest req) {
		lDAO.viewDetail(req, lg);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "view.jsp");
		return "index";
	}
	
	// 가계부 수정페이지 가기
	@RequestMapping(value = "/edit.go", method = RequestMethod.GET)
	public String EditView(Ledger lg, HttpServletRequest req) {
		lDAO.viewDetail(req, lg);
		req.setAttribute("cp", "edit.jsp");
		return "index";
	}
	
	// 가계부 수정하기
	@RequestMapping(value = "/update.go", method = RequestMethod.POST)
	public String LedgerUpdate(Ledger lg, HttpServletRequest req) {
		lDAO.updateLedger(lg, req);
		lDAO.viewDetail(req, lg);
		lDAO.updateLedger(lg, req);
		req.setAttribute("cp", "view.jsp");
		return "index";
	}
	
	// 가계부 삭제하기
	@RequestMapping(value = "/delete.go", method = RequestMethod.GET)
	public String LedgerDelete(Ledger lg, HttpServletRequest req) {
		lDAO.deleteLedger(lg, req);
		lDAO.goView(req, lg);
		req.setAttribute("cp", "list.jsp");
		return "index";
	}
	
	
	

}
