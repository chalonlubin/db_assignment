--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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

ALTER TABLE ONLY public.playlists_songs DROP CONSTRAINT playlists_songs_song_id_fkey;
ALTER TABLE ONLY public.playlists_songs DROP CONSTRAINT playlists_songs_playlist_id_fkey;
ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_title_artist_key;
ALTER TABLE ONLY public.songs DROP CONSTRAINT songs_pkey;
ALTER TABLE ONLY public.playlists_songs DROP CONSTRAINT playlists_songs_pkey;
ALTER TABLE ONLY public.playlists DROP CONSTRAINT playlists_pkey;
ALTER TABLE public.songs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.playlists_songs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.playlists ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.songs_id_seq;
DROP TABLE public.songs;
DROP SEQUENCE public.playlists_songs_id_seq;
DROP TABLE public.playlists_songs;
DROP SEQUENCE public.playlists_id_seq;
DROP TABLE public.playlists;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: playlists_songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlists_songs (
    id integer NOT NULL,
    playlist_id integer,
    song_id integer
);


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.playlists_songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.playlists_songs_id_seq OWNED BY public.playlists_songs.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title text NOT NULL,
    artist text
);


--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: playlists_songs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists_songs ALTER COLUMN id SET DEFAULT nextval('public.playlists_songs_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.playlists (id, name, description) FROM stdin;
1	House Blend	House Music Bangers
2	Trap + Rap	Rap and trap!
3	Anotha One	Real ONES ONLY!
4	FEED ME BEATS	Beet Feedin
5	HYPE	HIHIHIHI!
\.


--
-- Data for Name: playlists_songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.playlists_songs (id, playlist_id, song_id) FROM stdin;
2	1	1
3	1	2
4	2	3
5	2	4
6	3	5
7	3	1
8	3	4
9	1	5
10	1	4
11	5	5
12	5	8
13	4	9
14	4	10
15	4	6
16	4	2
17	4	7
18	4	8
19	4	12
20	4	5
21	4	3
22	4	1
23	4	4
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (id, title, artist) FROM stdin;
1	BoogeyMan	Ski-Mask
2	Silent Night	Santa Claus
3	Spice World	Spice Girls
4	The real slim shady	Eminem
5	Gin and Juice	Snoop Dogg
6	Barbie Girl 	Spice Girls
7	Born To Rock	ACDC
8	Purple Pills	D12
9	C.R.E.A.M.	Wu-Tang
10	Nail Tech	Jack Harlow
12	First Class	Jack Harlow
\.


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.playlists_id_seq', 5, true);


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.playlists_songs_id_seq', 23, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.songs_id_seq', 12, true);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: playlists_songs playlists_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_title_artist_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_title_artist_key UNIQUE (title, artist);


--
-- Name: playlists_songs playlists_songs_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: playlists_songs playlists_songs_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- PostgreSQL database dump complete
--

