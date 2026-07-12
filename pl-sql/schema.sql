CREATE TABLLE Customers(
	CustomerId NUMBER PRIMARY KEY,
	CustomerName Varchar2(50),
	Age Number,
	balance Number, 
	isVip VARCHAR2(2)
);

CREATE TABLE Loans(
LoanId Number primary key, 
customerId number, 
interestRate Number, 
DueDate DATE,
Foreign Key (CustomerId) References Customers(CustomerId)
);


INSERT INTO Customers VALUES (1, 'Alice', 65, 12000, 'FALSE');
INSERT INTO Customers VALUES (2, 'Bob', 45, 8000, 'FALSE');
INSERT INTO Customers VALUES (3, 'Charlie', 70, 15000, 'FALSE');

INSERT INTO Loans VALUES (101, 1, 8.5, SYSDATE + 20);
INSERT INTO Loans VALUES (102, 2, 9.0, SYSDATE + 50);
INSERT INTO Loans VALUES (103, 3, 7.5, SYSDATE + 15);

COMMIT;