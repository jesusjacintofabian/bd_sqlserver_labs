/*========================================================
  1. CREAR BASE DE DATOS
========================================================*/

CREATE DATABASE pubs;
GO

USE pubs;
GO


/*========================================================
  2. CREACION DE TABLAS
========================================================*/


/*========================================================
  TABLA: jobs
========================================================*/

CREATE TABLE jobs
(
    job_id SMALLINT NOT NULL,
    job_desc VARCHAR(50) NOT NULL,
    min_lvl TINYINT,
    max_lvl TINYINT
);  
GO

ALTER TABLE jobs
ADD CONSTRAINT PK_jobs
PRIMARY KEY CLUSTERED (job_id);
GO


/*========================================================
  TABLA: publishers
========================================================*/

CREATE TABLE publishers
(
    pub_id CHAR(4) NOT NULL,
    pub_name VARCHAR(40) NOT NULL,
    city VARCHAR(20),
    state CHAR(2),
    country VARCHAR(30)
);
GO

ALTER TABLE publishers
ADD CONSTRAINT PK_publishers
PRIMARY KEY CLUSTERED (pub_id);
GO


/*========================================================
  TABLA: stores
========================================================*/

CREATE TABLE stores
(
    stor_id CHAR(4) NOT NULL,
    stor_name VARCHAR(40),
    stor_address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5)
);
GO

ALTER TABLE stores
ADD CONSTRAINT PK_stores
PRIMARY KEY CLUSTERED (stor_id);
GO


/*========================================================
  TABLA: authors
========================================================*/

CREATE TABLE authors
(
    au_id VARCHAR(11) NOT NULL,
    au_lname VARCHAR(40),
    au_fname VARCHAR(20),
    phone CHAR(12),
    address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5),
    contract BIT
);
GO

ALTER TABLE authors
ADD CONSTRAINT PK_authors
PRIMARY KEY CLUSTERED (au_id);
GO


/*========================================================
  TABLA: employee
========================================================*/

CREATE TABLE employee
(
    emp_id CHAR(9) NOT NULL,
    fname VARCHAR(20),
    minit CHAR(1),
    lname VARCHAR(30),
    job_id SMALLINT,
    job_lvl TINYINT,
    pub_id CHAR(4),
    hire_date DATETIME
);
GO

ALTER TABLE employee
ADD CONSTRAINT PK_employee
PRIMARY KEY CLUSTERED (emp_id);
GO

ALTER TABLE employee
ADD CONSTRAINT FK_employee_jobs
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);
GO

ALTER TABLE employee
ADD CONSTRAINT FK_employee_publishers
FOREIGN KEY (pub_id)
REFERENCES publishers(pub_id);
GO


/*========================================================
  TABLA: titles
========================================================*/

CREATE TABLE titles
(
    title_id VARCHAR(6) NOT NULL,
    title VARCHAR(80),
    type CHAR(12),
    pub_id CHAR(4),
    price MONEY,
    advance MONEY,
    royalty INT,
    ytd_sales INT,
    notes VARCHAR(200),
    pubdate DATETIME
);
GO

ALTER TABLE titles
ADD CONSTRAINT PK_titles
PRIMARY KEY CLUSTERED (title_id);
GO

ALTER TABLE titles
ADD CONSTRAINT FK_titles_publishers
FOREIGN KEY (pub_id)
REFERENCES publishers(pub_id);
GO


/*========================================================
  TABLA: discounts
========================================================*/

CREATE TABLE discounts
(
    discounttype VARCHAR(40),
    stor_id CHAR(4),
    lowqty SMALLINT,
    highqty SMALLINT,
    discount DECIMAL(4,2)
);
GO

ALTER TABLE discounts
ADD CONSTRAINT FK_discounts_stores
FOREIGN KEY (stor_id)
REFERENCES stores(stor_id);
GO


/*========================================================
  TABLA: sales
========================================================*/

CREATE TABLE sales
(
    stor_id CHAR(4) NOT NULL,
    ord_num VARCHAR(20) NOT NULL,
    ord_date DATETIME,
    qty SMALLINT,
    payterms VARCHAR(12),
    title_id VARCHAR(6)
);
GO

ALTER TABLE sales
ADD CONSTRAINT PK_sales
PRIMARY KEY CLUSTERED (stor_id, ord_num, title_id);
GO

ALTER TABLE sales
ADD CONSTRAINT FK_sales_stores
FOREIGN KEY (stor_id)
REFERENCES stores(stor_id);
GO

ALTER TABLE sales
ADD CONSTRAINT FK_sales_titles
FOREIGN KEY (title_id)
REFERENCES titles(title_id);
GO


/*========================================================
  TABLA: roysched
========================================================*/

CREATE TABLE roysched
(
    title_id VARCHAR(6) NOT NULL,
    lorange INT,
    hirange INT,
    royalty INT
);
GO

ALTER TABLE roysched
ADD CONSTRAINT FK_roysched_titles
FOREIGN KEY (title_id)
REFERENCES titles(title_id);
GO


/*========================================================
  TABLA: titleauthor
========================================================*/

CREATE TABLE titleauthor
(
    au_id VARCHAR(11) NOT NULL,
    title_id VARCHAR(6) NOT NULL,
    au_ord TINYINT,
    royaltyper INT
);
GO

ALTER TABLE titleauthor
ADD CONSTRAINT PK_titleauthor
PRIMARY KEY CLUSTERED (au_id, title_id);
GO

ALTER TABLE titleauthor
ADD CONSTRAINT FK_titleauthor_authors
FOREIGN KEY (au_id)
REFERENCES authors(au_id);
GO

ALTER TABLE titleauthor
ADD CONSTRAINT FK_titleauthor_titles
FOREIGN KEY (title_id)
REFERENCES titles(title_id);
GO


/*========================================================
  TABLA: pub_info
========================================================*/

CREATE TABLE pub_info
(
    pub_id CHAR(4) NOT NULL,
    logo IMAGE,
    pr_info TEXT
);
GO

ALTER TABLE pub_info
ADD CONSTRAINT PK_pub_info
PRIMARY KEY CLUSTERED (pub_id);
GO

ALTER TABLE pub_info
ADD CONSTRAINT FK_pub_info_publishers
FOREIGN KEY (pub_id)
REFERENCES publishers(pub_id);
GO
