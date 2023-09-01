-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    address VARCHAR(200)
);

-- Create Car Type Table
CREATE TABLE Car_Type (
    car_type_id INT PRIMARY KEY,
    car_type_name VARCHAR(50)
);

-- Create Car Table
CREATE TABLE Car (
    car_id INT PRIMARY KEY,
    car_make VARCHAR(50),
    car_model VARCHAR(50),
    car_year INT,
    car_type_id INT,
    car_price_per_day DECIMAL(10, 2),
    availability_status BOOLEAN,
    FOREIGN KEY (car_type_id) REFERENCES Car_Type(car_type_id)
);

-- Create Office Table
CREATE TABLE Office (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100),
    office_location VARCHAR(200)
);

-- Create Office Contact Table
CREATE TABLE Office_Contact (
    contact_id INT PRIMARY KEY,
    office_id INT,
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    FOREIGN KEY (office_id) REFERENCES Office(office_id)
);

-- Create Reservation Table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    pickup_office_id INT,
    return_office_id INT,
    pickup_date DATE,
    return_date DATE,
    reservation_status VARCHAR(20),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (pickup_office_id) REFERENCES Office(office_id),
    FOREIGN KEY (return_office_id) REFERENCES Office(office_id)
);

-- Create Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    reservation_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    payment_status VARCHAR(20),
    payment_method VARCHAR(50),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);

-- Create Insurance Table
CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY,
    insurance_type VARCHAR(50),
    coverage_details TEXT
);



-- Modify Reservation Table
ALTER TABLE Reservation
ADD COLUMN insurance_id INT,
ADD FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id);


-- Create Address Table
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    street_address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);

-- Update Office Table to Reference Address
ALTER TABLE Office
ADD COLUMN address_id INT,
ADD FOREIGN KEY (address_id) REFERENCES Address(address_id);




---------------------------------------------------------------

-- Create Employee Table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    office_id INT,
    FOREIGN KEY (office_id) REFERENCES Office(office_id)
);


CREATE TABLE Employee_Office_Relation (
    relation_id INT PRIMARY KEY,
    employee_id INT,
    office_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (office_id) REFERENCES Office(office_id)
);



CREATE TABLE Manager_Office_Relation (
    relation_id INT PRIMARY KEY,
    manager_id INT,
    office_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (office_id) REFERENCES Office(office_id)
);

-- Create Reservation_Processing Table
CREATE TABLE Reservation_Processing (
    processing_id INT PRIMARY KEY,
    reservation_id INT,
    employee_id INT,
    office_id INT,
    processing_date DATETIME,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (office_id) REFERENCES Office(office_id)
);




