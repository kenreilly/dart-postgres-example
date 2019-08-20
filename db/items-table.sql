-- SEQUENCE: public.items_id_seq

-- DROP SEQUENCE public.items_id_seq;

CREATE SEQUENCE public.items_id_seq;

ALTER SEQUENCE public.items_id_seq
    OWNER TO dart_pg_user;


-- Table: public.items

-- DROP TABLE public.items;

CREATE TABLE public.items
(
    id integer NOT NULL DEFAULT nextval('items_id_seq'::regclass),
    name character varying(16) COLLATE pg_catalog."default" NOT NULL,
    description character varying(128) COLLATE pg_catalog."default",
    create_timestamp timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT items_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.items
    OWNER to dart_pg_user;