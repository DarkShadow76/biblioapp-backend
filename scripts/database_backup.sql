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

CREATE TYPE public.user_type AS ENUM (
	'root',
    'manager',
    'cliente'
);

ALTER TYPE public.user_type OWNER TO postgres;


SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.libros (
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

ALTER TABLE public.libros OWNER TO postgres;

CREATE TABLE public.copiaslibros (
    copia_id UUID PRIMARY KEY,
    libro_id UUID REFERENCES public.libros(libro_id),
    estado_copia TEXT,
    ubicacion TEXT
);

ALTER TABLE public.copiaslibros OWNER TO postgres;

CREATE TABLE public.usuarios (
    usuario_id UUID PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT NOT NULL,
    contrasena TEXT NOT NULL,
    telefono TEXT,
    direccion TEXT,
    rol_usuario TEXT
);

ALTER TABLE public.usuarios OWNER TO postgres;

CREATE TABLE public.prestamos (
    prestamo_id UUID PRIMARY KEY,
    usuario_id UUID REFERENCES public.usuarios(usuario_id),
    copia_id UUID REFERENCES public.copiaslibros(copia_id),
    fecha_solicitud DATE,
    fecha_inicio DATE,
    fecha_devolucion_esperada DATE,
    fecha_devolucion_real DATE,
    estado_prestamo TEXT
);

ALTER TABLE public.prestamos OWNER TO postgres;

CREATE TABLE public.reservas (
    reserva_id UUID PRIMARY KEY,
    usuario_id UUID REFERENCES public.usuarios(usuario_id),
    libro_id UUID REFERENCES public.libros(libro_id),
    fecha_solicitud_reserva DATE,
    estado_reserva TEXT
);

ALTER TABLE public.reservas OWNER TO postgres;

CREATE TABLE public.autores (
    autor_id UUID PRIMARY KEY,
    nombre_autor TEXT NOT NULL,
    nacionalidad TEXT,
    informacion_biografica TEXT
);

ALTER TABLE public.autores OWNER TO postgres;

--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (usuario_id, nombre, apellido, email, contrasena, telefono, direccion, rol_usuario)
VALUES
  ('0b051afd-c8d3-438a-9df9-486e68b78722', 'Isabella', 'Perez', 'isabellaperez@gmail.com', 'isabellaperez', '945115696', 'Dirección 1', 'manager'),
  ('4042b823-78a0-49e5-8e69-02874101c33c', 'Valentina', 'Gonzales', 'valentinagonzales@gmail.com','valentinagonzales', '988562478', 'Dirección 2', 'cliente'),
  ('7bea1f89-6e17-4b50-8f56-ec8c76e2f415', 'Mateo', 'Rodriguez', 'mateorodriguez@gmail.com', 'mateorodriguez', '933144445', 'Dirección 3', 'cliente'),
  ('8d01563b-61b4-4a9a-9792-634a76a38291', 'Santiago', 'Gomez', 'santiagogomez@gmail.com', 'santiagogomez', '956234518', 'Dirección 4', 'cliente'),
  ('ade3c8de-925c-4f49-9919-ac24ccbe0e71', 'Sofia', 'Garcia', 'sofiagarcia@gmail.com', 'sofiagarcia', '964451684', 'Dirección 5', 'cliente'),
  ('e97883de-09bd-40d7-bca8-ab3de422e025', 'Jhon', 'Doe', 'jhondoe@gmail.com', 'jhondoe', '974545664', 'Dirección 6', 'cliente'),
  ('f5ac78b2-b036-4113-86fc-fce1dc74bbaa', 'Jose', 'Linares', 'joselinares@gmail.com', 'joselinares','978455225', 'Dirección 7', 'cliente'),
  ('22abc385-f932-429f-8b5c-6509cf989fe4', 'Angel', 'Ferroa', 'angelferroa@gmail.com', 'angelferroa', '923784565', 'Dirección 8', 'cliente'),
  ('54f5ad8d-10a1-42f6-a8fe-3a61f3e022d5', 'Alonso', 'Caceres', 'alonsocaceres@gmail.com', 'alonsocaceres', '918288243', 'Dirección 9', 'root'),
  ('073680d4-c419-4225-b0f9-13297e8a35f0', 'Isai', 'Torres', 'isaitorres@gmail.com', 'isaitorres', '978855448', 'Dirección 10', 'cliente');


ALTER TABLE public.copiaslibros
ADD CONSTRAINT fk_libro_copia FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);

ALTER TABLE public.prestamos
ADD CONSTRAINT fk_usuario_prestamo FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);

ALTER TABLE public.prestamos
ADD CONSTRAINT fk_copia_prestamo FOREIGN KEY (copia_id) REFERENCES public.copiaslibros(copia_id);

ALTER TABLE public.reservas
ADD CONSTRAINT fk_usuario_reserva FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);

ALTER TABLE public.reservas
ADD CONSTRAINT fk_libro_reserva FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);

--
-- PostgreSQL database dump complete
--