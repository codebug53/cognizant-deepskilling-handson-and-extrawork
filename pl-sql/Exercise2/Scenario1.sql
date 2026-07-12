Begin 
	
	for rec IN(
	Select l.LoanId, c.Age
	from Customers c
	joins loans l
	on c.CustomerId = l.customerID
	)
	Loop 
		if rec.age > 60 then 
		update loans 
		set interestRate = interestRate-1
		where loanId = rec.loanId;
		END If;
	end loop;

commit;


end; /