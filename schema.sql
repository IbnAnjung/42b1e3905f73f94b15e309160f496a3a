--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

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
-- Name: mail_status; Type: TYPE; Schema: public; Owner: SUPPORT
--

CREATE TYPE public.mail_status AS ENUM (
    'send to broker',
    'failed',
    'success'
);


ALTER TYPE public.mail_status OWNER TO "SUPPORT";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mails; Type: TABLE; Schema: public; Owner: SUPPORT
--

CREATE TABLE public.mails (
    id integer NOT NULL,
    title character varying(50) DEFAULT ''::character varying,
    email character varying(50) NOT NULL,
    subject character varying(50) DEFAULT ''::character varying,
    body text NOT NULL,
    status public.mail_status DEFAULT 'send to broker'::public.mail_status,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mails OWNER TO "SUPPORT";

--
-- Name: mails_id_seq; Type: SEQUENCE; Schema: public; Owner: SUPPORT
--

CREATE SEQUENCE public.mails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mails_id_seq OWNER TO "SUPPORT";

--
-- Name: mails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: SUPPORT
--

ALTER SEQUENCE public.mails_id_seq OWNED BY public.mails.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: SUPPORT
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(15) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO "SUPPORT";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: SUPPORT
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "SUPPORT";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: SUPPORT
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: mails id; Type: DEFAULT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.mails ALTER COLUMN id SET DEFAULT nextval('public.mails_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: mails; Type: TABLE DATA; Schema: public; Owner: SUPPORT
--

COPY public.mails (id, title, email, subject, body, status, user_id, created_at) FROM stdin;
1	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 19:42:23.697534+07
2	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:03:51.923449+07
3	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:04:37.279923+07
4	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:04:42.340375+07
5	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:05:02.349076+07
6	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:06:01.880512+07
7	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:06:56.336231+07
8	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:07:54.258713+07
9	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:09:30.069748+07
10	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:11:31.246538+07
11	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:12:04.155823+07
12	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:12:15.15112+07
13	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:15:08.116138+07
14	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:15:20.913769+07
15	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:15:49.337479+07
16	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:16:40.616184+07
17	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:18:56.221587+07
18	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:19:27.620246+07
19	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:19:46.786517+07
20	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:20:15.850888+07
21	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:20:29.236082+07
22	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:20:43.96407+07
23	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:20:53.693142+07
24	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:21:00.206032+07
25	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:21:20.260615+07
26	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:21:47.575419+07
27	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:21:49.017382+07
28	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:24:21.805099+07
29	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:24:49.625567+07
30	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:26:56.516576+07
31	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:27:20.576413+07
32	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:27:34.063768+07
33	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:28:30.757105+07
34	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:29:56.211804+07
35	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:30:23.545258+07
36	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:31:08.636338+07
37	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:32:09.614475+07
38	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:32:22.493708+07
39	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:32:31.17056+07
40	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:36:32.595786+07
41	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:36:45.221543+07
42	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:37:05.737564+07
43	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:39:18.381589+07
44	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:39:24.206675+07
45	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:39:33.951615+07
46	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:41:00.746947+07
47	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:41:28.197809+07
48	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:43:06.961652+07
49	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:44:39.439809+07
50	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:45:26.940049+07
51	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:45:45.574762+07
52	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 20:54:37.441267+07
53	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:11:46.244529+07
54	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:12:43.693847+07
55	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:15:12.425115+07
56	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:17:33.288262+07
57	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:18:45.913446+07
58	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:19:38.886615+07
59	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 21:20:42.189606+07
60	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	\N	10	2021-01-12 21:21:33.012006+07
61	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	\N	10	2021-01-12 21:22:53.941497+07
62	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	\N	10	2021-01-12 21:22:55.335431+07
65	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	send to broker	10	2021-01-12 22:30:15.767561+07
66	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	\N	10	2021-01-12 22:30:36.087702+07
67	email sender	anggayouman@gmail.com	TEST KIRIM EMAIL	SAY HAI FROM POSTMAN	\N	10	2021-01-12 22:31:34.450032+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: SUPPORT
--

COPY public.users (id, username, password) FROM stdin;
1	angga	angga
10	saputra	$2y$10$Bvvn51TGawyeleLMazQcr.Zvm8GUR51gSgtiFyz6Dgc3zoTJrkraa
\.


--
-- Name: mails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: SUPPORT
--

SELECT pg_catalog.setval('public.mails_id_seq', 70, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: SUPPORT
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: mails mails_pkey; Type: CONSTRAINT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: mails mails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: SUPPORT
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

