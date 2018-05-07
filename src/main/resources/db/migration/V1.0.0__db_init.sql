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


CREATE TABLE Policy (
    id INT IDENTITY not null,
    customer_id int not null,
    policy_Number VARCHAR(100) NOT NULL,
    policy_Type VARCHAR(100),
    cover_Fm_Date DATE NOT NULL,
    cover_To_Date DATE NOT NULL,
    insurance_Company VARCHAR(255) NOT NULL,
    premium DOUBLE,
    PRIMARY KEY (id),
    constraint policy_customer_fk FOREIGN KEY (customer_id) REFERENCES customer(id)

);



CREATE TABLE PaymentDetails (
    id INT NOT NULL  IDENTITY ,
    policy_id int not null,
    amt_Paid double,
    transaction_Date DATE,
    PRIMARY KEY (id),
    constraint paymentDetails_policy_fk FOREIGN KEY (policy_id) REFERENCES Policy(id)
);