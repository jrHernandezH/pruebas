--Tabla ya creada account
-- Tabla de Usuarios
-- La tabla `InfoUser` almacena información personal de los usuarios, incluyendo nombre, apellidos, fecha de nacimiento, lugar de nacimiento, género, estado civil, número de hijos, tipo y número de documento, RFC, tipo de sangre, número de teléfono y correo electrónico personal.
CREATE TABLE InfoUser (
  id integer PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname_paternal VARCHAR(100),
  surname_maternal VARCHAR(100),
  birthday DATE,
  birthplace VARCHAR(100),
  gender CHAR(1) CHECK (gender IN ('M', 'F')), 
  marital_status VARCHAR(50),
  number_children INT DEFAULT 0,
  type_document VARCHAR(50),
  number_document VARCHAR(50) UNIQUE,
  rfc VARCHAR(13) UNIQUE,
  type_blood VARCHAR(3) CHECK (type_blood IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-')),
  email_personal VARCHAR(100) UNIQUE,
  email_corporate VARCHAR(100) UNIQUE,
  number_bank_account VARCHAR(50) UNIQUE
);

--Tabla de contacto personal
CREATE TABLE Contact (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  type_phone VARCHAR(10) CHECK (type_phone IN ('Casa', 'Oficina', 'Celular')),
  phone_number VARCHAR(15),
) ;

-- Tabla de Contactos de Emergencia
-- La tabla `ContactsEmergency` almacena información de contactos de emergencia asociados a los usuarios, incluyendo nombre, relación, tipo de teléfono, número de teléfono, correo electrónico y dirección.
CREATE TABLE ContactsEmergency (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  name VARCHAR(100),
  relation VARCHAR(50),
  type_phone VARCHAR(10) CHECK (type_phone IN ('Casa', 'Oficina', 'Celular')),
  phone_number VARCHAR(15),
  email VARCHAR(100),
  address TEXT
);

-- Tabla de redes sociales
-- La tabla `SocialNetworks` almacena información de redes sociales de los usuarios, incluyendo identificadores de Slack y Skype.
CREATE TABLE SocialNetworks (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  slack VARCHAR(100),
  skype VARCHAR(100)
);

-- Tabla de Direcciones
-- La tabla `Addresses` almacena información de direcciones de los usuarios, incluyendo país, estado, ciudad, código postal y dirección completa.
CREATE TABLE Addresses (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  country VARCHAR(100),
  state VARCHAR(100),
  city VARCHAR(100),
  code_postal VARCHAR(10),
  address TEXT
);

-- Tabla de Documentos
-- La tabla `Documents` almacena información de documentos importantes de los usuarios, incluyendo número de seguro social, licencia de conducir, fecha de expiración de la licencia de conducir y si posee libreta militar.
CREATE TABLE Documents (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  number_social_security VARCHAR(50) UNIQUE,
  driver_license VARCHAR(50),
  driver_license_expiration DATE,
  military_book BOOLEAN DEFAULT FALSE
);

-- Tabla de Salud
-- La tabla `Health` almacena información de salud de los usuarios, incluyendo tipo de sangre, si tiene alergias, detalles de las alergias y si posee alguna discapacidad.
CREATE TABLE Health (
  id integer PRIMARY KEY,
  user_id INT REFERENCES InfoUser(id) ON DELETE CASCADE,
  type_blood VARCHAR(3) CHECK (type_blood IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-')),
  allergies BOOLEAN DEFAULT FALSE,
  allergies_details TEXT,
  disability integer DEFAULT 0
);
