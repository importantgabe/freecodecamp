--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    explored boolean,
    description text,
    is_real boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: inhabitants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabitants (
    inhabitants_id integer NOT NULL,
    name character varying NOT NULL,
    population_billion numeric,
    planet_id integer
);


ALTER TABLE public.inhabitants OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabitants_inhabitant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabitants_inhabitant_id_seq OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabitants_inhabitant_id_seq OWNED BY public.inhabitants.inhabitants_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    landed_on boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_sun integer,
    radius_miles integer,
    orbital_speed numeric,
    habitable boolean,
    is_real boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    brightness_scale integer,
    dwarf boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inhabitants inhabitants_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants ALTER COLUMN inhabitants_id SET DEFAULT nextval('public.inhabitants_inhabitant_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier81', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier82', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'WhirlPool', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'BlackEye', NULL, NULL, NULL);


--
-- Data for Name: inhabitants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabitants VALUES (1, 'Human', 8.5, 1);
INSERT INTO public.inhabitants VALUES (2, 'Martian', 12.3, 4);
INSERT INTO public.inhabitants VALUES (3, 'Dogs', 1.2, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Moon2', 2, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon3', 3, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon4', 4, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon5', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon6', 6, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon7', 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon8', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon9', 9, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon10', 9, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon11', 1, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Moon12', 2, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Moon13', 3, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Moon14', 4, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Moon15', 5, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Moon16', 6, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Moon17', 7, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Moon18', 8, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Moon19', 8, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Moon20', 9, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 93000000, 6371, 29.78, true, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 35000000, 2440, 47.36, false, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 67000000, 6052, 35.02, false, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 142000000, 3390, 24.07, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 484000000, 69911, 13.07, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 58322, 9.68, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 23562, 6.8, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 24622, 5.43, false, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 2030, 9.2, false, NULL);
INSERT INTO public.planet VALUES (10, 'Planet 10', NULL, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (11, 'Planet 11', NULL, NULL, NULL, NULL, false);
INSERT INTO public.planet VALUES (12, 'Planet 12', NULL, NULL, NULL, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Canopus', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Arcturus', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Spica', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Antares', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabitants_inhabitant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabitants_inhabitant_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inhabitants inhabitants_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_name_key UNIQUE (name);


--
-- Name: inhabitants inhabitants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_pkey PRIMARY KEY (inhabitants_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: inhabitants inhabitants_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
