use newdatabases;
DROP TABLE IF EXISTS BankCustomer;
DROP TABLE IF EXISTS Depositor;
DROP TABLE IF EXISTS BankAccount;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Borrower;

CREATE TABLE Branch(
    Branch_name VARCHAR(100),
    Branch_city VARCHAR(100),
    assets REAL,
    PRIMARY KEY(Branch_name)
);

CREATE TABLE BankAccount(
    accno INT,
    Branch_name VARCHAR(100),
    balance REAL,
    PRIMARY KEY(accno)
);

SELECT * FROM Branch;

 create table depositor(customer_name varchar(100), accno int, primary key(customer_name), foreign key(accno) references BankAccount(accno));
 select * from depositor;
 
 create table BankCustomer(customer_name varchar(100), customer_street varchar(100), customer_city varchar(100), foreign key(customer_name) references depositor(customer_name));
 select * from BankCustomer;
 
 create table loan(loan_number int, Branch_name varchar(100), amount real, foreign key(Branch_name) references Branch(Branch_name), primary key(loan_number));
 
 create table Borrower(customer_name varchar(100), loan_number int, foreign key(customer_name) references BankCustomer(customer_name), foreign key(loan_number) references loan(loan_number));
 select * from Borrower;
 
  insert into Branch values("EC", "Bangalore", 70000);
 insert into Branch values("Jayanagar", "Bangalore", 40000);
 insert into Branch values("JP Nagar", "Bangalore", 150000);
 insert into Branch values("Basavangudi", "Bangalore", 250000);
 insert into Branch values("Hennur", "Bangalore", 5000);
 select * from Branch;
 
insert into BankAccount values(1000, "EC", 202210);
insert into BankAccount values(1002, "Jayanagar", 220000);
insert into BankAccount values(1003, "JP nagar", 20000);
insert into BankAccount values(1004, "Basavangudi", 200500);
insert into BankAccount values(1005, "Hennur", 2000);
insert into BankAccount values(1006, "Hennur", 21000);
select accno from BankAccount where Branch_name = "Hennur";
 
insert into depositor values("James",1000);
insert into depositor values("Malcom",1002);
insert into depositor values("Scott",1003);
insert into depositor values("Travis",1004);
insert into depositor values("Arthur",1005);
select customer_name from depositor where accno = 1005;
select customer_name from depositor where accno = 1006;

insert into BankCustomer values("James", "Bull road", "Bangalore");
insert into BankCustomer values("Malcom", "NICE road", "Bangalore");
insert into BankCustomer values("Scott", "Kanakpura road", "Bangalore");
insert into BankCustomer values("Travis", "BEML road", "Bangalore");
insert into BankCustomer values("Arthur", "BEL road", "Bangalore");
select * from BankCustomer;

insert into loan values(1, "EC", 2000);
insert into loan values(2, "Jayanagar", 20000);
insert into loan values(3, "JP nagar", 5000);
insert into loan values(4, "Basavangudi", 4000);
insert into loan values(5, "Hennur", 2100);
select * from loan;

insert into Borrower values("James", 1);
insert into Borrower values("Malcom", 2);
insert into Borrower values("Scott", 3);
insert into Borrower values("Travis", 4);
insert into Borrower values("Arthur", 5);
insert into Borrower values("Arnold", 7);
select * from borrower;

Select customer_name
From Borrower ,loan 
Where borrower.loan_number=loan.loan_number
and loan.branch_name in (select branch_name
from depositer, bankaccount
where depositer.accno = bankaccount.accno And bankaccount.branch_name in
 (Select branch_name from branch WHERE branch.branch_city='Bangalore')); 


Select branch_name From Branch
Where assets>(Select Sum(assets) from branch Where branch_city='Bangalore');

update BankAccount set balance = balance+0.05*balance where Branch_name = "Basavangudi";
select * from BankAccount;
