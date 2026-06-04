--
-- PostgreSQL database dump
--

\restrict M2KQanLkVRkm0fiN4m5O47daHbKJ7ufuas9k7DphysjMln1LjMuZ5tiVyMKlFDd

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-05-05 15:44:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16780)
-- Name: .; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ".";


ALTER SCHEMA "." OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 16869)
-- Name: buscar_raul(); Type: PROCEDURE; Schema: .; Owner: postgres
--

CREATE PROCEDURE ".".buscar_raul()
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT * FROM "." .cliente WHERE nombre_cliente LIKE 'Raúl%';
END;
$$;


ALTER PROCEDURE ".".buscar_raul() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16799)
-- Name: cliente; Type: TABLE; Schema: .; Owner: postgres
--

CREATE TABLE ".".cliente (
    "ID_cliente" integer NOT NULL,
    nombre_cliente character varying(100) NOT NULL,
    direccion_cliente character varying(250),
    telefono_cliente character varying NOT NULL
);


ALTER TABLE ".".cliente OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16798)
-- Name: cliente_ID_cliente_seq; Type: SEQUENCE; Schema: .; Owner: postgres
--

CREATE SEQUENCE "."."cliente_ID_cliente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "."."cliente_ID_cliente_seq" OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_ID_cliente_seq; Type: SEQUENCE OWNED BY; Schema: .; Owner: postgres
--

ALTER SEQUENCE "."."cliente_ID_cliente_seq" OWNED BY ".".cliente."ID_cliente";


--
-- TOC entry 220 (class 1259 OID 16790)
-- Name: marca; Type: TABLE; Schema: .; Owner: postgres
--

CREATE TABLE ".".marca (
    "ID_marca" integer NOT NULL,
    nombre_marca character varying(150) NOT NULL
);


ALTER TABLE ".".marca OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16789)
-- Name: marca_ID_marca_seq; Type: SEQUENCE; Schema: .; Owner: postgres
--

CREATE SEQUENCE "."."marca_ID_marca_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "."."marca_ID_marca_seq" OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 219
-- Name: marca_ID_marca_seq; Type: SEQUENCE OWNED BY; Schema: .; Owner: postgres
--

ALTER SEQUENCE "."."marca_ID_marca_seq" OWNED BY ".".marca."ID_marca";


--
-- TOC entry 224 (class 1259 OID 16833)
-- Name: producto; Type: TABLE; Schema: .; Owner: postgres
--

CREATE TABLE ".".producto (
    "ID_producto" integer NOT NULL,
    nombre_producto character varying(150) NOT NULL,
    precio_producto numeric(10,2) NOT NULL,
    "ID_marca" integer NOT NULL
);


ALTER TABLE ".".producto OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16832)
-- Name: producto_ID_producto_seq; Type: SEQUENCE; Schema: .; Owner: postgres
--

CREATE SEQUENCE "."."producto_ID_producto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "."."producto_ID_producto_seq" OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 223
-- Name: producto_ID_producto_seq; Type: SEQUENCE OWNED BY; Schema: .; Owner: postgres
--

ALTER SEQUENCE "."."producto_ID_producto_seq" OWNED BY ".".producto."ID_producto";


--
-- TOC entry 226 (class 1259 OID 16849)
-- Name: venta; Type: TABLE; Schema: .; Owner: postgres
--

CREATE TABLE ".".venta (
    "ID_venta" integer NOT NULL,
    fecha_venta date NOT NULL,
    "ID_cliente" integer NOT NULL,
    "ID_producto" integer NOT NULL
);


ALTER TABLE ".".venta OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16848)
-- Name: venta_ID_venta_seq; Type: SEQUENCE; Schema: .; Owner: postgres
--

CREATE SEQUENCE "."."venta_ID_venta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "."."venta_ID_venta_seq" OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 225
-- Name: venta_ID_venta_seq; Type: SEQUENCE OWNED BY; Schema: .; Owner: postgres
--

ALTER SEQUENCE "."."venta_ID_venta_seq" OWNED BY ".".venta."ID_venta";


--
-- TOC entry 4826 (class 2604 OID 16802)
-- Name: cliente ID_cliente; Type: DEFAULT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".cliente ALTER COLUMN "ID_cliente" SET DEFAULT nextval('"."."cliente_ID_cliente_seq"'::regclass);


--
-- TOC entry 4825 (class 2604 OID 16793)
-- Name: marca ID_marca; Type: DEFAULT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".marca ALTER COLUMN "ID_marca" SET DEFAULT nextval('"."."marca_ID_marca_seq"'::regclass);


--
-- TOC entry 4827 (class 2604 OID 16836)
-- Name: producto ID_producto; Type: DEFAULT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".producto ALTER COLUMN "ID_producto" SET DEFAULT nextval('"."."producto_ID_producto_seq"'::regclass);


