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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    discovery_year integer,
    description text,
    is_potentially_hazardous boolean,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    no_of_planets integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_in_millions_of_light_years numeric(5,2),
    description text,
    is_spiral boolean,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    radius_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_in_millions_of_light_years numeric(5,2),
    planet_name text,
    has_atmosphere boolean,
    has_water boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    radius_km integer NOT NULL,
    distance_in_millions_of_light_years numeric(5,2),
    description text,
    has_atmosphere boolean,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    radius_km integer NOT NULL,
    distance_in_millions_of_light_years numeric(5,2),
    description text,
    has_planets boolean,
    is_binary boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 1801, 'Largest object in the asteroid belt', false, 5);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, 1807, 'One of the largest asteroids', false, 5);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.00, 1802, 'Large asteroid in the main belt', false, 5);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434.00, 1849, 'Large asteroid in the asteroid belt', false, 5);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.84, 1898, 'Near-Earth asteroid', false, 3);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 0.49, 1999, 'Near-Earth asteroid studied by NASA', true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, 13600, 0.00, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 12, 10000, 2.54, 'Nearest major spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10, 12000, 2.73, 'A nearby spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 15, 13000, 29.30, 'Galaxy with a bright central bulge', true, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 20, 10000, 23.00, 'A grand-design spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 25, 13000, 53.50, 'A giant elliptical galaxy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Triton', 1353, 4500, 0.00, 'Neptune', true, true, 5);
INSERT INTO public.moon VALUES (2, 'Umbriel', 585, 4500, 0.00, 'Uranus', false, true, 6);
INSERT INTO public.moon VALUES (3, 'Ariel', 579, 4500, 0.00, 'Uranus', false, true, 6);
INSERT INTO public.moon VALUES (4, 'Miranda', 236, 4500, 0.00, 'Uranus', false, true, 6);
INSERT INTO public.moon VALUES (5, 'Iapetus', 735, 4500, 0.00, 'Saturn', false, true, 7);
INSERT INTO public.moon VALUES (6, 'Rhea', 764, 4500, 0.00, 'Saturn', true, true, 7);
INSERT INTO public.moon VALUES (7, 'Dione', 561, 4500, 0.00, 'Saturn', true, true, 7);
INSERT INTO public.moon VALUES (8, 'Tethys', 531, 4500, 0.00, 'Saturn', false, true, 7);
INSERT INTO public.moon VALUES (9, 'Mimas', 198, 4500, 0.00, 'Saturn', false, true, 7);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252, 4500, 0.00, 'Saturn', true, true, 7);
INSERT INTO public.moon VALUES (11, 'Titan', 2575, 4500, 0.00, 'Saturn', true, true, 7);
INSERT INTO public.moon VALUES (12, 'Himalia', 85, 4500, 0.00, 'Jupiter', false, false, 8);
INSERT INTO public.moon VALUES (13, 'Amalthea', 84, 4500, 0.00, 'Jupiter', false, false, 8);
INSERT INTO public.moon VALUES (14, 'Callisto', 2410, 4500, 0.00, 'Jupiter', true, true, 8);
INSERT INTO public.moon VALUES (15, 'Ganymede', 2634, 4500, 0.00, 'Jupiter', true, true, 8);
INSERT INTO public.moon VALUES (16, 'Europa', 1561, 4500, 0.00, 'Jupiter', true, true, 8);
INSERT INTO public.moon VALUES (17, 'Io', 1822, 4500, 0.00, 'Jupiter', true, false, 8);
INSERT INTO public.moon VALUES (18, 'Deimos', 6, 4500, 0.00, 'Mars', false, false, 9);
INSERT INTO public.moon VALUES (19, 'Phobos', 11, 4500, 0.00, 'Mars', false, false, 9);
INSERT INTO public.moon VALUES (20, 'Moon', 1737, 4500, 0.00, 'Earth', false, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Alpha Centauri Planet X', 4000, 6500, 0.00, 'Fictional example planet', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Vega Planet X', 400, 7200, 0.00, 'Fictional example planet', true, false, 2);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri d', 4800, 3000, 0.00, 'Small exoplanet', false, false, 4);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 4800, 7000, 0.00, 'Exoplanet orbiting Proxima Centauri', true, false, 4);
INSERT INTO public.planet VALUES (5, 'Neptune', 4500, 24622, 0.00, 'Distant ice giant planet', true, false, 6);
INSERT INTO public.planet VALUES (6, 'Uranus', 4500, 25362, 0.00, 'Ice giant planet', true, false, 6);
INSERT INTO public.planet VALUES (7, 'Saturn', 4500, 58232, 0.00, 'Planet with prominent rings', true, false, 6);
INSERT INTO public.planet VALUES (8, 'Jupiter', 4600, 69911, 0.00, 'Largest planet in the solar system', true, false, 6);
INSERT INTO public.planet VALUES (9, 'Mars', 4600, 3390, 0.00, 'The red planet', true, false, 6);
INSERT INTO public.planet VALUES (10, 'Earth', 4540, 6371, 0.00, 'Our home planet', true, true, 6);
INSERT INTO public.planet VALUES (11, 'Venus', 4500, 6052, 0.00, 'Hottest planet in the solar system', true, false, 6);
INSERT INTO public.planet VALUES (12, 'Mercury', 4500, 2440, 0.00, 'Closest planet to the Sun', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 5300, 854000, 0.00, 'Star in Alpha Centauri system', true, true, 1);
INSERT INTO public.star VALUES (2, 'Vega', 455, 1648000, 0.00, 'Bright star in Lyra', true, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 900000000, 0.00, 'Red supergiant star', false, false, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4850, 107280, 0.00, 'Closest known star to the Sun', true, false, 1);
INSERT INTO public.star VALUES (5, 'Sirius A', 242, 1189640, 0.00, 'Bright star in Canis Major', true, true, 1);
INSERT INTO public.star VALUES (6, 'Sun', 4600, 696340, 0.00, 'Star of our solar system', true, false, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

