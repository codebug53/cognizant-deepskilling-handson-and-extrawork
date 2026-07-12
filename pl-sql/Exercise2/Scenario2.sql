begin 
	for rec IN(
		SELECCT CustomerID, BALANCE
		FROM CUSTOMERS
	)
	LOOP
		IF REC.BALANCE > 10000 THEN 
			UPDATE CUSTOMERS 
			set isVIP = 'TRUE';
			where CustomerID = rec.CustomerId;
			end if;
			end loop;

		commit;
end; \