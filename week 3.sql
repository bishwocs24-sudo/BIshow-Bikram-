USE bish;
DROP TABLE IF EXISTS BankCustomer;
DROP TABLE IF EXISTS Depositor;
DROP TABLE IF EXISTS BankAccount;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Branch;

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

 create table depositor(customer_name varchar(100), accno int, primary key(customer_name,accno), foreign key(accno) references BankAccount(accno));
 select * from depositor;
 
 create table BankCustomer(customer_name varchar(100), customer_street varchar(100), customer_city varchar(100), foreign key(customer_name) references depositor(customer_name));
 select * from BankCustomer;
 
 create table loan(loan_number int, Branch_name varchar(100), amount real, foreign key(Branch_name) references Branch(Branch_name));
 
 insert into Branch values("rr nagar", "Bangalore", 70000);
 insert into Branch values("Jayanagar", "Bangalore", 40000);
 insert into Branch values("JP Nagar", "Bangalore", 150000);
 insert into Branch values("Basavangudi", "Bangalore", 250000);
 insert into Branch values("Hennur", "Bangalore", 5000);
 select * from Branch;
 
insert into BankAccount values(1007, "rr nagar", 202210);
INSERT INTO BankAccount VALUES (1012, 'Jayanagar', 150000);
insert into BankAccount values(1019, "Jayanagar", 220000);
insert into BankAccount values(1013, "JP nagar", 20000);
insert into BankAccount values(1014, "Basavangudi", 200500);
insert into BankAccount values(1015, "Hennur", 2000);
select * from BankAccount;
 
insert into depositor values("chandan",1007);
insert into depositor values("chandan",1012);
insert into depositor values("Malcom",1019);
insert into depositor values("Scott",1013);
insert into depositor values("Travis",1014);
insert into depositor values("Arthur",1015);
select * from depositor;

insert into BankCustomer values("chandan", "Bull road", "Bangalore");
insert into BankCustomer values("Malcom", "NICE road", "Bangalore");
insert into BankCustomer values("Scott", "Kanakpura road", "Bangalore");
insert into BankCustomer values("Travis", "BEML road", "Bangalore");
insert into BankCustomer values("Arthur", "BEL road", "Bangalore");
select * from BankCustomer;

insert into loan values(1, "rr nagar", 2000);
insert into loan values(2, "Jayanagar", 20000);
insert into loan values(3, "JP nagar", 5000);
insert into loan values(4, "Basavangudi", 4000);
insert into loan values(5, "Hennur", 2100);
select * from loan;

SELECT customer_name
FROM depositor d
JOIN BankAccount b ON d.accno = b.accno
GROUP BY customer_name, b.Branch_name
HAVING COUNT(*) >= 2;