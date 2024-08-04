-- Drop existing tables if they exist
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS api_ticket;
DROP TABLE IF EXISTS train;
DROP TABLE IF EXISTS user_profiles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS hibernate_sequence;

-- Create table for storing train information
CREATE TABLE train (
    train_no BIGINT NOT NULL,              -- Primary key for train
    fare DOUBLE PRECISION,                -- Fare for the train
    from_station VARCHAR(255),            -- Starting station
    seats_available INT,                  -- Number of seats available
    to_station VARCHAR(255),              -- Destination station
    train_name VARCHAR(255),              -- Name of the train
    PRIMARY KEY (train_no)                -- Primary key constraint
) ENGINE=InnoDB;

-- Create table for storing user profiles
CREATE TABLE user_profiles (
    profile_id INT NOT NULL AUTO_INCREMENT, -- Primary key for profile
    address VARCHAR(255),                  -- Address of the user
    first_name VARCHAR(255),              -- First name of the user
    image LONGBLOB,                        -- Image of the user
    last_name VARCHAR(255),               -- Last name of the user
    phone_number VARCHAR(255),            -- Phone number of the user
    PRIMARY KEY (profile_id)              -- Primary key constraint
) ENGINE=InnoDB;

-- Create table for storing user information
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,   -- Primary key for user
    username VARCHAR(255) NOT NULL,       -- Username for login
    password VARCHAR(255) NOT NULL,       -- Password for login
    role VARCHAR(255) NOT NULL,           -- Role of the user (e.g., ADMIN, USER)
    session_id VARCHAR(255),              -- Session ID for user session
    profile_id INT,                       -- Foreign key referencing user profile
    PRIMARY KEY (user_id),               -- Primary key constraint
    FOREIGN KEY (profile_id)              -- Foreign key constraint
        REFERENCES user_profiles (profile_id)
) ENGINE=InnoDB;

-- Create table for storing ticket information (another version)
CREATE TABLE ticket (
    ticket_id VARCHAR(255) NOT NULL,       -- Primary key for ticket
    journey_date DATE,                     -- Date of the journey
    seat_type VARCHAR(255),                -- Type of seat (e.g., Sleeper, AC)
    seats_required INT,                   -- Number of seats required
    amount DOUBLE PRECISION,              -- Amount for the ticket
    ticket_status VARCHAR(255),            -- Status of the ticket (e.g., Booked, Cancelled)
    transaction_id VARCHAR(255),          -- Transaction ID for payment
    train_no BIGINT,                       -- Foreign key referencing train
    user_id INT,                           -- Foreign key referencing user
    PRIMARY KEY (ticket_id),              -- Primary key constraint
    FOREIGN KEY (train_no)                -- Foreign key constraint
        REFERENCES train (train_no),
    FOREIGN KEY (user_id)                 -- Foreign key constraint
        REFERENCES users (user_id)
) ENGINE=InnoDB;

-- Create table for storing ticket information (API version)
CREATE TABLE api_ticket (
    ticket_id VARCHAR(255) NOT NULL,       -- Primary key for ticket
    journey_date DATE,                     -- Date of the journey
    seat_type VARCHAR(255),                -- Type of seat (e.g., Sleeper, AC)
    seats_required INT,                   -- Number of seats required
    amount DOUBLE PRECISION,              -- Amount for the ticket
    ticket_status VARCHAR(255),            -- Status of the ticket (e.g., Booked, Cancelled)
    transaction_id VARCHAR(255),          -- Transaction ID for payment
    train_no BIGINT,                       -- Foreign key referencing train
    PRIMARY KEY (ticket_id),              -- Primary key constraint
    FOREIGN KEY (train_no)                -- Foreign key constraint
        REFERENCES train (train_no)
) ENGINE=InnoDB;

-- Create table for managing Hibernate sequence (auto-generated values)
CREATE TABLE hibernate_sequence (
    next_val BIGINT                         -- Sequence value for Hibernate
) ENGINE=InnoDB;

-- Insert initial value into Hibernate sequence
INSERT INTO hibernate_sequence (next_val) VALUES (1);


-- Insert dummy data into user_profiles table
INSERT INTO user_profiles (address, first_name, image, last_name, phone_number) 
VALUES 
('123 MG Road, Mumbai', 'Rajesh', NULL, 'Kumar', '9823456789'),
('456 BTM Layout, Bangalore', 'Sita', NULL, 'Iyer', '9876543210'),
('789 Connaught Place, Delhi', 'Amit', NULL, 'Sharma', '9998887777');

-- Insert dummy data into users table with roles USER and ADMIN
INSERT INTO users (username, password, role, session_id, profile_id) 
VALUES 
('Test user1', 'g%&^%&^^&4ig^%7575634', 'USER', 'sess001', 1),
('Test user2', 'g%&^%&^^&4ig^%7575634', 'ADMIN', 'sess002', 2),
('Test user', 'g%&^%&^^&4ig^%7575634', 'USER', 'sess003', 3);

-- Insert dummy data into train table
INSERT INTO train (train_no, fare, from_station, seats_available, to_station, train_name) 
VALUES 
(101, 1200.00, 'Mumbai Lokmanya Tilak', 200, 'Delhi Hazrat Nizamuddin', 'Madhyanchal Express'),
(102, 800.00, 'Bangalore Yeshvantpur', 150, 'Chennai Egmore', 'Yeshvantpur Express'),
(103, 500.00, 'Delhi Hazrat Nizamuddin', 250, 'Jaipur', 'Delhi-Jaipur Superfast'),
(104, 1000.00, 'Kolkata Howrah', 180, 'Varanasi', 'Howrah-Varanasi Express'),
(105, 750.00, 'Hyderabad Secunderabad', 300, 'Bhubaneswar', 'Secunderabad-Bhubaneswar Express');

-- Insert dummy data into ticket table
INSERT INTO ticket (ticket_id, journey_date, seat_type, seats_required, amount, ticket_status, transaction_id, train_no, user_id) 
VALUES 
('TICKET001', '2024-09-01', 'Sleeper', 2, 2400.00, 'Booked', 'txn001', 101, 1),
('TICKET002', '2024-09-05', 'AC', 1, 1000.00, 'Booked', 'txn002', 102, 2),
('TICKET003', '2024-09-10', 'Sleeper', 3, 1500.00, 'Cancelled', 'txn003', 103, 1),
('TICKET004', '2024-09-15', 'AC', 2, 2000.00, 'Booked', 'txn004', 104, 3),
('TICKET005', '2024-09-20', 'Sleeper', 4, 3000.00, 'Booked', 'txn005', 105, 2);

-- Insert dummy data into api_ticket table
INSERT INTO api_ticket (ticket_id, journey_date, seat_type, seats_required, amount, ticket_status, transaction_id, train_no) 
VALUES 
('API_TICKET001', '2024-09-02', 'Sleeper', 1, 1200.00, 'Booked', 'txn101', 101),
('API_TICKET002', '2024-09-06', 'AC', 2, 1600.00, 'Booked', 'txn102', 102),
('API_TICKET003', '2024-09-11', 'Sleeper', 2, 1000.00, 'Cancelled', 'txn103', 103),
('API_TICKET004', '2024-09-16', 'AC', 1, 1000.00, 'Booked', 'txn104', 104),
('API_TICKET005', '2024-09-21', 'Sleeper', 3, 2250.00, 'Booked', 'txn105', 105);

