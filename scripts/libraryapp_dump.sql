--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

--
-- Name: enum_usuarios_rol_usuario; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_usuarios_rol_usuario AS ENUM (
    'root',
    'manager',
    'client'
);


ALTER TYPE public.enum_usuarios_rol_usuario OWNER TO postgres;

--
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'root',
    'manager',
    'cliente'
);


ALTER TYPE public.user_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    autor_id uuid NOT NULL,
    nombre_autor text NOT NULL,
    nacionalidad text,
    informacion_biografica text
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- Name: copiaslibros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.copiaslibros (
    copia_id uuid NOT NULL,
    libro_id uuid,
    estado_copia text,
    ubicacion text
);


ALTER TABLE public.copiaslibros OWNER TO postgres;

--
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    libro_id uuid NOT NULL,
    titulo text NOT NULL,
    autor text,
    isbn text,
    genero text,
    anio_publicacion integer,
    editor text,
    resumen text,
    portada text
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    prestamo_id uuid NOT NULL,
    usuario_id uuid,
    copia_id uuid,
    fecha_solicitud date,
    fecha_inicio date,
    fecha_devolucion_esperada date,
    fecha_devolucion_real date,
    estado_prestamo text
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    reserva_id uuid NOT NULL,
    usuario_id uuid,
    libro_id uuid,
    fecha_solicitud_reserva date,
    estado_reserva text
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usuario_id uuid NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    email text NOT NULL,
    contrasena text NOT NULL,
    telefono text,
    direccion text,
    rol_usuario text,
    dni text
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (autor_id, nombre_autor, nacionalidad, informacion_biografica) FROM stdin;
599a9977-3774-48bf-bb92-e2388c5b3c92	Carlos	Francia	Lorem Ipsum
b3ccc698-1fc1-4581-bfa2-a6b04f9e78af	Martin Adan	Cuba	Lorem Ipsum
1bcaa713-7c94-4655-b766-54106e32f60c	Miguel Cervantes	España	Lorem Ipsum
1c5544ce-db2e-45e7-86ef-7189428d7ced	Victor Hugo	Francia	Lorem Ipsum
\.


--
-- Data for Name: copiaslibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.copiaslibros (copia_id, libro_id, estado_copia, ubicacion) FROM stdin;
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (libro_id, titulo, autor, isbn, genero, anio_publicacion, editor, resumen, portada) FROM stdin;
\.


--
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (prestamo_id, usuario_id, copia_id, fecha_solicitud, fecha_inicio, fecha_devolucion_esperada, fecha_devolucion_real, estado_prestamo) FROM stdin;
\.


--
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (reserva_id, usuario_id, libro_id, fecha_solicitud_reserva, estado_reserva) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usuario_id, nombre, apellido, email, contrasena, telefono, direccion, rol_usuario, dni) FROM stdin;
0b051afd-c8d3-438a-9df9-486e68b78722	Isabella	Perez	isabellaperez@gmail.com	isabellaperez	945115696	Dirección 1	manager	7981637
20be68d2-7250-4b51-885f-7b007ff0b470	Abrahan	Silvera	abrahansilvera@gmail.com	abrahansilvera	962436571	Dirección 12	cliente	7121345
95c70fc2-e6b5-487b-bce4-f1850bf9e553	Frank	Castillo	frankcastillo@gmail.com	frankcastillo	976437516	Dirección 11	manager	4172726
073680d4-c419-4225-b0f9-13297e8a35f0	Isai	Torres	isaitorres@gmail.com	isaitorres	978855448	Dirección 10	cliente	2173843
54f5ad8d-10a1-42f6-a8fe-3a61f3e022d5	Alonso	Caceres	alonsocaceres@gmail.com	alonsocaceres	918288243	Dirección 9	root	7337354
22abc385-f932-429f-8b5c-6509cf989fe4	Angel	Ferroa	angelferroa@gmail.com	angelferroa	923784565	Dirección 8	cliente	4656553
f5ac78b2-b036-4113-86fc-fce1dc74bbaa	Jose	Linares	joselinares@gmail.com	joselinares	978455225	Dirección 7	cliente	7262765
e97883de-09bd-40d7-bca8-ab3de422e025	Jhon	Doe	jhondoe@gmail.com	jhondoe	974545664	Dirección 6	cliente	7784787
ade3c8de-925c-4f49-9919-ac24ccbe0e71	Sofia	Garcia	sofiagarcia@gmail.com	sofiagarcia	964451684	Dirección 5	cliente	7872876
8d01563b-61b4-4a9a-9792-634a76a38291	Santiago	Gomez	santiagogomez@gmail.com	santiagogomez	956234518	Dirección 4	cliente	7373883
7bea1f89-6e17-4b50-8f56-ec8c76e2f415	Mateo	Rodriguez	mateorodriguez@gmail.com	mateorodriguez	933144445	Dirección 3	cliente	4228739
\.


--
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (autor_id);


--
-- Name: copiaslibros copiaslibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.copiaslibros
    ADD CONSTRAINT copiaslibros_pkey PRIMARY KEY (copia_id);


--
-- Name: usuarios dni_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT dni_usuario UNIQUE (dni);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (libro_id);


--
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (prestamo_id);


--
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (reserva_id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuario_id);


--
-- Name: copiaslibros copiaslibros_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.copiaslibros
    ADD CONSTRAINT copiaslibros_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);


--
-- Name: prestamos fk_copia_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_copia_prestamo FOREIGN KEY (copia_id) REFERENCES public.copiaslibros(copia_id);


--
-- Name: copiaslibros fk_libro_copia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.copiaslibros
    ADD CONSTRAINT fk_libro_copia FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);


--
-- Name: reservas fk_libro_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_libro_reserva FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);


--
-- Name: prestamos fk_usuario_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_usuario_prestamo FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);


--
-- Name: reservas fk_usuario_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_usuario_reserva FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);


--
-- Name: prestamos prestamos_copia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_copia_id_fkey FOREIGN KEY (copia_id) REFERENCES public.copiaslibros(copia_id);


--
-- Name: prestamos prestamos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);


--
-- Name: reservas reservas_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(libro_id);


--
-- Name: reservas reservas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(usuario_id);


--
-- PostgreSQL database dump complete
--

