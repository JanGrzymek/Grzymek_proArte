--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

DROP DATABASE IF EXISTS "proArte";
--
-- Name: proArte; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "proArte" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';


ALTER DATABASE "proArte" OWNER TO postgres;

\connect "proArte"

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
-- Name: gemaelde; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gemaelde (
    g_id integer NOT NULL,
    titel character varying(100),
    jahr character varying(10),
    preis integer,
    k_id integer,
    bild character varying,
    signiert boolean,
    t_id integer,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE public.gemaelde OWNER TO postgres;

--
-- Name: Gemaelde_g_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Gemaelde_g_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Gemaelde_g_id_seq" OWNER TO postgres;

--
-- Name: Gemaelde_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Gemaelde_g_id_seq" OWNED BY public.gemaelde.g_id;


--
-- Name: gemaeldetyp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gemaeldetyp (
    typ character varying,
    t_id integer NOT NULL
);


ALTER TABLE public.gemaeldetyp OWNER TO postgres;

--
-- Name: gemaeldetyp_t_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gemaeldetyp_t_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gemaeldetyp_t_id_seq OWNER TO postgres;

--
-- Name: gemaeldetyp_t_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gemaeldetyp_t_id_seq OWNED BY public.gemaeldetyp.t_id;


--
-- Name: kuenstler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kuenstler (
    k_id integer NOT NULL,
    geburtsjahr integer,
    sterbejahr integer,
    vorname character varying,
    nachname character varying
);


ALTER TABLE public.kuenstler OWNER TO postgres;

--
-- Name: kuenstler_k_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kuenstler_k_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kuenstler_k_id_seq OWNER TO postgres;

--
-- Name: kuenstler_k_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kuenstler_k_id_seq OWNED BY public.kuenstler.k_id;


--
-- Name: gemaelde g_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaelde ALTER COLUMN g_id SET DEFAULT nextval('public."Gemaelde_g_id_seq"'::regclass);


--
-- Name: gemaeldetyp t_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaeldetyp ALTER COLUMN t_id SET DEFAULT nextval('public.gemaeldetyp_t_id_seq'::regclass);


--
-- Name: kuenstler k_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kuenstler ALTER COLUMN k_id SET DEFAULT nextval('public.kuenstler_k_id_seq'::regclass);


--
-- Data for Name: gemaelde; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gemaelde VALUES (29, 'Wiedervereinigung', '1986', 250, 21, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-390.jpg', true, 1, true);
INSERT INTO public.gemaelde VALUES (30, 'Rosen in Vase', '1935', 1000, 22, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-349.jpg', true, 1, true);
INSERT INTO public.gemaelde VALUES (31, 'Gletscherbach', '1926', 1000, 23, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-332.jpg', true, 1, true);
INSERT INTO public.gemaelde VALUES (33, 'Beschießung der italienischen Küste', '1915', 120, 25, 'https://kunsthandelproarte.at/wp-content/uploads/2021/01/m_ausg-14.jpg', true, 3, true);
INSERT INTO public.gemaelde VALUES (32, 'Feldlandschaft mit Haus', '1960', 160, 24, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-235.jpg', true, 3, true);
INSERT INTO public.gemaelde VALUES (35, 'Weite Landschaft bzw. eine rückwärts fallende Person an einem Seeufer', '1994', 500, 27, 'https://kunsthandelproarte.at/wp-content/uploads/2021/02/m_ausg.jpg', true, 4, true);
INSERT INTO public.gemaelde VALUES (36, 'Gottvater mit Krone und Zepter', '1840', 220, 28, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-579.jpg', true, 4, true);
INSERT INTO public.gemaelde VALUES (34, 'Wien - Petersplatz', '1920', 200, 26, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-506.jpg', true, 3, true);
INSERT INTO public.gemaelde VALUES (28, 'Heilige mit Kindern', '1955', 650, 20, 'https://kunsthandelproarte.at/wp-content/uploads/m_totalo-251.jpg', true, 1, false);
INSERT INTO public.gemaelde VALUES (21, 'Zyklopische Landschaft', '1967', 280, 13, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-237.jpg', true, 3, true);
INSERT INTO public.gemaelde VALUES (23, 'Bärtiger Orientale mit Turban', '1900', 1500, 15, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-299.jpg', true, 1, true);
INSERT INTO public.gemaelde VALUES (22, 'Motiv aus Rheinland-Pfalz', '1896', 120, 14, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-414.jpg', true, 4, true);
INSERT INTO public.gemaelde VALUES (16, 'Motiv aus Wien', '1860', 300, 12, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-4-930x620.jpg', true, 2, true);
INSERT INTO public.gemaelde VALUES (24, 'Relief', '1968', 600, 16, 'https://kunsthandelproarte.at/wp-content/uploads/m_totalo-256.jpg', true, 7, true);
INSERT INTO public.gemaelde VALUES (14, 'Gebirgslandschaft mit Bach', '1844', 1200, 10, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-302.jpg', true, 1, false);
INSERT INTO public.gemaelde VALUES (20, 'Der Kuss des Pan', '1969', 300, 13, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-243.jpg', true, 3, false);
INSERT INTO public.gemaelde VALUES (4, 'Portrait des jungen Michelangelo Buonarotti', '1764', 350, 4, 'https://kunsthandelproarte.at/wp-content/uploads/2021/01/m_ausg-19-300x300.jpg', true, 3, true);
INSERT INTO public.gemaelde VALUES (40, 'Test', '1900', 50, 8, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-437.jpg', true, 1, true);
INSERT INTO public.gemaelde VALUES (18, 'Blumenstillleben - Flieder und Rosen', '1890', 1200, 11, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-301.jpg', true, 1, false);
INSERT INTO public.gemaelde VALUES (25, 'Tempelanlage in Ägypten', '1890', 500, 17, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-23.jpg', true, 2, true);
INSERT INTO public.gemaelde VALUES (26, 'Symbolistische Darstellung eines Amors', '1900', 130, 18, 'https://kunsthandelproarte.at/wp-content/uploads/m_ausg-8.jpg', true, 2, true);
INSERT INTO public.gemaelde VALUES (27, 'Motiv aus Wien Grinzing', '1945', 600, 19, 'https://kunsthandelproarte.at/wp-content/uploads/2021/05/m_ausg.jpg', true, 2, true);


--
-- Data for Name: gemaeldetyp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gemaeldetyp VALUES ('Aquarell', 2);
INSERT INTO public.gemaeldetyp VALUES ('Druckgrafik', 3);
INSERT INTO public.gemaeldetyp VALUES ('Zeichnung', 4);
INSERT INTO public.gemaeldetyp VALUES ('Erotika', 5);
INSERT INTO public.gemaeldetyp VALUES ('PRO', 6);
INSERT INTO public.gemaeldetyp VALUES ('Sonstiges', 7);
INSERT INTO public.gemaeldetyp VALUES ('Ölgemälde', 1);


--
-- Data for Name: kuenstler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kuenstler VALUES (3, 1849, 1929, 'Hugo', 'von Habermann');
INSERT INTO public.kuenstler VALUES (4, 1727, 1815, 'Francesco', 'Bartolozzi');
INSERT INTO public.kuenstler VALUES (2, 1906, NULL, 'Jean Emile', 'Laurent');
INSERT INTO public.kuenstler VALUES (8, 1863, 1924, 'Karl', 'Schreder');
INSERT INTO public.kuenstler VALUES (9, 2002, 2021, 'Jan', 'Grzymek');
INSERT INTO public.kuenstler VALUES (10, 1806, 1870, 'Josef', 'Feid');
INSERT INTO public.kuenstler VALUES (11, 1871, 1955, 'Auguste', 'Döll');
INSERT INTO public.kuenstler VALUES (12, 1830, 1909, 'Johann Wilhelm', 'Frey');
INSERT INTO public.kuenstler VALUES (13, 1930, 2015, 'Ernst', 'Fuchs');
INSERT INTO public.kuenstler VALUES (14, 1862, 1924, 'Karl', 'Oenike');
INSERT INTO public.kuenstler VALUES (15, 1865, 1958, 'Vladimir Dimitrievich', 'Sukhov');
INSERT INTO public.kuenstler VALUES (16, 1927, 1983, 'Marian', 'Kruczek');
INSERT INTO public.kuenstler VALUES (1, NULL, NULL, 'No', 'Select');
INSERT INTO public.kuenstler VALUES (17, 1855, 1920, 'Anton', 'Brioschi');
INSERT INTO public.kuenstler VALUES (18, 1870, 1911, 'Hegedüs', 'László');
INSERT INTO public.kuenstler VALUES (19, 1895, 1975, 'Wilhelm', 'Kaufmann');
INSERT INTO public.kuenstler VALUES (20, 1895, 1968, 'Hans Alexander', 'Brunner');
INSERT INTO public.kuenstler VALUES (21, 1936, NULL, 'Argyrius ', 'Kalos-Argy');
INSERT INTO public.kuenstler VALUES (22, 1911, 1997, 'Franz', 'Leitgeb');
INSERT INTO public.kuenstler VALUES (23, 1886, 1957, 'Hans', 'Zötsch');
INSERT INTO public.kuenstler VALUES (24, 1923, 2005, 'Johannes', 'Wanke');
INSERT INTO public.kuenstler VALUES (25, 1881, 1944, 'Heinrich', 'Heusser');
INSERT INTO public.kuenstler VALUES (26, 1893, 1961, 'Viktor', 'Leyrer');
INSERT INTO public.kuenstler VALUES (27, 1942, 2013, 'Peter', 'Dotrel');
INSERT INTO public.kuenstler VALUES (28, 1818, 1867, 'Franz Josef', 'Dobiaschofsky');


--
-- Name: Gemaelde_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gemaelde_g_id_seq"', 41, true);


--
-- Name: gemaeldetyp_t_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gemaeldetyp_t_id_seq', 1, false);


--
-- Name: kuenstler_k_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kuenstler_k_id_seq', 28, true);


--
-- Name: gemaelde Gemaelde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaelde
    ADD CONSTRAINT "Gemaelde_pkey" PRIMARY KEY (g_id);


--
-- Name: gemaeldetyp gemaeldetyp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaeldetyp
    ADD CONSTRAINT gemaeldetyp_pk PRIMARY KEY (t_id);


--
-- Name: kuenstler kuenstler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kuenstler
    ADD CONSTRAINT kuenstler_pkey PRIMARY KEY (k_id);


--
-- Name: gemaelde gemaelde_fk_t_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaelde
    ADD CONSTRAINT gemaelde_fk_t_id_fkey FOREIGN KEY (t_id) REFERENCES public.gemaeldetyp(t_id);


--
-- Name: gemaelde k_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gemaelde
    ADD CONSTRAINT k_id FOREIGN KEY (k_id) REFERENCES public.kuenstler(k_id);


--
-- Name: TABLE gemaelde; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.gemaelde TO app69;


--
-- Name: SEQUENCE "Gemaelde_g_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Gemaelde_g_id_seq" TO app69;


--
-- Name: TABLE gemaeldetyp; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.gemaeldetyp TO app69;


--
-- Name: TABLE kuenstler; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.kuenstler TO app69;


--
-- PostgreSQL database dump complete
--

