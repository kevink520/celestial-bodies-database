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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(21,10)
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
    name character varying(80) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_type character varying(60),
    distance_from_earth numeric(21,10)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(21,10),
    planet_id integer NOT NULL
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
    name character varying(80) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_type character varying(60),
    distance_from_earth numeric(21,10),
    star_id integer NOT NULL
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
    name character varying(80) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(21,10),
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'A dwarf planet located in the asteroid belt between Mars and Jupiter', false, true, 4600, 0.0437000000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'The second-largest asteroid in the asteroid belt between Mars and Jupiter', false, false, 4500, 0.0199000000);
INSERT INTO public.asteroid VALUES (3, 'Bennu', 'A near-Earth asteroid', false, false, NULL, 0.0170000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral Galaxy in the Local Group', false, true, 10000, 'Spiral', 2537000.0000000000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy', true, true, 13500, 'Spiral', 0.0000000000);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'One of the brightest galaxies in the night sky', false, true, 7000, 'Spiral', 11700000.0000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous interacting grand-design spiral galaxy', false, true, 5000, 'Spiral', 23000000.0000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual galaxy with a prominent dust lane', false, true, 9000, 'Spiral', 29000000.0000000000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Third largest galaxy in the Local Group', false, true, 3000, 'Spiral', 3000000.0000000000);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', false, false, 13000, 'Irregular', 163000.0000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only moon of the Earth', false, true, 4500, 0.0000000026, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller of the two moons of Mars', false, false, 4600, 0.0000000239, 4);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger of the two moons of Mars', false, false, 4600, 0.0000002389, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'One of four Galilean moons of Jupiter', false, true, 4500, 0.0000000695, 12);
INSERT INTO public.moon VALUES (5, 'Europa', 'One of four Galilean moons of Jupiter, with icy crust', false, true, 4500, 0.0000000695, 12);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system', false, true, 4500, 0.0000000695, 12);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'One of the four Galilean moons of Jupiter, heavily cratered', false, true, 4500, 0.0000000695, 12);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn, known for its geysers', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 'A moon of Saturn, known for its large Herschel Crater', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (11, 'Dione', 'A moon of Saturn, with a possible subsurface ocean', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (12, 'Rhea', 'A moon of Saturn, with a possible subsurface ocean', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (13, 'Tethys', 'A moon of Saturn, known for its large canyon', false, true, 4500, 0.0000002126, 5);
INSERT INTO public.moon VALUES (14, 'Miranda', 'One of five major moons of Uranus, known for its unique terrain', false, true, 4500, 0.0000004537, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 'One of five major moons of Uranus, known for itsnetwork of canyons', false, true, 4500, 0.0000004537, 6);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'The darkest of the five major moons of Uranus', false, true, 4500, 0.0000004537, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 'The largest of the moons of Uranus', false, true, 4500, 0.0000004537, 6);
INSERT INTO public.moon VALUES (18, 'Oberon', 'The second largest of the moons of Uranus', false, true, 4500, 0.0000004537, 6);
INSERT INTO public.moon VALUES (19, 'Triton', 'The largest moon of Neptune', false, true, 4500, 0.0000007106, 7);
INSERT INTO public.moon VALUES (20, 'Nereid', 'The third largest moon of Neptune', false, true, 4500, 0.0000007106, 7);
INSERT INTO public.moon VALUES (21, 'Charon', 'The largest moon of Pluto', false, true, 4500, 0.0000009421, 8);
INSERT INTO public.moon VALUES (22, 'Nix', 'One of the moons of Pluto', false, true, 4500, 0.0000009421, 8);
INSERT INTO public.moon VALUES (23, 'Kepler-1625b I', 'The only exomoon many believe to exist', false, true, 8700, 4000.0000000000, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest and closest planet to the Sun', false, true, 4500, 'Terrestrial', 0.0000060000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun and the hottest planet in the solar system', false, true, 4500, 'Terrestrial', 0.0000150000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun and the only planet known to support life', true, true, 4500, 'Terrestrial', 0.0000000000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, known as the red planet', false, true, 4500, 'Terrestrial', 0.0000300000, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'The second-largest planet in the solar system, known for its ring system', false, true, 4500, 'Gas Giant', 0.0008000000, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice giant with the coldest atmosphere in the solar system', false, true, 4500, 'Ice Giant', 0.0017000000, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'The farthest known planet from the Sun in the solar system', false, true, 4500, 'Ice Giant', 0.0027000000, 1);
INSERT INTO public.planet VALUES (8, 'Pluto', 'Dwarf planet in the Kuiper belt', false, true, 4500, 'Dwarf', 0.0006000000, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Largest object in the asteroid belt between Mars and Jupiter', false, true, 4500, 'Dwarf', 0.0002000000, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Exoplanet in the habitable zone of Proxima Centauri', false, true, NULL, 'Exoplanet', 4.2400000000, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 'Super-Earth or mini-Neptune in the  Proxima Centauri system', false, true, NULL, 'Exoplanet', 4.2400000000, 2);
INSERT INTO public.planet VALUES (12, 'Jupiter', 'Largest planet in the solar system', false, true, 4500, 'Gas Giant', 0.0004700000, 1);
INSERT INTO public.planet VALUES (13, 'Kepler-1625b', 'An exoplanet in the Cygnus constellation, believed to have a moon', false, true, 8700, 'Exoplanet', 4000.0000000000, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at the center of our Solar System', false, true, 4500, 0.0000158100, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun', false, true, 4800, 4.2465000000, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'One part of the closest star system to the Earth', false, true, 6000, 4.3670000000, 2);
INSERT INTO public.star VALUES (4, 'Sirius A', 'The brightest star in the Earth''s night sky', false, true, 200, 8.6000000000, 2);
INSERT INTO public.star VALUES (5, 'R136a1', 'Most massive and lumninous star known in the Universe', false, true, 1000, 163000.0000000000, 7);
INSERT INTO public.star VALUES (6, 'VFTS 352', 'Overcontact binary star system', false, true, 2000, 164000.0000000000, 7);
INSERT INTO public.star VALUES (7, 'Kepler-1625', 'A star in the Cygnus constellation in the Milky Way galaxy. One of its exoplanets is believed to have a moon.', false, true, 8700, 4000.0000000000, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name UNIQUE (name);


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

