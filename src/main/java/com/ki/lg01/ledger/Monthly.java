package com.ki.lg01.ledger;

public class Monthly {
	private int expense;
	private int income;
	private int total;
	
	public Monthly() {
		// TODO Auto-generated constructor stub
	}

	public Monthly(int expense, int income, int total) {
		super();
		this.expense = expense;
		this.income = income;
		this.total = total;
	}

	public int getExpense() {
		return expense;
	}

	public void setExpense(int expense) {
		this.expense = expense;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	

}
