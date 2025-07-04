CREATE OR REPLACE PROCEDURE TransferFunds (
  fromAccountID IN NUMBER,
  toAccountID IN NUMBER,
  amount IN NUMBER
) AS
  fromBalance NUMBER;
BEGIN
  -- Check if source account has sufficient balance
  SELECT Balance INTO fromBalance
  FROM Accounts
  WHERE AccountID = fromAccountID;

  IF fromBalance < amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
  END IF;

  -- Subtract from source
  UPDATE Accounts
  SET Balance = Balance - amount
  WHERE AccountID = fromAccountID;

  -- Add to destination
  UPDATE Accounts
  SET Balance = Balance + amount
  WHERE AccountID = toAccountID;

  COMMIT;
END;
/
