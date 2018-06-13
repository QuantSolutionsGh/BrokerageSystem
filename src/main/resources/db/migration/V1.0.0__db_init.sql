/* It's an intersting way JPA does the mapping. Note that if in our Java domain, we have a field like
firstName, this translates as first_Name or first_name in our sql script file.

*/


CREATE TABLE Customer (
    id INT IDENTITY not null,
    last_Name VARCHAR(100) NOT NULL,
    first_Name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    address_line3 VARCHAR(255),
    other_Names varchar(100),
    PRIMARY KEY (id)
);

CREATE TABLE Sales_Agent(
    id INT NOT NULL IDENTITY ,
    agent_Name varchar(255) not null,
    PRIMARY KEY (id)
);


CREATE TABLE Insurer(
    id int not null identity,
    company_Name varchar(255) not null,
    primary key(id)

);


CREATE TABLE Policy (
    id INT IDENTITY not null,
    customer_id int not null,
    insurer_id int ,
    policy_Number VARCHAR(100) NOT NULL,
    policy_Type VARCHAR(100),
    cover_Fm_Date DATE NOT NULL,
    cover_To_Date DATE NOT NULL,
    insurance_Company VARCHAR(255) ,
    premium DOUBLE,
    amt_paid DOUBLE,
    agent_id int,
    PRIMARY KEY (id),
    constraint policy_customer_fk FOREIGN KEY (customer_id) REFERENCES customer(id),
    constraint policy_sales_agent_fk FOREIGN KEY (agent_id) references Sales_Agent(id),
    constraint policy_insurer_fk foreign key (insurer_id) references Insurer(id)

);


create Table Report(
    id int not null identity,
    report_id varchar(50) not null,
    report_description varchar(100) not null,
    PRIMARY KEY (id)

);



CREATE TABLE Payment_Details (
    id INT NOT NULL  IDENTITY ,
    policy_id int not null,
    amt_Paid double,
    transaction_Date DATE,
    entry_date date not null,
    comments varchar(100),
    PRIMARY KEY (id),
    constraint paymentDetails_policy_fk FOREIGN KEY (policy_id) REFERENCES Policy(id)
);


insert into Sales_Agent(id,agent_Name) values (1, 'TEST 1');

insert into Sales_Agent(id,agent_Name) values (2, 'TEST 2');

insert into Insurer(id,company_Name) values (1,'HOLLARD INSURANCE');

insert into Insurer(id, company_Name) values (2,'ENTERPRISE INSURANCE');
