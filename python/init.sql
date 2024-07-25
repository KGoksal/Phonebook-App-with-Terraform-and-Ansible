CREATE TABLE phonebook_db.phonebook(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    number VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO phonebook_db.phonebook (name, number)
    VALUES
        ("Mike Ehrmantraut", "1234567890"),
        ("Walter White Jr.", "69827854"),
        ("Jesse Pinkman", "876543554");
        ("Gustavo Fring", "987543554");
        ("Hector Salamanca", "9876543234");
