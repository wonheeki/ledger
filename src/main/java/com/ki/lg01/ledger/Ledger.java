package com.ki.lg01.ledger;

import java.math.BigDecimal;
import java.util.Date;

public class Ledger {
	private BigDecimal rn;
	private BigDecimal fl_no;
	private String fl_date;
	private String fl_category;
	private int fl_expense; // 지출
	private int fl_income; // 수입
	private String fl_detail; 
/*	private BigDecimal fl_ex_total; // 지출 총합 
	private BigDecimal fl_in_total; // 수입 총합
	private BigDecimal fl_total;*/
	
	public Ledger() {
		// TODO Auto-generated constructor stub
	}

	public Ledger(BigDecimal rn, BigDecimal fl_no, String fl_date, String fl_category, int fl_expense,
			int fl_income, String fl_detail/*, BigDecimal fl_ex_total, BigDecimal fl_in_total,
			BigDecimal fl_total*/) {
		super();
		this.rn = rn;
		this.fl_no = fl_no;
		this.fl_date = fl_date;
		this.fl_category = fl_category;
		this.fl_expense = fl_expense;
		this.fl_income = fl_income;
		this.fl_detail = fl_detail;
		/*this.fl_ex_total = fl_ex_total;
		this.fl_in_total = fl_in_total;
		this.fl_total = fl_total;*/
	}

	public BigDecimal getRn() {
		return rn;
	}

	public void setRn(BigDecimal rn) {
		this.rn = rn;
	}

	public BigDecimal getFl_no() {
		return fl_no;
	}

	public void setFl_no(BigDecimal fl_no) {
		this.fl_no = fl_no;
	}

	public String getFl_date() {
		return fl_date;
	}

	public void setFl_date(String fl_date) {
		this.fl_date = fl_date;
	}

	public String getFl_category() {
		return fl_category;
	}

	public void setFl_category(String fl_category) {
		this.fl_category = fl_category;
	}

	public int getFl_expense() {
		return fl_expense;
	}

	public void setFl_expense(int fl_expense) {
		this.fl_expense = fl_expense;
	}

	public int getFl_income() {
		return fl_income;
	}

	public void setFl_income(int fl_income) {
		this.fl_income = fl_income;
	}

	public String getFl_detail() {
		return fl_detail;
	}

	public void setFl_detail(String fl_detail) {
		this.fl_detail = fl_detail;
	}

/*	public BigDecimal getFl_ex_total() {
		return fl_ex_total;
	}

	public void setFl_ex_total(BigDecimal fl_ex_total) {
		this.fl_ex_total = fl_ex_total;
	}

	public BigDecimal getFl_in_total() {
		return fl_in_total;
	}

	public void setFl_in_total(BigDecimal fl_in_total) {
		this.fl_in_total = fl_in_total;
	}

	public BigDecimal getFl_total() {
		return fl_total;
	}

	public void setFl_total(BigDecimal fl_total) {
		this.fl_total = fl_total;
	}*/

	
}
