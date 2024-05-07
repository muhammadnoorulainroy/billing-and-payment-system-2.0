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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: feature_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feature_plans (
    id bigint NOT NULL,
    plan_id bigint,
    feature_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: feature_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feature_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feature_plans_id_seq OWNED BY public.feature_plans.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.features (
    id bigint NOT NULL,
    name character varying NOT NULL,
    code character varying NOT NULL,
    max_unit_limit integer NOT NULL,
    unit_price numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_code_length CHECK (((length((code)::text) >= 3) AND (length((code)::text) <= 6))),
    CONSTRAINT check_name_length CHECK (((length((name)::text) >= 3) AND (length((name)::text) <= 20)))
);


--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plans (
    id bigint NOT NULL,
    name character varying NOT NULL,
    monthly_fee numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_name_length CHECK (((length((name)::text) >= 3) AND (length((name)::text) <= 20)))
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: stripe_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stripe_plans (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying,
    "interval" integer,
    price_cents integer NOT NULL,
    stripe_price_id character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stripe_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stripe_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stripe_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stripe_plans_id_seq OWNED BY public.stripe_plans.id;


--
-- Name: stripe_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stripe_subscriptions (
    id bigint NOT NULL,
    stripe_plan_id bigint,
    user_id bigint,
    active boolean DEFAULT true,
    stripe_id character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stripe_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stripe_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stripe_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stripe_subscriptions_id_seq OWNED BY public.stripe_subscriptions.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    buyer_id bigint,
    plan_id bigint,
    billing_day date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    plan_name character varying NOT NULL,
    amount numeric NOT NULL,
    buyer_name character varying NOT NULL,
    buyer_email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: usages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usages (
    id bigint NOT NULL,
    subscription_id bigint,
    feature_id bigint,
    usage integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: usages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usages_id_seq OWNED BY public.usages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_type character varying,
    invited_by_id bigint,
    invitations_count integer DEFAULT 0,
    type character varying,
    stripe_id character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: feature_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_plans ALTER COLUMN id SET DEFAULT nextval('public.feature_plans_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: stripe_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_plans ALTER COLUMN id SET DEFAULT nextval('public.stripe_plans_id_seq'::regclass);


--
-- Name: stripe_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.stripe_subscriptions_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: usages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usages ALTER COLUMN id SET DEFAULT nextval('public.usages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: feature_plans feature_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_plans
    ADD CONSTRAINT feature_plans_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stripe_plans stripe_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_plans
    ADD CONSTRAINT stripe_plans_pkey PRIMARY KEY (id);


--
-- Name: stripe_subscriptions stripe_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_subscriptions
    ADD CONSTRAINT stripe_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: usages usages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usages
    ADD CONSTRAINT usages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_feature_plans_on_feature_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feature_plans_on_feature_id ON public.feature_plans USING btree (feature_id);


--
-- Name: index_feature_plans_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feature_plans_on_plan_id ON public.feature_plans USING btree (plan_id);


--
-- Name: index_features_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_features_on_code ON public.features USING btree (code);


--
-- Name: index_features_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_features_on_name ON public.features USING btree (name);


--
-- Name: index_plans_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_plans_on_name ON public.plans USING btree (name);


--
-- Name: index_stripe_plans_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_stripe_plans_on_name ON public.stripe_plans USING btree (name);


--
-- Name: index_stripe_plans_on_stripe_price_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_stripe_plans_on_stripe_price_id ON public.stripe_plans USING btree (stripe_price_id);


--
-- Name: index_stripe_subscriptions_on_stripe_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_stripe_subscriptions_on_stripe_id ON public.stripe_subscriptions USING btree (stripe_id);


--
-- Name: index_stripe_subscriptions_on_stripe_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stripe_subscriptions_on_stripe_plan_id ON public.stripe_subscriptions USING btree (stripe_plan_id);


--
-- Name: index_stripe_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stripe_subscriptions_on_user_id ON public.stripe_subscriptions USING btree (user_id);


--
-- Name: index_subscriptions_on_buyer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_buyer_id ON public.subscriptions USING btree (buyer_id);


--
-- Name: index_subscriptions_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_plan_id ON public.subscriptions USING btree (plan_id);


--
-- Name: index_transactions_on_buyer_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transactions_on_buyer_email ON public.transactions USING btree (buyer_email);


--
-- Name: index_usages_on_feature_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_usages_on_feature_id ON public.usages USING btree (feature_id);


--
-- Name: index_usages_on_subscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_usages_on_subscription_id ON public.usages USING btree (subscription_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON public.users USING btree (invitation_token);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_invited_by_id ON public.users USING btree (invited_by_id);


--
-- Name: index_users_on_invited_by_type_and_invited_by_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_invited_by_type_and_invited_by_id ON public.users USING btree (invited_by_type, invited_by_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_stripe_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_stripe_id ON public.users USING btree (stripe_id);


--
-- Name: stripe_subscriptions fk_rails_542bf76268; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_subscriptions
    ADD CONSTRAINT fk_rails_542bf76268 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscriptions fk_rails_63d3df128b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_63d3df128b FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: stripe_subscriptions fk_rails_7a122f7ae8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stripe_subscriptions
    ADD CONSTRAINT fk_rails_7a122f7ae8 FOREIGN KEY (stripe_plan_id) REFERENCES public.stripe_plans(id);


--
-- Name: subscriptions fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (buyer_id) REFERENCES public.users(id);


--
-- Name: feature_plans fk_rails_aace678173; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_plans
    ADD CONSTRAINT fk_rails_aace678173 FOREIGN KEY (feature_id) REFERENCES public.features(id);


--
-- Name: feature_plans fk_rails_b4d4320106; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feature_plans
    ADD CONSTRAINT fk_rails_b4d4320106 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: usages fk_rails_ebc0110052; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usages
    ADD CONSTRAINT fk_rails_ebc0110052 FOREIGN KEY (feature_id) REFERENCES public.features(id);


--
-- Name: usages fk_rails_f2717d5ae3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usages
    ADD CONSTRAINT fk_rails_f2717d5ae3 FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20220621092058'),
('20220625193649'),
('20220625200410'),
('20220625231545'),
('20220627090255'),
('20220627100538'),
('20220627215032'),
('20220627215703'),
('20220629071809'),
('20220629125014'),
('20220629131703'),
('20220629132202'),
('20220629143047'),
('20220630200827'),
('20220702181434'),
('20220703121056'),
('20220703121708'),
('20220706070803'),
('20220706081510'),
('20220706081730'),
('20220706081957'),
('20220706082727'),
('20220713081724'),
('20220713120909'),
('20220713121251'),
('20220714195415'),
('20220718115308'),
('20220718222901'),
('20220722010136'),
('20220722012849'),
('20220722013845'),
('20220722025644');


