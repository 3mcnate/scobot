DROP DATABASE Scobot;
CREATE DATABASE Scobot;
USE Scobot;

CREATE TABLE Guides (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE Participants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usc_id BIGINT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);
CREATE TABLE Trips (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    tt_event_id VARCHAR(12) UNIQUE NOT NULL,
    tt_driver_event_id VARCHAR(12) UNIQUE,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    is_cancelled BOOLEAN DEFAULT 0
);
CREATE TABLE TripGuides (
    trip_id INT NOT NULL,
    guide_id INT NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES Trips(id),
    FOREIGN KEY (guide_id) REFERENCES Guides(id)
);
CREATE TABLE Tickets (
    tt_ticket_id VARCHAR(12) PRIMARY KEY,
    trip_id INT NOT NULL,
    participant_id INT NOT NULL,
    is_driver BOOLEAN DEFAULT 0,
    is_cancelled BOOLEAN DEFAULT 0,
    medical_info JSON,
    emergency_contacts JSON,
    car_info JSON,
    waiver_link TEXT,
    FOREIGN KEY (trip_id) REFERENCES Trips(id),
    FOREIGN KEY (participant_id) REFERENCES Participants(id)
);
CREATE UNIQUE INDEX trip_participant ON Tickets (trip_id, participant_id);
CREATE UNIQUE INDEX trip_guide ON TripGuides (trip_id, guide_id);
