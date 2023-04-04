/* Hunter Erickson, 4322 Project, 11/29/2022 */

CREATE TABLE purchase(
    id INT,
    amount INT,
    pDate DATE NOT NULL,
    cusipNum INT,
    PRIMARY KEY(id),
    FOREIGN KEY(cusipNum) REFERENCES investment_instrument(cusipNum),
    CHECK(id > 0 AND id < 1000000000),
    CHECK(amount > -1 AND amount < 1000000000),
    CHECK(cusipNum > 0 AND cusipNum < 1000000000)
);

CREATE TABLE sell(
    id INT,
    amount INT,
    sDate DATE NOT NULL,
    cusipNum INT,
    PRIMARY KEY(id),
    FOREIGN KEY(cusipNum) REFERENCES investment_instrument(cusipNum),
    CHECK(id > 0 AND id < 1000000000),
    CHECK(amount > 0 AND amount < 1000000000),
    CHECK(cusipNum > 0 AND cusipNum < 1000000000)
);

CREATE TABLE investment_account(
    accountNum INT,
    cash_balance DECIMAL(19,2) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    cusipNum INT UNIQUE,
    PRIMARY KEY(accountNum),
    FOREIGN KEY(accountNum) REFERENCES client(accountNum),
    CHECK(accountNum > 0 AND accountNum < 1000000000),
    CHECK(cusipNum > 0 AND cusipNum < 1000000000)
);

CREATE TABLE roth_IRA(
    accountNum INT,
    invested_year DECIMAL(19,2) NOT NULL,
    PRIMARY KEY(accountNum),
    FOREIGN KEY(accountNum) REFERENCES investment_account(accountNum),
    CHECK(accountNum > 0 AND accountNum < 1000000000)
);

CREATE TABLE regular_account(
    accountNum INT,
    PRIMARY KEY(accountNum),
    FOREIGN KEY(accountNum) REFERENCES investment_account(accountNum),
    CHECK(accountNum > 0 AND accountNum < 1000000000)
);

CREATE TABLE client(
    ssn INT,
    cName VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    yearly_income DECIMAL(19,2),
    accountNum INT UNIQUE,
    transID INT UNIQUE,
    PRIMARY KEY(ssn),
    CHECK(SSN > 99999999 AND SSN < 1000000000),
    CHECK(accountNum > 0 AND accountNum < 1000000000),
    CHECK(transID > 0 AND transID < 1000000000)
);

CREATE TABLE transaction(
    id INT,
    amount DECIMAL(19,2) NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES client(transID),
    CHECK(id > 0 AND id < 1000000000)
);

CREATE TABLE withdraw(
    id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES transaction(id),
    CHECK(id > 0 AND id < 1000000000)
);

CREATE TABLE deposit(
    id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES transaction(id),
    CHECK(id > 0 AND id < 1000000000)
);

CREATE TABLE investment_instrument(
    cusipNum INT,
    current_price DECIMAL(19,2) NOT NULL,
    instrument_type VARCHAR(20) NOT NULL,
    PRIMARY KEY(cusipNum),
    FOREIGN KEY(cusipNum) REFERENCES investment_account(cusipNum),
    CHECK(cusipNum > 0 AND cusipNum < 1000000000)
);

CREATE TABLE stock(
    cusipNum INT,
    ticketNum INT,
    PRIMARY KEY(cusipNum),
    FOREIGN KEY(cusipNum) REFERENCES investment_instrument(cusipNum),
    CHECK(cusipNum > 0 AND cusipNum < 1000000000),
    CHECK(ticketNum > 0 AND ticketNum < 1000000000)
);

CREATE TABLE bond(
    cusipNum INT,
    PRIMARY KEY(cusipNum),
    FOREIGN KEY(cusipNum) REFERENCES investment_instrument(cusipNum),
    CHECK(cusipNum > 0 AND cusipNum  < 1000000000)
);

/* Inserting data */
/* perform client, investment_account, investment_instrument, transaction, then however you feel. */

/* Client Insertions */
INSERT INTO client VALUES(111111111, 'Billy Bob', 'goodoljimmy@blah', 123, 111111111, 111111111);
INSERT INTO client VALUES(222222222, 'Bob Billy', 'goodoljimmy@yahooooo', 12334, 222222222, 222222222);
INSERT INTO client VALUES(333333333, 'Timothy', 'uhoh@gmail', 2837598, 333333333, 333333333);
INSERT INTO client VALUES(444444444, 'Jacoby', 'iheartgmail@yahoo', 1, 444444444, 444444444);
INSERT INTO client VALUES(555555555, 'Billy Bob', 'email@email.com', 2634783, 555555555, 555555555);

