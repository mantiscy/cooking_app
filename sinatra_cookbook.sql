--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(1000) NOT NULL
);


ALTER TABLE public.categories OWNER TO "Nikolas";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Nikolas
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO "Nikolas";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Nikolas
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categories_recipes; Type: TABLE; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE TABLE categories_recipes (
    category_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.categories_recipes OWNER TO "Nikolas";

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying(1000) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO "Nikolas";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: Nikolas
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO "Nikolas";

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Nikolas
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: ingredients_recipes; Type: TABLE; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE TABLE ingredients_recipes (
    ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.ingredients_recipes OWNER TO "Nikolas";

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description text,
    instructions text,
    published_on date
);


ALTER TABLE public.recipes OWNER TO "Nikolas";

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: Nikolas
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO "Nikolas";

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Nikolas
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Nikolas
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Nikolas
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Nikolas
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Nikolas
--

COPY categories (id, name) FROM stdin;
2	Main
3	Desert
1	Starters
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Nikolas
--

SELECT pg_catalog.setval('categories_id_seq', 3, true);


--
-- Data for Name: categories_recipes; Type: TABLE DATA; Schema: public; Owner: Nikolas
--

COPY categories_recipes (category_id, recipe_id) FROM stdin;
2	4
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: Nikolas
--

COPY ingredients (id, name) FROM stdin;
1	Bacon
2	Cheese
3	Onion
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Nikolas
--

SELECT pg_catalog.setval('ingredients_id_seq', 3, true);


--
-- Data for Name: ingredients_recipes; Type: TABLE DATA; Schema: public; Owner: Nikolas
--

COPY ingredients_recipes (ingredient_id, recipe_id) FROM stdin;
1	4
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: Nikolas
--

COPY recipes (id, name, description, instructions, published_on) FROM stdin;
4	poj	pokj	poiuhyg	2014-01-20
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Nikolas
--

SELECT pg_catalog.setval('recipes_id_seq', 4, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Nikolas; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: Nikolas; Tablespace: 
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: Nikolas; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: categories_recipes_unq; Type: INDEX; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE UNIQUE INDEX categories_recipes_unq ON categories_recipes USING btree (category_id, recipe_id);


--
-- Name: ingredients_recipes_unq; Type: INDEX; Schema: public; Owner: Nikolas; Tablespace: 
--

CREATE UNIQUE INDEX ingredients_recipes_unq ON ingredients_recipes USING btree (ingredient_id, recipe_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Nikolas
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Nikolas";
GRANT ALL ON SCHEMA public TO "Nikolas";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

