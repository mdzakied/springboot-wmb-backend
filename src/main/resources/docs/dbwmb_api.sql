--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

--
-- Name: dbwmb_api; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbwmb_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';


ALTER DATABASE dbwmb_api OWNER TO postgres;

\connect dbwmb_api

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
-- Name: m_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_image (
    id character varying(255) NOT NULL,
    content_type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    size bigint NOT NULL
);


ALTER TABLE public.m_image OWNER TO postgres;

--
-- Name: m_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_menu (
    id character varying NOT NULL,
    name character varying NOT NULL,
    price integer,
    image_id character varying(255)
);


ALTER TABLE public.m_menu OWNER TO postgres;

--
-- Name: m_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_role (
    id character varying(255) NOT NULL,
    role character varying(255),
    CONSTRAINT m_role_role_check CHECK (((role)::text = ANY ((ARRAY['ROLE_SUPER_ADMIN'::character varying, 'ROLE_ADMIN'::character varying, 'ROLE_CUSTOMER'::character varying])::text[])))
);


ALTER TABLE public.m_role OWNER TO postgres;

--
-- Name: m_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_table (
    id character varying NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.m_table OWNER TO postgres;

--
-- Name: m_trans_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_trans_type (
    id character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.m_trans_type OWNER TO postgres;

--
-- Name: m_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_user (
    id character varying NOT NULL,
    name character varying NOT NULL,
    phone_number character varying,
    status boolean,
    user_acount_id character varying(255)
);


ALTER TABLE public.m_user OWNER TO postgres;

--
-- Name: m_user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_user_account (
    id character varying(255) NOT NULL,
    is_enable boolean,
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.m_user_account OWNER TO postgres;

--
-- Name: m_user_account_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_user_account_role (
    user_account_id character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL
);


ALTER TABLE public.m_user_account_role OWNER TO postgres;

--
-- Name: t_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_bill (
    id character varying NOT NULL,
    trans_date timestamp(6) without time zone NOT NULL,
    user_id character varying,
    table_id character varying,
    trans_type character varying NOT NULL,
    payment_id character varying(255)
);


ALTER TABLE public.t_bill OWNER TO postgres;

--
-- Name: t_bill_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_bill_detail (
    id character varying NOT NULL,
    bill_id character varying,
    menu_id character varying,
    qty integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.t_bill_detail OWNER TO postgres;

--
-- Name: t_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_payment (
    id character varying(255) NOT NULL,
    redirect_url character varying(255),
    token character varying(255),
    transaction_status character varying(255)
);


ALTER TABLE public.t_payment OWNER TO postgres;

--
-- Data for Name: m_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_image (id, content_type, name, path, size) FROM stdin;
f95e9824-f831-47b4-8414-521665ee14f0	image/png	1714583154677_mie-seafood.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583154677_mie-seafood.png	37203
a7ec11cf-c822-478e-8d01-ce234f7c8a1c	image/png	1714583576520_mie-ayam.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583576520_mie-ayam.png	41679
3e7d710b-8be4-48a0-8b5a-99550edaec25	image/png	1714583595767_bakpao.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583595767_bakpao.png	38109
6ac20fe4-fde6-483d-990d-f2d06c9c3b19	image/png	1714583610937_nasi-goreng.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583610937_nasi-goreng.png	40603
e0e0d249-4b23-45d3-baff-52ba8be5adff	image/png	1714583625630_mie-campur.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583625630_mie-campur.png	35595
38c33932-3258-452e-8504-1956cca9507c	image/png	1714583640289_mie-sayur.png	D:\\Area\\Enigma Camp\\Backend\\Challange\\wmb_api\\src\\main\\resources\\static\\menu-images\\1714583640289_mie-sayur.png	36997
\.


--
-- Data for Name: m_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_menu (id, name, price, image_id) FROM stdin;
bfbe6c89-6284-4563-a86b-85fdb5c72345	Mie Seafood 	30000	f95e9824-f831-47b4-8414-521665ee14f0
ccdabb5a-59b2-4182-8113-cde48c78ac7c	Mie Ayam	15000	a7ec11cf-c822-478e-8d01-ce234f7c8a1c
ac55959d-2da2-46ee-848e-a785cf43902b	Bakpao Rebus	45000	3e7d710b-8be4-48a0-8b5a-99550edaec25
768bb3a0-2ae2-44a5-8f4b-5a0e8152ad98	Nasi Goreng	20000	6ac20fe4-fde6-483d-990d-f2d06c9c3b19
8643ac3e-8aa9-4fc3-a322-51ca4ebe0d6e	Mie Campur	10000	e0e0d249-4b23-45d3-baff-52ba8be5adff
bd4da520-0efb-47b7-b40c-d5cc552a93c8	Mie Sayur	18000	38c33932-3258-452e-8504-1956cca9507c
\.


--
-- Data for Name: m_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_role (id, role) FROM stdin;
b79fb493-8fe5-4cba-bba2-e817ea80d138	ROLE_SUPER_ADMIN
1baf75c2-5a0a-4a6b-b8af-68f01815ac4e	ROLE_ADMIN
7b622244-0612-4485-8a40-2716df2c532b	ROLE_CUSTOMER
\.


--
-- Data for Name: m_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_table (id, name) FROM stdin;
ecbcdfd9-a512-410e-ba39-046fe804d86f	T01
8a356de0-d860-424d-81ea-70084dc98ecd	T02
a7999040-4443-4ac2-b654-a51695b9f8a9	T03
cb878ea6-2ee0-4838-9124-9ac287cf023a	T04
82521dbe-4ee9-421a-b724-84a59c6b8ebd	T05
1d93d5a9-736d-45f5-aab6-aa0bae1de0fa	T06
5ca58e0d-3462-4d0a-b107-4ccef09994e9	T07
955464a4-5b9b-49ac-8014-c0664d6a9bfd	T08
9c239854-6ab6-424f-a45f-26104e34f0b9	T09
9adf7e43-99ee-4f1a-b255-eb1e1d89d996	T10
f6f86f16-0b77-47da-a5d2-eef203b20932	T11
\.


--
-- Data for Name: m_trans_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_trans_type (id, description) FROM stdin;
EI	Eat In
TA	Take Away
\.


--
-- Data for Name: m_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_user (id, name, phone_number, status, user_acount_id) FROM stdin;
7419d431-cbdb-4fa0-bef9-44ee936e172b	superadmin	\N	t	63fab01c-2501-49ee-a246-bde94c958ae3
1ed55797-76b6-4136-a8ef-f07e84d35423	customer	\N	t	bbfce791-a1c5-4106-8871-bd8abc0e70b4
4830cd2a-d49f-4ce5-995e-61e2760a104f	admin	\N	t	c2f0c04d-9fc8-44fc-aceb-69c6c4bc4c5c
962f2461-bd66-4cfc-80bc-ba844c7eb582	admin2	\N	f	fe753d98-04bc-4456-9bd7-80e2f55a6a70
\.


--
-- Data for Name: m_user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_user_account (id, is_enable, password, username) FROM stdin;
63fab01c-2501-49ee-a246-bde94c958ae3	t	$2a$10$1PwZS/s5vrFJmNjmzCUXpeubD9qtra5rLtfSMyl/Ql.X48zE9FxKi	superadmin
bbfce791-a1c5-4106-8871-bd8abc0e70b4	t	$2a$10$0odUvezF.fy/TNyQ9WqfauQ5t6B6lnhy/an/e8cnVyLPAC5cGP4oO	customer
c2f0c04d-9fc8-44fc-aceb-69c6c4bc4c5c	t	$2a$10$exkTH9ijRJyvc37Xwr1HNuRyNRaz.uXB/KTJG1MDHdUji8hzOjTmC	admin
fe753d98-04bc-4456-9bd7-80e2f55a6a70	f	$2a$10$GrzkyYjid10IqkXZh9/H/.oSlqilMLca6SFQKjGjQVnXMxv9oeTJu	admin2
\.


--
-- Data for Name: m_user_account_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.m_user_account_role (user_account_id, role_id) FROM stdin;
63fab01c-2501-49ee-a246-bde94c958ae3	b79fb493-8fe5-4cba-bba2-e817ea80d138
63fab01c-2501-49ee-a246-bde94c958ae3	1baf75c2-5a0a-4a6b-b8af-68f01815ac4e
63fab01c-2501-49ee-a246-bde94c958ae3	7b622244-0612-4485-8a40-2716df2c532b
c2f0c04d-9fc8-44fc-aceb-69c6c4bc4c5c	1baf75c2-5a0a-4a6b-b8af-68f01815ac4e
c2f0c04d-9fc8-44fc-aceb-69c6c4bc4c5c	7b622244-0612-4485-8a40-2716df2c532b
fe753d98-04bc-4456-9bd7-80e2f55a6a70	1baf75c2-5a0a-4a6b-b8af-68f01815ac4e
fe753d98-04bc-4456-9bd7-80e2f55a6a70	7b622244-0612-4485-8a40-2716df2c532b
bbfce791-a1c5-4106-8871-bd8abc0e70b4	7b622244-0612-4485-8a40-2716df2c532b
\.


--
-- Data for Name: t_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_bill (id, trans_date, user_id, table_id, trans_type, payment_id) FROM stdin;
13fdbf5d-34f1-4ec4-bf89-6035f06b8117	2024-05-05 16:58:27.947	7419d431-cbdb-4fa0-bef9-44ee936e172b	\N	TA	225bf51d-bff3-4d27-9e7e-9752f5db39c9
7f2ef743-d823-4884-904d-5668e9d65413	2024-05-05 16:58:29.699	7419d431-cbdb-4fa0-bef9-44ee936e172b	\N	TA	0c3ff32a-b9af-4ead-a195-9a594b943ca4
f07d0e4f-5884-47e6-ab06-1fe12f820562	2024-05-01 16:59:20.981	7419d431-cbdb-4fa0-bef9-44ee936e172b	a7999040-4443-4ac2-b654-a51695b9f8a9	EI	ddd08aa1-38a3-49bb-8fb8-79d635610427
430592cf-f244-477a-b978-818e56f66d3e	2024-05-02 16:58:59.595	7419d431-cbdb-4fa0-bef9-44ee936e172b	\N	TA	96e7e164-311a-4d89-a040-6b8601c5adf8
5d7fcecb-fd1b-4806-a686-9f64ddbe7fc0	2024-05-05 18:28:56.814	4830cd2a-d49f-4ce5-995e-61e2760a104f	9adf7e43-99ee-4f1a-b255-eb1e1d89d996	EI	4a965622-bc66-4814-a122-4ae8ddacedef
d5c220fa-3ff9-4eca-a630-0ebada00feb8	2024-05-05 18:28:55.984	4830cd2a-d49f-4ce5-995e-61e2760a104f	9adf7e43-99ee-4f1a-b255-eb1e1d89d996	EI	008fb91e-2529-4bac-b030-8392cede7e1e
\.


--
-- Data for Name: t_bill_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_bill_detail (id, bill_id, menu_id, qty, price) FROM stdin;
ebf89722-5013-4035-97ae-0afd7f18174f	13fdbf5d-34f1-4ec4-bf89-6035f06b8117	ac55959d-2da2-46ee-848e-a785cf43902b	2	90000
0359ec1a-ebbf-4013-a458-2029b9cc2403	7f2ef743-d823-4884-904d-5668e9d65413	ac55959d-2da2-46ee-848e-a785cf43902b	2	90000
cb2dbc54-7d86-4a06-a188-4354bdfec092	430592cf-f244-477a-b978-818e56f66d3e	ccdabb5a-59b2-4182-8113-cde48c78ac7c	1	15000
789d45d2-1fdd-45a1-a150-30ded04d7fe9	430592cf-f244-477a-b978-818e56f66d3e	8643ac3e-8aa9-4fc3-a322-51ca4ebe0d6e	1	10000
9db59013-5517-4658-ae6a-d2f1c284935c	f07d0e4f-5884-47e6-ab06-1fe12f820562	bd4da520-0efb-47b7-b40c-d5cc552a93c8	4	72000
0aabf73c-b2b3-4803-9211-86c2ddff799a	d5c220fa-3ff9-4eca-a630-0ebada00feb8	ac55959d-2da2-46ee-848e-a785cf43902b	1	45000
a846e3fe-688d-4493-af38-189628e79f61	5d7fcecb-fd1b-4806-a686-9f64ddbe7fc0	ac55959d-2da2-46ee-848e-a785cf43902b	1	45000
\.


--
-- Data for Name: t_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_payment (id, redirect_url, token, transaction_status) FROM stdin;
8561eabc-c549-40cb-a606-4de0dd016f3b	https://app.sandbox.midtrans.com/snap/v3/redirection/42ee2851-f93a-4bdc-bfa4-0604abcf3194	42ee2851-f93a-4bdc-bfa4-0604abcf3194	ordered
4e8e857e-d9d5-4a58-9338-b37af53aabc2	https://app.sandbox.midtrans.com/snap/v3/redirection/8d979193-0ef4-45b7-8873-0525f763d775	8d979193-0ef4-45b7-8873-0525f763d775	ordered
2a72c99d-288d-4322-b4c2-d587c51e2038	https://app.sandbox.midtrans.com/snap/v3/redirection/661225ae-5193-4ce5-8fce-0a127eb604e8	661225ae-5193-4ce5-8fce-0a127eb604e8	ordered
c832175b-0414-41de-9b8e-d55ce4ba094b	https://app.sandbox.midtrans.com/snap/v3/redirection/d744655f-b083-41e6-862e-cc4614bc3a2d	d744655f-b083-41e6-862e-cc4614bc3a2d	ordered
ce92a077-a2f2-4912-a95a-3ddf4e36e95a	https://app.sandbox.midtrans.com/snap/v3/redirection/f8d1bf80-0c8b-4bc9-ac98-764ad0da2ce1	f8d1bf80-0c8b-4bc9-ac98-764ad0da2ce1	ordered
caf19fda-4e57-4223-b884-23bd59edc462	https://app.sandbox.midtrans.com/snap/v3/redirection/4ad90bb4-96c3-439e-ab9f-a8bd7fac3842	4ad90bb4-96c3-439e-ab9f-a8bd7fac3842	ordered
bd29986c-ed40-488a-a128-2db551c72b51	https://app.sandbox.midtrans.com/snap/v3/redirection/773685ed-df61-4fbd-b992-46a13ee17ff9	773685ed-df61-4fbd-b992-46a13ee17ff9	ordered
03e37d8a-8d7d-44cf-8f56-4e268cbf9400	https://app.sandbox.midtrans.com/snap/v3/redirection/9755228a-ae83-4990-b8ea-da13a02df1e4	9755228a-ae83-4990-b8ea-da13a02df1e4	ordered
775bfa4d-2ce8-42e4-a875-c017c252dc1a	https://app.sandbox.midtrans.com/snap/v3/redirection/b6d8e074-9abb-447b-9fda-2cbb951a12bd	b6d8e074-9abb-447b-9fda-2cbb951a12bd	ordered
7788d494-893e-471d-a41d-c26fceb3f1f1	https://app.sandbox.midtrans.com/snap/v3/redirection/ce51a2c9-f2eb-48fa-87f8-328260472e03	ce51a2c9-f2eb-48fa-87f8-328260472e03	ordered
4bbc9233-5b51-4381-a1e9-ef2e09b5b8e2	https://app.sandbox.midtrans.com/snap/v3/redirection/1ec9d5a2-aa35-4251-bfc6-323dbf06a223	1ec9d5a2-aa35-4251-bfc6-323dbf06a223	ordered
6ca107be-b5ad-4c07-a8e3-800f3286d936	https://app.sandbox.midtrans.com/snap/v3/redirection/1a2e9a04-c17e-46c0-ae4d-8d2461ce30d7	1a2e9a04-c17e-46c0-ae4d-8d2461ce30d7	ordered
6ffeb38e-0e22-48fb-a201-cd713b3bab54	https://app.sandbox.midtrans.com/snap/v3/redirection/87152025-c263-492f-87ef-5ffc4c54c7f0	87152025-c263-492f-87ef-5ffc4c54c7f0	ordered
7d5d4a61-6677-4af9-8a2e-a97af7056cfc	https://app.sandbox.midtrans.com/snap/v4/redirection/871f56fd-8fba-415f-a5f4-21472b31e234	871f56fd-8fba-415f-a5f4-21472b31e234	ordered
48dafd82-04a0-4e20-b25c-1cfe5ad3919b	https://app.sandbox.midtrans.com/snap/v4/redirection/12bd28ee-1f13-4dd3-b02f-faa7246a64ad	12bd28ee-1f13-4dd3-b02f-faa7246a64ad	ordered
8827d825-abf0-4d3e-8325-3986025ab10b	https://app.sandbox.midtrans.com/snap/v4/redirection/82040e5f-e960-4075-888a-ad9ceef79a67	82040e5f-e960-4075-888a-ad9ceef79a67	ordered
8623c714-452b-4d80-b1b9-261cf472a421	https://app.sandbox.midtrans.com/snap/v4/redirection/99258ee2-6f76-4bf7-bf73-17e5d21546a2	99258ee2-6f76-4bf7-bf73-17e5d21546a2	ordered
558e27c1-58e7-4a67-a73a-0bcc3682062d	https://app.sandbox.midtrans.com/snap/v4/redirection/c70b6dda-c44b-49ea-9af3-a5b2563bbe9a	c70b6dda-c44b-49ea-9af3-a5b2563bbe9a	ordered
fa3a1cf2-4ca1-4f5a-99f5-9f26128f4cf6	https://app.sandbox.midtrans.com/snap/v4/redirection/da88ca10-d546-4391-929f-1168a1099c37	da88ca10-d546-4391-929f-1168a1099c37	ordered
ab0022c7-c258-409e-9117-11a99c236c4a	https://app.sandbox.midtrans.com/snap/v4/redirection/06d26c15-b67e-46c3-97a1-bb769e3533cb	06d26c15-b67e-46c3-97a1-bb769e3533cb	ordered
97671f6f-182e-43cf-bad0-5434a3c3acf8	https://app.sandbox.midtrans.com/snap/v4/redirection/62090f32-000b-4b71-af1b-91e3c001ab16	62090f32-000b-4b71-af1b-91e3c001ab16	ordered
1dcc8d9e-def9-4b24-9b5d-1d267cdc2d5e	https://app.sandbox.midtrans.com/snap/v4/redirection/6f6bc6ee-63ff-4e39-bc39-b6419c7f24a1	6f6bc6ee-63ff-4e39-bc39-b6419c7f24a1	ordered
7efbc26f-664a-42fb-9d98-a7e730829b03	https://app.sandbox.midtrans.com/snap/v4/redirection/b9ece728-923b-47e1-9ded-edd6b6e30e47	b9ece728-923b-47e1-9ded-edd6b6e30e47	ordered
20d0fa85-6213-459f-8e4c-d1751ff3afb9	https://app.sandbox.midtrans.com/snap/v4/redirection/684e3a46-7de6-47ed-bab4-87c4f9afd522	684e3a46-7de6-47ed-bab4-87c4f9afd522	ordered
dcd3c7be-44c1-401d-a10d-d820cb860647	https://app.sandbox.midtrans.com/snap/v4/redirection/95297454-66cc-463a-9e7b-03e1938a7ca6	95297454-66cc-463a-9e7b-03e1938a7ca6	ordered
a04e2812-89a5-47ac-a393-7ccee2142a40	https://app.sandbox.midtrans.com/snap/v4/redirection/0fba65c2-ddae-4eeb-9a06-e636bc82d2c2	0fba65c2-ddae-4eeb-9a06-e636bc82d2c2	ordered
f51ce570-320d-4eb3-9b58-14f5c2698af1	https://app.sandbox.midtrans.com/snap/v4/redirection/8445a041-0bec-4e37-af87-9cb47ad7f36d	8445a041-0bec-4e37-af87-9cb47ad7f36d	ordered
addd28ce-f596-44b0-bb21-cdf0392be63f	https://app.sandbox.midtrans.com/snap/v4/redirection/52aea652-7160-4684-8b17-5d7afe50c2ab	52aea652-7160-4684-8b17-5d7afe50c2ab	ordered
57b44fea-5a92-411f-978c-ea0c6812a966	https://app.sandbox.midtrans.com/snap/v4/redirection/14a1d935-4ab0-43ee-ac4f-836e431a320f	14a1d935-4ab0-43ee-ac4f-836e431a320f	ordered
21065d37-5411-4a0a-83ed-3880e694c45f	https://app.sandbox.midtrans.com/snap/v4/redirection/4f433113-8a6b-4f13-a946-4dd00d26dcf5	4f433113-8a6b-4f13-a946-4dd00d26dcf5	ordered
c2d34349-9224-4bfa-b82c-9fed73d3d9af	https://app.sandbox.midtrans.com/snap/v4/redirection/052747f4-bb85-49e5-a800-98d5ef092470	052747f4-bb85-49e5-a800-98d5ef092470	ordered
9ebab921-e27c-4948-a1de-eda5a31159e8	https://app.sandbox.midtrans.com/snap/v4/redirection/e487bf68-0ead-4261-81bd-8acebc64937d	e487bf68-0ead-4261-81bd-8acebc64937d	ordered
e44d9722-9d89-4d33-a7be-a8f2c92a4e02	https://app.sandbox.midtrans.com/snap/v4/redirection/34a7f76b-b37d-4f6d-8b0c-4a76f711dc79	34a7f76b-b37d-4f6d-8b0c-4a76f711dc79	ordered
e295b6ea-f301-4a0b-a3a7-95c7410c97dd	https://app.sandbox.midtrans.com/snap/v4/redirection/2c859295-1f9f-4c00-b283-567d7e6f0c5b	2c859295-1f9f-4c00-b283-567d7e6f0c5b	ordered
3be6d608-3111-4e64-a52a-f86ac87724a4	https://app.sandbox.midtrans.com/snap/v4/redirection/10106857-4f48-4744-acef-2a7bf21da985	10106857-4f48-4744-acef-2a7bf21da985	ordered
a97240b9-f785-49ea-a6d7-773df669879f	https://app.sandbox.midtrans.com/snap/v4/redirection/b2dd44cc-2847-4467-97d9-e6acef4e3a5a	b2dd44cc-2847-4467-97d9-e6acef4e3a5a	ordered
5a5ab9f7-5c89-422a-b168-562afbecb041	https://app.sandbox.midtrans.com/snap/v4/redirection/5fb0084f-52a7-44bf-8ef2-f12dcfc3cf0e	5fb0084f-52a7-44bf-8ef2-f12dcfc3cf0e	ordered
a05954a3-f7e0-48be-849b-7b087209cbdc	https://app.sandbox.midtrans.com/snap/v4/redirection/c02af6a4-65a2-4107-ba6c-b6094c548749	c02af6a4-65a2-4107-ba6c-b6094c548749	ordered
225bf51d-bff3-4d27-9e7e-9752f5db39c9	https://app.sandbox.midtrans.com/snap/v4/redirection/af2277ef-1186-44f7-9e82-4de6f07f76dc	af2277ef-1186-44f7-9e82-4de6f07f76dc	ordered
0c3ff32a-b9af-4ead-a195-9a594b943ca4	https://app.sandbox.midtrans.com/snap/v4/redirection/c1dde04e-0cdb-4fa5-ae1b-437f2b073518	c1dde04e-0cdb-4fa5-ae1b-437f2b073518	ordered
96e7e164-311a-4d89-a040-6b8601c5adf8	https://app.sandbox.midtrans.com/snap/v4/redirection/06b4e133-f3d1-46aa-9bd0-aa4f3fb032bf	06b4e133-f3d1-46aa-9bd0-aa4f3fb032bf	ordered
ddd08aa1-38a3-49bb-8fb8-79d635610427	https://app.sandbox.midtrans.com/snap/v4/redirection/cc7b1a19-72a8-47a0-ba1b-798fd74dd1aa	cc7b1a19-72a8-47a0-ba1b-798fd74dd1aa	ordered
4a965622-bc66-4814-a122-4ae8ddacedef	https://app.sandbox.midtrans.com/snap/v4/redirection/5cf17e01-f9f9-4de7-815c-a72566b8c5bc	5cf17e01-f9f9-4de7-815c-a72566b8c5bc	ordered
008fb91e-2529-4bac-b030-8392cede7e1e	https://app.sandbox.midtrans.com/snap/v4/redirection/3fab624f-1fc4-4e98-8eef-5f857d223ecb	3fab624f-1fc4-4e98-8eef-5f857d223ecb	ordered
\.


--
-- Name: m_image m_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_image
    ADD CONSTRAINT m_image_pkey PRIMARY KEY (id);


--
-- Name: m_menu m_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT m_menu_pkey PRIMARY KEY (id);


--
-- Name: m_role m_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_role
    ADD CONSTRAINT m_role_pkey PRIMARY KEY (id);


--
-- Name: m_table m_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_table
    ADD CONSTRAINT m_table_pkey PRIMARY KEY (id);


--
-- Name: m_trans_type m_trans_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_trans_type
    ADD CONSTRAINT m_trans_type_pkey PRIMARY KEY (id);


--
-- Name: m_user_account m_user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user_account
    ADD CONSTRAINT m_user_account_pkey PRIMARY KEY (id);


--
-- Name: m_user m_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT m_user_pkey PRIMARY KEY (id);


--
-- Name: t_bill_detail t_bill_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT t_bill_detail_pkey PRIMARY KEY (id);


--
-- Name: t_bill t_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT t_bill_pkey PRIMARY KEY (id);


--
-- Name: t_payment t_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_payment
    ADD CONSTRAINT t_payment_pkey PRIMARY KEY (id);


--
-- Name: m_menu uk_20wgc30wmqu7frqgw5mbbxgr9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT uk_20wgc30wmqu7frqgw5mbbxgr9 UNIQUE (image_id);


--
-- Name: t_bill uk_5gbd3p3aghnmrmqn77ma2knrc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT uk_5gbd3p3aghnmrmqn77ma2knrc UNIQUE (payment_id);


--
-- Name: m_user uk_efbaxpe7uhpsvflvfgecb0fsf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT uk_efbaxpe7uhpsvflvfgecb0fsf UNIQUE (user_acount_id);


--
-- Name: m_user_account uk_lveldxh9ud3mkuqk8vexltugi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user_account
    ADD CONSTRAINT uk_lveldxh9ud3mkuqk8vexltugi UNIQUE (username);


--
-- Name: m_user_account_role fk3454ub2g25rxlc7dfbtfjcp10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user_account_role
    ADD CONSTRAINT fk3454ub2g25rxlc7dfbtfjcp10 FOREIGN KEY (role_id) REFERENCES public.m_role(id);


--
-- Name: m_menu fk3te4r8i7owxnuceempaw3v1ym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_menu
    ADD CONSTRAINT fk3te4r8i7owxnuceempaw3v1ym FOREIGN KEY (image_id) REFERENCES public.m_image(id);


--
-- Name: t_bill fk9ncaaotbxschlqy74r5mmsiwe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fk9ncaaotbxschlqy74r5mmsiwe FOREIGN KEY (trans_type) REFERENCES public.m_trans_type(id);


--
-- Name: t_bill fkcos40syk1ngm90ev1v2cpcl7g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fkcos40syk1ngm90ev1v2cpcl7g FOREIGN KEY (payment_id) REFERENCES public.t_payment(id);


--
-- Name: t_bill fkgi8nvfq5amrc9die4vkmonwxf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fkgi8nvfq5amrc9die4vkmonwxf FOREIGN KEY (table_id) REFERENCES public.m_table(id);


--
-- Name: m_user_account_role fkiof37osqt93rgnavdrtoc6qml; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user_account_role
    ADD CONSTRAINT fkiof37osqt93rgnavdrtoc6qml FOREIGN KEY (user_account_id) REFERENCES public.m_user_account(id);


--
-- Name: t_bill_detail fkkn1f8xw6ado3wrokhvjppu8qq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT fkkn1f8xw6ado3wrokhvjppu8qq FOREIGN KEY (bill_id) REFERENCES public.t_bill(id);


--
-- Name: t_bill fklmpbsqe22nwtls8scu4gtebta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill
    ADD CONSTRAINT fklmpbsqe22nwtls8scu4gtebta FOREIGN KEY (user_id) REFERENCES public.m_user(id);


--
-- Name: m_user fko42d7jy3ckkrknvwcy4iqtisj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_user
    ADD CONSTRAINT fko42d7jy3ckkrknvwcy4iqtisj FOREIGN KEY (user_acount_id) REFERENCES public.m_user_account(id);


--
-- Name: t_bill_detail fktf1dxdwko9gpahytlvhfxc39k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_bill_detail
    ADD CONSTRAINT fktf1dxdwko9gpahytlvhfxc39k FOREIGN KEY (menu_id) REFERENCES public.m_menu(id);


--
-- PostgreSQL database dump complete
--

