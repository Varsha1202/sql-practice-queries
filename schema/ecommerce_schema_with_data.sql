--------Sample E Commerce Data----------
  
create table customers(
  cust_id int primary key,
  cname varchar(50),
  email varchar(50),
  phone varchar(50),
  city varchar(50), 
  join_date date,
  rating int
  );

create table products(
  prod_id int primary key,
  pname varchar(100), 
  category varchar(50),
  price decimal(10,3)
  );

create table orders(
  order_id int primary key,
  cust_id int, 
  order_date date,
  status varchar(20),
  foreign key(cust_id) reference orders(cust_id),
  );

create table order_items(
  order_id int references orders(order_id),
  prod_id int references products(prod_id),  
  quantity int,
  price decimal (10, 3),
  primary key(order_id, prod_id),
  ),

  create table payments(
  payment_id int primary key,
  order_id int references orders(order_id),
  payment_date date,
  amount decimal(10, 2),
  method varchar(20)
  );

create table warehouse(
  wh_id int primary key,
  city varchar(50)
  );



----------sample data------------

insert into customers values(
(2001, 'Hoffman', 'hoffman@example.com', '1234567890', 'London', '1996-01-15', 100),
(2002, 'Giovanni', 'gio@example.com', '9876543210', 'Rome', '1996-03-10', 200),
(2003, 'Liu', 'liu@example.com', '4567891230', 'San Jose', '1996-04-05', 200),
(2004, 'Grass', 'grass@example.com', '6543217890', 'Berlin', '1996-06-01', 300),
(2006, 'Clemens', 'clemens@example.com', '3216549870', 'London', '1996-02-12', 100),
(2007, 'Pereira', 'pereira@example.com', '7418529630', 'Rome', '1996-10-01', 100),
(2008, 'Cisneros', 'cisneros@example.com', '9638527410', 'San Jose', '1996-09-21', 300);

INSERT INTO products VALUES
(3001, 'Laptop', 'Electronics', 1500.00),
(3002, 'Smartphone', 'Electronics', 800.00),
(3003, 'Tablet', 'Electronics', 600.00),
(3004, 'Printer', 'Office', 200.00),
(3005, 'Desk Chair', 'Furniture', 120.00);

INSERT INTO orders VALUES
(4001, 2008, '1996-10-03', 'Shipped'),
(4002, 2001, '1996-10-03', 'Delivered'),
(4003, 2007, '1996-10-03', 'Shipped'),
(4004, 2003, '1996-10-03', 'Processing'),
(4005, 2002, '1996-10-04', 'Delivered'),
(4006, 2004, '1996-10-06', 'Shipped'),
(4007, 2006, '1996-10-06', 'Delivered');

INSERT INTO order_items VALUES
(4001, 3001, 1, 1500.00),
(4002, 3002, 2, 800.00),
(4003, 3003, 1, 600.00),
(4004, 3004, 3, 200.00),
(4005, 3005, 2, 120.00),
(4006, 3001, 5, 1500.00),
(4007, 3002, 1, 800.00);

INSERT INTO payments VALUES
(5001, 4001, '1996-10-03', 1500.00, 'Card'),
(5002, 4002, '1996-10-03', 1600.00, 'UPI'),
(5003, 4003, '1996-10-03', 600.00, 'Cash'),
(5004, 4004, '1996-10-03', 600.00, 'Card'),
(5005, 4005, '1996-10-04', 240.00, 'UPI'),
(5006, 4006, '1996-10-06', 7500.00, 'Card'),
(5007, 4007, '1996-10-06', 800.00, 'Cash');

INSERT INTO warehouses VALUES
(1, 'London'),
(2, 'Rome'),
(3, 'San Jose'),
(4, 'Berlin');
  
  
  
