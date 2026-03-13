BEGIN;

CREATE TABLE usuario (
    usuCod SERIAL PRIMARY KEY,
    usuEma VARCHAR(45) NOT NULL,
    usuPas VARCHAR(255) NOT NULL,
    usuEstReg VARCHAR(1) DEFAULT 'A'
);

CREATE TABLE rol (
    rolCod SERIAL PRIMARY KEY,
    rolNom VARCHAR(45) NOT NULL,
    rolEstReg VARCHAR(1) DEFAULT 'A'
);

CREATE TABLE usuarios_roles (
    rolCod INTEGER NOT NULL,
    usuCod INTEGER NOT NULL,
    FOREIGN KEY (rolCod) REFERENCES rol(rolCod),
    FOREIGN KEY (usuCod) REFERENCES usuario(usuCod)
);

CREATE TABLE dato_usuario (
    datUsuCod SERIAL PRIMARY KEY,
    usuNom VARCHAR(45) NOT NULL,
    usuApePa VARCHAR(45) NOT NULL,
    usuApeMa VARCHAR(45) NOT NULL,
    usuDir VARCHAR(45) NOT NULL,
    usuFecNac DATE NOT NULL,
    usuDNI INTEGER NOT NULL,
    usuNac VARCHAR(45) NOT NULL,
    usuCel INTEGER NOT NULL,
    usuEstReg VARCHAR(1) DEFAULT 'A',
    usuCod INTEGER NOT NULL,
    FOREIGN KEY (usuCod) REFERENCES usuario(usuCod)
);

CREATE TABLE empleados (
    empCod SERIAL PRIMARY KEY,
    empSue DOUBLE PRECISION NOT NULL,
    usuCod INTEGER NOT NULL,
    empEstReg VARCHAR(1) DEFAULT 'A',
    FOREIGN KEY (usuCod) REFERENCES usuario(usuCod)
);

CREATE TABLE paquetes (
    paqCod SERIAL PRIMARY KEY,
    paqCos DOUBLE PRECISION NOT NULL,
    paqEstReg VARCHAR(1) DEFAULT 'A'
);

CREATE TABLE servicio (
    serCod SERIAL PRIMARY KEY,
    serImg VARCHAR(255),
    serDes VARCHAR(255) NOT NULL,
    serNom VARCHAR(45) NOT NULL,
    serFec DATE NOT NULL,
    serCos DOUBLE PRECISION NOT NULL,
    serEstReg VARCHAR(1) DEFAULT 'A',
    serDest VARCHAR(255)
);

CREATE TABLE paquetes_servicios (
    serCod INTEGER NOT NULL,
    paqCod INTEGER NOT NULL,
    FOREIGN KEY (serCod) REFERENCES servicio(serCod),
    FOREIGN KEY (paqCod) REFERENCES paquetes(paqCod)
);

CREATE TABLE venta (
    venNum SERIAL PRIMARY KEY,
    venFec DATE NOT NULL,
    venMedPag VARCHAR(45) NOT NULL,
    venEstReg VARCHAR(1) DEFAULT 'A',
    cliCod INTEGER,
    venMon DOUBLE PRECISION NOT NULL,
    empCod INTEGER,
    FOREIGN KEY (cliCod) REFERENCES usuario(usuCod),
    FOREIGN KEY (empCod) REFERENCES empleados(empCod)
);

CREATE TABLE venta_detalle (
    venDetCod SERIAL PRIMARY KEY,
    ventSubTot DOUBLE PRECISION NOT NULL,
    ventCant INTEGER NOT NULL,
    venNum INTEGER NOT NULL,
    serCod INTEGER,
    paqCod INTEGER,
    FOREIGN KEY (venNum) REFERENCES venta(venNum),
    FOREIGN KEY (serCod) REFERENCES servicio(serCod),
    FOREIGN KEY (paqCod) REFERENCES paquetes(paqCod)
);

INSERT INTO rol VALUES
(1,'cliente','A'),
(2,'admin','A'),
(3,'empleado','A');

INSERT INTO usuario VALUES
(1,'testuser@gmail.com','$2a$10$F4js9.qUfSJkxTn.3vHJOuWizOfeKTswiNHPqQdXxfzSSLDhGMTmG','A'),
(2,'richard@gmail.com','$2a$10$wdAUV9gtR8GdfuN9vIEspueQ99m2ZMchUf8KEr3t1/H1vWVirbGFa','A'),
(3,'alberto@gmail.com','$2a$10$r8shaAmmEJBlqm9YCT5Lq.rW.sx8CWRvydSI9WBGIEfQqNV9TJiQq','A'),
(4,'user@gmail.com','$2a$10$xK71fGsl3D6KaQgmRiIiJuRAoIQgSwjM/VQHL9QEify','A');

INSERT INTO usuarios_roles VALUES
(1,1),
(2,2),
(3,3),
(1,4);

INSERT INTO paquetes VALUES
(1,9000,'A');

INSERT INTO servicio VALUES
(15,'d007075a-c068-47d3-96b3-1e2fe887d0cd.jpg','una suit en Maiami','Hotel suit en Maiami','2024-08-27',1000,'A','Maiami'),
(16,'d11a63af-9709-4d27-b2ec-654531b2b74d.jpg','La Montaña de los 7 colores','La Montaña de los 7 colores','2024-08-27',2000,'A','Cusco'),
(17,'b35f118a-7c3b-45bf-a768-521eba95b880.jpg','un holet en maiami','Holet','2024-07-21',500,'I','Maima'),
(18,'b875d619-44f6-44ed-9226-e18e3b35b108.jpg','Alquiler de coche','Alquiler de Coche','2024-07-29',300,'A','Lima'),
(19,'1e55350b-0866-477f-a2e8-7f0214da7888.jpg','Playa Maimi','Playa Maimi','2024-08-26',3000,'A','Maimi'),
(20,'9e6ec929-004e-464d-85bc-1919e408c937.jpg','Vuelo Lima-Dubai','Vuelo Lima-Dubai','2024-08-14',6000,'A','Dubai');

INSERT INTO paquetes_servicios VALUES
(19,1),
(20,1),
(18,1);

COMMIT;
