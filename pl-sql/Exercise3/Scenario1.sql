-- Scenario 1: Process monthly interest for all savings accounts.
-- Write a stored procedure ProcessMonthlyInterest that calculates and updates
-- the balance of all savings accounts by applying an interest rate of 1% to the current balance.

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
    -- Explicit cursor to select all savings accounts and lock them for update
    CURSOR c_savings_accounts IS
        SELECT AccountId, Balance
        FROM Accounts
        WHERE AccountType = 'Savings'
        FOR UPDATE;
        
    v_AccountId Accounts.AccountId%TYPE;
    v_Balance Accounts.Balance%TYPE;
BEGIN
    OPEN c_savings_accounts;
    LOOP
        FETCH c_savings_accounts INTO v_AccountId, v_Balance;
        EXIT WHEN c_savings_accounts%NOTFOUND;
        
        -- Update the balance by applying 1% interest and updating the timestamp
        UPDATE Accounts
        SET Balance = Balance * 1.01,
            LastUpdate = SYSDATE
        WHERE CURRENT OF c_savings_accounts;
    END LOOP;
    CLOSE c_savings_accounts;
    
    -- Commit the changes to the database
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Ensure cursor is closed in case of an error
        IF c_savings_accounts%ISOPEN THEN
            CLOSE c_savings_accounts;
        END IF;
        -- Rollback the transaction to maintain data integrity
        ROLLBACK;
        RAISE;
END ProcessMonthlyInterest;
/
