toc.dat                                                                                             0000600 0004000 0002000 00000017712 13641307301 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       %                    x            netunion_dnrs    11.7    11.7                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                    1262    16393    netunion_dnrs    DATABASE     k   CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE netunion_dnrs;
             postgres    false         �            1259    24697    order    TABLE     �  CREATE TABLE public."order" (
    order_user_name character varying(20) NOT NULL,
    order_user_gender text NOT NULL,
    order_user_telephone character varying(20) NOT NULL,
    order_user_campus text NOT NULL,
    order_user_dormitory text NOT NULL,
    order_user_description text,
    order_status text NOT NULL,
    order_solver_id integer,
    order_user_id integer NOT NULL,
    order_date text NOT NULL,
    order_id text NOT NULL
);
    DROP TABLE public."order";
       public         postgres    false                    0    0    TABLE "order"    COMMENT     6   COMMENT ON TABLE public."order" IS '订单信息表';
            public       postgres    false    199                    0    0    COLUMN "order".order_date    COMMENT     E   COMMENT ON COLUMN public."order".order_date IS '订单创建日期';
            public       postgres    false    199         �            1259    24628    token    TABLE     |   CREATE TABLE public.token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.token;
       public         postgres    false                    0    0    TABLE token    COMMENT     �   COMMENT ON TABLE public.token IS '存放用户的登陆令牌，
当调用后端时首先访问此处验证用户的登陆状况。
令牌的有效期为 1 天。';
            public       postgres    false    198                    0    0    COLUMN token.token    COMMENT     8   COMMENT ON COLUMN public.token.token IS '用户令牌';
            public       postgres    false    198                    0    0    COLUMN token.expiration_date    COMMENT     Q   COMMENT ON COLUMN public.token.expiration_date IS '用户令牌的过期时间';
            public       postgres    false    198                    0    0    COLUMN token.id    COMMENT     G   COMMENT ON COLUMN public.token.id IS '用户令牌对应的用户 id';
            public       postgres    false    198         �            1259    16396    user    TABLE     q  CREATE TABLE public."user" (
    name character varying(20),
    telephone character varying(20),
    campus text,
    dormitory text,
    std_id character varying(20) NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL,
    gender text DEFAULT '男(Male)'::text,
    nickname character varying(20),
    intro text,
    is_solver boolean NOT NULL
);
    DROP TABLE public."user";
       public         postgres    false                    0    0    TABLE "user"    COMMENT     A   COMMENT ON TABLE public."user" IS '电子科技大学学生表';
            public       postgres    false    196                    0    0    COLUMN "user".name    COMMENT     G   COMMENT ON COLUMN public."user".name IS '存储用户的姓名信息';
            public       postgres    false    196                    0    0    COLUMN "user".telephone    COMMENT     R   COMMENT ON COLUMN public."user".telephone IS '存储用户的联系方式信息';
            public       postgres    false    196                    0    0    COLUMN "user".campus    COMMENT     �   COMMENT ON COLUMN public."user".campus IS '存储用户的校区信息。
