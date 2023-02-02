package com.ki.lg01.ledger;

import java.util.List;


public interface LedgerMapper {
	public abstract int writeLedger(Ledger l);
	public abstract List<Ledger> getLedger();
	public abstract int monthExpense(Monthly m);
	public abstract int monthIncome(Monthly m);
	public abstract List<Ledger> detailLedger(Ledger l);
	public abstract int updateDetail(Ledger l);
	public abstract int deleteDetail(Ledger l);
	
	
	public abstract List<Ledger> getAllLedger();
}
