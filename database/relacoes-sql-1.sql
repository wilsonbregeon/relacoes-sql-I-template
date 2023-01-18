-- Active: 1674045397687@@127.0.0.1@3306

                     -- Práticas 1 e 2--

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    phones (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id)
    );

SELECT * FROM phones;

INSERT INTO
    users (id, name, email, password)
VALUES (
        "u001",
        "fulano",
        "fulano@labenu.com",
        "12345"
    ), (
        "u002",
        "ciclano",
        "ciclano@labenu.com",
        "6789"
    );

INSERT INTO
    phones (id, phone_number, user_id)
VALUES ("p001", "55999999999", "u001"), ("p002", "5588888888", "u001"), ("p003", "557777777", "u002");

SELECT
    users.id AS userId,
    users.name,
    users.email,
    users.password,
    phones.id AS phoneId,
    phones.phone_number,
    phones.user_id AS referenceId
FROM users
    INNER JOIN phones ON phones.user_id = users.id;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

                -- Prática 3--
CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES("l001", "111111", "A"),
    ("l002", "2222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES ("d001", "ciclano", "ciclano@labenu.com", "12345", "l001"),
    ("d002", "fulano", "fulano@labenu.com", "56789", "l002");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;


               -- Exercício fixação--

CREATE TABLE clients (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    hardware_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (hardware_id) REFERENCES hardware (id)
);

CREATE TABLE hardware (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    price TEXT UNIQUE NOT NULL
);

INSERT INTO clients (id, name, email, password, hardware_id)
VALUES ("c001", "fulano", "fulano@gmail.com", "569", "h002");

INSERT INTO  hardware (id, name, price)
VALUES ("h001", "mouse", "R$: 20,00"),
    ("h002", "teclado", "R$ 40,00");

SELECT * FROM hardware;

SELECT * FROM clients;

SELECT * FROM hardware
INNER JOIN clients
ON clients.hardware_id = hardware_id