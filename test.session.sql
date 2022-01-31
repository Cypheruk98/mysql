SHOW DATABASES;

-- @block             --Allows a section of code to be run rather than the whole code
CREATE TABLE Users(   --Creates a table specifying the columns.
    id INT PRIMARY KEY AUTO_INCREMENT,          -- After specifying columns you must state the data type to be inputted and any conditions
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
)

-- @block
INSERT INTO Users (email,bio,country) VALUES    --Inserts values into rows to populate the TABLE
        ("hello@world.com","foo","US"),     --Note that id does not need to be added due to the auto increment keyword
        ("hola@munda.com","bar","MX"),
        ("bonjour@monde.com","baz","FR");

--@block
SELECT * FROM Users;

--@block
SELECT email, id FROM Users --Selects columns to query seperated by a ','
WHERE country="US"      --Conditional statements to filter results
OR email LIKE "h%"      --"h%" specifies any emails starting with "h"
ORDER BY id ASC     
LIMIT 2;            --Limits results to values from the table


--@block

CREATE INDEX email_index ON Users(email);       --As the size of the database increases the speed of the above query will slow,
   --Creating an index is a much more efficient process

--@block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id) --references primary key users table, tells the database not to delete anything that holds data about this relationship

--@block
INSERT INTO Rooms (owner_id,street) 
VALUES
    (1,"san diego sailboat"),
    (1,"nantucket cottage"),
    (1,"vail cabin"),
    (1,"cardboard box");

--@block
SELECT * FROM Users
INNER JOIN Rooms
ON Rooms.owner_id=Users.id;

--@block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id));

--@blocks           Rooms a user has booked
SELECT
    guest_id,
    street,
    check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id=guest_id;

