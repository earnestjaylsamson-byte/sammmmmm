-- Barangay Mabuhay Information and Document Request System

CREATE DATABASE IF NOT EXISTS barangaysystem;
USE barangaysystem;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(30) NOT NULL DEFAULT 'resident',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  verification_status VARCHAR(20) NOT NULL DEFAULT 'Unverified',
  purok VARCHAR(100),
  address VARCHAR(255),
  id_file VARCHAR(255),
  verification_note VARCHAR(255),
  verification_submitted_at DATETIME,
  verified_at DATETIME
);

CREATE TABLE document_requests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  request_number VARCHAR(50) NOT NULL UNIQUE,
  user_id INT NOT NULL,
  document_type VARCHAR(150) NOT NULL,
  purpose TEXT NOT NULL,
  amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  status VARCHAR(50) NOT NULL DEFAULT 'Pending',
  payment_status VARCHAR(50) NOT NULL DEFAULT 'Not Required',
  payment_reference VARCHAR(150),
  remarks TEXT,
  document_file VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  full_name VARCHAR(150),
  age INT,
  sex VARCHAR(20),
  civil_status VARCHAR(30),
  contact_number VARCHAR(30),
  address VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE payments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  request_id INT NOT NULL,
  user_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  payment_method VARCHAR(50) NOT NULL,
  delivery_method VARCHAR(50),
  delivery_address VARCHAR(255),
  reference_number VARCHAR(150),
  proof_file VARCHAR(255),
  status VARCHAR(50) NOT NULL DEFAULT 'Pending',
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (request_id) REFERENCES document_requests(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);