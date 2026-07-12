-- Exercise 3: Stored Procedures Schema Setup
-- Run this script to create the Accounts and Employees tables and populate them with test data.

-- Drop existing tables to ensure a clean setup
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create Accounts Table
CREATE TABLE Accounts (
    AccountId NUMBER PRIMARY KEY,
    CustomerId NUMBER,
    AccountType VARCHAR2(20) CHECK (AccountType IN ('Savings', 'Checking')),
    Balance NUMBER,
    LastUpdate DATE,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeId NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Department VARCHAR2(50),
    Salary NUMBER,
    Bonus NUMBER DEFAULT 0
);

-- Insert Sample Accounts Data
INSERT INTO Accounts (AccountId, CustomerId, AccountType, Balance, LastUpdate) VALUES (1001, 1, 'Savings', 5000, SYSDATE);
INSERT INTO Accounts (AccountId, CustomerId, AccountType, Balance, LastUpdate) VALUES (1002, 1, 'Checking', 7000, SYSDATE);
INSERT INTO Accounts (AccountId, CustomerId, AccountType, Balance, LastUpdate) VALUES (1003, 2, 'Savings', 8000, SYSDATE);
INSERT INTO Accounts (AccountId, CustomerId, AccountType, Balance, LastUpdate) VALUES (1004, 3, 'Savings', 15000, SYSDATE);

-- Insert Sample Employees Data
INSERT INTO Employees (EmployeeId, Name, Department, Salary, Bonus) VALUES (201, 'David', 'HR', 5000, 500);
INSERT INTO Employees (EmployeeId, Name, Department, Salary, Bonus) VALUES (202, 'Eva', 'IT', 6000, 600);
INSERT INTO Employees (EmployeeId, Name, Department, Salary, Bonus) VALUES (203, 'Frank', 'IT', 7000, 700);
INSERT INTO Employees (EmployeeId, Name, Department, Salary, Bonus) VALUES (204, 'Grace', 'HR', 4500, 450);

COMMIT;
