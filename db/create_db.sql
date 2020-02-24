--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2020-02-24 11:11:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 20317)
-- Name: order_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_rows (
    id integer NOT NULL,
    service_item_id integer NOT NULL,
    order_id integer NOT NULL,
    price numeric(15,2)
);


ALTER TABLE public.order_rows OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20315)
-- Name: order_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_rows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_rows_id_seq OWNER TO postgres;

--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 200
-- Name: order_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_rows_id_seq OWNED BY public.order_rows.id;


--
-- TOC entry 199 (class 1259 OID 20303)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    date date NOT NULL,
    milage integer,
    comment text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 20301)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 198
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 197 (class 1259 OID 20295)
-- Name: service_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.service_items OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 20293)
-- Name: service_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_items_id_seq OWNER TO postgres;

--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 196
-- Name: service_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_items_id_seq OWNED BY public.service_items.id;


--
-- TOC entry 2686 (class 2604 OID 20320)
-- Name: order_rows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rows ALTER COLUMN id SET DEFAULT nextval('public.order_rows_id_seq'::regclass);


--
-- TOC entry 2685 (class 2604 OID 20306)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 2684 (class 2604 OID 20298)
-- Name: service_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_items ALTER COLUMN id SET DEFAULT nextval('public.service_items_id_seq'::regclass);


--
-- TOC entry 2692 (class 2606 OID 20322)
-- Name: order_rows order_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rows
    ADD CONSTRAINT order_rows_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 20311)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 20300)
-- Name: service_items service_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_items
    ADD CONSTRAINT service_items_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20328)
-- Name: order_rows order_rows_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rows
    ADD CONSTRAINT order_rows_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 2693 (class 2606 OID 20323)
-- Name: order_rows order_rows_service_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rows
    ADD CONSTRAINT order_rows_service_item_id_fkey FOREIGN KEY (service_item_id) REFERENCES public.service_items(id);


-- Completed on 2020-02-24 11:11:54

--
-- PostgreSQL database dump complete
--

