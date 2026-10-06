--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1791284174821', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284174820', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284281656', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284281655', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284314067', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284314066', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284789208', 0, NULL);
INSERT INTO public.users VALUES ('user_1791284789207', 0, NULL);
INSERT INTO public.users VALUES ('Test', 2, 3);
INSERT INTO public.users VALUES ('user_1791285071829', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285071830', 5, NULL);
INSERT INTO public.users VALUES ('user_1791285150024', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285150025', 5, NULL);
INSERT INTO public.users VALUES ('user_1791285173607', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285173608', 5, NULL);
INSERT INTO public.users VALUES ('user_1791285228482', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285228483', 5, NULL);
INSERT INTO public.users VALUES ('user_1791285254086', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285254087', 5, NULL);
INSERT INTO public.users VALUES ('user_1791285304512', 2, NULL);
INSERT INTO public.users VALUES ('user_1791285304513', 5, NULL);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