Qingshuihe Campus（清水河校区）
Shahe Campus（沙河校区）';
            public       postgres    false    196                    0    0    COLUMN "user".dormitory    COMMENT     X   COMMENT ON COLUMN public."user".dormitory IS '存储用户的寝室地址及门牌号';
            public       postgres    false    196                     0    0    COLUMN "user".std_id    COMMENT     j   COMMENT ON COLUMN public."user".std_id IS '存储用户的学号信息，作为用户登录的用户名';
            public       postgres    false    196         !           0    0    COLUMN "user".id    COMMENT     9   COMMENT ON COLUMN public."user".id IS '用户标识号';
            public       postgres    false    196         "           0    0    COLUMN "user".password    COMMENT     K   COMMENT ON COLUMN public."user".password IS '存储用户的登陆密码';
            public       postgres    false    196         �            1259    24585    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    196         #           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       postgres    false    197         �            1259    24726    user_id_seq1    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    196                   0    24697    order 
   TABLE DATA               �   COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM stdin;
    public       postgres    false    199       2829.dat           0    24628    token 
   TABLE DATA               ;   COPY public.token (token, expiration_date, id) FROM stdin;
    public       postgres    false    198       2828.dat 
          0    16396    user 
   TABLE DATA               ~   COPY public."user" (name, telephone, campus, dormitory, std_id, id, password, gender, nickname, intro, is_solver) FROM stdin;
    public       postgres    false    196       2826.dat $           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
            public       postgres    false    197         %           0    0    user_id_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_id_seq1', 1, false);
            public       postgres    false    200         �
           2606    24735    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public         postgres    false    199         �
           2606    24603    user user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, std_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    196    196         �
           2606    24637    token user_token_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.token DROP CONSTRAINT user_token_pkey;
       public         postgres    false    198                                                              2829.dat                                                                                            0000600 0004000 0002000 00000001627 13641307301 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/26 下午6:32:04	00000103261832042020002
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/26 下午6:33:50	00000103261833502020043
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/31 上午11:34:50	00000103311134502020007
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233	天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪	canceled by user	\N	1	2020/3/31 上午11:54:35	00000103311154352020049
\.


                                                                                                         2828.dat                                                                                            0000600 0004000 0002000 00000000066 13641307301 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        bf4e468fdbf450c964b5b7ffd167e502	1585712083634	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                          2826.dat                                                                                            0000600 0004000 0002000 00000000201 13641307301 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Jason	18980340000	沙河校区(Shahe Campus)	欣2栋 233	2018091202000	1	42253fa978ca4bbf95668ec455e4844d	男(Male)	\N	\N	f
\.


                                                                                                                                                                                                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000016672 13641307301 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

DROP DATABASE netunion_dnrs;
--
-- Name: netunion_dnrs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE netunion_dnrs OWNER TO postgres;

\connect netunion_dnrs

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

SET default_with_oids = false;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_user_name character varying(20) NOT NULL,
    order_user_gender text NOT NULL,
    order_user_telephone character varying(20) NOT NULL,
    order_user_campus text NOT NULL,
    order_user_dormitory text NOT NULL,
    order_user_description text,
    order_status text NOT NULL,
    order_solver_id integer,
    order_user_id integer NOT NULL,
    order_date text NOT NULL,
    order_id text NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: TABLE "order"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."order" IS '订单信息表';


--
-- Name: COLUMN "order".order_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."order".order_date IS '订单创建日期';


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.token OWNER TO postgres;

--
-- Name: TABLE token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.token IS '存放用户的登陆令牌，
当调用后端时首先访问此处验证用户的登陆状况。
令牌的有效期为 1 天。';


--
-- Name: COLUMN token.token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.token IS '用户令牌';


--
-- Name: COLUMN token.expiration_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.expiration_date IS '用户令牌的过期时间';


--
-- Name: COLUMN token.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.id IS '用户令牌对应的用户 id';


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    name character varying(20),
    telephone character varying(20),
    campus text,
    dormitory text,
    std_id character varying(20) NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL,
    gender text DEFAULT '男(Male)'::text,
    nickname character varying(20),
    intro text,
    is_solver boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: TABLE "user"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."user" IS '电子科技大学学生表';


--
-- Name: COLUMN "user".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".name IS '存储用户的姓名信息';


--
-- Name: COLUMN "user".telephone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".telephone IS '存储用户的联系方式信息';


--
-- Name: COLUMN "user".campus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".campus IS '存储用户的校区信息。
Qingshuihe Campus（清水河校区）
Shahe Campus（沙河校区）';


--
-- Name: COLUMN "user".dormitory; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".dormitory IS '存储用户的寝室地址及门牌号';


--
-- Name: COLUMN "user".std_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".std_id IS '存储用户的学号信息，作为用户登录的用户名';


--
-- Name: COLUMN "user".id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".id IS '用户标识号';


--
-- Name: COLUMN "user".password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."user".password IS '存储用户的登陆密码';


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM stdin;
\.
COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM '$$PATH$$/2829.dat';

--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (token, expiration_date, id) FROM stdin;
\.
COPY public.token (token, expiration_date, id) FROM '$$PATH$$/2828.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (name, telephone, campus, dormitory, std_id, id, password, gender, nickname, intro, is_solver) FROM stdin;
\.
COPY public."user" (name, telephone, campus, dormitory, std_id, id, password, gender, nickname, intro, is_solver) FROM '$$PATH$$/2826.dat';

--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: user_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq1', 1, false);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, std_id);


--
-- Name: token user_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      