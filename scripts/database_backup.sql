SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE TYPE public.user_Type AS ENUM (
	'root',
    'manager',
    'cliente'
);

ALTER TYPE public.service_Type OWNER TO postgres;


SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE Libros (
    libro_id UUID PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT,
    isbn TEXT,
    genero TEXT,
    anio_publicacion INTEGER,
    editor TEXT,
    resumen TEXT,
    portada BYTEA
);

ALTER TABLE public.Libros OWNER TO postgres;

CREATE TABLE CopiasLibros (
    copia_id UUID PRIMARY KEY,
    libro_id UUID REFERENCES Libros(libro_id),
    estado_copia TEXT,
    ubicacion TEXT
);

ALTER TABLE public.CopiasLibros OWNER TO postgres;

CREATE TABLE Usuarios (
    usuario_id UUID PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT NOT NULL,
    contrasena TEXT NOT NULL,
    telefono TEXT,
    direccion TEXT,
    rol_usuario TEXT
);

ALTER TABLE public.Usuarios OWNER TO postgres;

CREATE TABLE Prestamos (
    prestamo_id UUID PRIMARY KEY,
    usuario_id UUID REFERENCES Usuarios(usuario_id),
    copia_id UUID REFERENCES CopiasLibros(copia_id),
    fecha_solicitud DATE,
    fecha_inicio DATE,
    fecha_devolucion_esperada DATE,
    fecha_devolucion_real DATE,
    estado_prestamo TEXT
);

ALTER TABLE public.Prestamos OWNER TO postgres;

CREATE TABLE Reservas (
    reserva_id UUID PRIMARY KEY,
    usuario_id UUID REFERENCES Usuarios(usuario_id),
    libro_id UUID REFERENCES Libros(libro_id),
    fecha_solicitud_reserva DATE,
    estado_reserva TEXT
);

ALTER TABLE public.Reservas OWNER TO postgres;

CREATE TABLE Autores (
    autor_id UUID PRIMARY KEY,
    nombre_autor TEXT NOT NULL,
    nacionalidad TEXT,
    informacion_biografica TEXT
);

ALTER TABLE public.Autores OWNER TO postgres;

--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.Usuario (usuario_id, nombre, apellido, email, contrasena, telefono, direccion , rol_usuario) FROM stdin;
0b051afd-c8d3-438a-9df9-486e68b78722	Isabella	Perez	isabellaperez@gmail.com	isabellaperez	945115696	direccion1	manager	\N
4042b823-78a0-49e5-8e69-02874101c33c	Valentina	Gonzales	ValeGonzales	valentinagonzales@gmail.com	valentinagonzales	988562478	direccion2	cliente	\N
7bea1f89-6e17-4b50-8f56-ec8c76e2f415	Mateo	Rodriguez	mateorodriguez@gmail.com	mateorodriguez	933144445	direccion3	cliente	\N
8d01563b-61b4-4a9a-9792-634a76a38291	Santiago	Gomez	santigomez@gmail.com	santiagogomez	956234518	direccion4	cliente	\N
ade3c8de-925c-4f49-9919-ac24ccbe0e71	Sofia	Garcia	sofiagarcia@gmail.com	sofiagarcia	964451684	direccion5	cliente	\N
e97883de-09bd-40d7-bca8-ab3de422e025	Jhon	Doe	jhondoe@gmail.com	jhondoe	974545664	direccion6	cliente	\N
f5ac78b2-b036-4113-86fc-fce1dc74bbaa	Jose	Linares	joselinares@gmail.com	joselinares	978455225	direccion7	cliente	\N
22abc385-f932-429f-8b5c-6509cf989fe4	Angel	Ferroa	angelferroa@gmail.com	angelferroa	923784565	direccion8	cliente	\N
54f5ad8d-10a1-42f6-a8fe-3a61f3e022d5	Alonso	Caceres	alonsocaceres@gmail.com	alonsocaceres	918288243	direccion9	root	\N
073680d4-c419-4225-b0f9-13297e8a35f0	Isai	Torres	isaitorres@gmail.com	isaitorres	978855448	direccion10	manager	\N
cb390b58-1cbb-4fac-8143-fd53e9c47d6b	Albert	MacReady	albertmacready@gmail.com	albertmacready	955451738	direccion11	cliente	\N
e41e5f7e-a4d6-40c3-9a26-dc446f8a6bdd	Martin	Lopez	martinlopez88@gmail.com	mertin123	933985287	direccion12	cliente	\N
19765129-2590-41e1-a008-91eb0559e58c	Test	Test	test@yopmail.com	testpost	testnumber	direccion13	cliente	\N
\.

ALTER TABLE CopiasLibros
ADD CONSTRAINT fk_libro_copia FOREIGN KEY (libro_id) REFERENCES Libros(libro_id);

ALTER TABLE Prestamos
ADD CONSTRAINT fk_usuario_prestamo FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id);

ALTER TABLE Prestamos
ADD CONSTRAINT fk_copia_prestamo FOREIGN KEY (copia_id) REFERENCES CopiasLibros(copia_id);

ALTER TABLE Reservas
ADD CONSTRAINT fk_usuario_reserva FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id);

ALTER TABLE Reservas
ADD CONSTRAINT fk_libro_reserva FOREIGN KEY (libro_id) REFERENCES Libros(libro_id);

--
-- PostgreSQL database dump complete
--
