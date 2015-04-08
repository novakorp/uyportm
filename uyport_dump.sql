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
-- Name: accounts; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    account_number character varying(255),
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying(255)
);


ALTER TABLE public.accounts OWNER TO uyport;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO uyport;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    location_id integer,
    description character varying(255),
    address_detail_1 character varying(255),
    address_detail_2 character varying(255),
    postal_code character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id integer,
    phone_number_1 character varying(255),
    phone_number_2 character varying(255),
    comments text
);


ALTER TABLE public.addresses OWNER TO uyport;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO uyport;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: billing_units; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE billing_units (
    id integer NOT NULL,
    description character varying(255),
    code character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.billing_units OWNER TO uyport;

--
-- Name: billing_units_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE billing_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_units_id_seq OWNER TO uyport;

--
-- Name: billing_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE billing_units_id_seq OWNED BY billing_units.id;


--
-- Name: cargo_categories; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE cargo_categories (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cargo_categories OWNER TO uyport;

--
-- Name: cargo_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE cargo_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_categories_id_seq OWNER TO uyport;

--
-- Name: cargo_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE cargo_categories_id_seq OWNED BY cargo_categories.id;


--
-- Name: cargo_types; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE cargo_types (
    id integer NOT NULL,
    description character varying(255),
    cargo_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    measure_unit_id integer
);


ALTER TABLE public.cargo_types OWNER TO uyport;

--
-- Name: cargo_types_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE cargo_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_types_id_seq OWNER TO uyport;

--
-- Name: cargo_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE cargo_types_id_seq OWNED BY cargo_types.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE companies (
    id integer NOT NULL,
    company_name character varying(255),
    trade_name character varying(255),
    rut character varying(255),
    bps character varying(255),
    mtss character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    mtop character varying(255)
);


ALTER TABLE public.companies OWNER TO uyport;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO uyport;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: customer_shipping_orders; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE customer_shipping_orders (
    id integer NOT NULL,
    company_id integer,
    order_number integer,
    order_datetime timestamp without time zone,
    account_id integer,
    shipping_date date,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_shipping_orders OWNER TO uyport;

--
-- Name: customer_shipping_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE customer_shipping_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_shipping_orders_id_seq OWNER TO uyport;

--
-- Name: customer_shipping_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE customer_shipping_orders_id_seq OWNED BY customer_shipping_orders.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rut character varying(255)
);


ALTER TABLE public.customers OWNER TO uyport;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO uyport;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: document_types; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE document_types (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.document_types OWNER TO uyport;

--
-- Name: document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_types_id_seq OWNER TO uyport;

--
-- Name: document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE document_types_id_seq OWNED BY document_types.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    personal_id character varying(255),
    personal_id_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id integer
);


ALTER TABLE public.employees OWNER TO uyport;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO uyport;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying(255),
    coords character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state_id integer,
    location_type smallint
);


ALTER TABLE public.locations OWNER TO uyport;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO uyport;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: m_requested_cargos; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE m_requested_cargos (
    id integer NOT NULL,
    amount integer,
    cargo_type_id integer,
    m_shipping_request_id integer,
    measure_unit_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.m_requested_cargos OWNER TO uyport;

--
-- Name: m_requested_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE m_requested_cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_requested_cargos_id_seq OWNER TO uyport;

--
-- Name: m_requested_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE m_requested_cargos_id_seq OWNED BY m_requested_cargos.id;


--
-- Name: m_requested_deliveries; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE m_requested_deliveries (
    id integer NOT NULL,
    amount integer,
    address_id integer,
    comments text,
    m_requested_cargo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.m_requested_deliveries OWNER TO uyport;

--
-- Name: m_requested_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE m_requested_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_requested_deliveries_id_seq OWNER TO uyport;

--
-- Name: m_requested_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE m_requested_deliveries_id_seq OWNED BY m_requested_deliveries.id;


--
-- Name: m_requested_supplies; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE m_requested_supplies (
    id integer NOT NULL,
    amount integer,
    address_id integer,
    comments text,
    m_requested_cargo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.m_requested_supplies OWNER TO uyport;

--
-- Name: m_requested_supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE m_requested_supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_requested_supplies_id_seq OWNER TO uyport;

--
-- Name: m_requested_supplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE m_requested_supplies_id_seq OWNED BY m_requested_supplies.id;


--
-- Name: m_shipping_requests; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE m_shipping_requests (
    id integer NOT NULL,
    contact character varying(255),
    details character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    service_id integer,
    account_id integer,
    trip_id integer,
    name character varying(255),
    simple_shipment integer,
    customer_id integer
);


ALTER TABLE public.m_shipping_requests OWNER TO uyport;

--
-- Name: m_shipping_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE m_shipping_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.m_shipping_requests_id_seq OWNER TO uyport;

--
-- Name: m_shipping_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE m_shipping_requests_id_seq OWNED BY m_shipping_requests.id;


--
-- Name: measure_units; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE measure_units (
    id integer NOT NULL,
    name character varying(255),
    symbol character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.measure_units OWNER TO uyport;

--
-- Name: measure_units_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE measure_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measure_units_id_seq OWNER TO uyport;

--
-- Name: measure_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE measure_units_id_seq OWNED BY measure_units.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO uyport;

--
-- Name: services; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    description character varying(255),
    billing_unit_id integer,
    vehicle_type_id integer,
    couple_type_id integer,
    couple_required smallint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id integer
);


ALTER TABLE public.services OWNER TO uyport;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO uyport;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: shipment_deliveries; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE shipment_deliveries (
    id integer NOT NULL,
    amount integer,
    shipment_id integer,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shipment_deliveries OWNER TO uyport;

--
-- Name: shipment_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE shipment_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_deliveries_id_seq OWNER TO uyport;

--
-- Name: shipment_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE shipment_deliveries_id_seq OWNED BY shipment_deliveries.id;


--
-- Name: shipment_supplies; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE shipment_supplies (
    id integer NOT NULL,
    amount integer,
    shipment_id integer,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shipment_supplies OWNER TO uyport;

--
-- Name: shipment_supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE shipment_supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_supplies_id_seq OWNER TO uyport;

--
-- Name: shipment_supplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE shipment_supplies_id_seq OWNED BY shipment_supplies.id;


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE shipments (
    id integer NOT NULL,
    shipping_request_id integer,
    vehicle_id integer,
    coupled_vehicle_id integer,
    driver_id integer,
    status smallint,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone
);


ALTER TABLE public.shipments OWNER TO uyport;

--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipments_id_seq OWNER TO uyport;

--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE shipments_id_seq OWNED BY shipments.id;


--
-- Name: shipping_requests; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE shipping_requests (
    id integer NOT NULL,
    customer_shipping_order_id integer,
    m_shipping_request_id integer,
    service_id integer,
    trip_quantity integer,
    cargo_quantity integer,
    trip_id integer,
    cargo_type_id integer,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    measure_unit_id integer
);


ALTER TABLE public.shipping_requests OWNER TO uyport;

--
-- Name: shipping_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE shipping_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_requests_id_seq OWNER TO uyport;

--
-- Name: shipping_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE shipping_requests_id_seq OWNED BY shipping_requests.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    country character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.states OWNER TO uyport;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO uyport;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: sucta_registrations; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE sucta_registrations (
    id integer NOT NULL,
    expiration timestamp without time zone,
    extended smallint,
    comments text,
    vehicle_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sucta_registrations OWNER TO uyport;

--
-- Name: sucta_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE sucta_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucta_registrations_id_seq OWNER TO uyport;

--
-- Name: sucta_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE sucta_registrations_id_seq OWNED BY sucta_registrations.id;


--
-- Name: trips; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE trips (
    id integer NOT NULL,
    from_location_id integer,
    to_location_id integer,
    distance integer,
    route_itinerary character varying(255),
    comments character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trips OWNER TO uyport;

--
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_id_seq OWNER TO uyport;

--
-- Name: trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE trips_id_seq OWNED BY trips.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying(255),
    remember_token character varying(255)
);


ALTER TABLE public.users OWNER TO uyport;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO uyport;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vehicle_registrations; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE vehicle_registrations (
    id integer NOT NULL,
    chassis character varying(255),
    engine character varying(255),
    registration_date timestamp without time zone,
    registration_number character varying(255),
    dnt_id character varying(255),
    vehicle_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date_of_entry timestamp without time zone
);


ALTER TABLE public.vehicle_registrations OWNER TO uyport;

--
-- Name: vehicle_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE vehicle_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_registrations_id_seq OWNER TO uyport;

--
-- Name: vehicle_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE vehicle_registrations_id_seq OWNED BY vehicle_registrations.id;


--
-- Name: vehicle_types; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE vehicle_types (
    id integer NOT NULL,
    description character varying(255),
    coupling_support smallint,
    couples_to_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.vehicle_types OWNER TO uyport;

--
-- Name: vehicle_types_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE vehicle_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_types_id_seq OWNER TO uyport;

--
-- Name: vehicle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE vehicle_types_id_seq OWNED BY vehicle_types.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE vehicles (
    id integer NOT NULL,
    brand character varying(255),
    model character varying(255),
    number_plate character varying(255),
    comments character varying(255),
    text character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id integer,
    vehicle_type_id integer
);


ALTER TABLE public.vehicles OWNER TO uyport;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicles_id_seq OWNER TO uyport;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE vehicles_id_seq OWNED BY vehicles.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY billing_units ALTER COLUMN id SET DEFAULT nextval('billing_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY cargo_categories ALTER COLUMN id SET DEFAULT nextval('cargo_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY cargo_types ALTER COLUMN id SET DEFAULT nextval('cargo_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY customer_shipping_orders ALTER COLUMN id SET DEFAULT nextval('customer_shipping_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY document_types ALTER COLUMN id SET DEFAULT nextval('document_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY m_requested_cargos ALTER COLUMN id SET DEFAULT nextval('m_requested_cargos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY m_requested_deliveries ALTER COLUMN id SET DEFAULT nextval('m_requested_deliveries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY m_requested_supplies ALTER COLUMN id SET DEFAULT nextval('m_requested_supplies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY m_shipping_requests ALTER COLUMN id SET DEFAULT nextval('m_shipping_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY measure_units ALTER COLUMN id SET DEFAULT nextval('measure_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY shipment_deliveries ALTER COLUMN id SET DEFAULT nextval('shipment_deliveries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY shipment_supplies ALTER COLUMN id SET DEFAULT nextval('shipment_supplies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY shipments ALTER COLUMN id SET DEFAULT nextval('shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY shipping_requests ALTER COLUMN id SET DEFAULT nextval('shipping_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY sucta_registrations ALTER COLUMN id SET DEFAULT nextval('sucta_registrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY trips ALTER COLUMN id SET DEFAULT nextval('trips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY vehicle_registrations ALTER COLUMN id SET DEFAULT nextval('vehicle_registrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY vehicle_types ALTER COLUMN id SET DEFAULT nextval('vehicle_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: uyport
--

ALTER TABLE ONLY vehicles ALTER COLUMN id SET DEFAULT nextval('vehicles_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY accounts (id, account_number, customer_id, created_at, updated_at, description) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('accounts_id_seq', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY addresses (id, location_id, description, address_detail_1, address_detail_2, postal_code, created_at, updated_at, customer_id, phone_number_1, phone_number_2, comments) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


--
-- Data for Name: billing_units; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY billing_units (id, description, code, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('billing_units_id_seq', 1, false);


--
-- Data for Name: cargo_categories; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY cargo_categories (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: cargo_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('cargo_categories_id_seq', 1, false);


--
-- Data for Name: cargo_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY cargo_types (id, description, cargo_category_id, created_at, updated_at, measure_unit_id) FROM stdin;
\.


--
-- Name: cargo_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('cargo_types_id_seq', 1, false);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY companies (id, company_name, trade_name, rut, bps, mtss, created_at, updated_at, mtop) FROM stdin;
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('companies_id_seq', 1, false);


--
-- Data for Name: customer_shipping_orders; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY customer_shipping_orders (id, company_id, order_number, order_datetime, account_id, shipping_date, comments, created_at, updated_at) FROM stdin;
\.


--
-- Name: customer_shipping_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('customer_shipping_orders_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY customers (id, name, created_at, updated_at, rut) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY document_types (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('document_types_id_seq', 1, false);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY employees (id, first_name, last_name, personal_id, personal_id_type, created_at, updated_at, company_id) FROM stdin;
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('employees_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY locations (id, name, coords, created_at, updated_at, state_id, location_type) FROM stdin;
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('locations_id_seq', 1, false);


--
-- Data for Name: m_requested_cargos; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_cargos (id, amount, cargo_type_id, m_shipping_request_id, measure_unit_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: m_requested_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_cargos_id_seq', 1, false);


--
-- Data for Name: m_requested_deliveries; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_deliveries (id, amount, address_id, comments, m_requested_cargo_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: m_requested_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_deliveries_id_seq', 1, false);


--
-- Data for Name: m_requested_supplies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_supplies (id, amount, address_id, comments, m_requested_cargo_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: m_requested_supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_supplies_id_seq', 1, false);


--
-- Data for Name: m_shipping_requests; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_shipping_requests (id, contact, details, created_at, updated_at, service_id, account_id, trip_id, name, simple_shipment, customer_id) FROM stdin;
\.


--
-- Name: m_shipping_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_shipping_requests_id_seq', 1, false);


--
-- Data for Name: measure_units; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY measure_units (id, name, symbol, created_at, updated_at) FROM stdin;
\.


--
-- Name: measure_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('measure_units_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY schema_migrations (version) FROM stdin;
20140908020504
20140827020707
20140827023433
20140827024137
20140828204547
20140828211414
20140828214548
20140831033130
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY services (id, description, billing_unit_id, vehicle_type_id, couple_type_id, couple_required, created_at, updated_at, company_id) FROM stdin;
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('services_id_seq', 1, false);


--
-- Data for Name: shipment_deliveries; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipment_deliveries (id, amount, shipment_id, address_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: shipment_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipment_deliveries_id_seq', 1, false);


--
-- Data for Name: shipment_supplies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipment_supplies (id, amount, shipment_id, address_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: shipment_supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipment_supplies_id_seq', 1, false);


--
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipments (id, shipping_request_id, vehicle_id, coupled_vehicle_id, driver_id, status, comments, created_at, updated_at, departure_time, arrival_time) FROM stdin;
\.


--
-- Name: shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipments_id_seq', 1, false);


--
-- Data for Name: shipping_requests; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipping_requests (id, customer_shipping_order_id, m_shipping_request_id, service_id, trip_quantity, cargo_quantity, trip_id, cargo_type_id, comments, created_at, updated_at, measure_unit_id) FROM stdin;
\.


--
-- Name: shipping_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipping_requests_id_seq', 1, false);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY states (id, name, country, created_at, updated_at) FROM stdin;
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('states_id_seq', 1, false);


--
-- Data for Name: sucta_registrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY sucta_registrations (id, expiration, extended, comments, vehicle_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: sucta_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('sucta_registrations_id_seq', 1, false);


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY trips (id, from_location_id, to_location_id, distance, route_itinerary, comments, created_at, updated_at) FROM stdin;
\.


--
-- Name: trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('trips_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY users (id, name, email, created_at, updated_at, password_digest, remember_token) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: vehicle_registrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicle_registrations (id, chassis, engine, registration_date, registration_number, dnt_id, vehicle_id, created_at, updated_at, date_of_entry) FROM stdin;
\.


--
-- Name: vehicle_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicle_registrations_id_seq', 1, false);


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicle_types (id, description, coupling_support, couples_to_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicle_types_id_seq', 1, false);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicles (id, brand, model, number_plate, comments, text, created_at, updated_at, company_id, vehicle_type_id) FROM stdin;
\.


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicles_id_seq', 1, false);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: billing_units_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY billing_units
    ADD CONSTRAINT billing_units_pkey PRIMARY KEY (id);


--
-- Name: cargo_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY cargo_categories
    ADD CONSTRAINT cargo_categories_pkey PRIMARY KEY (id);


--
-- Name: cargo_types_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY cargo_types
    ADD CONSTRAINT cargo_types_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: customer_shipping_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY customer_shipping_orders
    ADD CONSTRAINT customer_shipping_orders_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY document_types
    ADD CONSTRAINT document_types_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: m_requested_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY m_requested_cargos
    ADD CONSTRAINT m_requested_cargos_pkey PRIMARY KEY (id);


--
-- Name: m_requested_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY m_requested_deliveries
    ADD CONSTRAINT m_requested_deliveries_pkey PRIMARY KEY (id);


--
-- Name: m_requested_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY m_requested_supplies
    ADD CONSTRAINT m_requested_supplies_pkey PRIMARY KEY (id);


--
-- Name: m_shipping_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY m_shipping_requests
    ADD CONSTRAINT m_shipping_requests_pkey PRIMARY KEY (id);


--
-- Name: measure_units_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY measure_units
    ADD CONSTRAINT measure_units_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shipment_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY shipment_deliveries
    ADD CONSTRAINT shipment_deliveries_pkey PRIMARY KEY (id);


--
-- Name: shipment_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY shipment_supplies
    ADD CONSTRAINT shipment_supplies_pkey PRIMARY KEY (id);


--
-- Name: shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY shipping_requests
    ADD CONSTRAINT shipping_requests_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: sucta_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY sucta_registrations
    ADD CONSTRAINT sucta_registrations_pkey PRIMARY KEY (id);


--
-- Name: trips_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY vehicle_registrations
    ADD CONSTRAINT vehicle_registrations_pkey PRIMARY KEY (id);


--
-- Name: vehicle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY vehicle_types
    ADD CONSTRAINT vehicle_types_pkey PRIMARY KEY (id);


--
-- Name: vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_customer_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_addresses_on_customer_id ON addresses USING btree (customer_id);


--
-- Name: index_addresses_on_location_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_addresses_on_location_id ON addresses USING btree (location_id);


--
-- Name: index_addresses_on_measure_unit_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_addresses_on_measure_unit_id ON cargo_types USING btree (measure_unit_id);


--
-- Name: index_cargo_types_on_cargo_category_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_cargo_types_on_cargo_category_id ON cargo_types USING btree (cargo_category_id);


--
-- Name: index_customer_shipping_orders_on_account_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_customer_shipping_orders_on_account_id ON customer_shipping_orders USING btree (account_id);


--
-- Name: index_customer_shipping_orders_on_company_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_customer_shipping_orders_on_company_id ON customer_shipping_orders USING btree (company_id);


--
-- Name: index_employees_on_company_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_employees_on_company_id ON employees USING btree (company_id);


--
-- Name: index_locations_on_state_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_locations_on_state_id ON locations USING btree (state_id);


--
-- Name: index_m_requested_cargos_on_cargo_type_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_cargos_on_cargo_type_id ON m_requested_cargos USING btree (cargo_type_id);


--
-- Name: index_m_requested_cargos_on_m_shipping_request_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_cargos_on_m_shipping_request_id ON m_requested_cargos USING btree (m_shipping_request_id);


--
-- Name: index_m_requested_cargos_on_measure_unit_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_cargos_on_measure_unit_id ON m_requested_cargos USING btree (measure_unit_id);


--
-- Name: index_m_requested_deliveries_on_address_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_deliveries_on_address_id ON m_requested_deliveries USING btree (address_id);


--
-- Name: index_m_requested_deliveries_on_requested_cargo_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_deliveries_on_requested_cargo_id ON m_requested_deliveries USING btree (m_requested_cargo_id);


--
-- Name: index_m_requested_supplies_on_address_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_supplies_on_address_id ON m_requested_supplies USING btree (address_id);


--
-- Name: index_m_requested_supplies_on_requested_cargo_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_requested_supplies_on_requested_cargo_id ON m_requested_supplies USING btree (m_requested_cargo_id);


--
-- Name: index_m_shipping_requests_on_account_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_shipping_requests_on_account_id ON m_shipping_requests USING btree (account_id);


--
-- Name: index_m_shipping_requests_on_service_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_shipping_requests_on_service_id ON m_shipping_requests USING btree (service_id);


--
-- Name: index_m_shipping_requests_on_trip_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_shipping_requests_on_trip_id ON m_shipping_requests USING btree (trip_id);


--
-- Name: index_services_on_billing_unit_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_services_on_billing_unit_id ON services USING btree (billing_unit_id);


--
-- Name: index_services_on_company_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_services_on_company_id ON services USING btree (company_id);


--
-- Name: index_services_on_couple_type_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_services_on_couple_type_id ON services USING btree (couple_type_id);


--
-- Name: index_services_on_vehicle_type_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_services_on_vehicle_type_id ON services USING btree (vehicle_type_id);


--
-- Name: index_shipment_deliveries_on_address_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_deliveries_on_address_id ON shipment_deliveries USING btree (address_id);


--
-- Name: index_shipment_deliveries_on_shipment_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_deliveries_on_shipment_id ON shipment_deliveries USING btree (shipment_id);


--
-- Name: index_shipment_supplies_on_address_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_supplies_on_address_id ON shipment_supplies USING btree (address_id);


--
-- Name: index_shipment_supplies_on_shipment_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_supplies_on_shipment_id ON shipment_supplies USING btree (shipment_id);


--
-- Name: index_shipments_on_shipping_request_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipments_on_shipping_request_id ON shipments USING btree (shipping_request_id);


--
-- Name: index_shipments_on_vehicle_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipments_on_vehicle_id ON shipments USING btree (vehicle_id);


--
-- Name: index_shipping_requests_on_cargo_type_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_cargo_type_id ON shipping_requests USING btree (cargo_type_id);


--
-- Name: index_shipping_requests_on_customer_shipping_order_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_customer_shipping_order_id ON shipping_requests USING btree (customer_shipping_order_id);


--
-- Name: index_shipping_requests_on_m_shipping_request_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_m_shipping_request_id ON shipping_requests USING btree (m_shipping_request_id);


--
-- Name: index_shipping_requests_on_measure_unit_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_measure_unit_id ON shipping_requests USING btree (measure_unit_id);


--
-- Name: index_shipping_requests_on_service_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_service_id ON shipping_requests USING btree (service_id);


--
-- Name: index_shipping_requests_on_trip_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipping_requests_on_trip_id ON shipping_requests USING btree (trip_id);


--
-- Name: index_sucta_registrations_on_vehicle_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_sucta_registrations_on_vehicle_id ON sucta_registrations USING btree (vehicle_id);


--
-- Name: index_trips_on_from_location_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_trips_on_from_location_id ON trips USING btree (from_location_id);


--
-- Name: index_trips_on_to_location_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_trips_on_to_location_id ON trips USING btree (to_location_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: index_vehicle_registrations_on_vehicle_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_vehicle_registrations_on_vehicle_id ON vehicle_registrations USING btree (vehicle_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