/* Investment_account Insertions */
INSERT INTO investment_account VALUES(111111111, 1222, 'Roth IRA', 111111111);
INSERT INTO investment_account VALUES(222222222, 12343, 'Roth IRA', 222222222);
INSERT INTO investment_account VALUES(333333333, 42234, 'Roth IRA', 333333333);
INSERT INTO investment_account VALUES(444444444, 1356, 'Roth IRA', 444444444);
INSERT INTO investment_account VALUES(555555555, 156677, 'Roth IRA', 555555555);

/* Investment_instrument Insertions */
INSERT INTO investment_instrument VALUES(111111111, 2, 'Bond');
INSERT INTO investment_instrument VALUES(222222222, 35733, 'Bond');
INSERT INTO investment_instrument VALUES(333333333, 13, 'Stock');
INSERT INTO investment_instrument VALUES(444444444, 15839, 'Stock');
INSERT INTO investment_instrument VALUES(555555555, 1248, 'Stock');

/* Transaction Insertions */
INSERT INTO transaction VALUES(111111111, 134, 'Deposit');
INSERT INTO transaction VALUES(222222222, 13, 'Withdraw');
INSERT INTO transaction VALUES(333333333, 122, 'Withdraw');
INSERT INTO transaction VALUES(444444444, 1, 'Deposit');
INSERT INTO transaction VALUES(555555555, 1245, 'Deposit');

/* Purchase Insertion */
INSERT INTO purchase VALUES(111111111, 134, '2017-02-11', 111111111);
INSERT INTO purchase VALUES(222222222, 12, '2017-02-10', 222222222);
INSERT INTO purchase VALUES(333333333, 4, '2017-02-09', 333333333);
INSERT INTO purchase VALUES(444444444, 23, '2017-02-08', 444444444);
INSERT INTO purchase VALUES(555555555, 237, '2017-02-07', 555555555);

/* Sell Insertion */
INSERT INTO sell VALUES(111111111, 434, '2017-02-11', 111111111);
INSERT INTO sell VALUES(222222222, 133, '2018-04-10', 222222222);
INSERT INTO sell VALUES(333333333, 23, '2011-05-09', 333333333);
INSERT INTO sell VALUES(444444444, 563, '2018-02-10', 444444444);
INSERT INTO sell VALUES(555555555, 76, '2017-01-05', 555555555);

/* Roth IRA Insertion */
INSERT INTO roth_IRA VALUES(111111111, 1342);
INSERT INTO roth_IRA VALUES(222222222, 12);
INSERT INTO roth_IRA VALUES(333333333, 3940);
INSERT INTO roth_IRA VALUES(444444444, 873);
INSERT INTO roth_IRA VALUES(555555555, 5000);

/* Regular Account Insertion */
INSERT INTO regular_account VALUES(111111111);
INSERT INTO regular_account VALUES(222222222);
INSERT INTO regular_account VALUES(333333333);
INSERT INTO regular_account VALUES(444444444);
INSERT INTO regular_account VALUES(555555555);

/* Withdraw Insertion */
INSERT INTO withdraw VALUES(111111111);
INSERT INTO withdraw VALUES(222222222);
INSERT INTO withdraw VALUES(333333333);
INSERT INTO withdraw VALUES(444444444);
INSERT INTO withdraw VALUES(555555555);

/* Deposit Insertion */
INSERT INTO deposit VALUES(111111111);
INSERT INTO deposit VALUES(222222222);
INSERT INTO deposit VALUES(333333333);
INSERT INTO deposit VALUES(444444444);
INSERT INTO deposit VALUES(555555555);

/* Stock Insertion */
INSERT INTO stock VALUES(111111111, 8463);
INSERT INTO stock VALUES(222222222, 274);
INSERT INTO stock VALUES(333333333, 38390);
INSERT INTO stock VALUES(444444444, 1);
INSERT INTO stock VALUES(555555555, 263);


/* Bond Insertion */
INSERT INTO bond VALUES(111111111);
INSERT INTO bond VALUES(222222222);
INSERT INTO bond VALUES(333333333);
INSERT INTO bond VALUES(444444444);
INSERT INTO bond VALUES(555555555);

/* Index Creation */

/* Account Number for investment_account needs an index because it is used in both the queries the company plans on using multiple times a day */
CREATE INDEX accountNumInd ON investment_account USING HASH (accountNum);


/* CUSIP Number for the table investment_instrument is my other hash index I will create. */
CREATE INDEX cusipIndex ON investment_instrument USING HASH (cusipNum);

