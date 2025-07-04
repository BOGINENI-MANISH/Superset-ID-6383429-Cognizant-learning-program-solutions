-- STEP 1 & 2: CREATE TABLES + INSERT DATA

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Transactions CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Accounts CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Loans CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Employees CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE
);

ALTER TABLE Customers ADD IsVIP VARCHAR2(5);

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionDate DATE,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
);

-- Insert sample data
INSERT INTO Customers VALUES (1, 'John Doe', TO_DATE('1950-05-15', 'YYYY-MM-DD'), 12000, SYSDATE, NULL);
INSERT INTO Customers VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 9000, SYSDATE, NULL);
INSERT INTO Customers VALUES (3, 'Robert Brown', TO_DATE('1948-09-10', 'YYYY-MM-DD'), 8000, SYSDATE, NULL);

INSERT INTO Accounts VALUES (1, 1, 'Savings', 12000, SYSDATE);
INSERT INTO Accounts VALUES (2, 2, 'Checking', 9000, SYSDATE);
INSERT INTO Accounts VALUES (3, 3, 'Savings', 8000, SYSDATE);

INSERT INTO Transactions VALUES (1, 1, SYSDATE, 200, 'Deposit');
INSERT INTO Transactions VALUES (2, 2, SYSDATE, 300, 'Withdrawal');

INSERT INTO Loans VALUES (1, 1, 5000, 6.5, SYSDATE - 100, SYSDATE + 10);
INSERT INTO Loans VALUES (2, 2, 8000, 7.0, SYSDATE - 300, SYSDATE + 40);
INSERT INTO Loans VALUES (3, 3, 7000, 5.5, SYSDATE - 400, SYSDATE + 20);

INSERT INTO Employees VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));
INSERT INTO Employees VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

COMMIT;