--
-- TOC entry 4828 (class 2604 OID 16852)
-- Name: venta ID_venta; Type: DEFAULT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".venta ALTER COLUMN "ID_venta" SET DEFAULT nextval('"."."venta_ID_venta_seq"'::regclass);


--
-- TOC entry 4990 (class 0 OID 16799)
-- Dependencies: 222
-- Data for Name: cliente; Type: TABLE DATA; Schema: .; Owner: postgres
--

COPY ".".cliente ("ID_cliente", nombre_cliente, direccion_cliente, telefono_cliente) FROM stdin;
1	Juan Pérez	Culiacan, Sinaloa	6634928492
2	María García	CDMX	4499339955
3	Carlos López	Mazatlan, Sinaloa	6697837423
4	Ana Martínez	Guadalajara, Jalisco	555040466
5	Luis Rodríguez	Monterrey, Nuevo Leon	555050533
\.


--
-- TOC entry 4988 (class 0 OID 16790)
-- Dependencies: 220
-- Data for Name: marca; Type: TABLE DATA; Schema: .; Owner: postgres
--

COPY ".".marca ("ID_marca", nombre_marca) FROM stdin;
1	Samsung
2	Xiaomi
3	Apple
4	Soni
5	LG
\.


--
-- TOC entry 4992 (class 0 OID 16833)
-- Dependencies: 224
-- Data for Name: producto; Type: TABLE DATA; Schema: .; Owner: postgres
--

COPY ".".producto ("ID_producto", nombre_producto, precio_producto, "ID_marca") FROM stdin;
1	Galaxy S24	18500.00	1
2	Redmi Note 14	19999.00	2
3	Audifonos Sony	12400.00	4
4	Apple 17 pro max	34000.00	3
5	Smart Watch 8 pro	7500.00	5
\.


--
-- TOC entry 4994 (class 0 OID 16849)
-- Dependencies: 226
-- Data for Name: venta; Type: TABLE DATA; Schema: .; Owner: postgres
--

COPY ".".venta ("ID_venta", fecha_venta, "ID_cliente", "ID_producto") FROM stdin;
1	2025-11-25	1	2
2	2025-12-26	3	1
3	2026-01-22	2	4
4	2026-02-16	5	3
5	2026-03-24	4	5
\.


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_ID_cliente_seq; Type: SEQUENCE SET; Schema: .; Owner: postgres
--

SELECT pg_catalog.setval('"."."cliente_ID_cliente_seq"', 1, false);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 219
-- Name: marca_ID_marca_seq; Type: SEQUENCE SET; Schema: .; Owner: postgres
--

SELECT pg_catalog.setval('"."."marca_ID_marca_seq"', 1, false);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 223
-- Name: producto_ID_producto_seq; Type: SEQUENCE SET; Schema: .; Owner: postgres
--

SELECT pg_catalog.setval('"."."producto_ID_producto_seq"', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 225
-- Name: venta_ID_venta_seq; Type: SEQUENCE SET; Schema: .; Owner: postgres
--

SELECT pg_catalog.setval('"."."venta_ID_venta_seq"', 1, false);


--
-- TOC entry 4832 (class 2606 OID 16809)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("ID_cliente");


--
-- TOC entry 4830 (class 2606 OID 16797)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY ("ID_marca");


--
-- TOC entry 4834 (class 2606 OID 16842)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY ("ID_producto");


--
-- TOC entry 4836 (class 2606 OID 16858)
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY ("ID_venta");


--
-- TOC entry 4837 (class 2606 OID 16843)
-- Name: producto fk_producto-marca; Type: FK CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".producto
    ADD CONSTRAINT "fk_producto-marca" FOREIGN KEY ("ID_marca") REFERENCES ".".marca("ID_marca");


--
-- TOC entry 4838 (class 2606 OID 16859)
-- Name: venta fk_venta-cliente; Type: FK CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".venta
    ADD CONSTRAINT "fk_venta-cliente" FOREIGN KEY ("ID_cliente") REFERENCES ".".cliente("ID_cliente");


--
-- TOC entry 4839 (class 2606 OID 16864)
-- Name: venta fk_venta-producto; Type: FK CONSTRAINT; Schema: .; Owner: postgres
--

ALTER TABLE ONLY ".".venta
    ADD CONSTRAINT "fk_venta-producto" FOREIGN KEY ("ID_producto") REFERENCES ".".producto("ID_producto");


-- Completed on 2026-05-05 15:44:46

--
-- PostgreSQL database dump complete
--

\unrestrict M2KQanLkVRkm0fiN4m5O47daHbKJ7ufuas9k7DphysjMln1LjMuZ5tiVyMKlFDd

