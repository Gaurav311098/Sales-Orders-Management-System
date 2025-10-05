CREATE TABLE Customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  address VARCHAR(255),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  zip_code VARCHAR(10),
  registration_date DATE,
  status ENUM('Active', 'Inactive') DEFAULT 'Active'
);


CREATE TABLE Products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  category VARCHAR(50),
  sub_category VARCHAR(50),
  brand VARCHAR(50),
  unit_price DECIMAL(10,2),
  stock_quantity INT,
  status ENUM('Available', 'Discontinued') DEFAULT 'Available',
  added_date DATE
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  employee_id INT,
  order_date DATE,
  delivery_date DATE,
  order_status ENUM('Shipped', 'Delivered', 'Returned', 'Cancelled') DEFAULT 'Shipped',
  shipping_address VARCHAR(255),
  shipping_city VARCHAR(50),
  shipping_state VARCHAR(50),
  shipping_zip VARCHAR(10),
  shipping_method VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Order_Items (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  discount DECIMAL(10,2) DEFAULT 0,
  total_price DECIMAL(10,2) GENERATED ALWAYS AS ((quantity * unit_price) - discount) STORED,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  payment_date DATE,
  payment_method ENUM('UPI', 'Credit Card', 'Debit Card', 'Net Banking', 'COD'),
  amount_paid DECIMAL(10,2),
  payment_status ENUM('Paid', 'Pending', 'Failed') DEFAULT 'Paid',
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  department VARCHAR(50),
  role VARCHAR(50),
  joining_date DATE,
  status ENUM('Active', 'Resigned') DEFAULT 'Active'
);

-- Alter tables as per requirements 
alter TABLE Customers 
modify customer_id INT PRIMARY KEY AUTO_INCREMENT,
modify name VARCHAR(100),
modify email VARCHAR(100),
modify phone VARCHAR(15),
modify address VARCHAR(255),
modify city VARCHAR(50),
modify state VARCHAR(50),
modify country VARCHAR(50),
modify zip_code VARCHAR(10),
modify registration_date DATE,
modify status ENUM('Active', 'Inactive') DEFAULT 'Active';
  
Alter TABLE Products 
Modify  product_id INT PRIMARY KEY AUTO_INCREMENT,
Modify  name VARCHAR(100),
Modify  category VARCHAR(50),
Modify  sub_category VARCHAR(50),
Modify  brand VARCHAR(50),
Modify  unit_price DECIMAL(10,2),
Modify  stock_quantity INT,
Modify  status ENUM('Available', 'Discontinued') DEFAULT 'Available',
Modify  added_date DATE;

Alter TABLE Employees 
Modify  employee_id INT PRIMARY KEY AUTO_INCREMENT,
Modify  name VARCHAR(100),
Modify email VARCHAR(100),
Modify  phone VARCHAR(15),
Modify  department VARCHAR(50),
Modify  role VARCHAR(50),
Modify  joining_date DATE,
Modify  status ENUM('Active', 'Resigned') DEFAULT 'Active';

Alter TABLE Orders 
Modify  order_id INT PRIMARY KEY AUTO_INCREMENT,
Modify  customer_id INT,
Modify  employee_id INT,
Modify  order_date DATE,
Modify  delivery_date DATE,
Modify  order_status ENUM('Shipped', 'Delivered', 'Returned', 'Cancelled') DEFAULT 'Shipped',
Modify  shipping_address VARCHAR(255),
Modify  shipping_city VARCHAR(50),
Modify  shipping_state VARCHAR(50),
Modify  shipping_zip VARCHAR(10),
Modify  shipping_method VARCHAR(50),
add  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
add  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);


Alter TABLE Order_Items 
Modify  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
Modify  order_id INT,
Modify  product_id INT,
Modify  quantity INT,
Modify  unit_price DECIMAL(10,2),
Modify  discount DECIMAL(10,2) DEFAULT 0,
add  total_price DECIMAL(10,2) GENERATED ALWAYS AS ((quantity * unit_price) - discount) STORED,
add  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
add  FOREIGN KEY (product_id) REFERENCES Products(product_id);

Alter TABLE Payments 
Modify  payment_id INT PRIMARY KEY AUTO_INCREMENT,
Modify  order_id INT,
Modify  payment_date DATE,
Modify  payment_method ENUM('UPI', 'Credit Card', 'Debit Card', 'Net Banking', 'COD'),
Modify  amount_paid DECIMAL(10,2),
Modify  payment_status ENUM('Paid', 'Pending', 'Failed') DEFAULT 'Paid',
add  FOREIGN KEY (order_id) REFERENCES Orders(order_id);