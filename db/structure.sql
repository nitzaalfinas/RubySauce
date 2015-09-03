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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE article_categories (
    id integer NOT NULL,
    article_id bigint,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_categories_id_seq OWNED BY article_categories.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    body text,
    author_id bigint,
    permalink character varying,
    excerp text,
    feat_img character varying,
    comment_status character varying(3),
    publish_status character varying(20),
    publish_visibility character varying(10),
    article_type character varying(10),
    article_vcount bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    cat_name character varying,
    cat_description character varying,
    cat_slug character varying,
    cat_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: discusses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE discusses (
    id integer NOT NULL,
    article_id integer,
    user_id integer,
    dis_body character varying,
    dis_approve character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: discusses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE discusses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discusses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE discusses_id_seq OWNED BY discusses.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media (
    id integer NOT NULL,
    med_storage_name character varying(100),
    med_url character varying(500),
    med_title character varying,
    med_caption character varying,
    med_alt character varying,
    med_description character varying,
    med_author_id bigint,
    gallery bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE options (
    id integer NOT NULL,
    site_title character varying,
    site_description character varying,
    site_domain character varying,
    site_menu text,
    site_menu_draft text,
    site_keywords character varying,
    article_size bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: themes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE themes (
    id integer NOT NULL,
    folder_name character varying,
    active integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE themes_id_seq OWNED BY themes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    full_name character varying,
    nick_name character varying,
    avatar_file character varying,
    level character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: v_article_categories; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_article_categories AS
 SELECT article_categories.id,
    article_categories.article_id,
    articles.title,
    articles.body,
    articles.author_id,
    ( SELECT users.full_name
           FROM users
          WHERE (users.id = articles.author_id)) AS full_name,
    ( SELECT users.nick_name
           FROM users
          WHERE (users.id = articles.author_id)) AS nick_name,
    articles.permalink,
    articles.excerp,
    articles.feat_img,
    articles.comment_status,
    articles.publish_status,
    articles.publish_visibility,
    articles.article_vcount,
    articles.created_at,
    articles.updated_at,
    article_categories.category_id,
    categories.cat_name,
    categories.cat_slug,
    categories.cat_count,
    concat(articles.title, ' ', articles.body, ' ', articles.permalink, ' ', articles.excerp, ' ', categories.cat_name) AS article_all
   FROM ((article_categories
     LEFT JOIN categories ON ((article_categories.category_id = categories.id)))
     LEFT JOIN articles ON ((article_categories.article_id = articles.id)));


--
-- Name: v_articles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_articles AS
 SELECT articles.id,
    articles.title,
    articles.body,
    articles.author_id,
    users.full_name,
    users.nick_name,
    articles.permalink,
    articles.excerp,
    articles.feat_img,
    articles.comment_status,
    articles.publish_status,
    articles.publish_visibility,
    articles.article_type,
    articles.article_vcount,
    concat(articles.title, ' ', articles.body, ' ', articles.permalink, ' ', articles.excerp) AS article_all,
    articles.created_at,
    articles.updated_at
   FROM (articles
     LEFT JOIN users ON ((articles.author_id = users.id)))
  WHERE ((articles.article_type)::text = 'Article'::text);


--
-- Name: v_discusses; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_discusses AS
 SELECT discusses.id,
    discusses.article_id,
    articles.title,
    articles.permalink,
    articles.excerp,
    articles.feat_img,
    articles.comment_status,
    discusses.user_id,
    users.email,
    users.full_name,
    users.nick_name,
    users.level,
    discusses.dis_body,
    discusses.dis_approve,
    discusses.created_at,
    discusses.updated_at
   FROM ((discusses
     LEFT JOIN users ON ((discusses.user_id = users.id)))
     LEFT JOIN articles ON ((discusses.article_id = articles.id)));


--
-- Name: v_pages; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_pages AS
 SELECT articles.id,
    articles.title,
    articles.body,
    articles.author_id,
    users.full_name,
    users.nick_name,
    articles.permalink,
    articles.excerp,
    articles.feat_img,
    articles.comment_status,
    articles.publish_status,
    articles.publish_visibility,
    articles.article_type,
    articles.created_at,
    articles.updated_at
   FROM (articles
     LEFT JOIN users ON ((articles.author_id = users.id)))
  WHERE ((articles.article_type)::text = 'Page'::text);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_categories ALTER COLUMN id SET DEFAULT nextval('article_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY discusses ALTER COLUMN id SET DEFAULT nextval('discusses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: discusses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY discusses
    ADD CONSTRAINT discusses_pkey PRIMARY KEY (id);


--
-- Name: media_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: options_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141230104903');

INSERT INTO schema_migrations (version) VALUES ('20141230120303');

INSERT INTO schema_migrations (version) VALUES ('20141231002723');

INSERT INTO schema_migrations (version) VALUES ('20141231002724');

INSERT INTO schema_migrations (version) VALUES ('20150101171600');

INSERT INTO schema_migrations (version) VALUES ('20150101171601');

INSERT INTO schema_migrations (version) VALUES ('20150101171602');

INSERT INTO schema_migrations (version) VALUES ('20150101171603');

INSERT INTO schema_migrations (version) VALUES ('20150101171604');

INSERT INTO schema_migrations (version) VALUES ('20150117020829');

INSERT INTO schema_migrations (version) VALUES ('20150117020830');

INSERT INTO schema_migrations (version) VALUES ('20150611043852');

INSERT INTO schema_migrations (version) VALUES ('20150611044525');

INSERT INTO schema_migrations (version) VALUES ('20150614015305');

INSERT INTO schema_migrations (version) VALUES ('20150614015307');

