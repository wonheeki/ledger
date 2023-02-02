package com.ki.lg01.ledger;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LedgerDAO {

	@Autowired
	private SqlSession ss;

	// 가계부 입력하기
	public void write(Ledger l, HttpServletRequest req) {
		try {
			/*
			 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); Date date =
			 * sdf.parse(req.getParameter("fl_date"));
			 */
			String token = req.getParameter("token"); // 141414에 글을 썼다
			// 지금 이 메소드에서만 사용할 token 저장 공간 임시적으로 만들기
			String st2 = (String) req.getSession().getAttribute("st");
			if (st2 != null && token.equals(st2)) { // st2가 null이 아니면서 토큰과 st2가 같으면
				req.setAttribute("r", "글쓰기 실패- 새로고침"); // 14시14분14초에 글을 쓰고 14시14분14초에 새로고침 누르면
				return;
			}

			l.setFl_date(req.getParameter("fl_date"));
			l.setFl_category(req.getParameter("fl_category"));
			l.setFl_expense(Integer.parseInt(req.getParameter("fl_expense")));
			l.setFl_income(Integer.parseInt(req.getParameter("fl_income")));
			l.setFl_detail(req.getParameter("fl_detail"));

			if (ss.getMapper(LedgerMapper.class).writeLedger(l) == 1) {
				req.setAttribute("r", "성공");
				req.getSession().setAttribute("st", token);
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "실패");
		}
	}

	// 가계부 목록보기
	public void goView(HttpServletRequest req, Ledger l) {
		BigDecimal fl_no = l.getFl_no();
		l.setFl_no(fl_no);

		List<Ledger> viewMsgs = ss.getMapper(LedgerMapper.class).getLedger();
		req.setAttribute("msgs", viewMsgs);
	}

	// 이달의 수입, 지출, 총합보기
	public void monthResult(HttpServletRequest req, Monthly m) {
		int expense = ss.getMapper(LedgerMapper.class).monthExpense(m);
		int income = ss.getMapper(LedgerMapper.class).monthIncome(m);
		int total = income - expense;

		m.setExpense(expense);
		m.setIncome(income);
		m.setTotal(total);

		req.setAttribute("monthExpense", m.getExpense());
		req.setAttribute("monthIncome", m.getIncome());
		req.setAttribute("total", m.getTotal());
		// 이 달의 수입 지출이 0인 상태로 프로그램 실행하면 NullpointerError 발생
		// db에서 수입 지출 임시로 넣어주고 실행하기
	}

	// 가계부 상세보기
	public void viewDetail(HttpServletRequest req, Ledger l) {
		try {
			List<Ledger> detailMsgs = ss.getMapper(LedgerMapper.class).detailLedger(l);
			req.setAttribute("msgs", detailMsgs);
			
			BigDecimal fl_no = l.getFl_no();
			l.setFl_no(fl_no);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시글 수정
	public void updateLedger(Ledger l, HttpServletRequest req) {
		// 수정 전의 내용 불러오기
		try {		
			BigDecimal fl_no = l.getFl_no();
			String fl_date = req.getParameter("fl_date");
			String fl_category = req.getParameter("fl_category");
			int fl_expense = Integer.parseInt(req.getParameter("fl_expense"));
			int fl_income = Integer.parseInt(req.getParameter("fl_income"));
			String fl_detail = req.getParameter("fl_detail");

			l.setFl_no(fl_no);
			l.setFl_date(fl_date);
			l.setFl_category(fl_category);
			l.setFl_expense(fl_expense);
			l.setFl_income(fl_income);
			l.setFl_detail(fl_detail);
			req.setAttribute("no", fl_no);

			if (ss.getMapper(LedgerMapper.class).updateDetail(l) == 1) {
				req.setAttribute("r", "글수정성공");
//	            req.getSession().setAttribute("boardGo", b);
			} else {
				req.setAttribute("r", "글수정실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("r", "글수정실패DB");
		}
	}

	// 게시글 삭제
	public void deleteLedger(Ledger l, HttpServletRequest req) {
		try {
			BigDecimal fl_no = l.getFl_no();
			l.setFl_no(fl_no);
			if (ss.getMapper(LedgerMapper.class).deleteDetail(l) == 1) {
				req.setAttribute("r", "삭제성공");
			} else {
				req.setAttribute("r", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "삭제실패DB");
		}
	}

	public void getAllLedger(HttpServletRequest req) {
		try {
			List<Ledger> ledgers = ss.getMapper(LedgerMapper.class).getAllLedger();
			req.setAttribute("ledgers", ledgers);
			/*req.setAttribute("ledgers", ss.getMapper(LedgerMapper.class).getAllLedger());*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
