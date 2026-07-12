-- Verification Script for Exercise 3: Stored Procedures
-- This script runs tests for Scenario 1, Scenario 2, and Scenario 3.
-- Run this in an SQL block to verify the procedures.

SET SERVEROUTPUT ON;

DECLARE
    v_pre_balance NUMBER;
    v_post_balance NUMBER;
    v_emp_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- 1. INITIAL STATE OF ACCOUNTS ---');
    FOR r IN (SELECT AccountId, CustomerId, AccountType, Balance FROM Accounts ORDER BY AccountId) LOOP
        DBMS_OUTPUT.PUT_LINE('Account ' || r.AccountId || ' (' || r.AccountType || ') Balance: ' || r.Balance);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(CHR(10) || '--- 2. INITIAL STATE OF EMPLOYEES ---');
    FOR r IN (SELECT EmployeeId, Name, Department, Salary FROM Employees ORDER BY EmployeeId) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ' || r.EmployeeId || ' (' || r.Name || ') Dept: ' || r.Department || ' Salary: ' || r.Salary);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=========================================');
    DBMS_OUTPUT.PUT_LINE('TESTING SCENARIO 1: ProcessMonthlyInterest');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    ProcessMonthlyInterest;
    DBMS_OUTPUT.PUT_LINE('Monthly interest applied successfully.');
    
    DBMS_OUTPUT.PUT_LINE('--- ACCOUNTS AFTER INTEREST APPLICATION ---');
    FOR r IN (SELECT AccountId, CustomerId, AccountType, Balance FROM Accounts ORDER BY AccountId) LOOP
        DBMS_OUTPUT.PUT_LINE('Account ' || r.AccountId || ' (' || r.AccountType || ') Balance: ' || r.Balance);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=========================================');
    DBMS_OUTPUT.PUT_LINE('TESTING SCENARIO 2: UpdateEmployeeBonus');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Updating IT department with a 10% bonus...');
    UpdateEmployeeBonus('IT', 10);
    DBMS_OUTPUT.PUT_LINE('Bonus applied successfully.');
    
    DBMS_OUTPUT.PUT_LINE('--- EMPLOYEES AFTER BONUS APPLICATION ---');
    FOR r IN (SELECT EmployeeId, Name, Department, Salary FROM Employees ORDER BY EmployeeId) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ' || r.EmployeeId || ' (' || r.Name || ') Dept: ' || r.Department || ' Salary: ' || r.Salary);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=========================================');
    DBMS_OUTPUT.PUT_LINE('TESTING SCENARIO 3: TransferFunds (Valid Case)');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Transferring 1500 from Account 1001 to 1002...');
    TransferFunds(1001, 1002, 1500);
    DBMS_OUTPUT.PUT_LINE('Transfer completed successfully.');
    
    DBMS_OUTPUT.PUT_LINE('--- ACCOUNTS AFTER VALID FUND TRANSFER ---');
    FOR r IN (SELECT AccountId, CustomerId, AccountType, Balance FROM Accounts ORDER BY AccountId) LOOP
        DBMS_OUTPUT.PUT_LINE('Account ' || r.AccountId || ' (' || r.AccountType || ') Balance: ' || r.Balance);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=========================================');
    DBMS_OUTPUT.PUT_LINE('TESTING SCENARIO 3: TransferFunds (Insufficient Balance Case)');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Attempting to transfer 100000 from Account 1001 to 1002...');
    BEGIN
        TransferFunds(1001, 1002, 100000);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Caught Expected Error: ' || SQLERRM);
    END;
    
    DBMS_OUTPUT.PUT_LINE('--- ACCOUNTS AFTER FAILED TRANSFER (Balances should be unchanged) ---');
    FOR r IN (SELECT AccountId, CustomerId, AccountType, Balance FROM Accounts ORDER BY AccountId) LOOP
        DBMS_OUTPUT.PUT_LINE('Account ' || r.AccountId || ' (' || r.AccountType || ') Balance: ' || r.Balance);
    END LOOP;
    
END;
/
