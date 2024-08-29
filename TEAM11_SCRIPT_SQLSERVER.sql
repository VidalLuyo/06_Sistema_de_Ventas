CREATE DATABASE SISTEMA_DE_VENTAS;
USE SISTEMA_DE_VENTAS;

-- Table: CUSTOMER
CREATE TABLE CUSTOMER (
    ID_CUSTOMER int  NOT NULL,
    DOCUMENTTYPE char(3)  NOT NULL,
    DOCUMENTNUMBER varchar(15)  NOT NULL,
    NAMES varchar(50)  NOT NULL,
    SURNAMES varchar(50)  NOT NULL,
    CELLPHONE varchar(50)  NOT NULL,
    GMAIL int  NOT NULL,
    STATUS bit  NOT NULL,
    CONSTRAINT CUSTOMER_pk PRIMARY KEY  (ID_CUSTOMER)
);

-- Table: Employees
CREATE TABLE Employees (
    ID_EMPLOYEES int  NOT NULL,
    DOCUMENTTYPE char(3)  NOT NULL,
    DOCUMENTNUMBER varchar(15)  NOT NULL,
    NAMES varchar(50)  NOT NULL,
    SURNAMES varchar(50)  NOT NULL,
    CELLPHONE char(9)  NOT NULL,
    STATUS bit  NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY  (ID_EMPLOYEES)
);

-- Table: PRODUCTS
CREATE TABLE PRODUCTS (
    ID_PRODUCTS int  NOT NULL,
    NAMES varchar(50)  NOT NULL,
    DESCRIPTION varchar(150)  NOT NULL,
    PRICE decimal(10,2)  NOT NULL,
    AMOUNT int  NOT NULL,
    STATUS bit  NOT NULL,
    Employees_ID_EMPLOYEES int  NOT NULL,
    CONSTRAINT PRODUCTS_pk PRIMARY KEY  (ID_PRODUCTS)
);

-- Table: Ventas
CREATE TABLE Ventas (
    ID_SALES int  NOT NULL,
    AMOUNT decimal(10,2)  NOT NULL,
    ADDRESS varchar(100)  NOT NULL,
    DATESALES date  NOT NULL,
    PRODUCTS_ID_PRODUCTS int  NOT NULL,
    CUSTOMER_ID_CUSTOMER int  NOT NULL,
    CONSTRAINT Ventas_pk PRIMARY KEY  (ID_SALES)
);

-- Table: Ventas_Detalle
CREATE TABLE Ventas_Detalle (
    ID_SALESDATEIL int  NOT NULL,
    AMOUNT int  NOT NULL,
    UNITPRICE decimal(10,2)  NOT NULL,
    Ventas_ID_SALES int  NOT NULL,
    PRODUCTS_ID_PRODUCTS int  NOT NULL,
    CONSTRAINT Ventas_Detalle_pk PRIMARY KEY  (ID_SALESDATEIL)
);

-- foreign keys
-- Reference: Productos_Empleados (table: PRODUCTS)
ALTER TABLE PRODUCTS ADD CONSTRAINT Productos_Empleados
    FOREIGN KEY (Employees_ID_EMPLOYEES)
    REFERENCES Employees (ID_EMPLOYEES);

-- Reference: Ventas_Cliente (table: Ventas)
ALTER TABLE Ventas ADD CONSTRAINT Ventas_Cliente
    FOREIGN KEY (CUSTOMER_ID_CUSTOMER)
    REFERENCES CUSTOMER (ID_CUSTOMER);

-- Reference: Ventas_Detalle_Productos (table: Ventas_Detalle)
ALTER TABLE Ventas_Detalle ADD CONSTRAINT Ventas_Detalle_Productos
    FOREIGN KEY (PRODUCTS_ID_PRODUCTS)
    REFERENCES PRODUCTS (ID_PRODUCTS);

-- Reference: Ventas_Detalle_Ventas (table: Ventas_Detalle)
ALTER TABLE Ventas_Detalle ADD CONSTRAINT Ventas_Detalle_Ventas
    FOREIGN KEY (Ventas_ID_SALES)
    REFERENCES Ventas (ID_SALES);

-- Reference: Ventas_Productos (table: Ventas)
ALTER TABLE Ventas ADD CONSTRAINT Ventas_Productos
    FOREIGN KEY (PRODUCTS_ID_PRODUCTS)
    REFERENCES PRODUCTS (ID_PRODUCTS);