-- Scenario 2: Implement a bonus scheme for employees based on performance.
-- Write a stored procedure UpdateEmployeeBonus that updates the salary of employees
-- in a given department by adding a bonus percentage passed as a parameter.

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_Department IN VARCHAR2,
    p_BonusPercentage IN NUMBER
) IS
BEGIN
    -- Input parameter validation
    IF p_Department IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Department name cannot be null.');
    END IF;
    
    IF p_BonusPercentage IS NULL OR p_BonusPercentage < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Bonus percentage must be greater than or equal to 0.');
    END IF;

    -- Update salary by applying the bonus percentage to employees in the specified department
    UPDATE Employees
    SET Salary = Salary + (Salary * (p_BonusPercentage / 100))
    WHERE Department = p_Department;
    
    -- Commit the changes to the database
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Rollback changes in case of failure to maintain consistency
        ROLLBACK;
        RAISE;
END UpdateEmployeeBonus;
/
