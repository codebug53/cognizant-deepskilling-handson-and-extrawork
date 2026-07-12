-- Scenario 3: Customers should be able to transfer funds between their accounts.
-- Write a stored procedure TransferFunds that transfers a specified amount from one account
-- to another, checking that the source account has sufficient balance before making the transfer.

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_SourceAccountId IN NUMBER,
    p_DestinationAccountId IN NUMBER,
    p_Amount IN NUMBER
) IS
    v_SourceBalance NUMBER;
    v_DestExists NUMBER;
BEGIN
    -- 1. Validate that the transfer amount is positive and non-null
    IF p_Amount IS NULL OR p_Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Transfer amount must be positive and non-null.');
    END IF;
    
    -- 2. Prevent self-transfer
    IF p_SourceAccountId = p_DestinationAccountId THEN
        RAISE_APPLICATION_ERROR(-20004, 'Source and destination accounts must be different.');
    END IF;

    -- 3. Lock and retrieve source account balance to prevent race conditions
    BEGIN
        SELECT Balance INTO v_SourceBalance
        FROM Accounts
        WHERE AccountId = p_SourceAccountId
        FOR UPDATE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20005, 'Source account with ID ' || p_SourceAccountId || ' does not exist.');
    END;

    -- 4. Check if the destination account exists
    BEGIN
        SELECT 1 INTO v_DestExists
        FROM Accounts
        WHERE AccountId = p_DestinationAccountId;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20006, 'Destination account with ID ' || p_DestinationAccountId || ' does not exist.');
    END;

    -- 5. Check for sufficient balance in the source account
    IF v_SourceBalance < p_Amount THEN
        RAISE_APPLICATION_ERROR(-20007, 'Insufficient balance. Account ' || p_SourceAccountId || 
            ' has balance ' || v_SourceBalance || ', but requested transfer is ' || p_Amount || '.');
    END IF;

    -- 6. Perform the fund transfer
    -- Deduct from the source account
    UPDATE Accounts
    SET Balance = Balance - p_Amount,
        LastUpdate = SYSDATE
    WHERE AccountId = p_SourceAccountId;

    -- Add to the destination account
    UPDATE Accounts
    SET Balance = Balance + p_Amount,
        LastUpdate = SYSDATE
    WHERE AccountId = p_DestinationAccountId;

    -- 7. Commit the transaction atomically
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Rollback all changes in the current transaction block if any error occurs
        ROLLBACK;
        RAISE;
END TransferFunds;
/
