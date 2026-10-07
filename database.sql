CREATE DATABASE IF NOT EXISTS earns_electronics CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE earns_electronics;

CREATE TABLE admins (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 username VARCHAR(80) UNIQUE NOT NULL,
 password_hash VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 email VARCHAR(160) UNIQUE NOT NULL,
 phone VARCHAR(30) NOT NULL,
 password_hash VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) UNIQUE NOT NULL,
 slug VARCHAR(120) UNIQUE NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
 id INT AUTO_INCREMENT PRIMARY KEY,
 category_id INT NULL,
 name VARCHAR(180) NOT NULL,
 slug VARCHAR(200) UNIQUE NOT NULL,
 brand VARCHAR(100) DEFAULT '',
 description TEXT,
 price DECIMAL(12,2) NOT NULL,
 sale_price DECIMAL(12,2) NULL,
 stock INT NOT NULL DEFAULT 0,
 image VARCHAR(255) DEFAULT '',
 active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
);

CREATE TABLE product_images (
 id INT AUTO_INCREMENT PRIMARY KEY,
 product_id INT NOT NULL,
 image_path VARCHAR(255) NOT NULL,
 FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE pickup_locations (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(150) NOT NULL,
 address VARCHAR(255) NOT NULL,
 fee DECIMAL(10,2) NOT NULL DEFAULT 0,
 active TINYINT(1) DEFAULT 1
);

CREATE TABLE delivery_zones (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(150) NOT NULL,
 fee DECIMAL(10,2) NOT NULL,
 active TINYINT(1) DEFAULT 1
);

CREATE TABLE orders (
 id BIGINT AUTO_INCREMENT PRIMARY KEY,
 order_number VARCHAR(40) UNIQUE NOT NULL,
 customer_id INT NULL,
 customer_name VARCHAR(120) NOT NULL,
 customer_phone VARCHAR(30) NOT NULL,
 customer_email VARCHAR(160) DEFAULT '',
 fulfillment ENUM('delivery','pickup') NOT NULL,
 location_name VARCHAR(180) NOT NULL,
 address VARCHAR(255) DEFAULT '',
 delivery_fee DECIMAL(10,2) NOT NULL DEFAULT 0,
 subtotal DECIMAL(12,2) NOT NULL,
 total DECIMAL(12,2) NOT NULL,
 payment_method ENUM('mpesa','cod','pickup') NOT NULL,
 payment_status ENUM('pending','paid','failed','refunded') DEFAULT 'pending',
 status ENUM('pending','processing','ready','shipped','completed','cancelled') DEFAULT 'pending',
 mpesa_receipt VARCHAR(80) DEFAULT '',
 notes TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
 id BIGINT AUTO_INCREMENT PRIMARY KEY,
 order_id BIGINT NOT NULL,
 product_id INT NULL,
 product_name VARCHAR(180) NOT NULL,
 price DECIMAL(12,2) NOT NULL,
 quantity INT NOT NULL,
 line_total DECIMAL(12,2) NOT NULL,
 FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE,
 FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE SET NULL
);

CREATE TABLE payments (
 id BIGINT AUTO_INCREMENT PRIMARY KEY,
 order_id BIGINT NOT NULL,
 provider VARCHAR(50) NOT NULL,
 reference VARCHAR(100) DEFAULT '',
 amount DECIMAL(12,2) NOT NULL,
 status VARCHAR(30) DEFAULT 'pending',
 raw_response LONGTEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE
);

INSERT INTO categories(name,slug) VALUES
('Phones','phones'),('Accessories','accessories'),('Electronics','electronics'),('Computers','computers')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO pickup_locations(name,address,fee) VALUES
('Embu Town Pickup','Embu Town',0),
('Blue Valley Pickup','Blue Valley, Embu',0),
('Sunrise Pickup','Sunrise, Embu',0),
('Majimbo Pickup','Majimbo, Embu',0);

INSERT INTO delivery_zones(name,fee) VALUES
('Embu Town',150),('Blue Valley',200),('Sunrise',200),('Majimbo',200),('Other Kenya Location',350);

-- Create the admin password with: php tools/create_admin.php
