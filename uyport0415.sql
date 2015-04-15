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
-- Name: order_number_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_number_seq OWNER TO uyport;

--
-- Name: customer_shipping_orders; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE customer_shipping_orders (
    id integer NOT NULL,
    company_id integer,
    order_number integer DEFAULT nextval('order_number_seq'::regclass),
    order_datetime timestamp without time zone,
    shipping_date date,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id integer
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
    location_type smallint,
    longitude numeric(7,5),
    latitude numeric(7,5)
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
-- Name: shipment_documents; Type: TABLE; Schema: public; Owner: uyport; Tablespace: 
--

CREATE TABLE shipment_documents (
    id integer NOT NULL,
    shipment_id integer,
    document_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number_text character varying(255),
    comments text
);


ALTER TABLE public.shipment_documents OWNER TO uyport;

--
-- Name: shipment_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: uyport
--

CREATE SEQUENCE shipment_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_documents_id_seq OWNER TO uyport;

--
-- Name: shipment_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uyport
--

ALTER SEQUENCE shipment_documents_id_seq OWNED BY shipment_documents.id;


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

ALTER TABLE ONLY shipment_documents ALTER COLUMN id SET DEFAULT nextval('shipment_documents_id_seq'::regclass);


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
1	123456	1	2014-05-16 04:46:09	2014-05-26 03:58:18	Efectivo
2	123457	1	2014-05-22 04:42:04	2014-05-26 03:58:00	Cheque
4	123459	2	2014-09-15 23:12:43.917934	2014-09-15 23:13:38.480054	Dolares
3	123458	2	2014-09-15 23:12:16.840385	2014-09-15 23:13:54.300959	Pesos
5	123460	3	2014-09-15 23:14:43.811791	2014-09-15 23:14:43.811791	Pesos
6	123461	4	2014-09-15 23:16:13.65993	2014-09-15 23:16:13.65993	Pesos
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('accounts_id_seq', 6, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY addresses (id, location_id, description, address_detail_1, address_detail_2, postal_code, created_at, updated_at, customer_id, phone_number_1, phone_number_2, comments) FROM stdin;
1	1	Cantera	ruta 101	km 12	11500	2014-05-14 05:50:28	2014-05-21 23:47:21	1	1234	5648	Estos son los comentarios.
3	1	Fábrica	Sayago 881	Sayago	30412	2014-05-21 23:47:00	2014-05-21 23:47:00	1	3459302		
4	1	Oficina Central	Ruta 5 km10			2014-09-02 01:12:30	2014-09-02 01:12:30	4			
5	7	CW	Ruta 1 km 57			2014-09-02 01:14:53	2014-09-02 01:14:53	4			
6	1	Planta Fray Bentos	Ruta UPM KM 23			2015-04-07 04:55:31.481854	2015-04-07 04:55:31.481854	3	12234		
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('addresses_id_seq', 6, true);


--
-- Data for Name: billing_units; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY billing_units (id, description, code, created_at, updated_at) FROM stdin;
1	Por Viaje	FactXViaje	2014-03-15 02:33:43	2014-03-15 02:33:43
2	Por Tonelada	FactXTonelada	2014-03-15 02:34:14	2014-03-15 02:34:14
3	Por Unidad	FactXUnidad	2014-03-15 02:34:58	2014-03-15 02:34:58
4	Por m3	PorM3	2014-03-16 23:55:37	2014-03-16 23:55:37
\.


--
-- Name: billing_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('billing_units_id_seq', 5, false);


--
-- Data for Name: cargo_categories; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY cargo_categories (id, description, created_at, updated_at) FROM stdin;
1	Material de Construcción	2014-05-19 00:00:25	2014-05-19 00:00:25
2	Minerales	2014-05-19 00:01:36	2014-05-19 00:01:36
\.


--
-- Name: cargo_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('cargo_categories_id_seq', 3, false);


--
-- Data for Name: cargo_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY cargo_types (id, description, cargo_category_id, created_at, updated_at, measure_unit_id) FROM stdin;
1	Arena	2	2014-05-19 00:03:41	2014-05-23 02:33:10	1
2	Portland	1	2014-05-19 00:04:00	2014-05-23 02:34:01	3
3	Clinker	2	2014-05-19 00:04:22	2014-05-23 02:33:36	2
4	Pedregullo	2	2014-05-19 00:04:39	2014-06-18 01:54:34	1
\.


--
-- Name: cargo_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('cargo_types_id_seq', 5, false);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY companies (id, company_name, trade_name, rut, bps, mtss, created_at, updated_at, mtop) FROM stdin;
1	Odacor	Odacor S.A.	2133 0056 440017	222222	333333	2014-03-28 04:02:23	2014-04-01 05:36:30	1566
2	Ferreira Almirón	Ferreira Almirón S.A.	12342210017	123456	212121	2014-03-28 04:06:59	2014-04-01 05:36:09	15133165
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('companies_id_seq', 3, false);


--
-- Data for Name: customer_shipping_orders; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY customer_shipping_orders (id, company_id, order_number, order_datetime, shipping_date, comments, created_at, updated_at, customer_id) FROM stdin;
18	1	13	2015-01-15 01:09:00	2015-01-16		2015-01-15 03:10:39.970172	2015-01-15 03:10:39.970172	4
16	1	11	2015-01-16 00:42:00	2015-01-16		2015-01-15 02:43:59.228107	2015-01-15 02:43:59.228107	1
17	1	12	2015-01-18 02:10:00	2015-01-16		2015-01-15 03:03:13.877228	2015-01-15 03:03:13.877228	4
19	1	14	2015-03-19 04:42:00	2015-03-19		2015-03-04 02:44:21.492513	2015-03-04 02:44:21.492513	1
20	1	15	2015-03-14 10:55:00	2015-03-15		2015-03-14 13:56:55.431379	2015-03-14 13:56:55.431379	1
21	1	16	2015-03-14 10:55:00	2015-03-15		2015-03-14 13:59:09.078023	2015-03-14 13:59:09.078023	1
24	1	19	2015-03-25 23:46:00	2015-03-26		2015-03-26 02:48:01.044608	2015-03-26 02:48:01.044608	1
25	1	20	2015-03-25 23:46:00	2015-03-26		2015-03-26 03:17:13.193825	2015-03-26 03:17:13.193825	1
\.


--
-- Name: customer_shipping_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('customer_shipping_orders_id_seq', 25, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY customers (id, name, created_at, updated_at, rut) FROM stdin;
1	CNC	2014-03-27 03:22:36	2014-05-16 03:53:11	12345678
2	Cementos Artigas	2014-03-27 03:22:58	2014-03-27 03:22:58	\N
3	UPM	2014-03-27 03:26:14	2014-03-27 03:26:14	\N
4	Hormigon Azul Mixto S.A.	2014-05-24 02:51:13	2014-05-24 02:51:13	434930034
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('customers_id_seq', 5, false);


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY document_types (id, description, created_at, updated_at) FROM stdin;
1	Guía	2014-06-16 01:26:03	2014-06-16 01:28:01
2	Orden de Carga	2014-06-16 01:26:51	2014-06-16 01:27:36
3	Remito	2014-06-16 01:28:24	2014-06-16 01:28:24
\.


--
-- Name: document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('document_types_id_seq', 4, false);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY employees (id, first_name, last_name, personal_id, personal_id_type, created_at, updated_at, company_id) FROM stdin;
1	Carlos	Fernandez	3056874	CI	2014-05-16 05:01:37	2014-05-16 05:01:37	1
2	Roberto	Fleitas	2358962	CI	2014-05-19 00:07:42	2014-05-19 00:07:42	1
3	Matías	Ferreira	4205632	CI	2014-05-20 00:15:37	2014-05-20 00:15:37	2
4	Alejandro	Sanz	304586	CI	2014-05-20 00:16:28	2014-05-20 00:16:28	2
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('employees_id_seq', 5, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY locations (id, name, coords, created_at, updated_at, state_id, location_type, longitude, latitude) FROM stdin;
1	Montevideo	1234, 30444	2014-03-13 03:15:24	2015-03-18 13:52:11.742245	1	1	56.18333	34.83333
6	Minas	54210, 65842	2014-05-19 22:44:06	2015-03-18 14:18:45.908426	9	1	55.23333	34.36666
2	Maldonado	32044, 02324	2014-03-13 03:17:30	2015-03-18 14:19:52.386228	10	1	54.95000	34.88333
3	Punta del Este	32343, 40340	2014-03-13 03:17:56	2015-03-18 14:20:35.759709	10	1	54.95000	34.95000
8	Zona América	\N	2015-03-18 14:21:40.882434	2015-03-18 14:21:40.882434	1	2	56.06667	34.78333
7	Colonia Wilson		2014-09-02 01:10:46	2015-03-19 03:19:26.982011	16	2	56.55000	34.71667
4	Conchillas	34493, 4003	2014-03-13 03:18:17	2015-03-19 03:30:32.747091	5	1	58.01667	34.15000
9	Canelones	\N	2015-03-19 03:31:48.402418	2015-03-19 03:31:48.402418	3	1	56.28333	34.53333
11	Fca. C. Artigas	\N	2015-03-19 03:33:40.872851	2015-03-19 03:33:40.872851	1	2	56.21667	34.83333
12	Barros Blancos	\N	2015-03-19 03:34:16.839908	2015-03-19 03:34:40.015234	3	1	56.00000	34.75000
13	Pando	\N	2015-03-19 03:37:35.418266	2015-03-19 03:37:35.418266	3	1	55.95000	34.70000
5	Aerop. Int. de Carrasco	56225, 66945	2014-05-19 03:56:38	2015-03-19 03:38:41.21303	3	2	56.01667	34.83333
10	Depósito	\N	2015-03-19 03:32:43.32756	2015-03-19 04:50:06.667144	1	2	56.21333	34.77583
14	Planta Fray Bentos	\N	2015-04-07 04:57:15.147784	2015-04-07 04:57:15.147784	12	2	\N	\N
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('locations_id_seq', 14, true);


--
-- Data for Name: m_requested_cargos; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_cargos (id, amount, cargo_type_id, m_shipping_request_id, measure_unit_id, created_at, updated_at) FROM stdin;
1	\N	3	1	1	2014-05-21 06:31:04	2014-05-21 06:31:04
2	30000	2	5	2	2014-09-02 01:16:00	2014-09-02 01:16:00
\.


--
-- Name: m_requested_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_cargos_id_seq', 3, false);


--
-- Data for Name: m_requested_deliveries; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_deliveries (id, amount, address_id, comments, m_requested_cargo_id, created_at, updated_at) FROM stdin;
1	3000	1		\N	2014-05-21 06:49:43	2014-05-21 06:49:43
2	\N	3	entrega en acopio	1	2014-05-21 06:54:22	2014-06-30 00:14:59
5	\N	3	Entregar en deposito	1	2014-06-30 00:15:40	2014-06-30 00:16:14
6	30000	5		2	2014-09-03 03:00:08	2014-09-03 03:00:50
\.


--
-- Name: m_requested_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_deliveries_id_seq', 7, false);


--
-- Data for Name: m_requested_supplies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_requested_supplies (id, amount, address_id, comments, m_requested_cargo_id, created_at, updated_at) FROM stdin;
1	200	1		\N	2014-05-21 06:49:28	2014-05-21 06:49:28
3	30000	4		2	2014-09-03 02:58:47	2014-09-03 03:00:36
2	50	1		1	2014-05-21 06:54:33	2014-10-11 15:53:38.263797
\.


--
-- Name: m_requested_supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_requested_supplies_id_seq', 4, false);


--
-- Data for Name: m_shipping_requests; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY m_shipping_requests (id, contact, details, created_at, updated_at, service_id, trip_id, name, simple_shipment, customer_id) FROM stdin;
1	\N		2014-05-21 06:29:23	2014-09-01 03:38:05	1	3	Arena M del Plata	0	1
4	\N		2014-09-01 03:12:20	2014-09-01 03:28:49	2	7	Trabajo Planta	1	1
5	\N	Se retira  a nombre de Ancap Manga a Nombre del cliente.mSe transporta de Planta Manga Ancap a San Jose Colonia Wilson Ruta1 km57  Planta 2 Cielo Azul.	2014-09-02 01:09:19	2014-09-03 03:25:37	1	9	Tolva CW	1	4
\.


--
-- Name: m_shipping_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('m_shipping_requests_id_seq', 6, false);


--
-- Data for Name: measure_units; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY measure_units (id, name, symbol, created_at, updated_at) FROM stdin;
1	Metro Cuadrado	M3	2014-05-16 05:03:55	2014-05-16 05:03:55
2	Tonelada	Ton	2014-05-19 04:07:20	2014-05-19 04:07:20
3	Bolsa 25 Kilos	Bolsa 25K	2014-05-20 00:20:04	2014-05-24 02:53:57
\.


--
-- Name: measure_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('measure_units_id_seq', 4, false);


--
-- Name: order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('order_number_seq', 20, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY schema_migrations (version) FROM stdin;
20140912040503
20140913230812
20140913233230
20141228194126
20141228202440
20141229024348
20150311223440
20150311233705
20150311234145
20150311234249
20150318014713
20150318015201
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY services (id, description, billing_unit_id, vehicle_type_id, couple_type_id, couple_required, created_at, updated_at, company_id) FROM stdin;
1	Viaje Tolva	2	7	11	1	2014-05-16 06:01:11	2014-05-16 06:09:38	1
2	Trabajo Pala	1	12	\N	0	2014-05-23 01:26:04	2014-05-23 01:26:04	1
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('services_id_seq', 3, false);


--
-- Data for Name: shipment_deliveries; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipment_deliveries (id, amount, shipment_id, address_id, created_at, updated_at) FROM stdin;
9	10	7	3	2015-02-02 23:25:30.156524	2015-02-02 23:25:30.156524
10	40	7	3	2015-02-02 23:25:30.289531	2015-02-02 23:25:30.289531
11	20	8	3	2015-02-27 00:47:08.50731	2015-02-27 00:47:08.50731
12	30	8	3	2015-02-27 00:47:08.822328	2015-02-27 00:47:08.822328
13	\N	9	3	2015-03-04 02:46:06.053493	2015-03-04 02:46:06.053493
14	\N	9	3	2015-03-04 02:46:06.074494	2015-03-04 02:46:06.074494
20	10	10	1	2015-04-07 04:49:39.002694	2015-04-07 04:49:39.002694
15	25	10	3	2015-04-07 03:11:47.419858	2015-04-07 04:50:13.677677
21	15	10	1	2015-04-07 04:49:39.006694	2015-04-07 04:50:13.684677
\.


--
-- Name: shipment_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipment_deliveries_id_seq', 21, true);


--
-- Data for Name: shipment_documents; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipment_documents (id, shipment_id, document_type_id, created_at, updated_at, number_text, comments) FROM stdin;
1	7	1	2015-03-12 04:35:09.991586	2015-03-12 04:35:09.991586	1	a
2	7	3	2015-03-12 04:35:55.663198	2015-03-12 04:35:55.663198	2	b
3	7	1	2015-03-12 21:49:05.483919	2015-03-12 21:49:05.483919		
4	7	3	2015-03-15 20:27:28.440666	2015-03-15 20:27:28.440666	1025	Otro remito
5	7	2	2015-03-15 20:31:13.769554	2015-03-15 20:31:13.769554	425	pppp
\.


--
-- Name: shipment_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipment_documents_id_seq', 5, true);


--
-- Data for Name: shipment_supplies; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipment_supplies (id, amount, shipment_id, address_id, created_at, updated_at) FROM stdin;
6	50	7	1	2015-02-02 23:25:29.7375	2015-02-02 23:25:29.7375
7	50	8	1	2015-02-27 00:47:08.186292	2015-02-27 00:47:08.186292
8	50	9	1	2015-03-04 02:46:05.989489	2015-03-04 02:46:05.989489
9	50	10	1	2015-04-07 03:11:45.095725	2015-04-07 03:11:45.095725
\.


--
-- Name: shipment_supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipment_supplies_id_seq', 9, true);


--
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipments (id, shipping_request_id, vehicle_id, coupled_vehicle_id, driver_id, status, comments, created_at, updated_at, departure_time, arrival_time) FROM stdin;
8	19	1	4	1	4		2015-02-27 00:47:07.955279	2015-02-28 22:33:50.467593	2015-02-26 04:00:00	2015-02-26 06:10:00
7	19	1	4	1	3		2015-02-02 23:25:29.163467	2015-03-10 23:44:41.953007	2015-02-23 21:00:00	2015-02-24 00:00:00
9	22	1	4	1	2		2015-03-04 02:46:05.969488	2015-03-20 02:23:49.253103	2015-03-20 08:00:00	2015-03-21 10:00:00
10	30	1	4	4	1		2015-04-07 03:11:44.29668	2015-04-07 03:11:44.29668	2015-04-09 05:00:00	2015-04-09 07:00:00
\.


--
-- Name: shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipments_id_seq', 10, true);


--
-- Data for Name: shipping_requests; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY shipping_requests (id, customer_shipping_order_id, m_shipping_request_id, service_id, trip_quantity, cargo_quantity, trip_id, cargo_type_id, comments, created_at, updated_at, measure_unit_id) FROM stdin;
19	16	1	1	2	50	3	1	\N	2015-01-15 02:43:59.699667	2015-01-15 02:43:59.699667	2
20	17	5	1	1	30000	9	2	\N	2015-01-15 03:03:13.881729	2015-01-15 03:03:13.881729	2
21	18	5	1	4	30000	9	2	\N	2015-01-15 03:10:39.977173	2015-01-15 11:49:03.293461	2
25	21	1	1	5	10	3	3	\N	2015-03-14 13:59:09.083023	2015-03-14 13:59:09.083023	1
26	21	4	2	20	300	7	3	\N	2015-03-14 13:59:09.088024	2015-03-14 13:59:09.088024	1
22	19	1	1	80	5000	3	3	\N	2015-03-04 02:44:21.80153	2015-03-15 16:02:07.012024	2
31	21	4	2	10	30	7	2	\N	2015-03-24 23:47:41.643314	2015-03-24 23:47:41.643314	2
30	21	1	1	12	201	3	3	\N	2015-03-23 02:28:45.513525	2015-03-24 23:53:16.776482	2
\.


--
-- Name: shipping_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('shipping_requests_id_seq', 32, true);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY states (id, name, country, created_at, updated_at) FROM stdin;
1	Montevideo	UY	2014-05-19 02:33:07	2014-05-19 02:33:07
2	Artigas	UY	2014-05-19 02:33:23	2014-05-19 02:34:10
3	Canelones	UY	2014-05-19 02:34:31	2014-05-19 02:34:31
4	Cerro Largo	UY	2014-05-19 02:35:14	2014-05-19 02:35:14
5	Colonia	UY	2014-05-19 02:35:28	2014-05-19 02:35:28
6	Durazno	UY	2014-05-19 02:36:35	2014-05-19 02:36:35
7	Flores	UY	2014-05-19 02:36:48	2014-05-19 02:36:48
8	Florida	UY	2014-05-19 02:37:01	2014-05-19 02:37:01
9	Lavalleja	UY	2014-05-19 02:38:02	2014-05-19 02:38:02
10	Maldonado	UY	2014-05-19 02:39:22	2014-05-19 02:39:22
11	Paysandú	UY	2014-05-19 02:39:47	2014-05-19 02:39:47
12	Río Negro	UY	2014-05-19 02:40:02	2014-05-19 02:40:02
13	Rivera	UY	2014-05-19 02:40:20	2014-05-19 02:40:20
14	Rocha	UY	2014-05-19 02:40:40	2014-05-19 02:40:40
15	Salto	UY	2014-05-19 02:41:14	2014-05-19 02:41:14
16	San José	UY	2014-05-19 02:41:37	2014-05-19 02:41:37
17	Soriano	UY	2014-05-19 02:42:07	2014-05-19 02:42:07
18	Tacuarembó	UY	2014-05-19 02:42:37	2014-05-19 02:42:37
19	Treinta y Tres	UY	2014-05-19 02:44:40	2014-05-19 02:44:40
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('states_id_seq', 20, false);


--
-- Data for Name: sucta_registrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY sucta_registrations (id, expiration, extended, comments, vehicle_id, created_at, updated_at) FROM stdin;
15	2014-04-01 00:00:00	1	ok	1	2014-04-01 02:18:53	2014-04-01 02:40:39
16	2015-01-21 00:00:00	0	ok	2	2014-04-01 02:44:34	2015-01-19 03:04:02.949853
17	2015-01-22 00:00:00	0		3	2015-01-19 03:07:34.177935	2015-01-19 03:07:34.177935
\.


--
-- Name: sucta_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('sucta_registrations_id_seq', 17, true);


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY trips (id, from_location_id, to_location_id, distance, route_itinerary, comments, created_at, updated_at) FROM stdin;
1	1	2	170	\N	\N	2014-05-16 05:56:12	2014-05-16 05:56:12
2	2	1	170	\N	\N	2014-05-19 22:39:14	2014-05-19 22:39:14
3	1	4	200	\N	\N	2014-05-19 22:39:38	2014-05-19 22:39:38
4	4	1	200	\N	\N	2014-05-19 22:39:55	2014-05-19 22:39:55
5	1	3	150	\N	\N	2014-05-19 22:40:46	2014-06-18 02:03:25
6	3	1	150	\N	\N	2014-05-19 22:41:00	2014-06-18 02:09:23
7	1	6	215	\N	\N	2014-05-19 22:57:21	2014-05-19 22:57:21
8	6	1	215	\N	\N	2014-05-19 22:57:35	2014-05-19 22:57:35
9	1	7	180	\N	\N	2014-09-03 03:08:14	2014-09-03 03:08:14
\.


--
-- Name: trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('trips_id_seq', 10, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY users (id, name, email, created_at, updated_at, password_digest, remember_token) FROM stdin;
2	José	jose.ferreira87@gmail.com	2014-05-27 04:42:11	2014-05-27 04:42:11	$2a$10$wzB1vsY9aR8vUK2sq6ptt.HdaxBwRqUMfPqTo6VCSwmJ61J9/QAFW	\N
1	Tamara	tamaralucia.f.a@gmail.com	2014-05-27 04:40:43	2015-03-14 13:40:05.394608	$2a$10$yMjyTH6BcpQ0IiosWaq4Oer12LT2JMQWADt9KaqYKpKZtROGMREhm	ac556181a22e46862eaa79a2b88c84e07156c567
3	Federico	fedetob@gmail.com	2014-06-29 23:29:01	2015-04-05 07:17:20.852523	$2a$10$QnDnvxWi.p8KV1cEcdDPDu/TjajRhnxzDkVHp9rCX3N5PVzgf6Ujq	91f2e58a3d80d460bb72475ef7eede52bd7d6010
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('users_id_seq', 4, false);


--
-- Data for Name: vehicle_registrations; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicle_registrations (id, chassis, engine, registration_date, registration_number, dnt_id, vehicle_id, created_at, updated_at, date_of_entry) FROM stdin;
1	jk34fw	0322230945	2009-05-10 00:00:00	12256	233900	3	2014-04-01 05:23:26	2014-04-01 05:23:26	2009-05-05 00:00:00
2	jk34fw	0322230945	2009-05-10 00:00:00	12256	233900	3	2014-04-01 05:26:02	2014-04-01 05:26:02	2009-05-05 00:00:00
3	Chasis 1	13450	2014-05-01 00:00:00	5656	id124	2	2014-07-01 23:44:56	2014-07-01 23:44:56	2014-01-01 00:00:00
4	ASG 1234553	RTGHT 453000039	2010-01-19 00:00:00	234544332	23455033	1	2015-01-19 02:52:08.038962	2015-01-19 02:52:08.038962	2015-01-23 00:00:00
\.


--
-- Name: vehicle_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicle_registrations_id_seq', 4, true);


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicle_types (id, description, coupling_support, couples_to_type_id, created_at, updated_at) FROM stdin;
1	Camión	0	\N	2014-03-27 02:19:18	2014-03-27 02:19:18
7	Tractor	0	\N	2014-03-27 03:03:51	2014-03-27 03:12:18
8	Remolque - Zorra	1	1	2014-03-27 03:06:58	2014-03-27 03:06:58
9	Semi Remolque - Chata	1	7	2014-03-27 03:12:02	2014-03-27 03:14:35
10	Semi Remolque - Casamba	1	7	2014-03-27 03:13:58	2014-03-27 03:13:58
11	Semi Remolque - Tolva	1	7	2014-03-27 03:17:13	2014-03-27 03:17:13
12	Máquina	0	\N	2014-04-01 05:54:06	2014-04-01 05:54:06
\.


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicle_types_id_seq', 13, false);


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: uyport
--

COPY vehicles (id, brand, model, number_plate, comments, text, created_at, updated_at, company_id, vehicle_type_id) FROM stdin;
1	Mercedes Benz	M 230	STP 1234		\N	2014-03-13 03:13:49	2014-04-01 05:50:22	2	1
2	Volkswagen	Worker	MTP 5430	El Cabezón	\N	2014-03-13 03:14:26	2014-06-16 02:46:55	2	1
3	Scania	ST 1323	MTP 1483	Para Viajes UPM	\N	2014-04-01 03:05:21	2014-04-01 05:51:42	1	1
4	Tolvillex	T-1000	STP-2030		\N	2014-08-24 06:39:08	2014-08-24 06:39:08	1	11
\.


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uyport
--

SELECT pg_catalog.setval('vehicles_id_seq', 5, false);


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
-- Name: shipment_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: uyport; Tablespace: 
--

ALTER TABLE ONLY shipment_documents
    ADD CONSTRAINT shipment_documents_pkey PRIMARY KEY (id);


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
-- Name: index_customer_shipping_orders_on_company_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_customer_shipping_orders_on_company_id ON customer_shipping_orders USING btree (company_id);


--
-- Name: index_customer_shipping_orders_on_customer_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_customer_shipping_orders_on_customer_id ON customer_shipping_orders USING btree (customer_id);


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
-- Name: index_m_shipping_requests_on_customer_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_m_shipping_requests_on_customer_id ON m_shipping_requests USING btree (customer_id);


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
-- Name: index_shipment_documents_on_document_type_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_documents_on_document_type_id ON shipment_documents USING btree (document_type_id);


--
-- Name: index_shipment_documents_on_shipment_id; Type: INDEX; Schema: public; Owner: uyport; Tablespace: 
--

CREATE INDEX index_shipment_documents_on_shipment_id ON shipment_documents USING btree (shipment_id);


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
-- PostgreSQL database dump complete
--

