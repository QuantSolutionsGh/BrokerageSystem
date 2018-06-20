/* It's an intersting way JPA does the mapping. Note that if in our Java domain, we have a field like
firstName, this translates as first_Name or first_name in our sql script file.

*/

create table users (
    id int identity not null,
    username varchar(50) not null,
    fullname varchar(100) not null,
    password varchar(100) not null,

    enabled int,

    primary key (id)
);

create table user_roles(
    id int identity not null,
    username varchar(50) not null,
    role varchar(50) not NULL,
    PRIMARY KEY (id),
    CONSTRAINT user_userroles_fk FOREIGN KEY (username) REFERENCES users(username)

);

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

insert into Insurer(id,company_name) values(3,'DONEWELL INSURANCE');

insert into Report(id,report_id,report_description) values(1,'test.rptdesign','Test Report');

insert into users (id,username,password,enabled,fullname)
values (1,'admin','$2a$10$E3mPTZb50e7sSW15fDx8Ne7hDZpfDjrmMPTTUp8wVjLTu.G5oPYCO',1,'administrator');

insert into user_roles(id,username,role) values(1,'admin','admin');
