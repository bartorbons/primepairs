--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: config; Type: TABLE; Schema: public; Owner: bart
--

CREATE TABLE public.config (
    id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.config OWNER TO bart;

--
-- Name: config_id_seq; Type: SEQUENCE; Schema: public; Owner: bart
--

CREATE SEQUENCE public.config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_id_seq OWNER TO bart;

--
-- Name: config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bart
--

ALTER SEQUENCE public.config_id_seq OWNED BY public.config.id;


--
-- Name: priem; Type: TABLE; Schema: public; Owner: bart
--

CREATE TABLE public.priem (
    id integer NOT NULL,
    prime bigint NOT NULL
);


ALTER TABLE public.priem OWNER TO bart;

--
-- Name: priem_id_seq; Type: SEQUENCE; Schema: public; Owner: bart
--

CREATE SEQUENCE public.priem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priem_id_seq OWNER TO bart;

--
-- Name: priem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bart
--

ALTER SEQUENCE public.priem_id_seq OWNED BY public.priem.id;


--
-- Name: voortgang; Type: TABLE; Schema: public; Owner: bart
--

CREATE TABLE public.voortgang (
    id integer NOT NULL,
    hoogste_blok bigint NOT NULL
);


ALTER TABLE public.voortgang OWNER TO bart;

--
-- Name: voortgang_id_seq; Type: SEQUENCE; Schema: public; Owner: bart
--

CREATE SEQUENCE public.voortgang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voortgang_id_seq OWNER TO bart;

--
-- Name: voortgang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bart
--

ALTER SEQUENCE public.voortgang_id_seq OWNED BY public.voortgang.id;


--
-- Name: config id; Type: DEFAULT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.config ALTER COLUMN id SET DEFAULT nextval('public.config_id_seq'::regclass);


--
-- Name: priem id; Type: DEFAULT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.priem ALTER COLUMN id SET DEFAULT nextval('public.priem_id_seq'::regclass);


--
-- Name: voortgang id; Type: DEFAULT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.voortgang ALTER COLUMN id SET DEFAULT nextval('public.voortgang_id_seq'::regclass);


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: bart
--

COPY public.config (id, key, value) FROM stdin;
1	version	1.0.0
\.


--
-- Data for Name: priem; Type: TABLE DATA; Schema: public; Owner: bart
--

COPY public.priem (id, prime) FROM stdin;
1	2
2	3
\.


--
-- Data for Name: voortgang; Type: TABLE DATA; Schema: public; Owner: bart
--

COPY public.voortgang (id, hoogste_blok) FROM stdin;
\.


--
-- Name: config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bart
--

SELECT pg_catalog.setval('public.config_id_seq', 1, true);


--
-- Name: priem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bart
--

SELECT pg_catalog.setval('public.priem_id_seq', 2, true);


--
-- Name: voortgang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bart
--

SELECT pg_catalog.setval('public.voortgang_id_seq', 1, false);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: priem priem_pkey; Type: CONSTRAINT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.priem
    ADD CONSTRAINT priem_pkey PRIMARY KEY (id);


--
-- Name: priem priem_prime_key; Type: CONSTRAINT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.priem
    ADD CONSTRAINT priem_prime_key UNIQUE (prime);


--
-- Name: voortgang voortgang_pkey; Type: CONSTRAINT; Schema: public; Owner: bart
--

ALTER TABLE ONLY public.voortgang
    ADD CONSTRAINT voortgang_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

