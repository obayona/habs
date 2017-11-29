--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: account_account; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_account (
    id integer NOT NULL,
    timezone character varying(100) NOT NULL,
    language character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_account OWNER TO geonode;

--
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_account_id_seq OWNER TO geonode;

--
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_account_id_seq OWNED BY account_account.id;


--
-- Name: account_accountdeletion; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_accountdeletion (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    date_requested timestamp with time zone NOT NULL,
    date_expunged timestamp with time zone,
    user_id integer
);


ALTER TABLE account_accountdeletion OWNER TO geonode;

--
-- Name: account_accountdeletion_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_accountdeletion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_accountdeletion_id_seq OWNER TO geonode;

--
-- Name: account_accountdeletion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_accountdeletion_id_seq OWNED BY account_accountdeletion.id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_emailaddress OWNER TO geonode;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailaddress_id_seq OWNER TO geonode;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE account_emailconfirmation OWNER TO geonode;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailconfirmation_id_seq OWNER TO geonode;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: account_passwordexpiry; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_passwordexpiry (
    id integer NOT NULL,
    expiry integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT account_passwordexpiry_expiry_check CHECK ((expiry >= 0))
);


ALTER TABLE account_passwordexpiry OWNER TO geonode;

--
-- Name: account_passwordexpiry_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_passwordexpiry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_passwordexpiry_id_seq OWNER TO geonode;

--
-- Name: account_passwordexpiry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_passwordexpiry_id_seq OWNED BY account_passwordexpiry.id;


--
-- Name: account_passwordhistory; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_passwordhistory (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_passwordhistory OWNER TO geonode;

--
-- Name: account_passwordhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_passwordhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_passwordhistory_id_seq OWNER TO geonode;

--
-- Name: account_passwordhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_passwordhistory_id_seq OWNED BY account_passwordhistory.id;


--
-- Name: account_signupcode; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_signupcode (
    id integer NOT NULL,
    code character varying(64) NOT NULL,
    max_uses integer NOT NULL,
    expiry timestamp with time zone,
    email character varying(254) NOT NULL,
    notes text NOT NULL,
    sent timestamp with time zone,
    created timestamp with time zone NOT NULL,
    use_count integer NOT NULL,
    inviter_id integer,
    username character varying(30),
    CONSTRAINT account_signupcode_max_uses_check CHECK ((max_uses >= 0)),
    CONSTRAINT account_signupcode_use_count_check CHECK ((use_count >= 0))
);


ALTER TABLE account_signupcode OWNER TO geonode;

--
-- Name: account_signupcode_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_signupcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_signupcode_id_seq OWNER TO geonode;

--
-- Name: account_signupcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_signupcode_id_seq OWNED BY account_signupcode.id;


--
-- Name: account_signupcoderesult; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE account_signupcoderesult (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    signup_code_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_signupcoderesult OWNER TO geonode;

--
-- Name: account_signupcoderesult_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE account_signupcoderesult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_signupcoderesult_id_seq OWNER TO geonode;

--
-- Name: account_signupcoderesult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE account_signupcoderesult_id_seq OWNED BY account_signupcoderesult.id;


--
-- Name: actstream_action; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE actstream_action (
    id integer NOT NULL,
    actor_object_id character varying(255) NOT NULL,
    verb character varying(255) NOT NULL,
    description text,
    target_object_id character varying(255),
    action_object_object_id character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    data jsonb,
    action_object_content_type_id integer,
    actor_content_type_id integer NOT NULL,
    target_content_type_id integer
);


ALTER TABLE actstream_action OWNER TO geonode;

--
-- Name: actstream_action_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE actstream_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actstream_action_id_seq OWNER TO geonode;

--
-- Name: actstream_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE actstream_action_id_seq OWNED BY actstream_action.id;


--
-- Name: actstream_follow; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE actstream_follow (
    id integer NOT NULL,
    object_id character varying(255) NOT NULL,
    actor_only boolean NOT NULL,
    started timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE actstream_follow OWNER TO geonode;

--
-- Name: actstream_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE actstream_follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actstream_follow_id_seq OWNER TO geonode;

--
-- Name: actstream_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE actstream_follow_id_seq OWNED BY actstream_follow.id;


--
-- Name: agon_ratings_overallrating; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE agon_ratings_overallrating (
    id integer NOT NULL,
    object_id integer NOT NULL,
    rating numeric(6,1),
    category integer,
    content_type_id integer NOT NULL
);


ALTER TABLE agon_ratings_overallrating OWNER TO geonode;

--
-- Name: agon_ratings_overallrating_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE agon_ratings_overallrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agon_ratings_overallrating_id_seq OWNER TO geonode;

--
-- Name: agon_ratings_overallrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE agon_ratings_overallrating_id_seq OWNED BY agon_ratings_overallrating.id;


--
-- Name: agon_ratings_rating; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE agon_ratings_rating (
    id integer NOT NULL,
    object_id integer NOT NULL,
    rating integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    category integer,
    content_type_id integer NOT NULL,
    overall_rating_id integer,
    user_id integer NOT NULL
);


ALTER TABLE agon_ratings_rating OWNER TO geonode;

--
-- Name: agon_ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE agon_ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agon_ratings_rating_id_seq OWNER TO geonode;

--
-- Name: agon_ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE agon_ratings_rating_id_seq OWNED BY agon_ratings_rating.id;


--
-- Name: announcements_announcement; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE announcements_announcement (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    level integer NOT NULL,
    content text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    site_wide boolean NOT NULL,
    members_only boolean NOT NULL,
    dismissal_type integer NOT NULL,
    publish_start timestamp with time zone NOT NULL,
    publish_end timestamp with time zone,
    creator_id integer NOT NULL
);


ALTER TABLE announcements_announcement OWNER TO geonode;

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE announcements_announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcements_announcement_id_seq OWNER TO geonode;

--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE announcements_announcement_id_seq OWNED BY announcements_announcement.id;


--
-- Name: announcements_dismissal; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE announcements_dismissal (
    id integer NOT NULL,
    dismissed_at timestamp with time zone NOT NULL,
    announcement_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE announcements_dismissal OWNER TO geonode;

--
-- Name: announcements_dismissal_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE announcements_dismissal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcements_dismissal_id_seq OWNER TO geonode;

--
-- Name: announcements_dismissal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE announcements_dismissal_id_seq OWNED BY announcements_dismissal.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO geonode;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO geonode;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO geonode;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO geonode;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO geonode;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO geonode;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: avatar_avatar; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE avatar_avatar (
    id integer NOT NULL,
    "primary" boolean NOT NULL,
    avatar character varying(1024) NOT NULL,
    date_uploaded timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE avatar_avatar OWNER TO geonode;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE avatar_avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE avatar_avatar_id_seq OWNER TO geonode;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE avatar_avatar_id_seq OWNED BY avatar_avatar.id;


--
-- Name: base_backup; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_backup (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    name_en character varying(100),
    date timestamp with time zone NOT NULL,
    description text,
    description_en text,
    base_folder character varying(100) NOT NULL,
    location text
);


ALTER TABLE base_backup OWNER TO geonode;

--
-- Name: base_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_backup_id_seq OWNER TO geonode;

--
-- Name: base_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_backup_id_seq OWNED BY base_backup.id;


--
-- Name: base_contactrole; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_contactrole (
    id integer NOT NULL,
    role character varying(255) NOT NULL,
    contact_id integer NOT NULL,
    resource_id integer
);


ALTER TABLE base_contactrole OWNER TO geonode;

--
-- Name: base_contactrole_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_contactrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_contactrole_id_seq OWNER TO geonode;

--
-- Name: base_contactrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_contactrole_id_seq OWNED BY base_contactrole.id;


--
-- Name: base_hierarchicalkeyword; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_hierarchicalkeyword (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    CONSTRAINT base_hierarchicalkeyword_depth_check CHECK ((depth >= 0)),
    CONSTRAINT base_hierarchicalkeyword_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE base_hierarchicalkeyword OWNER TO geonode;

--
-- Name: base_hierarchicalkeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_hierarchicalkeyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_hierarchicalkeyword_id_seq OWNER TO geonode;

--
-- Name: base_hierarchicalkeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_hierarchicalkeyword_id_seq OWNED BY base_hierarchicalkeyword.id;


--
-- Name: base_license; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_license (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    name_en character varying(100),
    abbreviation character varying(20),
    description text,
    description_en text,
    url character varying(2000),
    license_text text,
    license_text_en text
);


ALTER TABLE base_license OWNER TO geonode;

--
-- Name: base_license_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_license_id_seq OWNER TO geonode;

--
-- Name: base_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_license_id_seq OWNED BY base_license.id;


--
-- Name: base_link; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_link (
    id integer NOT NULL,
    extension character varying(255) NOT NULL,
    link_type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    mime character varying(255) NOT NULL,
    url text NOT NULL,
    resource_id integer
);


ALTER TABLE base_link OWNER TO geonode;

--
-- Name: base_link_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_link_id_seq OWNER TO geonode;

--
-- Name: base_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_link_id_seq OWNED BY base_link.id;


--
-- Name: base_region; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_region (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    CONSTRAINT base_region_level_check CHECK ((level >= 0)),
    CONSTRAINT base_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT base_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT base_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE base_region OWNER TO geonode;

--
-- Name: base_region_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_region_id_seq OWNER TO geonode;

--
-- Name: base_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_region_id_seq OWNED BY base_region.id;


--
-- Name: base_resourcebase; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_resourcebase (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    title character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    date_type character varying(255) NOT NULL,
    edition character varying(255),
    abstract text NOT NULL,
    purpose text,
    maintenance_frequency character varying(255),
    constraints_other text,
    language character varying(3) NOT NULL,
    temporal_extent_start timestamp with time zone,
    temporal_extent_end timestamp with time zone,
    supplemental_information text NOT NULL,
    data_quality_statement text,
    bbox_x0 numeric(19,10),
    bbox_x1 numeric(19,10),
    bbox_y0 numeric(19,10),
    bbox_y1 numeric(19,10),
    srid character varying(255) NOT NULL,
    csw_typename character varying(32) NOT NULL,
    csw_schema character varying(64) NOT NULL,
    csw_mdsource character varying(256) NOT NULL,
    csw_insert_date timestamp with time zone,
    csw_type character varying(32) NOT NULL,
    csw_anytext text,
    csw_wkt_geometry text NOT NULL,
    metadata_uploaded boolean NOT NULL,
    metadata_xml text,
    popular_count integer NOT NULL,
    share_count integer NOT NULL,
    featured boolean NOT NULL,
    is_published boolean NOT NULL,
    thumbnail_url text,
    detail_url character varying(255),
    rating integer,
    category_id integer,
    license_id integer,
    owner_id integer,
    polymorphic_ctype_id integer,
    restriction_code_type_id integer,
    spatial_representation_type_id integer,
    metadata_uploaded_preserve boolean NOT NULL
);


ALTER TABLE base_resourcebase OWNER TO geonode;

--
-- Name: base_resourcebase_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_resourcebase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_resourcebase_id_seq OWNER TO geonode;

--
-- Name: base_resourcebase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_resourcebase_id_seq OWNED BY base_resourcebase.id;


--
-- Name: base_resourcebase_regions; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_resourcebase_regions (
    id integer NOT NULL,
    resourcebase_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE base_resourcebase_regions OWNER TO geonode;

--
-- Name: base_resourcebase_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_resourcebase_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_resourcebase_regions_id_seq OWNER TO geonode;

--
-- Name: base_resourcebase_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_resourcebase_regions_id_seq OWNED BY base_resourcebase_regions.id;


--
-- Name: base_resourcebase_tkeywords; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_resourcebase_tkeywords (
    id integer NOT NULL,
    resourcebase_id integer NOT NULL,
    thesauruskeyword_id integer NOT NULL
);


ALTER TABLE base_resourcebase_tkeywords OWNER TO geonode;

--
-- Name: base_resourcebase_tkeywords_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_resourcebase_tkeywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_resourcebase_tkeywords_id_seq OWNER TO geonode;

--
-- Name: base_resourcebase_tkeywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_resourcebase_tkeywords_id_seq OWNED BY base_resourcebase_tkeywords.id;


--
-- Name: base_restrictioncodetype; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_restrictioncodetype (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    description text NOT NULL,
    description_en text,
    gn_description text NOT NULL,
    gn_description_en text,
    is_choice boolean NOT NULL
);


ALTER TABLE base_restrictioncodetype OWNER TO geonode;

--
-- Name: base_restrictioncodetype_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_restrictioncodetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_restrictioncodetype_id_seq OWNER TO geonode;

--
-- Name: base_restrictioncodetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_restrictioncodetype_id_seq OWNED BY base_restrictioncodetype.id;


--
-- Name: base_spatialrepresentationtype; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_spatialrepresentationtype (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    description_en character varying(255),
    gn_description character varying(255) NOT NULL,
    gn_description_en character varying(255),
    is_choice boolean NOT NULL
);


ALTER TABLE base_spatialrepresentationtype OWNER TO geonode;

--
-- Name: base_spatialrepresentationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_spatialrepresentationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_spatialrepresentationtype_id_seq OWNER TO geonode;

--
-- Name: base_spatialrepresentationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_spatialrepresentationtype_id_seq OWNED BY base_spatialrepresentationtype.id;


--
-- Name: base_taggedcontentitem; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_taggedcontentitem (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE base_taggedcontentitem OWNER TO geonode;

--
-- Name: base_taggedcontentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_taggedcontentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_taggedcontentitem_id_seq OWNER TO geonode;

--
-- Name: base_taggedcontentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_taggedcontentitem_id_seq OWNED BY base_taggedcontentitem.id;


--
-- Name: base_thesaurus; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_thesaurus (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    date character varying(20) NOT NULL,
    description text NOT NULL,
    slug character varying(64) NOT NULL
);


ALTER TABLE base_thesaurus OWNER TO geonode;

--
-- Name: base_thesaurus_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_thesaurus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_thesaurus_id_seq OWNER TO geonode;

--
-- Name: base_thesaurus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_thesaurus_id_seq OWNED BY base_thesaurus.id;


--
-- Name: base_thesauruskeyword; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_thesauruskeyword (
    id integer NOT NULL,
    about character varying(255),
    alt_label character varying(255),
    thesaurus_id integer NOT NULL
);


ALTER TABLE base_thesauruskeyword OWNER TO geonode;

--
-- Name: base_thesauruskeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_thesauruskeyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_thesauruskeyword_id_seq OWNER TO geonode;

--
-- Name: base_thesauruskeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_thesauruskeyword_id_seq OWNED BY base_thesauruskeyword.id;


--
-- Name: base_thesauruskeywordlabel; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_thesauruskeywordlabel (
    id integer NOT NULL,
    lang character varying(3) NOT NULL,
    label character varying(255) NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE base_thesauruskeywordlabel OWNER TO geonode;

--
-- Name: base_thesauruskeywordlabel_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_thesauruskeywordlabel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_thesauruskeywordlabel_id_seq OWNER TO geonode;

--
-- Name: base_thesauruskeywordlabel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_thesauruskeywordlabel_id_seq OWNED BY base_thesauruskeywordlabel.id;


--
-- Name: base_topiccategory; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE base_topiccategory (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    description text NOT NULL,
    description_en text,
    gn_description text,
    gn_description_en text,
    is_choice boolean NOT NULL,
    fa_class character varying(64) NOT NULL
);


ALTER TABLE base_topiccategory OWNER TO geonode;

--
-- Name: base_topiccategory_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE base_topiccategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_topiccategory_id_seq OWNER TO geonode;

--
-- Name: base_topiccategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE base_topiccategory_id_seq OWNED BY base_topiccategory.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE celery_taskmeta OWNER TO geonode;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_taskmeta_id_seq OWNER TO geonode;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE celery_taskmeta_id_seq OWNED BY celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE celery_tasksetmeta OWNER TO geonode;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_tasksetmeta_id_seq OWNER TO geonode;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE celery_tasksetmeta_id_seq OWNED BY celery_tasksetmeta.id;


--
-- Name: dialogos_comment; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE dialogos_comment (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    website character varying(255) NOT NULL,
    object_id integer NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    public boolean NOT NULL,
    author_id integer,
    content_type_id integer NOT NULL
);


ALTER TABLE dialogos_comment OWNER TO geonode;

--
-- Name: dialogos_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE dialogos_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dialogos_comment_id_seq OWNER TO geonode;

--
-- Name: dialogos_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE dialogos_comment_id_seq OWNED BY dialogos_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO geonode;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO geonode;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO geonode;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO geonode;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO geonode;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO geonode;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO geonode;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO geonode;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO geonode;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE djcelery_crontabschedule OWNER TO geonode;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_crontabschedule_id_seq OWNER TO geonode;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE djcelery_crontabschedule_id_seq OWNED BY djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE djcelery_intervalschedule OWNER TO geonode;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_intervalschedule_id_seq OWNER TO geonode;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE djcelery_intervalschedule_id_seq OWNED BY djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE djcelery_periodictask OWNER TO geonode;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_periodictask_id_seq OWNER TO geonode;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE djcelery_periodictask_id_seq OWNED BY djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE djcelery_periodictasks OWNER TO geonode;

--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    hidden boolean NOT NULL,
    worker_id integer
);


ALTER TABLE djcelery_taskstate OWNER TO geonode;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_taskstate_id_seq OWNER TO geonode;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE djcelery_taskstate_id_seq OWNED BY djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


ALTER TABLE djcelery_workerstate OWNER TO geonode;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_workerstate_id_seq OWNER TO geonode;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE djcelery_workerstate_id_seq OWNED BY djcelery_workerstate.id;


--
-- Name: documents_document; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE documents_document (
    resourcebase_ptr_id integer NOT NULL,
    title_en character varying(255),
    abstract_en text,
    purpose_en text,
    constraints_other_en text,
    supplemental_information_en text,
    data_quality_statement_en text,
    object_id integer,
    doc_file character varying(255),
    extension character varying(128),
    doc_type character varying(128),
    doc_url character varying(255),
    content_type_id integer,
    CONSTRAINT documents_document_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE documents_document OWNER TO geonode;

--
-- Name: groups_groupinvitation; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE groups_groupinvitation (
    id integer NOT NULL,
    token character varying(40) NOT NULL,
    email character varying(254) NOT NULL,
    role character varying(10) NOT NULL,
    state character varying(10) NOT NULL,
    created timestamp with time zone NOT NULL,
    from_user_id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer
);


ALTER TABLE groups_groupinvitation OWNER TO geonode;

--
-- Name: groups_groupinvitation_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE groups_groupinvitation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_groupinvitation_id_seq OWNER TO geonode;

--
-- Name: groups_groupinvitation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE groups_groupinvitation_id_seq OWNED BY groups_groupinvitation.id;


--
-- Name: groups_groupmember; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE groups_groupmember (
    id integer NOT NULL,
    role character varying(10) NOT NULL,
    joined timestamp with time zone NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE groups_groupmember OWNER TO geonode;

--
-- Name: groups_groupmember_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE groups_groupmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_groupmember_id_seq OWNER TO geonode;

--
-- Name: groups_groupmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE groups_groupmember_id_seq OWNED BY groups_groupmember.id;


--
-- Name: groups_groupprofile; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE groups_groupprofile (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    logo character varying(100) NOT NULL,
    description text NOT NULL,
    email character varying(254),
    access character varying(15) NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE groups_groupprofile OWNER TO geonode;

--
-- Name: groups_groupprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE groups_groupprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_groupprofile_id_seq OWNER TO geonode;

--
-- Name: groups_groupprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE groups_groupprofile_id_seq OWNED BY groups_groupprofile.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE guardian_groupobjectpermission OWNER TO geonode;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_groupobjectpermission_id_seq OWNER TO geonode;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE guardian_userobjectpermission OWNER TO geonode;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_userobjectpermission_id_seq OWNER TO geonode;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: layers_attribute; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_attribute (
    id integer NOT NULL,
    attribute character varying(255),
    description character varying(255),
    attribute_label character varying(255),
    attribute_type character varying(50) NOT NULL,
    visible boolean NOT NULL,
    display_order integer NOT NULL,
    count integer NOT NULL,
    min character varying(255),
    max character varying(255),
    average character varying(255),
    median character varying(255),
    stddev character varying(255),
    sum character varying(255),
    unique_values text,
    last_stats_updated timestamp with time zone NOT NULL,
    layer_id integer NOT NULL
);


ALTER TABLE layers_attribute OWNER TO geonode;

--
-- Name: layers_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE layers_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layers_attribute_id_seq OWNER TO geonode;

--
-- Name: layers_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE layers_attribute_id_seq OWNED BY layers_attribute.id;


--
-- Name: layers_layer; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_layer (
    resourcebase_ptr_id integer NOT NULL,
    title_en character varying(255),
    abstract_en text,
    purpose_en text,
    constraints_other_en text,
    supplemental_information_en text,
    data_quality_statement_en text,
    workspace character varying(128) NOT NULL,
    store character varying(128) NOT NULL,
    "storeType" character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    typename character varying(128),
    charset character varying(255) NOT NULL,
    default_style_id integer,
    upload_session_id integer,
    elevation_regex character varying(128),
    has_elevation boolean NOT NULL,
    has_time boolean NOT NULL,
    is_mosaic boolean NOT NULL,
    time_regex character varying(128)
);


ALTER TABLE layers_layer OWNER TO geonode;

--
-- Name: layers_layer_styles; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_layer_styles (
    id integer NOT NULL,
    layer_id integer NOT NULL,
    style_id integer NOT NULL
);


ALTER TABLE layers_layer_styles OWNER TO geonode;

--
-- Name: layers_layer_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE layers_layer_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layers_layer_styles_id_seq OWNER TO geonode;

--
-- Name: layers_layer_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE layers_layer_styles_id_seq OWNED BY layers_layer_styles.id;


--
-- Name: layers_layerfile; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_layerfile (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    base boolean NOT NULL,
    file character varying(255) NOT NULL,
    upload_session_id integer NOT NULL
);


ALTER TABLE layers_layerfile OWNER TO geonode;

--
-- Name: layers_layerfile_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE layers_layerfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layers_layerfile_id_seq OWNER TO geonode;

--
-- Name: layers_layerfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE layers_layerfile_id_seq OWNED BY layers_layerfile.id;


--
-- Name: layers_style; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_style (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sld_title character varying(255),
    sld_body text,
    sld_version character varying(12),
    sld_url character varying(1000),
    workspace character varying(255)
);


ALTER TABLE layers_style OWNER TO geonode;

--
-- Name: layers_style_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE layers_style_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layers_style_id_seq OWNER TO geonode;

--
-- Name: layers_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE layers_style_id_seq OWNED BY layers_style.id;


--
-- Name: layers_uploadsession; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE layers_uploadsession (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    processed boolean NOT NULL,
    error text,
    traceback text,
    context text,
    user_id integer NOT NULL
);


ALTER TABLE layers_uploadsession OWNER TO geonode;

--
-- Name: layers_uploadsession_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE layers_uploadsession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layers_uploadsession_id_seq OWNER TO geonode;

--
-- Name: layers_uploadsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE layers_uploadsession_id_seq OWNED BY layers_uploadsession.id;


--
-- Name: maps_map; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE maps_map (
    resourcebase_ptr_id integer NOT NULL,
    title_en character varying(255),
    abstract_en text,
    purpose_en text,
    constraints_other_en text,
    supplemental_information_en text,
    data_quality_statement_en text,
    zoom integer NOT NULL,
    projection character varying(32) NOT NULL,
    center_x double precision NOT NULL,
    center_y double precision NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    urlsuffix character varying(255) NOT NULL,
    featuredurl character varying(255) NOT NULL
);


ALTER TABLE maps_map OWNER TO geonode;

--
-- Name: maps_maplayer; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE maps_maplayer (
    id integer NOT NULL,
    stack_order integer NOT NULL,
    format character varying(200),
    name character varying(200),
    opacity double precision NOT NULL,
    styles character varying(200),
    transparent boolean NOT NULL,
    fixed boolean NOT NULL,
    "group" character varying(200),
    visibility boolean NOT NULL,
    ows_url character varying(200),
    layer_params text NOT NULL,
    source_params text NOT NULL,
    local boolean NOT NULL,
    map_id integer NOT NULL
);


ALTER TABLE maps_maplayer OWNER TO geonode;

--
-- Name: maps_maplayer_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE maps_maplayer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE maps_maplayer_id_seq OWNER TO geonode;

--
-- Name: maps_maplayer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE maps_maplayer_id_seq OWNED BY maps_maplayer.id;


--
-- Name: maps_mapsnapshot; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE maps_mapsnapshot (
    id integer NOT NULL,
    config text NOT NULL,
    created_dttm timestamp with time zone NOT NULL,
    map_id integer NOT NULL,
    user_id integer
);


ALTER TABLE maps_mapsnapshot OWNER TO geonode;

--
-- Name: maps_mapsnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE maps_mapsnapshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE maps_mapsnapshot_id_seq OWNER TO geonode;

--
-- Name: maps_mapsnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE maps_mapsnapshot_id_seq OWNED BY maps_mapsnapshot.id;


--
-- Name: meteorology_entry; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE meteorology_entry (
    id integer NOT NULL,
    value double precision NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    "timeSeries_id" integer NOT NULL
);


ALTER TABLE meteorology_entry OWNER TO geonode;

--
-- Name: meteorology_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE meteorology_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meteorology_entry_id_seq OWNER TO geonode;

--
-- Name: meteorology_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE meteorology_entry_id_seq OWNED BY meteorology_entry.id;


--
-- Name: meteorology_station; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE meteorology_station (
    id integer NOT NULL,
    code character varying(6) NOT NULL,
    name character varying(30) NOT NULL,
    province character varying(50) NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    elevation double precision NOT NULL
);


ALTER TABLE meteorology_station OWNER TO geonode;

--
-- Name: meteorology_station_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE meteorology_station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meteorology_station_id_seq OWNER TO geonode;

--
-- Name: meteorology_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE meteorology_station_id_seq OWNED BY meteorology_station.id;


--
-- Name: meteorology_timeserie; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE meteorology_timeserie (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    variable_id integer NOT NULL
);


ALTER TABLE meteorology_timeserie OWNER TO geonode;

--
-- Name: meteorology_timeserie_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE meteorology_timeserie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meteorology_timeserie_id_seq OWNER TO geonode;

--
-- Name: meteorology_timeserie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE meteorology_timeserie_id_seq OWNED BY meteorology_timeserie.id;


--
-- Name: meteorology_unit; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE meteorology_unit (
    id integer NOT NULL,
    representation character varying(10) NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE meteorology_unit OWNER TO geonode;

--
-- Name: meteorology_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE meteorology_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meteorology_unit_id_seq OWNER TO geonode;

--
-- Name: meteorology_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE meteorology_unit_id_seq OWNED BY meteorology_unit.id;


--
-- Name: meteorology_variable; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE meteorology_variable (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(50) NOT NULL,
    station_id integer NOT NULL,
    unit_id integer NOT NULL
);


ALTER TABLE meteorology_variable OWNER TO geonode;

--
-- Name: meteorology_variable_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE meteorology_variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meteorology_variable_id_seq OWNER TO geonode;

--
-- Name: meteorology_variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE meteorology_variable_id_seq OWNED BY meteorology_variable.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE oauth2_provider_accesstoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer
);


ALTER TABLE oauth2_provider_accesstoken OWNER TO geonode;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_accesstoken_id_seq OWNER TO geonode;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE oauth2_provider_accesstoken_id_seq OWNED BY oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL
);


ALTER TABLE oauth2_provider_application OWNER TO geonode;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_application_id_seq OWNER TO geonode;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE oauth2_provider_application_id_seq OWNED BY oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE oauth2_provider_grant (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE oauth2_provider_grant OWNER TO geonode;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_grant_id_seq OWNER TO geonode;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE oauth2_provider_grant_id_seq OWNED BY oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE oauth2_provider_refreshtoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE oauth2_provider_refreshtoken OWNER TO geonode;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_refreshtoken_id_seq OWNER TO geonode;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE oauth2_provider_refreshtoken_id_seq OWNED BY oauth2_provider_refreshtoken.id;


--
-- Name: people_profile; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE people_profile (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    organization character varying(255),
    profile text,
    "position" character varying(255),
    voice character varying(255),
    fax character varying(255),
    delivery character varying(255),
    city character varying(255),
    area character varying(255),
    zipcode character varying(255),
    country character varying(3)
);


ALTER TABLE people_profile OWNER TO geonode;

--
-- Name: people_profile_groups; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE people_profile_groups (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE people_profile_groups OWNER TO geonode;

--
-- Name: people_profile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE people_profile_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_profile_groups_id_seq OWNER TO geonode;

--
-- Name: people_profile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE people_profile_groups_id_seq OWNED BY people_profile_groups.id;


--
-- Name: people_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE people_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_profile_id_seq OWNER TO geonode;

--
-- Name: people_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE people_profile_id_seq OWNED BY people_profile.id;


--
-- Name: people_profile_user_permissions; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE people_profile_user_permissions (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE people_profile_user_permissions OWNER TO geonode;

--
-- Name: people_profile_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE people_profile_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_profile_user_permissions_id_seq OWNER TO geonode;

--
-- Name: people_profile_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE people_profile_user_permissions_id_seq OWNED BY people_profile_user_permissions.id;


--
-- Name: services_service; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE services_service (
    resourcebase_ptr_id integer NOT NULL,
    type character varying(4) NOT NULL,
    method character varying(1) NOT NULL,
    base_url character varying(200) NOT NULL,
    version character varying(10),
    name character varying(255) NOT NULL,
    description character varying(255),
    online_resource character varying(200),
    fees character varying(1000),
    access_constraints character varying(255),
    connection_params text,
    username character varying(50),
    password character varying(50),
    api_key character varying(255),
    workspace_ref character varying(200),
    store_ref character varying(200),
    resources_ref character varying(200),
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    first_noanswer timestamp with time zone,
    noanswer_retries integer,
    external_id integer,
    parent_id integer,
    CONSTRAINT services_service_noanswer_retries_check CHECK ((noanswer_retries >= 0))
);


ALTER TABLE services_service OWNER TO geonode;

--
-- Name: services_servicelayer; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE services_servicelayer (
    id integer NOT NULL,
    typename character varying(255) NOT NULL,
    title character varying(512) NOT NULL,
    description text,
    styles text,
    layer_id integer,
    service_id integer NOT NULL
);


ALTER TABLE services_servicelayer OWNER TO geonode;

--
-- Name: services_servicelayer_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE services_servicelayer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_servicelayer_id_seq OWNER TO geonode;

--
-- Name: services_servicelayer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE services_servicelayer_id_seq OWNED BY services_servicelayer.id;


--
-- Name: services_serviceprofilerole; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE services_serviceprofilerole (
    id integer NOT NULL,
    role character varying(255) NOT NULL,
    profiles_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE services_serviceprofilerole OWNER TO geonode;

--
-- Name: services_serviceprofilerole_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE services_serviceprofilerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_serviceprofilerole_id_seq OWNER TO geonode;

--
-- Name: services_serviceprofilerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE services_serviceprofilerole_id_seq OWNED BY services_serviceprofilerole.id;


--
-- Name: services_webserviceharvestlayersjob; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE services_webserviceharvestlayersjob (
    id integer NOT NULL,
    status character varying(10) NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE services_webserviceharvestlayersjob OWNER TO geonode;

--
-- Name: services_webserviceharvestlayersjob_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE services_webserviceharvestlayersjob_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_webserviceharvestlayersjob_id_seq OWNER TO geonode;

--
-- Name: services_webserviceharvestlayersjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE services_webserviceharvestlayersjob_id_seq OWNED BY services_webserviceharvestlayersjob.id;


--
-- Name: services_webserviceregistrationjob; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE services_webserviceregistrationjob (
    id integer NOT NULL,
    base_url character varying(200) NOT NULL,
    type character varying(4) NOT NULL,
    status character varying(10) NOT NULL
);


ALTER TABLE services_webserviceregistrationjob OWNER TO geonode;

--
-- Name: services_webserviceregistrationjob_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE services_webserviceregistrationjob_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_webserviceregistrationjob_id_seq OWNER TO geonode;

--
-- Name: services_webserviceregistrationjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE services_webserviceregistrationjob_id_seq OWNED BY services_webserviceregistrationjob.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE taggit_tag OWNER TO geonode;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_tag_id_seq OWNER TO geonode;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE taggit_taggeditem OWNER TO geonode;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_taggeditem_id_seq OWNER TO geonode;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: tastypie_apiaccess; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE tastypie_apiaccess (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    request_method character varying(10) NOT NULL,
    accessed integer NOT NULL,
    CONSTRAINT tastypie_apiaccess_accessed_check CHECK ((accessed >= 0))
);


ALTER TABLE tastypie_apiaccess OWNER TO geonode;

--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE tastypie_apiaccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apiaccess_id_seq OWNER TO geonode;

--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE tastypie_apiaccess_id_seq OWNED BY tastypie_apiaccess.id;


--
-- Name: tastypie_apikey; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE tastypie_apikey (
    id integer NOT NULL,
    key character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE tastypie_apikey OWNER TO geonode;

--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE tastypie_apikey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apikey_id_seq OWNER TO geonode;

--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE tastypie_apikey_id_seq OWNED BY tastypie_apikey.id;


--
-- Name: upload_upload; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE upload_upload (
    id integer NOT NULL,
    import_id bigint,
    state character varying(16) NOT NULL,
    date timestamp with time zone NOT NULL,
    upload_dir character varying(100),
    name character varying(64),
    complete boolean NOT NULL,
    session text,
    metadata text,
    mosaic_time_regex character varying(128),
    mosaic_time_value character varying(128),
    mosaic_elev_regex character varying(128),
    mosaic_elev_value character varying(128),
    layer_id integer,
    user_id integer
);


ALTER TABLE upload_upload OWNER TO geonode;

--
-- Name: upload_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE upload_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload_upload_id_seq OWNER TO geonode;

--
-- Name: upload_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE upload_upload_id_seq OWNED BY upload_upload.id;


--
-- Name: upload_uploadfile; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE upload_uploadfile (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    upload_id integer
);


ALTER TABLE upload_uploadfile OWNER TO geonode;

--
-- Name: upload_uploadfile_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE upload_uploadfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload_uploadfile_id_seq OWNER TO geonode;

--
-- Name: upload_uploadfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE upload_uploadfile_id_seq OWNED BY upload_uploadfile.id;


--
-- Name: user_messages_message; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE user_messages_message (
    id integer NOT NULL,
    sent_at timestamp with time zone NOT NULL,
    content text NOT NULL,
    sender_id integer NOT NULL,
    thread_id integer NOT NULL
);


ALTER TABLE user_messages_message OWNER TO geonode;

--
-- Name: user_messages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE user_messages_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_messages_message_id_seq OWNER TO geonode;

--
-- Name: user_messages_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE user_messages_message_id_seq OWNED BY user_messages_message.id;


--
-- Name: user_messages_thread; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE user_messages_thread (
    id integer NOT NULL,
    subject character varying(150) NOT NULL
);


ALTER TABLE user_messages_thread OWNER TO geonode;

--
-- Name: user_messages_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE user_messages_thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_messages_thread_id_seq OWNER TO geonode;

--
-- Name: user_messages_thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE user_messages_thread_id_seq OWNED BY user_messages_thread.id;


--
-- Name: user_messages_userthread; Type: TABLE; Schema: public; Owner: geonode
--

CREATE TABLE user_messages_userthread (
    id integer NOT NULL,
    unread boolean NOT NULL,
    deleted boolean NOT NULL,
    thread_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE user_messages_userthread OWNER TO geonode;

--
-- Name: user_messages_userthread_id_seq; Type: SEQUENCE; Schema: public; Owner: geonode
--

CREATE SEQUENCE user_messages_userthread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_messages_userthread_id_seq OWNER TO geonode;

--
-- Name: user_messages_userthread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: geonode
--

ALTER SEQUENCE user_messages_userthread_id_seq OWNED BY user_messages_userthread.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_account ALTER COLUMN id SET DEFAULT nextval('account_account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_accountdeletion ALTER COLUMN id SET DEFAULT nextval('account_accountdeletion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordexpiry ALTER COLUMN id SET DEFAULT nextval('account_passwordexpiry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordhistory ALTER COLUMN id SET DEFAULT nextval('account_passwordhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcode ALTER COLUMN id SET DEFAULT nextval('account_signupcode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcoderesult ALTER COLUMN id SET DEFAULT nextval('account_signupcoderesult_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_action ALTER COLUMN id SET DEFAULT nextval('actstream_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_follow ALTER COLUMN id SET DEFAULT nextval('actstream_follow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_overallrating ALTER COLUMN id SET DEFAULT nextval('agon_ratings_overallrating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating ALTER COLUMN id SET DEFAULT nextval('agon_ratings_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_announcement ALTER COLUMN id SET DEFAULT nextval('announcements_announcement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_dismissal ALTER COLUMN id SET DEFAULT nextval('announcements_dismissal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY avatar_avatar ALTER COLUMN id SET DEFAULT nextval('avatar_avatar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_backup ALTER COLUMN id SET DEFAULT nextval('base_backup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_contactrole ALTER COLUMN id SET DEFAULT nextval('base_contactrole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_hierarchicalkeyword ALTER COLUMN id SET DEFAULT nextval('base_hierarchicalkeyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_license ALTER COLUMN id SET DEFAULT nextval('base_license_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_link ALTER COLUMN id SET DEFAULT nextval('base_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_region ALTER COLUMN id SET DEFAULT nextval('base_region_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase ALTER COLUMN id SET DEFAULT nextval('base_resourcebase_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_regions ALTER COLUMN id SET DEFAULT nextval('base_resourcebase_regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_tkeywords ALTER COLUMN id SET DEFAULT nextval('base_resourcebase_tkeywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_restrictioncodetype ALTER COLUMN id SET DEFAULT nextval('base_restrictioncodetype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_spatialrepresentationtype ALTER COLUMN id SET DEFAULT nextval('base_spatialrepresentationtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_taggedcontentitem ALTER COLUMN id SET DEFAULT nextval('base_taggedcontentitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesaurus ALTER COLUMN id SET DEFAULT nextval('base_thesaurus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeyword ALTER COLUMN id SET DEFAULT nextval('base_thesauruskeyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeywordlabel ALTER COLUMN id SET DEFAULT nextval('base_thesauruskeywordlabel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_topiccategory ALTER COLUMN id SET DEFAULT nextval('base_topiccategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('celery_taskmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('celery_tasksetmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY dialogos_comment ALTER COLUMN id SET DEFAULT nextval('dialogos_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('djcelery_periodictask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('djcelery_taskstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('djcelery_workerstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation ALTER COLUMN id SET DEFAULT nextval('groups_groupinvitation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupmember ALTER COLUMN id SET DEFAULT nextval('groups_groupmember_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupprofile ALTER COLUMN id SET DEFAULT nextval('groups_groupprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_attribute ALTER COLUMN id SET DEFAULT nextval('layers_attribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer_styles ALTER COLUMN id SET DEFAULT nextval('layers_layer_styles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layerfile ALTER COLUMN id SET DEFAULT nextval('layers_layerfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_style ALTER COLUMN id SET DEFAULT nextval('layers_style_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_uploadsession ALTER COLUMN id SET DEFAULT nextval('layers_uploadsession_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_maplayer ALTER COLUMN id SET DEFAULT nextval('maps_maplayer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_mapsnapshot ALTER COLUMN id SET DEFAULT nextval('maps_mapsnapshot_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_entry ALTER COLUMN id SET DEFAULT nextval('meteorology_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_station ALTER COLUMN id SET DEFAULT nextval('meteorology_station_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_timeserie ALTER COLUMN id SET DEFAULT nextval('meteorology_timeserie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_unit ALTER COLUMN id SET DEFAULT nextval('meteorology_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_variable ALTER COLUMN id SET DEFAULT nextval('meteorology_variable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_application_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_grant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile ALTER COLUMN id SET DEFAULT nextval('people_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_groups ALTER COLUMN id SET DEFAULT nextval('people_profile_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_user_permissions ALTER COLUMN id SET DEFAULT nextval('people_profile_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_servicelayer ALTER COLUMN id SET DEFAULT nextval('services_servicelayer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_serviceprofilerole ALTER COLUMN id SET DEFAULT nextval('services_serviceprofilerole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceharvestlayersjob ALTER COLUMN id SET DEFAULT nextval('services_webserviceharvestlayersjob_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceregistrationjob ALTER COLUMN id SET DEFAULT nextval('services_webserviceregistrationjob_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apiaccess ALTER COLUMN id SET DEFAULT nextval('tastypie_apiaccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apikey ALTER COLUMN id SET DEFAULT nextval('tastypie_apikey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_upload ALTER COLUMN id SET DEFAULT nextval('upload_upload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_uploadfile ALTER COLUMN id SET DEFAULT nextval('upload_uploadfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_message ALTER COLUMN id SET DEFAULT nextval('user_messages_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_thread ALTER COLUMN id SET DEFAULT nextval('user_messages_thread_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_userthread ALTER COLUMN id SET DEFAULT nextval('user_messages_userthread_id_seq'::regclass);


--
-- Data for Name: account_account; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_account (id, timezone, language, user_id) FROM stdin;
1		en	-1
4		en	3
\.


--
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_account_id_seq', 4, true);


--
-- Data for Name: account_accountdeletion; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_accountdeletion (id, email, date_requested, date_expunged, user_id) FROM stdin;
\.


--
-- Name: account_accountdeletion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_accountdeletion_id_seq', 1, false);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
4	obayona@espol.edu.ec	f	t	3
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 4, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: account_passwordexpiry; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_passwordexpiry (id, expiry, user_id) FROM stdin;
\.


--
-- Name: account_passwordexpiry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_passwordexpiry_id_seq', 1, false);


--
-- Data for Name: account_passwordhistory; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_passwordhistory (id, password, "timestamp", user_id) FROM stdin;
\.


--
-- Name: account_passwordhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_passwordhistory_id_seq', 1, false);


--
-- Data for Name: account_signupcode; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_signupcode (id, code, max_uses, expiry, email, notes, sent, created, use_count, inviter_id, username) FROM stdin;
\.


--
-- Name: account_signupcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_signupcode_id_seq', 1, false);


--
-- Data for Name: account_signupcoderesult; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY account_signupcoderesult (id, "timestamp", signup_code_id, user_id) FROM stdin;
\.


--
-- Name: account_signupcoderesult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('account_signupcoderesult_id_seq', 1, false);


--
-- Data for Name: actstream_action; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY actstream_action (id, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, data, action_object_content_type_id, actor_content_type_id, target_content_type_id) FROM stdin;
2	3	deleted	\N	\N	\N	2017-11-28 11:38:56.279248-05	t	{"raw_action": "deleted", "object_name": "eurasia_lsib8_"}	\N	44	\N
\.


--
-- Name: actstream_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('actstream_action_id_seq', 2, true);


--
-- Data for Name: actstream_follow; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY actstream_follow (id, object_id, actor_only, started, content_type_id, user_id) FROM stdin;
\.


--
-- Name: actstream_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('actstream_follow_id_seq', 1, false);


--
-- Data for Name: agon_ratings_overallrating; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY agon_ratings_overallrating (id, object_id, rating, category, content_type_id) FROM stdin;
\.


--
-- Name: agon_ratings_overallrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('agon_ratings_overallrating_id_seq', 1, false);


--
-- Data for Name: agon_ratings_rating; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY agon_ratings_rating (id, object_id, rating, "timestamp", category, content_type_id, overall_rating_id, user_id) FROM stdin;
\.


--
-- Name: agon_ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('agon_ratings_rating_id_seq', 1, false);


--
-- Data for Name: announcements_announcement; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY announcements_announcement (id, title, level, content, creation_date, site_wide, members_only, dismissal_type, publish_start, publish_end, creator_id) FROM stdin;
\.


--
-- Name: announcements_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('announcements_announcement_id_seq', 1, false);


--
-- Data for Name: announcements_dismissal; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY announcements_dismissal (id, dismissed_at, announcement_id, user_id) FROM stdin;
\.


--
-- Name: announcements_dismissal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('announcements_dismissal_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY auth_group (id, name) FROM stdin;
1	anonymous
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add Tag	7	add_tag
20	Can change Tag	7	change_tag
21	Can delete Tag	7	delete_tag
22	Can add Tagged Item	8	add_taggeditem
23	Can change Tagged Item	8	change_taggeditem
24	Can delete Tagged Item	8	delete_taggeditem
25	Can add task state	9	add_taskmeta
26	Can change task state	9	change_taskmeta
27	Can delete task state	9	delete_taskmeta
28	Can add saved group result	10	add_tasksetmeta
29	Can change saved group result	10	change_tasksetmeta
30	Can delete saved group result	10	delete_tasksetmeta
31	Can add interval	11	add_intervalschedule
32	Can change interval	11	change_intervalschedule
33	Can delete interval	11	delete_intervalschedule
34	Can add crontab	12	add_crontabschedule
35	Can change crontab	12	change_crontabschedule
36	Can delete crontab	12	delete_crontabschedule
37	Can add periodic tasks	13	add_periodictasks
38	Can change periodic tasks	13	change_periodictasks
39	Can delete periodic tasks	13	delete_periodictasks
40	Can add periodic task	14	add_periodictask
41	Can change periodic task	14	change_periodictask
42	Can delete periodic task	14	delete_periodictask
43	Can add worker	15	add_workerstate
44	Can change worker	15	change_workerstate
45	Can delete worker	15	delete_workerstate
46	Can add task	16	add_taskstate
47	Can change task	16	change_taskstate
48	Can delete task	16	delete_taskstate
49	Can add account	17	add_account
50	Can change account	17	change_account
51	Can delete account	17	delete_account
52	Can add signup code	18	add_signupcode
53	Can change signup code	18	change_signupcode
54	Can delete signup code	18	delete_signupcode
55	Can add signup code result	19	add_signupcoderesult
56	Can change signup code result	19	change_signupcoderesult
57	Can delete signup code result	19	delete_signupcoderesult
58	Can add email address	20	add_emailaddress
59	Can change email address	20	change_emailaddress
60	Can delete email address	20	delete_emailaddress
61	Can add email confirmation	21	add_emailconfirmation
62	Can change email confirmation	21	change_emailconfirmation
63	Can delete email confirmation	21	delete_emailconfirmation
64	Can add account deletion	22	add_accountdeletion
65	Can change account deletion	22	change_accountdeletion
66	Can delete account deletion	22	delete_accountdeletion
67	Can add password history	23	add_passwordhistory
68	Can change password history	23	change_passwordhistory
69	Can delete password history	23	delete_passwordhistory
70	Can add password expiry	24	add_passwordexpiry
71	Can change password expiry	24	change_passwordexpiry
72	Can delete password expiry	24	delete_passwordexpiry
73	Can add avatar	25	add_avatar
74	Can change avatar	25	change_avatar
75	Can delete avatar	25	delete_avatar
76	Can add comment	26	add_comment
77	Can change comment	26	change_comment
78	Can delete comment	26	delete_comment
79	Can add overall rating	27	add_overallrating
80	Can change overall rating	27	change_overallrating
81	Can delete overall rating	27	delete_overallrating
82	Can add rating	28	add_rating
83	Can change rating	28	change_rating
84	Can delete rating	28	delete_rating
85	Can add announcement	29	add_announcement
86	Can change announcement	29	change_announcement
87	Can delete announcement	29	delete_announcement
88	Can add dismissal	30	add_dismissal
89	Can change dismissal	30	change_dismissal
90	Can delete dismissal	30	delete_dismissal
91	Can add follow	31	add_follow
92	Can change follow	31	change_follow
93	Can delete follow	31	delete_follow
94	Can add action	32	add_action
95	Can change action	32	change_action
96	Can delete action	32	delete_action
97	Can add thread	33	add_thread
98	Can change thread	33	change_thread
99	Can delete thread	33	delete_thread
100	Can add user thread	34	add_userthread
101	Can change user thread	34	change_userthread
102	Can delete user thread	34	delete_userthread
103	Can add message	35	add_message
104	Can change message	35	change_message
105	Can delete message	35	delete_message
106	Can add api access	36	add_apiaccess
107	Can change api access	36	change_apiaccess
108	Can delete api access	36	delete_apiaccess
109	Can add api key	37	add_apikey
110	Can change api key	37	change_apikey
111	Can delete api key	37	delete_apikey
112	Can add user object permission	38	add_userobjectpermission
113	Can change user object permission	38	change_userobjectpermission
114	Can delete user object permission	38	delete_userobjectpermission
115	Can add group object permission	39	add_groupobjectpermission
116	Can change group object permission	39	change_groupobjectpermission
117	Can delete group object permission	39	delete_groupobjectpermission
118	Can add application	40	add_application
119	Can change application	40	change_application
120	Can delete application	40	delete_application
121	Can add grant	41	add_grant
122	Can change grant	41	change_grant
123	Can delete grant	41	delete_grant
124	Can add access token	42	add_accesstoken
125	Can change access token	42	change_accesstoken
126	Can delete access token	42	delete_accesstoken
127	Can add refresh token	43	add_refreshtoken
128	Can change refresh token	43	change_refreshtoken
129	Can delete refresh token	43	delete_refreshtoken
130	Can add user	44	add_profile
131	Can change user	44	change_profile
132	Can delete user	44	delete_profile
133	Can add contact role	45	add_contactrole
134	Can change contact role	45	change_contactrole
135	Can delete contact role	45	delete_contactrole
136	Can add topic category	46	add_topiccategory
137	Can change topic category	46	change_topiccategory
138	Can delete topic category	46	delete_topiccategory
139	Can add spatial representation type	47	add_spatialrepresentationtype
140	Can change spatial representation type	47	change_spatialrepresentationtype
141	Can delete spatial representation type	47	delete_spatialrepresentationtype
142	Can add region	48	add_region
143	Can change region	48	change_region
144	Can delete region	48	delete_region
145	Can add restriction code type	49	add_restrictioncodetype
146	Can change restriction code type	49	change_restrictioncodetype
147	Can delete restriction code type	49	delete_restrictioncodetype
148	Can add backup	50	add_backup
149	Can change backup	50	change_backup
150	Can delete backup	50	delete_backup
151	Can add license	51	add_license
152	Can change license	51	change_license
153	Can delete license	51	delete_license
154	Can add hierarchical keyword	52	add_hierarchicalkeyword
155	Can change hierarchical keyword	52	change_hierarchicalkeyword
156	Can delete hierarchical keyword	52	delete_hierarchicalkeyword
157	Can add tagged content item	53	add_taggedcontentitem
158	Can change tagged content item	53	change_taggedcontentitem
159	Can delete tagged content item	53	delete_taggedcontentitem
160	Can add thesaurus	54	add_thesaurus
161	Can change thesaurus	54	change_thesaurus
162	Can delete thesaurus	54	delete_thesaurus
163	Can add thesaurus keyword	55	add_thesauruskeyword
164	Can change thesaurus keyword	55	change_thesauruskeyword
165	Can delete thesaurus keyword	55	delete_thesauruskeyword
166	Can add thesaurus keyword label	56	add_thesauruskeywordlabel
167	Can change thesaurus keyword label	56	change_thesauruskeywordlabel
168	Can delete thesaurus keyword label	56	delete_thesauruskeywordlabel
169	Can add resource base	57	add_resourcebase
170	Can change resource base	57	change_resourcebase
171	Can delete resource base	57	delete_resourcebase
172	Can view resource	57	view_resourcebase
173	Can change resource permissions	57	change_resourcebase_permissions
174	Can download resource	57	download_resourcebase
175	Can publish resource	57	publish_resourcebase
176	Can change resource metadata	57	change_resourcebase_metadata
177	Can add link	58	add_link
178	Can change link	58	change_link
179	Can delete link	58	delete_link
180	Can add style	59	add_style
181	Can change style	59	change_style
182	Can delete style	59	delete_style
183	Can add layer	60	add_layer
184	Can change layer	60	change_layer
185	Can delete layer	60	delete_layer
186	Can edit layer data	60	change_layer_data
187	Can change layer style	60	change_layer_style
188	Can add upload session	61	add_uploadsession
189	Can change upload session	61	change_uploadsession
190	Can delete upload session	61	delete_uploadsession
191	Can add layer file	62	add_layerfile
192	Can change layer file	62	change_layerfile
193	Can delete layer file	62	delete_layerfile
194	Can add attribute	63	add_attribute
195	Can change attribute	63	change_attribute
196	Can delete attribute	63	delete_attribute
197	Can add map	64	add_map
198	Can change map	64	change_map
199	Can delete map	64	delete_map
200	Can add map layer	65	add_maplayer
201	Can change map layer	65	change_maplayer
202	Can delete map layer	65	delete_maplayer
203	Can add map snapshot	66	add_mapsnapshot
204	Can change map snapshot	66	change_mapsnapshot
205	Can delete map snapshot	66	delete_mapsnapshot
206	Can add document	67	add_document
207	Can change document	67	change_document
208	Can delete document	67	delete_document
209	Can add group profile	68	add_groupprofile
210	Can change group profile	68	change_groupprofile
211	Can delete group profile	68	delete_groupprofile
212	Can add group member	69	add_groupmember
213	Can change group member	69	change_groupmember
214	Can delete group member	69	delete_groupmember
215	Can add group invitation	70	add_groupinvitation
216	Can change group invitation	70	change_groupinvitation
217	Can delete group invitation	70	delete_groupinvitation
218	Can add service	71	add_service
219	Can change service	71	change_service
220	Can delete service	71	delete_service
221	Can add service profile role	72	add_serviceprofilerole
222	Can change service profile role	72	change_serviceprofilerole
223	Can delete service profile role	72	delete_serviceprofilerole
224	Can add service layer	73	add_servicelayer
225	Can change service layer	73	change_servicelayer
226	Can delete service layer	73	delete_servicelayer
227	Can add web service harvest layers job	74	add_webserviceharvestlayersjob
228	Can change web service harvest layers job	74	change_webserviceharvestlayersjob
229	Can delete web service harvest layers job	74	delete_webserviceharvestlayersjob
230	Can add web service registration job	75	add_webserviceregistrationjob
231	Can change web service registration job	75	change_webserviceregistrationjob
232	Can delete web service registration job	75	delete_webserviceregistrationjob
233	Can add upload	76	add_upload
234	Can change upload	76	change_upload
235	Can delete upload	76	delete_upload
236	Can add upload file	77	add_uploadfile
237	Can change upload file	77	change_uploadfile
238	Can delete upload file	77	delete_uploadfile
239	Can add station	78	add_station
240	Can change station	78	change_station
241	Can delete station	78	delete_station
242	Can add unit	79	add_unit
243	Can change unit	79	change_unit
244	Can delete unit	79	delete_unit
245	Can add variable	80	add_variable
246	Can change variable	80	change_variable
247	Can delete variable	80	delete_variable
248	Can add time serie	81	add_timeserie
249	Can change time serie	81	change_timeserie
250	Can delete time serie	81	delete_timeserie
251	Can add entry	82	add_entry
252	Can change entry	82	change_entry
253	Can delete entry	82	delete_entry
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('auth_permission_id_seq', 253, true);


--
-- Data for Name: avatar_avatar; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY avatar_avatar (id, "primary", avatar, date_uploaded, user_id) FROM stdin;
\.


--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('avatar_avatar_id_seq', 1, false);


--
-- Data for Name: base_backup; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_backup (id, identifier, name, name_en, date, description, description_en, base_folder, location) FROM stdin;
\.


--
-- Name: base_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_backup_id_seq', 1, false);


--
-- Data for Name: base_contactrole; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_contactrole (id, role, contact_id, resource_id) FROM stdin;
\.


--
-- Name: base_contactrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_contactrole_id_seq', 2, true);


--
-- Data for Name: base_hierarchicalkeyword; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_hierarchicalkeyword (id, name, slug, path, depth, numchild) FROM stdin;
\.


--
-- Name: base_hierarchicalkeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_hierarchicalkeyword_id_seq', 1, false);


--
-- Data for Name: base_license; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_license (id, identifier, name, name_en, abbreviation, description, description_en, url, license_text, license_text_en) FROM stdin;
1	not_specified	Not Specified	Not Specified		The original author did not specify a license.	The original author did not specify a license.		Not applicable	Not applicable
2	varied_original	Varied / Original	Varied / Original		This item is either licensed under multiple licenses.  See the item's abstract for more information or contact the distributor.	This item is either licensed under multiple licenses.  See the item's abstract for more information or contact the distributor.		Not applicable	Not applicable
3	varied_derived	Varied / Derived	Varied / Derived		The constituent parts of this item have different licenses.  Go to each part to see license information.	The constituent parts of this item have different licenses.  Go to each part to see license information.		Not applicable	Not applicable
4	public_domain	Public Domain	Public Domain	PD	Works in the public domain may be used freely without the permission of the former copyright owner.	Works in the public domain may be used freely without the permission of the former copyright owner.	http://www.copyright.gov/help/faq/faq-definitions.html	The public domain is not a place. A work of authorship is in the “public domain” if it is no longer under copyright protection or if it failed to meet the requirements for copyright protection. Works in the public domain may be used freely without the permission of the former copyright owner.	The public domain is not a place. A work of authorship is in the “public domain” if it is no longer under copyright protection or if it failed to meet the requirements for copyright protection. Works in the public domain may be used freely without the permission of the former copyright owner.
5	public_domain_usg	Public Domain / USG	Public Domain / USG	PD/USG	This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.	This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.	https://raw.githubusercontent.com/state-hiu/cybergis-licenses/master/licenses/PUBLICDOMAIN-LICENSE-RAW.txt	This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.	This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.
6	odbl	Open Data Commons Open Database License / OSM	Open Data Commons Open Database License / OSM	ODbL/OSM	You are free to copy, distribute, transmit and adapt our data, as long as you credit OpenStreetMap and its contributors\nIf you alter or build upon our data, you may distribute the result only under the same licence.	You are free to copy, distribute, transmit and adapt our data, as long as you credit OpenStreetMap and its contributors\nIf you alter or build upon our data, you may distribute the result only under the same licence.	http://www.openstreetmap.org/copyright		
7	nextview	NextView	NextView	NV	This data is licensed for use by the US Government (USG) under the NextView (NV) license and copyrighted by Digital Globe or GeoEye. The NV license allows the USG to share the imagery and Literal Imagery Derived Products (LIDP) with entities outside the USG when that entity is working directly with the USG, for the USG, or in a manner that is directly beneficial to the USG. The party receiving the data can only use the imagery or LIDP for the original purpose or only as otherwise agreed to by the USG. The party receiving the data cannot share the imagery or LIDP with a third party without express permission from the USG. At no time should this imagery or LIDP be used for other than USG-related purposes and must not be used for commercial gain. The copyright information should be maintained at all times. Your acceptance of these license terms is implied by your use.\nIn other words, you may only use NextView imagery linked from this site for digitizing OpenStreetMap data for humanitarian purposes.	This data is licensed for use by the US Government (USG) under the NextView (NV) license and copyrighted by Digital Globe or GeoEye. The NV license allows the USG to share the imagery and Literal Imagery Derived Products (LIDP) with entities outside the USG when that entity is working directly with the USG, for the USG, or in a manner that is directly beneficial to the USG. The party receiving the data can only use the imagery or LIDP for the original purpose or only as otherwise agreed to by the USG. The party receiving the data cannot share the imagery or LIDP with a third party without express permission from the USG. At no time should this imagery or LIDP be used for other than USG-related purposes and must not be used for commercial gain. The copyright information should be maintained at all times. Your acceptance of these license terms is implied by your use.\nIn other words, you may only use NextView imagery linked from this site for digitizing OpenStreetMap data for humanitarian purposes.	https://raw.githubusercontent.com/state-hiu/cybergis-licenses/master/licenses/NEXTVIEW-LICENSE-RAW.txt		
\.


--
-- Name: base_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_license_id_seq', 7, true);


--
-- Data for Name: base_link; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_link (id, extension, link_type, name, mime, url, resource_id) FROM stdin;
\.


--
-- Name: base_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_link_id_seq', 24, true);


--
-- Data for Name: base_region; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_region (id, code, name, name_en, lft, rght, tree_id, level, parent_id) FROM stdin;
1	GLO	Global	Global	1	516	90	0	\N
2	NAM	North America	North America	203	212	90	2	254
3	CAM	Central America	Central America	187	202	90	2	254
4	SAM	South America	South America	213	242	90	2	254
5	EUR	Europe	Europe	318	433	90	1	1
6	ASI	Asia	Asia	246	317	90	1	1
7	SEA	Southeast Asia	Southeast Asia	293	316	90	2	6
8	CTA	Central Asia	Central Asia	247	260	90	2	6
9	SAS	South Asia	South Asia	277	292	90	2	6
10	AFR	Africa	Africa	2	127	90	1	1
11	NAF	North Africa	North Africa	49	64	90	2	10
12	EAF	East Africa	East Africa	13	48	90	2	10
13	WAF	West Africa	West Africa	83	126	90	2	10
14	SAF	Southern Africa	Southern Africa	65	82	90	2	10
15	MES	Middle East	Middle East	434	463	90	1	1
16	ANT	Antarctica	Antarctica	244	245	90	1	1
17	AFG	Afghanistan	Afghanistan	248	249	90	3	8
18	ALA	Aland Islands	Aland Islands	319	320	90	2	5
19	ALB	Albania	Albania	321	322	90	2	5
20	DZA	Algeria	Algeria	50	51	90	3	11
21	ASM	American Samoa	American Samoa	465	466	90	2	256
22	AND	Andorra	Andorra	323	324	90	2	5
23	AGO	Angola	Angola	84	85	90	3	13
24	AIA	Anguilla	Anguilla	130	131	90	3	255
25	ATG	Antigua and Barbuda	Antigua and Barbuda	132	133	90	3	255
26	ARG	Argentina	Argentina	214	215	90	3	4
27	ARM	Armenia	Armenia	325	326	90	2	5
28	ABW	Aruba	Aruba	134	135	90	3	255
29	AUS	Australia	Australia	467	468	90	2	256
30	AUT	Austria	Austria	327	328	90	2	5
31	AZE	Azerbaijan	Azerbaijan	329	330	90	2	5
32	BHS	Bahamas	Bahamas	136	137	90	3	255
33	BHR	Bahrain	Bahrain	435	436	90	2	15
34	BGD	Bangladesh	Bangladesh	278	279	90	3	9
35	BRB	Barbados	Barbados	138	139	90	3	255
36	BLR	Belarus	Belarus	331	332	90	2	5
37	BEL	Belgium	Belgium	333	334	90	2	5
38	BLZ	Belize	Belize	188	189	90	3	3
39	BEN	Benin	Benin	86	87	90	3	13
40	BMU	Bermuda	Bermuda	140	141	90	3	255
41	BTN	Bhutan	Bhutan	280	281	90	3	9
42	BOL	Bolivia	Bolivia	216	217	90	3	4
43	BIH	Bosnia and Herzegovina	Bosnia and Herzegovina	335	336	90	2	5
44	BWA	Botswana	Botswana	66	67	90	3	14
45	BRA	Brazil	Brazil	218	219	90	3	4
46	VGB	British Virgin Islands	British Virgin Islands	142	143	90	3	255
47	BRN	Brunei Darussalam	Brunei Darussalam	294	295	90	3	7
48	BGR	Bulgaria	Bulgaria	337	338	90	2	5
49	BFA	Burkina Faso	Burkina Faso	88	89	90	3	13
50	BDI	Burundi	Burundi	14	15	90	3	12
51	KHM	Cambodia	Cambodia	296	297	90	3	7
52	CMR	Cameroon	Cameroon	90	91	90	3	13
53	CAN	Canada	Canada	204	205	90	3	2
54	CPV	Cape Verde	Cape Verde	92	93	90	3	13
55	CYM	Cayman Islands	Cayman Islands	144	145	90	3	255
56	CAF	Central African Republic	Central African Republic	4	5	90	3	257
57	TCD	Chad	Chad	6	7	90	3	257
58	CIL	Channel Islands	Channel Islands	339	340	90	2	5
59	CHL	Chile	Chile	220	221	90	3	4
60	CHN	China	China	262	263	90	3	258
61	HKG	China - Hong Kong	China - Hong Kong	264	265	90	3	258
62	MAC	China - Macao	China - Macao	266	267	90	3	258
63	COL	Colombia	Colombia	222	223	90	3	4
64	COM	Comoros	Comoros	16	17	90	3	12
65	COG	Congo	Congo	8	9	90	3	257
66	COK	Cook Islands	Cook Islands	469	470	90	2	256
67	CRI	Costa Rica	Costa Rica	190	191	90	3	3
68	CIV	Cote d'Ivoire	Cote d'Ivoire	94	95	90	3	13
69	HRV	Croatia	Croatia	341	342	90	2	5
70	CUB	Cuba	Cuba	146	147	90	3	255
71	CYP	Cyprus	Cyprus	343	344	90	2	5
72	CZE	Czech Republic	Czech Republic	345	346	90	2	5
73	PRK	Democratic People's Republic of Korea	Democratic People's Republic of Korea	268	269	90	3	258
74	COD	Democratic Republic of the Congo	Democratic Republic of the Congo	10	11	90	3	257
75	DNK	Denmark	Denmark	347	348	90	2	5
76	DJI	Djibouti	Djibouti	18	19	90	3	12
77	DMA	Dominica	Dominica	148	149	90	3	255
78	DOM	Dominican Republic	Dominican Republic	150	151	90	3	255
79	ECU	Ecuador	Ecuador	224	225	90	3	4
80	EGY	Egypt	Egypt	52	53	90	3	11
81	SLV	El Salvador	El Salvador	192	193	90	3	3
82	GNQ	Equatorial Guinea	Equatorial Guinea	96	97	90	3	13
83	ERI	Eritrea	Eritrea	20	21	90	3	12
84	EST	Estonia	Estonia	349	350	90	2	5
85	ETH	Ethiopia	Ethiopia	22	23	90	3	12
86	FRO	Faeroe Islands	Faeroe Islands	351	352	90	2	5
87	FLK	Falkland Islands (Malvinas)	Falkland Islands (Malvinas)	226	227	90	3	4
88	FJI	Fiji	Fiji	471	472	90	2	256
89	FIN	Finland	Finland	353	354	90	2	5
90	FRA	France	France	355	356	90	2	5
91	GUF	French Guiana	French Guiana	228	229	90	3	4
92	PYF	French Polynesia	French Polynesia	473	474	90	2	256
93	GAB	Gabon	Gabon	98	99	90	3	13
94	GMB	Gambia	Gambia	100	101	90	3	13
95	GEO	Georgia	Georgia	357	358	90	2	5
96	DEU	Germany	Germany	359	360	90	2	5
97	GHA	Ghana	Ghana	102	103	90	3	13
98	GIB	Gibraltar	Gibraltar	361	362	90	2	5
99	GRC	Greece	Greece	363	364	90	2	5
100	GRL	Greenland	Greenland	206	207	90	3	2
101	GRD	Grenada	Grenada	152	153	90	3	255
102	GLP	Guadeloupe	Guadeloupe	154	155	90	3	255
103	GUM	Guam	Guam	475	476	90	2	256
104	GTM	Guatemala	Guatemala	194	195	90	3	3
105	GGY	Guernsey	Guernsey	365	366	90	2	5
106	GIN	Guinea	Guinea	104	105	90	3	13
107	GNB	Guinea-Bissau	Guinea-Bissau	106	107	90	3	13
108	GUY	Guyana	Guyana	230	231	90	3	4
109	HTI	Haiti	Haiti	156	157	90	3	255
110	VAT	Holy See (Vatican City)	Holy See (Vatican City)	367	368	90	2	5
111	HND	Honduras	Honduras	196	197	90	3	3
112	HUN	Hungary	Hungary	369	370	90	2	5
113	ISL	Iceland	Iceland	371	372	90	2	5
114	IND	India	India	282	283	90	3	9
115	IDN	Indonesia	Indonesia	298	299	90	3	7
116	IRN	Iran	Iran	437	438	90	2	15
117	IRQ	Iraq	Iraq	439	440	90	2	15
118	IRL	Ireland	Ireland	373	374	90	2	5
119	IMN	Isle of Man	Isle of Man	375	376	90	2	5
120	ISR	Israel	Israel	441	442	90	2	15
121	ITA	Italy	Italy	377	378	90	2	5
122	JAM	Jamaica	Jamaica	158	159	90	3	255
123	JPN	Japan	Japan	270	271	90	3	258
124	JEY	Jersey	Jersey	379	380	90	2	5
125	JOR	Jordan	Jordan	443	444	90	2	15
126	KAZ	Kazakhstan	Kazakhstan	250	251	90	3	8
127	KEN	Kenya	Kenya	24	25	90	3	12
128	KIR	Kiribati	Kiribati	477	478	90	2	256
129	KWT	Kuwait	Kuwait	445	446	90	2	15
130	KGZ	Kyrgyzstan	Kyrgyzstan	252	253	90	3	8
131	LAO	Lao People's Democratic Republic	Lao People's Democratic Republic	300	301	90	3	7
132	LVA	Latvia	Latvia	381	382	90	2	5
133	LBN	Lebanon	Lebanon	447	448	90	2	15
134	LSO	Lesotho	Lesotho	68	69	90	3	14
135	LBR	Liberia	Liberia	108	109	90	3	13
136	LBY	Libyan Arab Jamahiriya	Libyan Arab Jamahiriya	54	55	90	3	11
137	LIE	Liechtenstein	Liechtenstein	383	384	90	2	5
138	LTU	Lithuania	Lithuania	385	386	90	2	5
139	LUX	Luxembourg	Luxembourg	387	388	90	2	5
140	MKD	Macedonia	Macedonia	389	390	90	2	5
141	MDG	Madagascar	Madagascar	26	27	90	3	12
142	MWI	Malawi	Malawi	28	29	90	3	12
143	MYS	Malaysia	Malaysia	302	303	90	3	7
144	MDV	Maldives	Maldives	284	285	90	3	9
145	MLI	Mali	Mali	110	111	90	3	13
146	MLT	Malta	Malta	391	392	90	2	5
147	MHL	Marshall Islands	Marshall Islands	479	480	90	2	256
148	MTQ	Martinique	Martinique	160	161	90	3	255
149	MRT	Mauritania	Mauritania	112	113	90	3	13
150	MUS	Mauritius	Mauritius	30	31	90	3	12
151	MYT	Mayotte	Mayotte	32	33	90	3	12
152	MEX	Mexico	Mexico	208	209	90	3	2
153	FSM	Micronesia, Federated States of	Micronesia, Federated States of	481	482	90	2	256
154	MCO	Monaco	Monaco	393	394	90	2	5
155	MNG	Mongolia	Mongolia	272	273	90	3	258
156	MNE	Montenegro	Montenegro	395	396	90	2	5
157	MSR	Montserrat	Montserrat	162	163	90	3	255
158	MAR	Morocco	Morocco	56	57	90	3	11
159	MOZ	Mozambique	Mozambique	34	35	90	3	12
160	MMR	Myanmar	Myanmar	304	305	90	3	7
161	NMB	Namibia	Namibia	70	71	90	3	14
162	NRU	Nauru	Nauru	483	484	90	2	256
163	NPL	Nepal	Nepal	286	287	90	3	9
164	NLD	Netherlands	Netherlands	397	398	90	2	5
165	NAN	Netherlands Antilles	Netherlands Antilles	164	165	90	3	255
166	NCL	New Caledonia	New Caledonia	485	486	90	2	256
167	NZL	New Zealand	New Zealand	487	488	90	2	256
168	NIC	Nicaragua	Nicaragua	198	199	90	3	3
169	NER	Niger	Niger	114	115	90	3	13
170	NGA	Nigeria	Nigeria	116	117	90	3	13
171	NIU	Niue	Niue	489	490	90	2	256
172	NFK	Norfolk Island	Norfolk Island	491	492	90	2	256
173	MNP	Northern Mariana Islands	Northern Mariana Islands	493	494	90	2	256
174	NOR	Norway	Norway	399	400	90	2	5
175	PSE	Occupied Palestinian Territory	Occupied Palestinian Territory	449	450	90	2	15
176	OMN	Oman	Oman	451	452	90	2	15
177	PAK	Pakistan	Pakistan	288	289	90	3	9
178	PLW	Palau	Palau	495	496	90	2	256
179	PAN	Panama	Panama	200	201	90	3	3
180	PNG	Papua New Guinea	Papua New Guinea	497	498	90	2	256
181	PRY	Paraguay	Paraguay	232	233	90	3	4
182	PER	Peru	Peru	234	235	90	3	4
183	PHL	Philippines	Philippines	306	307	90	3	7
184	PCN	Pitcairn	Pitcairn	499	500	90	2	256
185	POL	Poland	Poland	401	402	90	2	5
186	PRT	Portugal	Portugal	403	404	90	2	5
187	PRI	Puerto Rico	Puerto Rico	166	167	90	3	255
188	QAT	Qatar	Qatar	453	454	90	2	15
189	KOR	Republic of Korea	Republic of Korea	274	275	90	3	258
190	MDA	Republic of Moldova	Republic of Moldova	405	406	90	2	5
191	REU	Reunion	Reunion	36	37	90	3	12
192	ROU	Romania	Romania	407	408	90	2	5
193	RUS	Russian Federation	Russian Federation	409	410	90	2	5
194	RWA	Rwanda	Rwanda	38	39	90	3	12
195	SHN	Saint Helena	Saint Helena	72	73	90	3	14
196	KNA	Saint Kitts and Nevis	Saint Kitts and Nevis	168	169	90	3	255
197	LCA	Saint Lucia	Saint Lucia	170	171	90	3	255
198	SPM	Saint Pierre and Miquelon	Saint Pierre and Miquelon	172	173	90	3	255
199	VCT	Saint Vincent and the Grenadines	Saint Vincent and the Grenadines	174	175	90	3	255
200	BLM	Saint-Barthelemy	Saint-Barthelemy	176	177	90	3	255
201	MAF	Saint-Martin (French part)	Saint-Martin (French part)	178	179	90	3	255
202	WSM	Samoa	Samoa	501	502	90	2	256
203	SMR	San Marino	San Marino	411	412	90	2	5
204	STP	Sao Tome and Principe	Sao Tome and Principe	118	119	90	3	13
205	SAU	Saudi Arabia	Saudi Arabia	455	456	90	2	15
206	SEN	Senegal	Senegal	120	121	90	3	13
207	SRB	Serbia	Serbia	413	414	90	2	5
208	SYC	Seychelles	Seychelles	40	41	90	3	12
209	SLE	Sierra Leone	Sierra Leone	122	123	90	3	13
210	SGP	Singapore	Singapore	308	309	90	3	7
211	SVK	Slovakia	Slovakia	415	416	90	2	5
212	SVN	Slovenia	Slovenia	417	418	90	2	5
213	SLB	Solomon Islands	Solomon Islands	503	504	90	2	256
214	SOM	Somalia	Somalia	42	43	90	3	12
215	ZAF	South Africa	South Africa	74	75	90	3	14
216	ESP	Spain	Spain	419	420	90	2	5
217	LKA	Sri Lanka	Sri Lanka	290	291	90	3	9
218	SDN	Sudan	Sudan	58	59	90	3	11
219	SUR	Suriname	Suriname	236	237	90	3	4
220	SJM	Svalbard and Jan Mayen Islands	Svalbard and Jan Mayen Islands	421	422	90	2	5
221	SWZ	Swaziland	Swaziland	76	77	90	3	14
222	SWE	Sweden	Sweden	423	424	90	2	5
223	CHE	Switzerland	Switzerland	425	426	90	2	5
224	SYR	Syrian Arab Republic	Syrian Arab Republic	457	458	90	2	15
225	TJK	Tajikistan	Tajikistan	254	255	90	3	8
226	THA	Thailand	Thailand	310	311	90	3	7
227	TLS	Timor-Leste	Timor-Leste	312	313	90	3	7
228	TGO	Togo	Togo	124	125	90	3	13
229	TKL	Tokelau	Tokelau	505	506	90	2	256
230	TON	Tonga	Tonga	507	508	90	2	256
231	TTO	Trinidad and Tobago	Trinidad and Tobago	180	181	90	3	255
232	TUN	Tunisia	Tunisia	60	61	90	3	11
233	TUR	Turkey	Turkey	427	428	90	2	5
234	TKM	Turkmenistan	Turkmenistan	256	257	90	3	8
235	TCA	Turks and Caicos Islands	Turks and Caicos Islands	182	183	90	3	255
236	TUV	Tuvalu	Tuvalu	509	510	90	2	256
237	UGA	Uganda	Uganda	44	45	90	3	12
238	UKR	Ukraine	Ukraine	429	430	90	2	5
239	ARE	United Arab Emirates	United Arab Emirates	459	460	90	2	15
240	GBR	United Kingdom	United Kingdom	431	432	90	2	5
241	TZA	United Republic of Tanzania	United Republic of Tanzania	46	47	90	3	12
242	VIR	United States Virgin Islands	United States Virgin Islands	184	185	90	3	255
243	USA	United States of America	United States of America	210	211	90	3	2
244	URY	Uruguay	Uruguay	238	239	90	3	4
245	UZB	Uzbekistan	Uzbekistan	258	259	90	3	8
246	VUT	Vanuatu	Vanuatu	511	512	90	2	256
247	VEN	Venezuela (Bolivarian Republic of)	Venezuela (Bolivarian Republic of)	240	241	90	3	4
248	VNM	Viet Nam	Viet Nam	314	315	90	3	7
249	WLF	Wallis and Futuna Islands	Wallis and Futuna Islands	513	514	90	2	256
250	ESH	Western Sahara	Western Sahara	62	63	90	3	11
251	YEM	Yemen	Yemen	461	462	90	2	15
252	ZMB	Zambia	Zambia	78	79	90	3	14
253	ZWE	Zimbabwe	Zimbabwe	80	81	90	3	14
254	AME	Americas	Americas	128	243	90	1	1
255	CRB	Caribbean	Caribbean	129	186	90	2	254
256	PAC	Pacific	Pacific	464	515	90	1	1
257	CFR	Central Africa	Central Africa	3	12	90	2	10
258	EAS	East Asia	East Asia	261	276	90	2	6
259	SSD	South Sudan	South Sudan	58	59	90	3	11
\.


--
-- Name: base_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_region_id_seq', 259, true);


--
-- Data for Name: base_resourcebase; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_resourcebase (id, uuid, title, date, date_type, edition, abstract, purpose, maintenance_frequency, constraints_other, language, temporal_extent_start, temporal_extent_end, supplemental_information, data_quality_statement, bbox_x0, bbox_x1, bbox_y0, bbox_y1, srid, csw_typename, csw_schema, csw_mdsource, csw_insert_date, csw_type, csw_anytext, csw_wkt_geometry, metadata_uploaded, metadata_xml, popular_count, share_count, featured, is_published, thumbnail_url, detail_url, rating, category_id, license_id, owner_id, polymorphic_ctype_id, restriction_code_type_id, spatial_representation_type_id, metadata_uploaded_preserve) FROM stdin;
\.


--
-- Name: base_resourcebase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_resourcebase_id_seq', 1, true);


--
-- Data for Name: base_resourcebase_regions; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_resourcebase_regions (id, resourcebase_id, region_id) FROM stdin;
\.


--
-- Name: base_resourcebase_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_resourcebase_regions_id_seq', 1, false);


--
-- Data for Name: base_resourcebase_tkeywords; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_resourcebase_tkeywords (id, resourcebase_id, thesauruskeyword_id) FROM stdin;
\.


--
-- Name: base_resourcebase_tkeywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_resourcebase_tkeywords_id_seq', 1, false);


--
-- Data for Name: base_restrictioncodetype; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_restrictioncodetype (id, identifier, description, description_en, gn_description, gn_description_en, is_choice) FROM stdin;
1	copyright	exclusive right to the publication, production, or sale of the rights to a literary, dramatic, musical, or artistic work, or to the use of a commercial print or label, granted by law for a specified period of time to an author, composer, artist, distributor	exclusive right to the publication, production, or sale of the rights to a literary, dramatic, musical, or artistic work, or to the use of a commercial print or label, granted by law for a specified period of time to an author, composer, artist, distributor	exclusive right to the publication, production, or sale of the rights to a literary, dramatic, musical, or artistic work, or to the use of a commercial print or label, granted by law for a specified period of time to an author, composer, artist, distributor	exclusive right to the publication, production, or sale of the rights to a literary, dramatic, musical, or artistic work, or to the use of a commercial print or label, granted by law for a specified period of time to an author, composer, artist, distributor	t
6	intellectualPropertyRights	rights to financial benefit from and control of distribution of non-tangible property that is a result of creativity	rights to financial benefit from and control of distribution of non-tangible property that is a result of creativity	rights to financial benefit from and control of distribution of non-tangible property that is a result of creativity	rights to financial benefit from and control of distribution of non-tangible property that is a result of creativity	t
5	license	formal permission to do something	formal permission to do something	formal permission to do something	formal permission to do something	t
8	limitation not listed	otherRestrictions	otherRestrictions	otherRestrictions	otherRestrictions	t
2	patent	government has granted exclusive right to make, sell, use or license an invention or discovery	government has granted exclusive right to make, sell, use or license an invention or discovery	government has granted exclusive right to make, sell, use or license an invention or discovery	government has granted exclusive right to make, sell, use or license an invention or discovery	t
3	patentPending	produced or sold information awaiting a patent	produced or sold information awaiting a patent	produced or sold information awaiting a patent	produced or sold information awaiting a patent	t
7	restricted	withheld from general circulation or disclosure	withheld from general circulation or disclosure	withheld from general circulation or disclosure	withheld from general circulation or disclosure	t
4	trademark	a name, symbol, or other device identifying a product, officially registered and legally restricted to the use of the owner or manufacturer	a name, symbol, or other device identifying a product, officially registered and legally restricted to the use of the owner or manufacturer	a name, symbol, or other device identifying a product, officially registered and legally restricted to the use of the owner or manufacturer	a name, symbol, or other device identifying a product, officially registered and legally restricted to the use of the owner or manufacturer	t
\.


--
-- Name: base_restrictioncodetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_restrictioncodetype_id_seq', 8, true);


--
-- Data for Name: base_spatialrepresentationtype; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_spatialrepresentationtype (id, identifier, description, description_en, gn_description, gn_description_en, is_choice) FROM stdin;
2	grid	grid data is used to represent geographic data	grid data is used to represent geographic data	grid data is used to represent geographic data	grid data is used to represent geographic data	t
5	stereoModel	three-dimensional view formed by the intersecting homologous rays of an overlapping pair of images	three-dimensional view formed by the intersecting homologous rays of an overlapping pair of images	three-dimensional view formed by the intersecting homologous rays of an overlapping pair of images	three-dimensional view formed by the intersecting homologous rays of an overlapping pair of images	t
3	textTable	textual or tabular data is used to represent geographic data	textual or tabular data is used to represent geographic data	textual or tabular data is used to represent geographic data	textual or tabular data is used to represent geographic data	t
4	tin	triangulated irregular network	triangulated irregular network	triangulated irregular network	triangulated irregular network	t
1	vector	vector data is used to represent geographic data	vector data is used to represent geographic data	vector data is used to represent geographic data	vector data is used to represent geographic data	t
6	video	scene from a video recording	scene from a video recording	scene from a video recording	scene from a video recording	t
\.


--
-- Name: base_spatialrepresentationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_spatialrepresentationtype_id_seq', 6, true);


--
-- Data for Name: base_taggedcontentitem; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_taggedcontentitem (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: base_taggedcontentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_taggedcontentitem_id_seq', 1, false);


--
-- Data for Name: base_thesaurus; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_thesaurus (id, identifier, title, date, description, slug) FROM stdin;
\.


--
-- Name: base_thesaurus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_thesaurus_id_seq', 1, false);


--
-- Data for Name: base_thesauruskeyword; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_thesauruskeyword (id, about, alt_label, thesaurus_id) FROM stdin;
\.


--
-- Name: base_thesauruskeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_thesauruskeyword_id_seq', 1, false);


--
-- Data for Name: base_thesauruskeywordlabel; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_thesauruskeywordlabel (id, lang, label, keyword_id) FROM stdin;
\.


--
-- Name: base_thesauruskeywordlabel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_thesauruskeywordlabel_id_seq', 1, false);


--
-- Data for Name: base_topiccategory; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY base_topiccategory (id, identifier, description, description_en, gn_description, gn_description_en, is_choice, fa_class) FROM stdin;
13	biota	flora and/or fauna in natural environment. Examples: wildlife, vegetation, biological sciences, ecology, wilderness, sealife, wetlands, habitat	flora and/or fauna in natural environment. Examples: wildlife, vegetation, biological sciences, ecology, wilderness, sealife, wetlands, habitat	Biota	Biota	t	fa-leaf
6	boundaries	legal land descriptions. Examples: political and administrative boundaries	legal land descriptions. Examples: political and administrative boundaries	Boundaries	Boundaries	t	fa-ellipsis-h
19	climatologyMeteorologyAtmosphere	processes and phenomena of the atmosphere. Examples: cloud cover, weather, climate, atmospheric conditions, climate change, precipitation	processes and phenomena of the atmosphere. Examples: cloud cover, weather, climate, atmospheric conditions, climate change, precipitation	Climatology Meteorology Atmosphere	Climatology Meteorology Atmosphere	t	fa-cloud
11	economy	economic activities, conditions and employment. Examples: production, labour, revenue, commerce, industry, tourism and ecotourism, forestry, fisheries, commercial or subsistence hunting, exploration and exploitation of resources such as minerals, oil and gas	economic activities, conditions and employment. Examples: production, labour, revenue, commerce, industry, tourism and ecotourism, forestry, fisheries, commercial or subsistence hunting, exploration and exploitation of resources such as minerals, oil and gas	Economy	Economy	t	fa-shopping-cart
3	elevation	height above or below sea level. Examples: altitude, bathymetry, digital elevation models, slope, derived products	height above or below sea level. Examples: altitude, bathymetry, digital elevation models, slope, derived products	Elevation	Elevation	t	fa-flag
9	environment	environmental resources, protection and conservation. Examples: environmental pollution, waste storage and treatment, environmental impact assessment, monitoring environmental risk, nature reserves, landscape	environmental resources, protection and conservation. Examples: environmental pollution, waste storage and treatment, environmental impact assessment, monitoring environmental risk, nature reserves, landscape	Environment	Environment	t	fa-tree
2	farming	rearing of animals and/or cultivation of plants. Examples: agriculture, irrigation, aquaculture, plantations, herding, pests and diseases affecting crops and livestock	rearing of animals and/or cultivation of plants. Examples: agriculture, irrigation, aquaculture, plantations, herding, pests and diseases affecting crops and livestock	Farming	Farming	t	fa-lemon-o
1	geoscientificInformation	information pertaining to earth sciences. Examples: geophysical features and processes, geology, minerals, sciences dealing with the composition, structure and origin of the earth s rocks, risks of earthquakes, volcanic activity, landslides, gravity information, soils, permafrost, hydrogeology, erosion	information pertaining to earth sciences. Examples: geophysical features and processes, geology, minerals, sciences dealing with the composition, structure and origin of the earth s rocks, risks of earthquakes, volcanic activity, landslides, gravity information, soils, permafrost, hydrogeology, erosion	Geoscientific Information	Geoscientific Information	t	fa-bullseye
14	health	health, health services, human ecology, and safety. Examples: disease and illness, factors affecting health, hygiene, substance abuse, mental and physical health, health services	health, health services, human ecology, and safety. Examples: disease and illness, factors affecting health, hygiene, substance abuse, mental and physical health, health services	Health	Health	t	fa-stethoscope
15	imageryBaseMapsEarthCover	base maps. Examples: land cover, topographic maps, imagery, unclassified images, annotations	base maps. Examples: land cover, topographic maps, imagery, unclassified images, annotations	Imagery Base Maps Earth Cover	Imagery Base Maps Earth Cover	t	fa-globe
7	inlandWaters	inland water features, drainage systems and their characteristics. Examples: rivers and glaciers, salt lakes, water utilization plans, dams, currents, floods, water quality, hydrographic charts	inland water features, drainage systems and their characteristics. Examples: rivers and glaciers, salt lakes, water utilization plans, dams, currents, floods, water quality, hydrographic charts	Inland Waters	Inland Waters	t	fa-tint
8	intelligenceMilitary	military bases, structures, activities. Examples: barracks, training grounds, military transportation, information collection	military bases, structures, activities. Examples: barracks, training grounds, military transportation, information collection	Intelligence Military	Intelligence Military	t	fa-fighter-jet
5	oceans	features and characteristics of salt water bodies (excluding inland waters). Examples: tides, tidal waves, coastal information, reefs	features and characteristics of salt water bodies (excluding inland waters). Examples: tides, tidal waves, coastal information, reefs	Oceans	Oceans	t	fa-anchor
10	location	positional information and services. Examples: addresses, geodetic networks, control points, postal zones and services, place names	positional information and services. Examples: addresses, geodetic networks, control points, postal zones and services, place names	Location	Location	t	fa-map-marker
12	planningCadastre	information used for appropriate actions for future use of the land. Examples: land use maps, zoning maps, cadastral surveys, land ownership	information used for appropriate actions for future use of the land. Examples: land use maps, zoning maps, cadastral surveys, land ownership	Planning Cadastre	Planning Cadastre	t	fa-home
17	society	characteristics of society and cultures. Examples: settlements, anthropology, archaeology, education, traditional beliefs, manners and customs, demographic data, recreational areas and activities, social impact assessments, crime and justice, census information	characteristics of society and cultures. Examples: settlements, anthropology, archaeology, education, traditional beliefs, manners and customs, demographic data, recreational areas and activities, social impact assessments, crime and justice, census information	Society	Society	t	fa-comments
18	structure	man-made construction. Examples: buildings, museums, churches, factories, housing, monuments, shops, towers	man-made construction. Examples: buildings, museums, churches, factories, housing, monuments, shops, towers	Structure	Structure	t	fa-building
16	transportation	means and aids for conveying persons and/or goods. Examples: roads, airports/airstrips, shipping routes, tunnels, nautical charts, vehicle or vessel location, aeronautical charts, railways	means and aids for conveying persons and/or goods. Examples: roads, airports/airstrips, shipping routes, tunnels, nautical charts, vehicle or vessel location, aeronautical charts, railways	Transportation	Transportation	t	fa-truck
4	utilitiesCommunication	energy, water and waste systems and communications infrastructure and services. Examples: hydroelectricity, geothermal, solar and nuclear sources of energy, water purification and distribution, sewage collection and disposal, electricity and gas distribution, data communication, telecommunication, radio, communication networks	energy, water and waste systems and communications infrastructure and services. Examples: hydroelectricity, geothermal, solar and nuclear sources of energy, water purification and distribution, sewage collection and disposal, electricity and gas distribution, data communication, telecommunication, radio, communication networks	Utilities Communication	Utilities Communication	t	fa-phone
\.


--
-- Name: base_topiccategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('base_topiccategory_id_seq', 19, true);


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('celery_taskmeta_id_seq', 1, false);


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('celery_tasksetmeta_id_seq', 1, false);


--
-- Data for Name: dialogos_comment; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY dialogos_comment (id, name, email, website, object_id, comment, submit_date, ip_address, public, author_id, content_type_id) FROM stdin;
\.


--
-- Name: dialogos_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('dialogos_comment_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-18 15:25:38.492943-05	1	GeoServer	1		40	3
2	2017-11-27 15:26:39.382572-05	2	admin	3		44	3
3	2017-11-27 15:27:08.578192-05	1	oswaldo	3		44	3
4	2017-11-28 10:59:55.625283-05	1	GeoServer	2	No fields changed.	40	3
5	2017-11-28 11:29:19.404659-05	1	GeoServer	2	No fields changed.	40	3
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 5, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	taggit	tag
8	taggit	taggeditem
9	djcelery	taskmeta
10	djcelery	tasksetmeta
11	djcelery	intervalschedule
12	djcelery	crontabschedule
13	djcelery	periodictasks
14	djcelery	periodictask
15	djcelery	workerstate
16	djcelery	taskstate
17	account	account
18	account	signupcode
19	account	signupcoderesult
20	account	emailaddress
21	account	emailconfirmation
22	account	accountdeletion
23	account	passwordhistory
24	account	passwordexpiry
25	avatar	avatar
26	dialogos	comment
27	agon_ratings	overallrating
28	agon_ratings	rating
29	announcements	announcement
30	announcements	dismissal
31	actstream	follow
32	actstream	action
33	user_messages	thread
34	user_messages	userthread
35	user_messages	message
36	tastypie	apiaccess
37	tastypie	apikey
38	guardian	userobjectpermission
39	guardian	groupobjectpermission
40	oauth2_provider	application
41	oauth2_provider	grant
42	oauth2_provider	accesstoken
43	oauth2_provider	refreshtoken
44	people	profile
45	base	contactrole
46	base	topiccategory
47	base	spatialrepresentationtype
48	base	region
49	base	restrictioncodetype
50	base	backup
51	base	license
52	base	hierarchicalkeyword
53	base	taggedcontentitem
54	base	thesaurus
55	base	thesauruskeyword
56	base	thesauruskeywordlabel
57	base	resourcebase
58	base	link
59	layers	style
60	layers	layer
61	layers	uploadsession
62	layers	layerfile
63	layers	attribute
64	maps	map
65	maps	maplayer
66	maps	mapsnapshot
67	documents	document
68	groups	groupprofile
69	groups	groupmember
70	groups	groupinvitation
71	services	service
72	services	serviceprofilerole
73	services	servicelayer
74	services	webserviceharvestlayersjob
75	services	webserviceregistrationjob
76	upload	upload
77	upload	uploadfile
78	meteorology	station
79	meteorology	unit
80	meteorology	variable
81	meteorology	timeserie
82	meteorology	entry
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('django_content_type_id_seq', 82, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-10-22 11:31:17.034156-05
2	taggit	0001_initial	2017-10-22 11:31:17.151964-05
3	taggit	0002_auto_20150616_2121	2017-10-22 11:31:17.192321-05
4	contenttypes	0002_remove_content_type_name	2017-10-22 11:31:17.28597-05
5	auth	0001_initial	2017-10-22 11:31:17.477232-05
6	auth	0002_alter_permission_name_max_length	2017-10-22 11:31:17.527364-05
7	auth	0003_alter_user_email_max_length	2017-10-22 11:31:17.59255-05
8	auth	0004_alter_user_username_opts	2017-10-22 11:31:17.645939-05
9	auth	0005_alter_user_last_login_null	2017-10-22 11:31:17.68514-05
10	auth	0006_require_contenttypes_0002	2017-10-22 11:31:17.689356-05
11	people	24_initial	2017-10-22 11:31:17.871987-05
12	account	0001_initial	2017-10-22 11:31:18.765875-05
13	account	0002_fix_str	2017-10-22 11:31:18.91414-05
14	account	0003_passwordexpiry_passwordhistory	2017-10-22 11:31:19.098622-05
15	account	0004_auto_20170416_1821	2017-10-22 11:31:19.167205-05
16	account	0005_signupcode_username	2017-10-22 11:31:19.310786-05
17	actstream	0001_initial	2017-10-22 11:31:19.696325-05
18	actstream	0002_remove_action_data	2017-10-22 11:31:19.700538-05
19	admin	0001_initial	2017-10-22 11:31:19.878884-05
20	agon_ratings	0001_initial	2017-10-22 11:31:20.298623-05
21	announcements	0001_initial	2017-10-22 11:31:20.717822-05
22	avatar	0001_initial	2017-10-22 11:31:20.989172-05
23	base	24_initial	2017-10-22 11:31:22.823814-05
24	base	24_to_26	2017-10-22 11:31:24.193638-05
25	dialogos	0001_initial	2017-10-22 11:31:24.437279-05
26	djcelery	0001_initial	2017-10-22 11:31:24.813744-05
27	documents	24_initial	2017-10-22 11:31:25.025396-05
28	groups	24_initial	2017-10-22 11:31:26.755325-05
29	guardian	0001_initial	2017-10-22 11:31:27.486172-05
30	layers	24_initial	2017-10-22 11:31:29.45066-05
31	layers	24_to_26	2017-10-22 11:31:30.557986-05
32	maps	24_initial	2017-10-22 11:31:31.771751-05
33	oauth2_provider	0001_initial	2017-10-22 11:31:32.80644-05
34	oauth2_provider	0002_08_updates	2017-10-22 11:31:33.924568-05
35	oauth2_provider	0003_auto_20160316_1503	2017-10-22 11:31:34.641908-05
36	oauth2_provider	0004_auto_20160525_1623	2017-10-22 11:31:35.394596-05
37	services	24_initial	2017-10-22 11:31:37.019023-05
38	sessions	0001_initial	2017-10-22 11:31:37.072146-05
39	sites	0001_initial	2017-10-22 11:31:37.562874-05
40	tastypie	0001_initial	2017-10-22 11:31:37.902245-05
41	upload	24_initial	2017-10-22 11:31:38.739629-05
42	user_messages	0001_initial	2017-10-22 11:31:39.896897-05
43	meteorology	0001_initial	2017-11-27 16:49:54.664017-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('django_migrations_id_seq', 43, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
z8m0rmfinjwj2jsn2hc947ow3b8uiubd	YTE5MjI4NTI4OWY5OTkxNzViOWYxYzE1OWVlZjgwOGQxY2FmYzdiNDqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNVIDhiY2JmZTE4YmI0NzExZTdiYTc1MDgwMDI3OGRiZjZhVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBVUKSlNFU1NJT05JRHEGVSA4YmNiZmUxOWJiNDcxMWU3YmE3NTA4MDAyNzhkYmY2YVgPAAAAX3Nlc3Npb25fZXhwaXJ5cQdLAFUPX2F1dGhfdXNlcl9oYXNocQhVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-11-10 14:49:22.086715-05
2zl1089vs8u4szjn1lmgi1w7j9wc4cod	MjAxMjYwN2YwMTYwZTA4OTQyMzVjOTE3MmEzN2UzN2IwZTQyNWIxMjqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNVIDVkYzg2M2Q4Y2M5YzExZTc5NzJhMDgwMDI3OGRiZjZhVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBVUKSlNFU1NJT05JRHEGVSAxMGE4MWQyMmNjOWQxMWU3OTcyYTA4MDAyNzhkYmY2YVgPAAAAX3Nlc3Npb25fZXhwaXJ5cQdLAFUPX2F1dGhfdXNlcl9oYXNocQhVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-12-02 15:14:21.948344-05
rmjcshol64tk4rqiepvexkdskeosv9zy	ZTYyMDJjZTUzNzU0MDcwMTU5YmU5Yjg2MjljMTU1MGY3YTMxYmFlMzqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNVIDBjYjg2MGEwY2M5ZDExZTc5NzJhMDgwMDI3OGRiZjZhVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBVUKSlNFU1NJT05JRHEGVSBBMjQwNkVCMDRGMzM1ODhEQjQ4MDdBQ0YxNEM5MURFOHEHWA8AAABfc2Vzc2lvbl9leHBpcnlxCEsAVQ9fYXV0aF91c2VyX2hhc2hxCVUoMGFkMDE4NDg3ZWI3OGEyNzE5MjJjMzA0ZWU0NzA1ODc3MzZmZmFmNHUu	2017-12-02 15:14:29.734325-05
ylg41fiw2x5y5mfq9iran5bw4gr5qaxw	MDU3YWM4NmRkYThjOWNlNjkzYTE5NGRiMzRmZWI2NzMyZTdlOThlMzqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNYHgAAAGdGcTZ2RDJnMjFlTk1BUTlISUxTc05Fd3FYbzhHYlUSX2F1dGhfdXNlcl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQVVCkpTRVNTSU9OSURxBlUgRjUxMTU0RTU3QThBNDREMUJFMjkxREI3NjYyOUM3QThxB1gPAAAAX3Nlc3Npb25fZXhwaXJ5cQhLAFUPX2F1dGhfdXNlcl9oYXNocQlVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-12-11 15:49:20.414755-05
j6f75b3t69wohq9ozyv3auplvp885vth	M2YxZDZiMzU4MjFlMTlkMjM2MzIxMDEyOGYxNDVkYTA1MWMzZDkzOTqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNYHgAAADd1VzBSNjFzbkNjcVM1ck5lTnJOWUVtRzdKdzZvQ1USX2F1dGhfdXNlcl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQVVCkpTRVNTSU9OSURxBlUgQkYxRUFGRDQ0RTI3QURFNzdDOEE5RjNEQkVDNjQ4QjBxB1gPAAAAX3Nlc3Npb25fZXhwaXJ5cQhLAFUPX2F1dGhfdXNlcl9oYXNocQlVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-12-12 10:22:40.414859-05
05mgewystyi3yasa2d49r8aa3nvxjzkl	NzJhZmI4MTgxYzE1M2IwMzExMzA0Nzc5N2Y4MjIyODA0OWM5YjJiODqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNYHgAAAFlZcUJFeHlES2pnVG9WMENlT1FoRUpuSlZLeEV4QlUSX2F1dGhfdXNlcl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQVVCkpTRVNTSU9OSURxBlUgODkyRjFDODU2QUE2QUI0NTBDNjRCMkVERERGRDEwN0RxB1gPAAAAX3Nlc3Npb25fZXhwaXJ5cQhLAFUPX2F1dGhfdXNlcl9oYXNocQlVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-12-12 10:22:49.611547-05
lp95fd5x32ewxu5vq1fpz6m6mfz1tgvr	Nzk0YzMyOTI5YjQwNjVlZWZkOTQwZjZiMWQ4ZTM5NmU0N2RlODUzNzqAAn1xAShVDV9hdXRoX3VzZXJfaWRxAlgBAAAAM1UMYWNjZXNzX3Rva2VucQNYHgAAAE1yUzhiUkdTdzVIZW96aEpBbHJGNmtHamUzVnRyN1USX2F1dGhfdXNlcl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQVVCkpTRVNTSU9OSURxBlUgRTJDRTRFOTU0QUZCMzNGMEFGRDU1MjFCMTg3OUY0MjFxB1gPAAAAX3Nlc3Npb25fZXhwaXJ5cQhLAFUPX2F1dGhfdXNlcl9oYXNocQlVKDBhZDAxODQ4N2ViNzhhMjcxOTIyYzMwNGVlNDcwNTg3NzM2ZmZhZjR1Lg==	2017-12-12 10:52:37.537153-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
\.


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('djcelery_crontabschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('djcelery_intervalschedule_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
\.


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('djcelery_periodictask_id_seq', 1, false);


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, hidden, worker_id) FROM stdin;
\.


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('djcelery_taskstate_id_seq', 1, false);


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('djcelery_workerstate_id_seq', 1, false);


--
-- Data for Name: documents_document; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY documents_document (resourcebase_ptr_id, title_en, abstract_en, purpose_en, constraints_other_en, supplemental_information_en, data_quality_statement_en, object_id, doc_file, extension, doc_type, doc_url, content_type_id) FROM stdin;
\.


--
-- Data for Name: groups_groupinvitation; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY groups_groupinvitation (id, token, email, role, state, created, from_user_id, group_id, user_id) FROM stdin;
\.


--
-- Name: groups_groupinvitation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('groups_groupinvitation_id_seq', 1, false);


--
-- Data for Name: groups_groupmember; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY groups_groupmember (id, role, joined, group_id, user_id) FROM stdin;
\.


--
-- Name: groups_groupmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('groups_groupmember_id_seq', 1, false);


--
-- Data for Name: groups_groupprofile; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY groups_groupprofile (id, title, slug, logo, description, email, access, last_modified, group_id) FROM stdin;
\.


--
-- Name: groups_groupprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('groups_groupprofile_id_seq', 1, false);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 4, true);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
12	1	60	186	3
13	1	60	187	3
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 20, true);


--
-- Data for Name: layers_attribute; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_attribute (id, attribute, description, attribute_label, attribute_type, visible, display_order, count, min, max, average, median, stddev, sum, unique_values, last_stats_updated, layer_id) FROM stdin;
\.


--
-- Name: layers_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('layers_attribute_id_seq', 8, true);


--
-- Data for Name: layers_layer; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_layer (resourcebase_ptr_id, title_en, abstract_en, purpose_en, constraints_other_en, supplemental_information_en, data_quality_statement_en, workspace, store, "storeType", name, typename, charset, default_style_id, upload_session_id, elevation_regex, has_elevation, has_time, is_mosaic, time_regex) FROM stdin;
\.


--
-- Data for Name: layers_layer_styles; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_layer_styles (id, layer_id, style_id) FROM stdin;
\.


--
-- Name: layers_layer_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('layers_layer_styles_id_seq', 1, true);


--
-- Data for Name: layers_layerfile; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_layerfile (id, name, base, file, upload_session_id) FROM stdin;
1	shx	f	layers/duran_final.shx	1
2	shp	f	layers/duran_final.shp	1
3	prj	f	layers/duran_final.prj	1
4	dbf	f	layers/duran_final.dbf	1
5	shx	f	layers/duran_final_dpjY094.shx	2
6	shp	f	layers/duran_final_dpjY094.shp	2
7	prj	f	layers/duran_final_dpjY094.prj	2
8	dbf	f	layers/duran_final_dpjY094.dbf	2
9	shx	f	layers/duran_final_x3UBX1h.shx	3
10	shp	f	layers/duran_final_x3UBX1h.shp	3
11	prj	f	layers/duran_final_x3UBX1h.prj	3
12	dbf	f	layers/duran_final_x3UBX1h.dbf	3
13	shx	f	layers/duran_final_rmYLv9v.shx	4
14	shp	f	layers/duran_final_rmYLv9v.shp	4
15	prj	f	layers/duran_final_rmYLv9v.prj	4
16	dbf	f	layers/duran_final_rmYLv9v.dbf	4
17	shx	f	layers/duran_final_icV9eLq.shx	5
18	shp	f	layers/duran_final_icV9eLq.shp	5
19	prj	f	layers/duran_final_icV9eLq.prj	5
20	dbf	f	layers/duran_final_icV9eLq.dbf	5
21	shx	f	layers/duran_final_se2nHzM.shx	6
22	shp	f	layers/duran_final_se2nHzM.shp	6
23	prj	f	layers/duran_final_se2nHzM.prj	6
24	dbf	f	layers/duran_final_se2nHzM.dbf	6
25	shx	f	layers/shape_duran.shx	7
26	shp	f	layers/shape_duran.shp	7
27	prj	f	layers/shape_duran.prj	7
28	dbf	f	layers/shape_duran.dbf	7
29	shx	f	layers/shape_duran_WoNkRVj.shx	8
30	shp	f	layers/shape_duran_WoNkRVj.shp	8
31	prj	f	layers/shape_duran_WoNkRVj.prj	8
32	dbf	f	layers/shape_duran_WoNkRVj.dbf	8
33	shx	f	layers/shape_duran_2zvBUas.shx	9
34	shp	f	layers/shape_duran_2zvBUas.shp	9
35	prj	f	layers/shape_duran_2zvBUas.prj	9
36	dbf	f	layers/shape_duran_2zvBUas.dbf	9
37	shx	f	layers/shape_duran_4IzVKXN.shx	10
38	shp	f	layers/shape_duran_4IzVKXN.shp	10
39	prj	f	layers/shape_duran_4IzVKXN.prj	10
40	dbf	f	layers/shape_duran_4IzVKXN.dbf	10
41	shx	f	layers/shape_duran_oSoOyGs.shx	11
42	shp	f	layers/shape_duran_oSoOyGs.shp	11
43	prj	f	layers/shape_duran_oSoOyGs.prj	11
44	dbf	f	layers/shape_duran_oSoOyGs.dbf	11
77	dbf	f		44
76	prj	f		44
75	shp	f		44
74	shx	f		44
78	shx	f	layers/eurasia_lsib8_.shx	45
79	shp	f	layers/eurasia_lsib8_.shp	45
80	prj	f	layers/eurasia_lsib8_.prj	45
81	dbf	f	layers/eurasia_lsib8_.dbf	45
82	shx	f	layers/eurasia_lsib8__gLkiHWg.shx	46
83	shp	f	layers/eurasia_lsib8__gLkiHWg.shp	46
84	prj	f	layers/eurasia_lsib8__gLkiHWg.prj	46
85	dbf	f	layers/eurasia_lsib8__gLkiHWg.dbf	46
86	shx	f	layers/eurasia_lsib8__BNqwSXs.shx	47
87	shp	f	layers/eurasia_lsib8__BNqwSXs.shp	47
88	prj	f	layers/eurasia_lsib8__BNqwSXs.prj	47
89	dbf	f	layers/eurasia_lsib8__BNqwSXs.dbf	47
90	shx	f	layers/eurasia_lsib8__E3W4AON.shx	48
91	shp	f	layers/eurasia_lsib8__E3W4AON.shp	48
92	prj	f	layers/eurasia_lsib8__E3W4AON.prj	48
93	dbf	f	layers/eurasia_lsib8__E3W4AON.dbf	48
94	shx	f	layers/eurasia_lsib8__nGJ5CH1.shx	49
95	shp	f	layers/eurasia_lsib8__nGJ5CH1.shp	49
96	prj	f	layers/eurasia_lsib8__nGJ5CH1.prj	49
97	dbf	f	layers/eurasia_lsib8__nGJ5CH1.dbf	49
\.


--
-- Name: layers_layerfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('layers_layerfile_id_seq', 97, true);


--
-- Data for Name: layers_style; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_style (id, name, sld_title, sld_body, sld_version, sld_url, workspace) FROM stdin;
\.


--
-- Name: layers_style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('layers_style_id_seq', 1, true);


--
-- Data for Name: layers_uploadsession; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY layers_uploadsession (id, date, processed, error, traceback, context, user_id) FROM stdin;
1	2017-10-31 11:36:48.59684-05	f	File cannot be opened, maybe check the encoding	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 222, in get_base_file\n    assert valid_shp, msg\nAssertionError: File cannot be opened, maybe check the encoding\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
2	2017-10-31 11:36:58.952461-05	f	File cannot be opened, maybe check the encoding	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 222, in get_base_file\n    assert valid_shp, msg\nAssertionError: File cannot be opened, maybe check the encoding\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
3	2017-10-31 11:37:13.102457-05	f	File cannot be opened, maybe check the encoding	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 222, in get_base_file\n    assert valid_shp, msg\nAssertionError: File cannot be opened, maybe check the encoding\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
4	2017-10-31 11:37:38.030867-05	f	unknown encoding: 	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 217, in get_base_file\n    valid_shp, wrong_column_name, list_col = check_shp_columnnames(self)\n  File "/home/geonode/geonode/geonode/utils.py", line 729, in check_shp_columnnames\n    field_name = unicode(inLayerDefn.GetFieldDefn(i).GetName(), layer.charset)\nLookupError: unknown encoding: \n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
5	2017-10-31 11:37:46.130824-05	f	unknown encoding: 	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 217, in get_base_file\n    valid_shp, wrong_column_name, list_col = check_shp_columnnames(self)\n  File "/home/geonode/geonode/geonode/utils.py", line 729, in check_shp_columnnames\n    field_name = unicode(inLayerDefn.GetFieldDefn(i).GetName(), layer.charset)\nLookupError: unknown encoding: \n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
6	2017-10-31 11:37:54.442723-05	f	File cannot be opened, maybe check the encoding	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/layers/models.py", line 468, in pre_save_layer\n    base_file, info = instance.get_base_file()\n  File "/home/geonode/geonode/geonode/layers/models.py", line 222, in get_base_file\n    assert valid_shp, msg\nAssertionError: File cannot be opened, maybe check the encoding\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
7	2017-10-31 11:38:31.910307-05	f	Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta http-equiv="content-type" content="text/html; charset=utf-8">\n  <title>Page not found at /geoserverrest/workspaces/default.xml</title>\n  <meta name="robots" content="NONE,NOARCHIVE">\n  <style type="text/css">\n    html * { padding:0; margin:0; }\n    body * { padding:10px 20px; }\n    body * * { padding:0; }\n    body { font:small sans-serif; background:#eee; }\n    body>div { border-bottom:1px solid #ddd; }\n    h1 { font-weight:normal; margin-bottom:.4em; }\n    h1 span { font-size:60%; color:#666; font-weight:normal; }\n    table { border:none; border-collapse: collapse; width:100%; }\n    td, th { vertical-align:top; padding:2px 3px; }\n    th { width:12em; text-align:right; color:#666; padding-right:.5em; }\n    #info { background:#f6f6f6; }\n    #info ol { margin: 0.5em 4em; }\n    #info ol li { font-family: monospace; }\n    #summary { background: #ffc; }\n    #explanation { background:#eee; border-bottom: 0px none; }\n  </style>\n</head>\n<body>\n  <div id="summary">\n    <h1>Page not found <span>(404)</span></h1>\n    <table class="meta">\n      <tr>\n        <th>Request Method:</th>\n        <td>GET</td>\n      </tr>\n      <tr>\n        <th>Request URL:</th>\n        <td>http://localhost/geoserverrest/workspaces/default.xml</td>\n      </tr>\n      \n    </table>\n  </div>\n  <div id="info">\n    \n      <p>\n      Using the URLconf defined in <code>geonode.urls</code>,\n      Django tried these URL patterns, in this order:\n      </p>\n      <ol>\n        \n          <li>\n            \n                ^/?$\n                [name='home']\n            \n          </li>\n        \n          <li>\n            \n                ^help/$\n                [name='help']\n            \n          </li>\n        \n          <li>\n            \n                ^developer/$\n                [name='developer']\n            \n          </li>\n        \n          <li>\n            \n                ^about/$\n                [name='about']\n            \n          </li>\n        \n          <li>\n            \n                ^layers/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^maps/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^catalogue/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^data.json$\n                [name='data_json']\n            \n          </li>\n        \n          <li>\n            \n                ^ident.json$\n                [name='ident_json']\n            \n          </li>\n        \n          <li>\n            \n                ^h_keywords_api$\n                [name='h_keywords_api']\n            \n          </li>\n        \n          <li>\n            \n                ^search/$\n                [name='search']\n            \n          </li>\n        \n          <li>\n            \n                ^account/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^people/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^avatar/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^comments/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^ratings/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^activity/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^announcements/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^messages/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^social/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^security/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_login$\n                [name='account_ajax_login']\n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_lookup$\n                [name='account_ajax_lookup']\n            \n          </li>\n        \n          <li>\n            \n                ^lang\\.js$\n                [name='lang']\n            \n          </li>\n        \n          <li>\n            \n                ^jsi18n/$\n                [name='jscat']\n            \n          </li>\n        \n          <li>\n            \n                ^sitemap\\.xml$\n                [name='sitemap']\n            \n          </li>\n        \n          <li>\n            \n                ^i18n/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^autocomplete/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^admin/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^groups/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^documents/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^services/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^o/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^api/o/v4/tokeninfo\n                [name='tokeninfo']\n            \n          </li>\n        \n          <li>\n            \n                ^api/roles\n                [name='roles']\n            \n          </li>\n        \n          <li>\n            \n                ^api/adminRole\n                [name='adminRole']\n            \n          </li>\n        \n          <li>\n            \n                ^api/users\n                [name='users']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/$\n                [name='api_api_top_level']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^upload/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^gs/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^proxy/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^static\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^uploaded\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/info$\n                \n            \n          </li>\n        \n      </ol>\n      <p>The current URL, <code>geoserverrest/workspaces/default.xml</code>, didn't match any of these.</p>\n    \n  </div>\n\n  <div id="explanation">\n    <p>\n      You're seeing this error because you have <code>DEBUG = True</code> in\n      your Django settings file. Change that to <code>False</code>, and Django\n      will display a standard 404 page.\n    </p>\n  </div>\n</body>\n</html>\n	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta http-equiv="content-type" content="text/html; charset=utf-8">\n  <title>Page not found at /geoserverrest/workspaces/default.xml</title>\n  <meta name="robots" content="NONE,NOARCHIVE">\n  <style type="text/css">\n    html * { padding:0; margin:0; }\n    body * { padding:10px 20px; }\n    body * * { padding:0; }\n    body { font:small sans-serif; background:#eee; }\n    body>div { border-bottom:1px solid #ddd; }\n    h1 { font-weight:normal; margin-bottom:.4em; }\n    h1 span { font-size:60%; color:#666; font-weight:normal; }\n    table { border:none; border-collapse: collapse; width:100%; }\n    td, th { vertical-align:top; padding:2px 3px; }\n    th { width:12em; text-align:right; color:#666; padding-right:.5em; }\n    #info { background:#f6f6f6; }\n    #info ol { margin: 0.5em 4em; }\n    #info ol li { font-family: monospace; }\n    #summary { background: #ffc; }\n    #explanation { background:#eee; border-bottom: 0px none; }\n  </style>\n</head>\n<body>\n  <div id="summary">\n    <h1>Page not found <span>(404)</span></h1>\n    <table class="meta">\n      <tr>\n        <th>Request Method:</th>\n        <td>GET</td>\n      </tr>\n      <tr>\n        <th>Request URL:</th>\n        <td>http://localhost/geoserverrest/workspaces/default.xml</td>\n      </tr>\n      \n    </table>\n  </div>\n  <div id="info">\n    \n      <p>\n      Using the URLconf defined in <code>geonode.urls</code>,\n      Django tried these URL patterns, in this order:\n      </p>\n      <ol>\n        \n          <li>\n            \n                ^/?$\n                [name='home']\n            \n          </li>\n        \n          <li>\n            \n                ^help/$\n                [name='help']\n            \n          </li>\n        \n          <li>\n            \n                ^developer/$\n                [name='developer']\n            \n          </li>\n        \n          <li>\n            \n                ^about/$\n                [name='about']\n            \n          </li>\n        \n          <li>\n            \n                ^layers/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^maps/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^catalogue/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^data.json$\n                [name='data_json']\n            \n          </li>\n        \n          <li>\n            \n                ^ident.json$\n                [name='ident_json']\n            \n          </li>\n        \n          <li>\n            \n                ^h_keywords_api$\n                [name='h_keywords_api']\n            \n          </li>\n        \n          <li>\n            \n                ^search/$\n                [name='search']\n            \n          </li>\n        \n          <li>\n            \n                ^account/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^people/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^avatar/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^comments/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^ratings/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^activity/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^announcements/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^messages/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^social/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^security/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_login$\n                [name='account_ajax_login']\n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_lookup$\n                [name='account_ajax_lookup']\n            \n          </li>\n        \n          <li>\n            \n                ^lang\\.js$\n                [name='lang']\n            \n          </li>\n        \n          <li>\n            \n                ^jsi18n/$\n                [name='jscat']\n            \n          </li>\n        \n          <li>\n            \n                ^sitemap\\.xml$\n                [name='sitemap']\n            \n          </li>\n        \n          <li>\n            \n                ^i18n/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^autocomplete/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^admin/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^groups/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^documents/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^services/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^o/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^api/o/v4/tokeninfo\n                [name='tokeninfo']\n            \n          </li>\n        \n          <li>\n            \n                ^api/roles\n                [name='roles']\n            \n          </li>\n        \n          <li>\n            \n                ^api/adminRole\n                [name='adminRole']\n            \n          </li>\n        \n          <li>\n            \n                ^api/users\n                [name='users']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/$\n                [name='api_api_top_level']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^upload/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^gs/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^proxy/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^static\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^uploaded\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/info$\n                \n            \n          </li>\n        \n      </ol>\n      <p>The current URL, <code>geoserverrest/workspaces/default.xml</code>, didn't match any of these.</p>\n    \n  </div>\n\n  <div id="explanation">\n    <p>\n      You're seeing this error because you have <code>DEBUG = True</code> in\n      your Django settings file. Change that to <code>False</code>, and Django\n      will display a standard 404 page.\n    </p>\n  </div>\n</body>\n</html>\n\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
8	2017-11-02 11:07:52.797117-05	f	Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta http-equiv="content-type" content="text/html; charset=utf-8">\n  <title>Page not found at /geoserverrest/workspaces/default.xml</title>\n  <meta name="robots" content="NONE,NOARCHIVE">\n  <style type="text/css">\n    html * { padding:0; margin:0; }\n    body * { padding:10px 20px; }\n    body * * { padding:0; }\n    body { font:small sans-serif; background:#eee; }\n    body>div { border-bottom:1px solid #ddd; }\n    h1 { font-weight:normal; margin-bottom:.4em; }\n    h1 span { font-size:60%; color:#666; font-weight:normal; }\n    table { border:none; border-collapse: collapse; width:100%; }\n    td, th { vertical-align:top; padding:2px 3px; }\n    th { width:12em; text-align:right; color:#666; padding-right:.5em; }\n    #info { background:#f6f6f6; }\n    #info ol { margin: 0.5em 4em; }\n    #info ol li { font-family: monospace; }\n    #summary { background: #ffc; }\n    #explanation { background:#eee; border-bottom: 0px none; }\n  </style>\n</head>\n<body>\n  <div id="summary">\n    <h1>Page not found <span>(404)</span></h1>\n    <table class="meta">\n      <tr>\n        <th>Request Method:</th>\n        <td>GET</td>\n      </tr>\n      <tr>\n        <th>Request URL:</th>\n        <td>http://localhost/geoserverrest/workspaces/default.xml</td>\n      </tr>\n      \n    </table>\n  </div>\n  <div id="info">\n    \n      <p>\n      Using the URLconf defined in <code>geonode.urls</code>,\n      Django tried these URL patterns, in this order:\n      </p>\n      <ol>\n        \n          <li>\n            \n                ^/?$\n                [name='home']\n            \n          </li>\n        \n          <li>\n            \n                ^help/$\n                [name='help']\n            \n          </li>\n        \n          <li>\n            \n                ^developer/$\n                [name='developer']\n            \n          </li>\n        \n          <li>\n            \n                ^about/$\n                [name='about']\n            \n          </li>\n        \n          <li>\n            \n                ^layers/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^maps/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^catalogue/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^data.json$\n                [name='data_json']\n            \n          </li>\n        \n          <li>\n            \n                ^ident.json$\n                [name='ident_json']\n            \n          </li>\n        \n          <li>\n            \n                ^h_keywords_api$\n                [name='h_keywords_api']\n            \n          </li>\n        \n          <li>\n            \n                ^search/$\n                [name='search']\n            \n          </li>\n        \n          <li>\n            \n                ^account/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^people/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^avatar/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^comments/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^ratings/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^activity/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^announcements/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^messages/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^social/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^security/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_login$\n                [name='account_ajax_login']\n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_lookup$\n                [name='account_ajax_lookup']\n            \n          </li>\n        \n          <li>\n            \n                ^lang\\.js$\n                [name='lang']\n            \n          </li>\n        \n          <li>\n            \n                ^jsi18n/$\n                [name='jscat']\n            \n          </li>\n        \n          <li>\n            \n                ^sitemap\\.xml$\n                [name='sitemap']\n            \n          </li>\n        \n          <li>\n            \n                ^i18n/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^autocomplete/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^admin/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^groups/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^documents/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^services/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^o/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^api/o/v4/tokeninfo\n                [name='tokeninfo']\n            \n          </li>\n        \n          <li>\n            \n                ^api/roles\n                [name='roles']\n            \n          </li>\n        \n          <li>\n            \n                ^api/adminRole\n                [name='adminRole']\n            \n          </li>\n        \n          <li>\n            \n                ^api/users\n                [name='users']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/$\n                [name='api_api_top_level']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^upload/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^gs/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^proxy/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^static\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^uploaded\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/info$\n                \n            \n          </li>\n        \n      </ol>\n      <p>The current URL, <code>geoserverrest/workspaces/default.xml</code>, didn't match any of these.</p>\n    \n  </div>\n\n  <div id="explanation">\n    <p>\n      You're seeing this error because you have <code>DEBUG = True</code> in\n      your Django settings file. Change that to <code>False</code>, and Django\n      will display a standard 404 page.\n    </p>\n  </div>\n</body>\n</html>\n	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta http-equiv="content-type" content="text/html; charset=utf-8">\n  <title>Page not found at /geoserverrest/workspaces/default.xml</title>\n  <meta name="robots" content="NONE,NOARCHIVE">\n  <style type="text/css">\n    html * { padding:0; margin:0; }\n    body * { padding:10px 20px; }\n    body * * { padding:0; }\n    body { font:small sans-serif; background:#eee; }\n    body>div { border-bottom:1px solid #ddd; }\n    h1 { font-weight:normal; margin-bottom:.4em; }\n    h1 span { font-size:60%; color:#666; font-weight:normal; }\n    table { border:none; border-collapse: collapse; width:100%; }\n    td, th { vertical-align:top; padding:2px 3px; }\n    th { width:12em; text-align:right; color:#666; padding-right:.5em; }\n    #info { background:#f6f6f6; }\n    #info ol { margin: 0.5em 4em; }\n    #info ol li { font-family: monospace; }\n    #summary { background: #ffc; }\n    #explanation { background:#eee; border-bottom: 0px none; }\n  </style>\n</head>\n<body>\n  <div id="summary">\n    <h1>Page not found <span>(404)</span></h1>\n    <table class="meta">\n      <tr>\n        <th>Request Method:</th>\n        <td>GET</td>\n      </tr>\n      <tr>\n        <th>Request URL:</th>\n        <td>http://localhost/geoserverrest/workspaces/default.xml</td>\n      </tr>\n      \n    </table>\n  </div>\n  <div id="info">\n    \n      <p>\n      Using the URLconf defined in <code>geonode.urls</code>,\n      Django tried these URL patterns, in this order:\n      </p>\n      <ol>\n        \n          <li>\n            \n                ^/?$\n                [name='home']\n            \n          </li>\n        \n          <li>\n            \n                ^help/$\n                [name='help']\n            \n          </li>\n        \n          <li>\n            \n                ^developer/$\n                [name='developer']\n            \n          </li>\n        \n          <li>\n            \n                ^about/$\n                [name='about']\n            \n          </li>\n        \n          <li>\n            \n                ^layers/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^maps/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^catalogue/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^data.json$\n                [name='data_json']\n            \n          </li>\n        \n          <li>\n            \n                ^ident.json$\n                [name='ident_json']\n            \n          </li>\n        \n          <li>\n            \n                ^h_keywords_api$\n                [name='h_keywords_api']\n            \n          </li>\n        \n          <li>\n            \n                ^search/$\n                [name='search']\n            \n          </li>\n        \n          <li>\n            \n                ^account/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^people/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^avatar/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^comments/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^ratings/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^activity/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^announcements/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^messages/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^social/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^security/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_login$\n                [name='account_ajax_login']\n            \n          </li>\n        \n          <li>\n            \n                ^account/ajax_lookup$\n                [name='account_ajax_lookup']\n            \n          </li>\n        \n          <li>\n            \n                ^lang\\.js$\n                [name='lang']\n            \n          </li>\n        \n          <li>\n            \n                ^jsi18n/$\n                [name='jscat']\n            \n          </li>\n        \n          <li>\n            \n                ^sitemap\\.xml$\n                [name='sitemap']\n            \n          </li>\n        \n          <li>\n            \n                ^i18n/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^autocomplete/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^admin/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^groups/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^documents/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^services/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^o/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^api/o/v4/tokeninfo\n                [name='tokeninfo']\n            \n          </li>\n        \n          <li>\n            \n                ^api/roles\n                [name='roles']\n            \n          </li>\n        \n          <li>\n            \n                ^api/adminRole\n                [name='adminRole']\n            \n          </li>\n        \n          <li>\n            \n                ^api/users\n                [name='users']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/$\n                [name='api_api_top_level']\n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                \n                \n            \n                ^(?P&lt;api_name&gt;api)/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^upload/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^gs/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^proxy/\n                \n            \n          </li>\n        \n          <li>\n            \n                ^static\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^uploaded\\/(?P&lt;path&gt;.*)$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/$\n                \n            \n          </li>\n        \n          <li>\n            \n                ^featured/(?P&lt;site&gt;[A-Za-z0-9_\\-]+)/info$\n                \n            \n          </li>\n        \n      </ol>\n      <p>The current URL, <code>geoserverrest/workspaces/default.xml</code>, didn't match any of these.</p>\n    \n  </div>\n\n  <div id="explanation">\n    <p>\n      You're seeing this error because you have <code>DEBUG = True</code> in\n      your Django settings file. Change that to <code>False</code>, and Django\n      will display a standard 404 page.\n    </p>\n  </div>\n</body>\n</html>\n\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
9	2017-11-02 11:09:44.317503-05	f	Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1">\n    <title>example.com</title>\n    \n      \n      <link href="/static/lib/css/assets.min.css?v=2.6.3" rel="stylesheet"/>\n      \n      <link href="/static/geonode/css/ext-compatibility.css?v=2.6.3" rel="stylesheet" />\n      <link href="/static/geonode/css/base.css?v=2.6.3" rel="stylesheet" />\n      <style type="text/css">[ng\\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}</style>\n      \n      \n    \n    <!--[if IE]>\n      <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>\n      <style>\n        #ieflag{\n            display: block !important;\n            height: 150px;\n            text-align: center;\n        }\n      </style>\n    <![endif]-->\n    <link rel="search" type="application/opensearchdescription+xml" href="/catalogue/opensearch" title="GeoNode Search"/>\n  </head>\n\n  <body class="">\n    <!-- Navbar -->\n    \n\t<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">\n\t  <div class="container">\n        <div class="navbar-header">\n\t      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t        <i class="fa fa-navicon fa-lg"></i>\n\t      </button>\n\t      <a class="navbar-brand" href="/">GeoNode</a>\n\t    </div>\n\t    <div id="navbar" class="navbar-collapse collapse">\n\t      <ul class="nav navbar-nav toolbar">\n\t        \n\t        <li id="nav_layers">\n              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Data<i class="fa fa-angle-down fa-lg"></i></a>\n              <ul class="dropdown-menu">\n                <li><a href="/layers/">Layers</a></li>\n                <li><a href="/documents/">Documents</a></li>\n                \n              </ul>\n            </li>\n\t        <li id="nav_maps">\n              \n              <a href="/maps/">Maps</a>\n              \n            </li>\n            <li>\n\t          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About<i class="fa fa-angle-down fa-lg"></i></a>\n              <ul class="dropdown-menu">\n                <li><a href="/people/">People</a></li>\n                <li><a href="/groups/">Groups</a></li>\n                \n                \n              </ul>\n            </li>\n\t        \n            \n            \n          </ul>\n\t      <ul class="nav navbar-nav navbar-right">\n            <li>\n              <div class="search">\n                <form id="search" action="/search/" >\n                  <span class="fa fa-search"></span>\n                  \n                  <input id="search_input" type="text" placeholder="Search" name="title__icontains">\n                  \n                </form>\n              </div>\n\t        </li>\n            \n            \n\t\t      <li><a href="#" data-toggle="modal" data-target="#SigninModal" role="button" >Sign in </a></li>\n              \n            </ul>\n          </div> <!--/.nav-collapse -->\n        </div>\n      </nav>\n      \n      <!-- End of Navbar -->\n\n    <div class="alert alert-danger alert-dismissible" role="alert" id="ieflag" style="display:none">\n      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n      <h1>You are using an outdated browser that is not supported by GeoNode.</h1>\n      <p>Please use a <strong>modern browser</strong> like Mozilla Firefox, Google Chrome or Safari.</p>\n    </div>\n\n  <div id="wrap">\n    \n    <div class="container">\n      <div class="alert alert-warn" id="status-message" hidden="hidden">\n    <a class="close" onclick="$('.alert').hide()">×</a>\n    <strong><p id="status-message-text">Placeholder for status-message</p></strong>  \n    <p id="status-message-text-body">Placeholder for status-message-body</p>\n</div>\n\n      \n\n\n\n\n      \n\n      \n      <div class="row">\n        <div class="col-md-8">\n        \n  <div id="description"><h3>Page Not Found</h3></div>\n  \n      The page you requested does not exist.  Perhaps you are using an outdated bookmark?\n  \n\n        </div>\n        <div class="col-md-4">\n        \n        </div>\n      </div>\n      \n    </div>\n    \n  </div>\n\n  \n  <footer>\n    <div class="container">\n      <div class="row">\n        <div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>Data</li>\n            <li><a href="/layers/">Layers</a></li>\n            <li><a href="/documents/">Documents</a></li>\n            \n          </ul>\n        </div>\n        <div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>Maps</li>\n            <li><a href="/maps/">Explore Maps</a></li>\n            \n          </ul>\n        </div>\n\t\t<div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>About</li>\n            <li><a href="/people/">People</a></li>\n            <li><a href="/groups/">Groups</a></li>\n            \n            \n          </ul>\n        </div>\n        <div class="col-md-6 text-right">\n          <ul class="list-unstyled">\n            <li>Powered by <a href="http://geonode.org">GeoNode</a> <em>version 2.6.3</em></li>\n            <li><a href="/developer/">Developers</a> | <a href="/about/">About</a><li>\n          </ul>\n          <label class="hidden">Language</label>\n          \n          \n          <form class="form-inline" action="/i18n/setlang/" method="post">\n          <input type='hidden' name='csrfmiddlewaretoken' value='ZcnwU6XIwuXh7LnyjL9BQgPoilwedBfF' />\n            <select class="col-md-6 pull-right" name="language" onchange="javascript:form.submit()">\n              \n              <option value="en"  selected="selected">\n                English\n              </option>\n              \n              <option value="es" >\n                Español\n              </option>\n              \n              <option value="it" >\n                Italiano\n              </option>\n              \n              <option value="fr" >\n                Français\n              </option>\n              \n              <option value="de" >\n                Deutsch\n              </option>\n              \n              <option value="el" >\n                Ελληνικά\n              </option>\n              \n              <option value="id" >\n                Bahasa Indonesia\n              </option>\n              \n              <option value="zh-cn" >\n                中文\n              </option>\n              \n              <option value="ja" >\n                日本語\n              </option>\n              \n              <option value="fa" >\n                Persian\n              </option>\n              \n              <option value="ar" >\n                Arabic\n              </option>\n              \n              <option value="bn" >\n                Bengali\n              </option>\n              \n              <option value="ne" >\n                Nepali\n              </option>\n              \n              <option value="sq" >\n                Albanian\n              </option>\n              \n              <option value="af" >\n                Afrikaans\n              </option>\n              \n              <option value="sw" >\n                Swahili\n              </option>\n              \n              <option value="pt" >\n                Portuguese\n              </option>\n              \n              <option value="pt-br" >\n                Portuguese (Brazil)\n              </option>\n              \n              <option value="ru" >\n                Russian\n              </option>\n              \n              <option value="vi" >\n                Vietnamese\n              </option>\n              \n              <option value="ko" >\n                한국어\n              </option>\n              \n              <option value="am" >\n                Amharic\n              </option>\n              \n              <option value="km" >\n                Khmer\n              </option>\n              \n              <option value="pl" >\n                Polish\n              </option>\n              \n              <option value="sv" >\n                Swedish\n              </option>\n              \n              <option value="th" >\n                ไทย\n              </option>\n              \n              <option value="uk" >\n                Ukranian\n              </option>\n              \n              <option value="si" >\n                Sinhala\n              </option>\n              \n              <option value="ta" >\n                Tamil\n              </option>\n              \n              <option value="tl" >\n                Tagalog\n              </option>\n              \n            </select>\n          </form>\n          \n        </div>\n      </div>\n    </div>\n  </footer>\n  \n\n\n    <!-- Modal must stay outside the navbar -->\n    \n    <div class="modal fade" id="SigninModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n      <div class="modal-dialog modal-sm">\n        <div class="modal-content">\n          <div class="modal-header">\n            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n            <h4 class="modal-title" id="myModalLabel">Sign in</h4>\n          </div>\n          <form class="form-signin" role="form" action="/account/login/?next=/geoserverrest/workspaces/default.xml" method="post">\n            <div class="modal-body">\n              <input type='hidden' name='csrfmiddlewaretoken' value='ZcnwU6XIwuXh7LnyjL9BQgPoilwedBfF' />\n              <div class="form-group">\n                <label for="id_username" class="sr-only">Username:</label>\n                <input id="id_username" class="form-control" name="username" placeholder="Username" type="text" />\n              </div>\n              <div class="form-group">\n                <label for="id_password" class="sr-only">Password:</label>\n                <input id="id_password" class="form-control" name="password" placeholder="Password" type="password" />\n              </div>\n              <label class="checkbox">\n                <input type="checkbox" /> Remember Me\n              </label>\n            </div>\n            <div class="modal-footer">\n              <button type="submit" class="btn btn-primary btn-block">Sign in</button>\n            </div>\n          </form>\n        </div>\n      </div>\n    </div>\n    \n    <!-- End of Modal -->\n\n    \n    <script src="/static/lib/js/assets.min.js?v=2.6.3"></script>\n    \n    <script src="/static/geonode/js/utils/utils.js?v=2.6.3"></script>\n    <script src="/static/geonode/js/base/base.js?v=2.6.3"></script>\n    \n\n<script type="text/javascript">\njQuery(function($) {\nfunction getCookie(name) {\n    var cookieValue = null;\n    if (document.cookie && document.cookie != '') {\n        var cookies = document.cookie.split(';');\n        for (var i = 0; i < cookies.length; i++) {\n            var cookie = jQuery.trim(cookies[i]);\n            // Does this cookie string begin with the name we want?\n            if (cookie.substring(0, name.length + 1) == (name + '=')) {\n                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));\n                break;\n            }\n        }\n    }\n    return cookieValue;\n}\nfunction csrfSafeMethod(method) {\n    // these HTTP methods do not require CSRF protection\n    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));\n}\nfunction sameOrigin(url) {\n    // test that a given url is a same-origin URL\n    // url could be relative or scheme relative or absolute\n    var host = document.location.host; // host + port\n    var protocol = document.location.protocol;\n    var sr_origin = '//' + host;\n    var origin = protocol + sr_origin;\n    // Allow absolute or scheme relative URLs to same origin\n    return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||\n        (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||\n        // or any other URL that isn't scheme relative or absolute i.e relative.\n        !(/^(\\/\\/|http:|https:).*/.test(url));\n}\n$.ajaxSetup({\n    beforeSend: function(xhr, settings) {\n        if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {\n            // Send the token to same-origin, relative URLs only.\n            // Send the token only if the method warrants CSRF protection\n            // Using the CSRFToken value acquired earlier\n            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));\n        }\n    }\n});\n});\n</script>\n\n\n<script type="text/javascript" src="/static/autocomplete_light/django_admin.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/autocomplete.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/widget.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/addanother.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/text_widget.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/remote.js"></script>\n<link rel="stylesheet" type="text/css" href="/static/autocomplete_light/style.css" />\n\n    <script type="text/javascript" src="/jsi18n/"></script>\n    \n    <script type="text/javascript">\n        var autocomplete = $('#search_input').yourlabsAutocomplete({\n            url: '/autocomplete/ResourceBaseAutocomplete/',\n            choiceSelector: 'span',\n            hideAfter: 200,\n            minimumCharacters: 1,\n            placeholder: 'Type your search here ...',\n            appendAutocomplete: $('#search_input'),\n            autoHilightFirst: false\n        });\n        $('#search_input').bind('selectChoice', function(e, choice, autocomplete) {\n            if(choice[0].children[0] == undefined) {\n                $('#search_input').val($(choice[0]).text());\n                $('#search').submit();\n            }\n        });\n    </script>\n    <script>\n        // Workaround to fix the autocomplete box positions\n        yourlabs.Autocomplete.prototype.fixPosition = function(html) {\n            this.input.parents().filter(function() {\n                return $(this).css('overflow') === 'hidden';\n            }).first().css('overflow', 'visible');\n            if(this.input.attr('name') !== 'resource-keywords'){\n              this.box.insertAfter(this.input).css({top: 28, left: 0});\n            }else{\n              var pos = $.extend({}, this.input.position(), {\n                height: this.input.outerHeight()\n              });\n              this.box.insertAfter(this.input).css({top: pos.top + pos.height, left: pos.left});\n            }\n        };\n    </script>\n    <script type="text/javascript" src="/lang.js"></script>\n\n  </body>\n</html>\n	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserverrest/workspaces/default.xml but got a 404 status code: \n\n<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1">\n    <title>example.com</title>\n    \n      \n      <link href="/static/lib/css/assets.min.css?v=2.6.3" rel="stylesheet"/>\n      \n      <link href="/static/geonode/css/ext-compatibility.css?v=2.6.3" rel="stylesheet" />\n      <link href="/static/geonode/css/base.css?v=2.6.3" rel="stylesheet" />\n      <style type="text/css">[ng\\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}</style>\n      \n      \n    \n    <!--[if IE]>\n      <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>\n      <style>\n        #ieflag{\n            display: block !important;\n            height: 150px;\n            text-align: center;\n        }\n      </style>\n    <![endif]-->\n    <link rel="search" type="application/opensearchdescription+xml" href="/catalogue/opensearch" title="GeoNode Search"/>\n  </head>\n\n  <body class="">\n    <!-- Navbar -->\n    \n\t<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">\n\t  <div class="container">\n        <div class="navbar-header">\n\t      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t        <i class="fa fa-navicon fa-lg"></i>\n\t      </button>\n\t      <a class="navbar-brand" href="/">GeoNode</a>\n\t    </div>\n\t    <div id="navbar" class="navbar-collapse collapse">\n\t      <ul class="nav navbar-nav toolbar">\n\t        \n\t        <li id="nav_layers">\n              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Data<i class="fa fa-angle-down fa-lg"></i></a>\n              <ul class="dropdown-menu">\n                <li><a href="/layers/">Layers</a></li>\n                <li><a href="/documents/">Documents</a></li>\n                \n              </ul>\n            </li>\n\t        <li id="nav_maps">\n              \n              <a href="/maps/">Maps</a>\n              \n            </li>\n            <li>\n\t          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About<i class="fa fa-angle-down fa-lg"></i></a>\n              <ul class="dropdown-menu">\n                <li><a href="/people/">People</a></li>\n                <li><a href="/groups/">Groups</a></li>\n                \n                \n              </ul>\n            </li>\n\t        \n            \n            \n          </ul>\n\t      <ul class="nav navbar-nav navbar-right">\n            <li>\n              <div class="search">\n                <form id="search" action="/search/" >\n                  <span class="fa fa-search"></span>\n                  \n                  <input id="search_input" type="text" placeholder="Search" name="title__icontains">\n                  \n                </form>\n              </div>\n\t        </li>\n            \n            \n\t\t      <li><a href="#" data-toggle="modal" data-target="#SigninModal" role="button" >Sign in </a></li>\n              \n            </ul>\n          </div> <!--/.nav-collapse -->\n        </div>\n      </nav>\n      \n      <!-- End of Navbar -->\n\n    <div class="alert alert-danger alert-dismissible" role="alert" id="ieflag" style="display:none">\n      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n      <h1>You are using an outdated browser that is not supported by GeoNode.</h1>\n      <p>Please use a <strong>modern browser</strong> like Mozilla Firefox, Google Chrome or Safari.</p>\n    </div>\n\n  <div id="wrap">\n    \n    <div class="container">\n      <div class="alert alert-warn" id="status-message" hidden="hidden">\n    <a class="close" onclick="$('.alert').hide()">×</a>\n    <strong><p id="status-message-text">Placeholder for status-message</p></strong>  \n    <p id="status-message-text-body">Placeholder for status-message-body</p>\n</div>\n\n      \n\n\n\n\n      \n\n      \n      <div class="row">\n        <div class="col-md-8">\n        \n  <div id="description"><h3>Page Not Found</h3></div>\n  \n      The page you requested does not exist.  Perhaps you are using an outdated bookmark?\n  \n\n        </div>\n        <div class="col-md-4">\n        \n        </div>\n      </div>\n      \n    </div>\n    \n  </div>\n\n  \n  <footer>\n    <div class="container">\n      <div class="row">\n        <div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>Data</li>\n            <li><a href="/layers/">Layers</a></li>\n            <li><a href="/documents/">Documents</a></li>\n            \n          </ul>\n        </div>\n        <div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>Maps</li>\n            <li><a href="/maps/">Explore Maps</a></li>\n            \n          </ul>\n        </div>\n\t\t<div class="col-md-2">\n          <ul class="list-unstyled">\n            <li>About</li>\n            <li><a href="/people/">People</a></li>\n            <li><a href="/groups/">Groups</a></li>\n            \n            \n          </ul>\n        </div>\n        <div class="col-md-6 text-right">\n          <ul class="list-unstyled">\n            <li>Powered by <a href="http://geonode.org">GeoNode</a> <em>version 2.6.3</em></li>\n            <li><a href="/developer/">Developers</a> | <a href="/about/">About</a><li>\n          </ul>\n          <label class="hidden">Language</label>\n          \n          \n          <form class="form-inline" action="/i18n/setlang/" method="post">\n          <input type='hidden' name='csrfmiddlewaretoken' value='ZcnwU6XIwuXh7LnyjL9BQgPoilwedBfF' />\n            <select class="col-md-6 pull-right" name="language" onchange="javascript:form.submit()">\n              \n              <option value="en"  selected="selected">\n                English\n              </option>\n              \n              <option value="es" >\n                Español\n              </option>\n              \n              <option value="it" >\n                Italiano\n              </option>\n              \n              <option value="fr" >\n                Français\n              </option>\n              \n              <option value="de" >\n                Deutsch\n              </option>\n              \n              <option value="el" >\n                Ελληνικά\n              </option>\n              \n              <option value="id" >\n                Bahasa Indonesia\n              </option>\n              \n              <option value="zh-cn" >\n                中文\n              </option>\n              \n              <option value="ja" >\n                日本語\n              </option>\n              \n              <option value="fa" >\n                Persian\n              </option>\n              \n              <option value="ar" >\n                Arabic\n              </option>\n              \n              <option value="bn" >\n                Bengali\n              </option>\n              \n              <option value="ne" >\n                Nepali\n              </option>\n              \n              <option value="sq" >\n                Albanian\n              </option>\n              \n              <option value="af" >\n                Afrikaans\n              </option>\n              \n              <option value="sw" >\n                Swahili\n              </option>\n              \n              <option value="pt" >\n                Portuguese\n              </option>\n              \n              <option value="pt-br" >\n                Portuguese (Brazil)\n              </option>\n              \n              <option value="ru" >\n                Russian\n              </option>\n              \n              <option value="vi" >\n                Vietnamese\n              </option>\n              \n              <option value="ko" >\n                한국어\n              </option>\n              \n              <option value="am" >\n                Amharic\n              </option>\n              \n              <option value="km" >\n                Khmer\n              </option>\n              \n              <option value="pl" >\n                Polish\n              </option>\n              \n              <option value="sv" >\n                Swedish\n              </option>\n              \n              <option value="th" >\n                ไทย\n              </option>\n              \n              <option value="uk" >\n                Ukranian\n              </option>\n              \n              <option value="si" >\n                Sinhala\n              </option>\n              \n              <option value="ta" >\n                Tamil\n              </option>\n              \n              <option value="tl" >\n                Tagalog\n              </option>\n              \n            </select>\n          </form>\n          \n        </div>\n      </div>\n    </div>\n  </footer>\n  \n\n\n    <!-- Modal must stay outside the navbar -->\n    \n    <div class="modal fade" id="SigninModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n      <div class="modal-dialog modal-sm">\n        <div class="modal-content">\n          <div class="modal-header">\n            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n            <h4 class="modal-title" id="myModalLabel">Sign in</h4>\n          </div>\n          <form class="form-signin" role="form" action="/account/login/?next=/geoserverrest/workspaces/default.xml" method="post">\n            <div class="modal-body">\n              <input type='hidden' name='csrfmiddlewaretoken' value='ZcnwU6XIwuXh7LnyjL9BQgPoilwedBfF' />\n              <div class="form-group">\n                <label for="id_username" class="sr-only">Username:</label>\n                <input id="id_username" class="form-control" name="username" placeholder="Username" type="text" />\n              </div>\n              <div class="form-group">\n                <label for="id_password" class="sr-only">Password:</label>\n                <input id="id_password" class="form-control" name="password" placeholder="Password" type="password" />\n              </div>\n              <label class="checkbox">\n                <input type="checkbox" /> Remember Me\n              </label>\n            </div>\n            <div class="modal-footer">\n              <button type="submit" class="btn btn-primary btn-block">Sign in</button>\n            </div>\n          </form>\n        </div>\n      </div>\n    </div>\n    \n    <!-- End of Modal -->\n\n    \n    <script src="/static/lib/js/assets.min.js?v=2.6.3"></script>\n    \n    <script src="/static/geonode/js/utils/utils.js?v=2.6.3"></script>\n    <script src="/static/geonode/js/base/base.js?v=2.6.3"></script>\n    \n\n<script type="text/javascript">\njQuery(function($) {\nfunction getCookie(name) {\n    var cookieValue = null;\n    if (document.cookie && document.cookie != '') {\n        var cookies = document.cookie.split(';');\n        for (var i = 0; i < cookies.length; i++) {\n            var cookie = jQuery.trim(cookies[i]);\n            // Does this cookie string begin with the name we want?\n            if (cookie.substring(0, name.length + 1) == (name + '=')) {\n                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));\n                break;\n            }\n        }\n    }\n    return cookieValue;\n}\nfunction csrfSafeMethod(method) {\n    // these HTTP methods do not require CSRF protection\n    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));\n}\nfunction sameOrigin(url) {\n    // test that a given url is a same-origin URL\n    // url could be relative or scheme relative or absolute\n    var host = document.location.host; // host + port\n    var protocol = document.location.protocol;\n    var sr_origin = '//' + host;\n    var origin = protocol + sr_origin;\n    // Allow absolute or scheme relative URLs to same origin\n    return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||\n        (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||\n        // or any other URL that isn't scheme relative or absolute i.e relative.\n        !(/^(\\/\\/|http:|https:).*/.test(url));\n}\n$.ajaxSetup({\n    beforeSend: function(xhr, settings) {\n        if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {\n            // Send the token to same-origin, relative URLs only.\n            // Send the token only if the method warrants CSRF protection\n            // Using the CSRFToken value acquired earlier\n            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));\n        }\n    }\n});\n});\n</script>\n\n\n<script type="text/javascript" src="/static/autocomplete_light/django_admin.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/autocomplete.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/widget.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/addanother.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/text_widget.js"></script>\n<script type="text/javascript" src="/static/autocomplete_light/remote.js"></script>\n<link rel="stylesheet" type="text/css" href="/static/autocomplete_light/style.css" />\n\n    <script type="text/javascript" src="/jsi18n/"></script>\n    \n    <script type="text/javascript">\n        var autocomplete = $('#search_input').yourlabsAutocomplete({\n            url: '/autocomplete/ResourceBaseAutocomplete/',\n            choiceSelector: 'span',\n            hideAfter: 200,\n            minimumCharacters: 1,\n            placeholder: 'Type your search here ...',\n            appendAutocomplete: $('#search_input'),\n            autoHilightFirst: false\n        });\n        $('#search_input').bind('selectChoice', function(e, choice, autocomplete) {\n            if(choice[0].children[0] == undefined) {\n                $('#search_input').val($(choice[0]).text());\n                $('#search').submit();\n            }\n        });\n    </script>\n    <script>\n        // Workaround to fix the autocomplete box positions\n        yourlabs.Autocomplete.prototype.fixPosition = function(html) {\n            this.input.parents().filter(function() {\n                return $(this).css('overflow') === 'hidden';\n            }).first().css('overflow', 'visible');\n            if(this.input.attr('name') !== 'resource-keywords'){\n              this.box.insertAfter(this.input).css({top: 28, left: 0});\n            }else{\n              var pos = $.extend({}, this.input.position(), {\n                height: this.input.outerHeight()\n              });\n              this.box.insertAfter(this.input).css({top: pos.top + pos.height, left: pos.left});\n            }\n        };\n    </script>\n    <script type="text/javascript" src="/lang.js"></script>\n\n  </body>\n</html>\n\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
10	2017-11-02 11:33:08.349471-05	f	IncompleteRead(281 bytes read)	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1128, in geoserver_upload\n    workspace=workspace)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 990, in _create_db_featurestore\n    ds = get_store(cat, dsname, workspace=workspace)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1018, in get_store\n    store = cat.get_xml('%s/%s.xml' % (workspace.datastore_url[:-4], name))\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 211, in get_xml\n    response, content = self.http.request(rest_url)\n  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1659, in request\n    (response, content) = self._request(conn, authority, uri, request_uri, method, body, headers, redirections, cachekey)\n  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1399, in _request\n    (response, content) = self._conn_request(conn, request_uri, method, body, headers)\n  File "/usr/local/lib/python2.7/dist-packages/httplib2/__init__.py", line 1382, in _conn_request\n    content = response.read()\n  File "/usr/lib/python2.7/httplib.py", line 588, in read\n    return self._read_chunked(amt)\n  File "/usr/lib/python2.7/httplib.py", line 642, in _read_chunked\n    raise IncompleteRead(''.join(value))\nIncompleteRead: IncompleteRead(281 bytes read)\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
11	2017-11-02 11:43:22.302649-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 500 status code: \n<!DOCTYPE html><html><head><title>Apache Tomcat/8.0.32 (Ubuntu) - Error report</title><style type="text/css">H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}.line {height: 1px; background-color: #525D76; border: none;}</style> </head><body><h1>HTTP Status 500 - Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space</h1><div class="line"></div><p><b>type</b> Exception report</p><p><b>message</b> <u>Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space</u></p><p><b>description</b> <u>The server encountered an internal error that prevented it from fulfilling this request.</u></p><p><b>exception</b></p><pre>org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space\n\torg.springframework.beans.factory.support.ConstructorResolver.instantiateUsingFactoryMethod(ConstructorResolver.java:599)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.instantiateUsingFactoryMethod(AbstractAutowireCapableBeanFactory.java:1123)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1018)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:510)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:482)\n\torg.springframework.beans.factory.support.AbstractBeanFactory$2.getObject(AbstractBeanFactory.java:345)\n\torg.springframework.web.context.request.AbstractRequestAttributesScope.get(AbstractRequestAttributesScope.java:44)\n\torg.springframework.web.context.request.SessionScope.get(SessionScope.java:93)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:340)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:197)\n\torg.springframework.aop.target.SimpleBeanTargetSource.getTarget(SimpleBeanTargetSource.java:35)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.getTarget(CglibAopProxy.java:687)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:637)\n\torg.springframework.security.oauth2.client.OAuth2RestTemplate$$EnhancerBySpringCGLIB$$38d5c3e4.getOAuth2ClientContext(&lt;generated&gt;)\n\torg.geoserver.security.oauth2.GeoServerOAuthAuthenticationFilter.doFilter(GeoServerOAuthAuthenticationFilter.java:110)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilterInternal(BasicAuthenticationFilter.java:213)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.geoserver.security.filter.GeoServerBasicAuthenticationFilter.doFilter(GeoServerBasicAuthenticationFilter.java:84)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:91)\n\torg.geoserver.security.filter.GeoServerSecurityContextPersistenceFilter$1.doFilter(GeoServerSecurityContextPersistenceFilter.java:53)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:213)\n\torg.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:176)\n\torg.geoserver.security.GeoServerSecurityFilterChainProxy.doFilter(GeoServerSecurityFilterChainProxy.java:152)\n\torg.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\n\torg.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\n\torg.geoserver.filters.LoggingFilter.doFilter(LoggingFilter.java:87)\n\torg.geoserver.filters.GZIPFilter.doFilter(GZIPFilter.java:42)\n\torg.geoserver.filters.SessionDebugFilter.doFilter(SessionDebugFilter.java:48)\n\torg.geoserver.filters.FlushSafeFilter.doFilter(FlushSafeFilter.java:44)\n\torg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:121)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n</pre><p><b>root cause</b></p><pre>org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space\n\torg.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiate(SimpleInstantiationStrategy.java:189)\n\torg.springframework.beans.factory.support.ConstructorResolver.instantiateUsingFactoryMethod(ConstructorResolver.java:588)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.instantiateUsingFactoryMethod(AbstractAutowireCapableBeanFactory.java:1123)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1018)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:510)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:482)\n\torg.springframework.beans.factory.support.AbstractBeanFactory$2.getObject(AbstractBeanFactory.java:345)\n\torg.springframework.web.context.request.AbstractRequestAttributesScope.get(AbstractRequestAttributesScope.java:44)\n\torg.springframework.web.context.request.SessionScope.get(SessionScope.java:93)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:340)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:197)\n\torg.springframework.aop.target.SimpleBeanTargetSource.getTarget(SimpleBeanTargetSource.java:35)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.getTarget(CglibAopProxy.java:687)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:637)\n\torg.springframework.security.oauth2.client.OAuth2RestTemplate$$EnhancerBySpringCGLIB$$38d5c3e4.getOAuth2ClientContext(&lt;generated&gt;)\n\torg.geoserver.security.oauth2.GeoServerOAuthAuthenticationFilter.doFilter(GeoServerOAuthAuthenticationFilter.java:110)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilterInternal(BasicAuthenticationFilter.java:213)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.geoserver.security.filter.GeoServerBasicAuthenticationFilter.doFilter(GeoServerBasicAuthenticationFilter.java:84)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:91)\n\torg.geoserver.security.filter.GeoServerSecurityContextPersistenceFilter$1.doFilter(GeoServerSecurityContextPersistenceFilter.java:53)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:213)\n\torg.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:176)\n\torg.geoserver.security.GeoServerSecurityFilterChainProxy.doFilter(GeoServerSecurityFilterChainProxy.java:152)\n\torg.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\n\torg.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\n\torg.geoserver.filters.LoggingFilter.doFilter(LoggingFilter.java:87)\n\torg.geoserver.filters.GZIPFilter.doFilter(GZIPFilter.java:42)\n\torg.geoserver.filters.SessionDebugFilter.doFilter(SessionDebugFilter.java:48)\n\torg.geoserver.filters.FlushSafeFilter.doFilter(FlushSafeFilter.java:44)\n\torg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:121)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n</pre><p><b>root cause</b></p><pre>java.lang.OutOfMemoryError: Java heap space\n</pre><p><b>note</b> <u>The full stack trace of the root cause is available in the Apache Tomcat/8.0.32 (Ubuntu) logs.</u></p><hr class="line"><h3>Apache Tomcat/8.0.32 (Ubuntu)</h3></body></html>	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 500 status code: \n<!DOCTYPE html><html><head><title>Apache Tomcat/8.0.32 (Ubuntu) - Error report</title><style type="text/css">H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}.line {height: 1px; background-color: #525D76; border: none;}</style> </head><body><h1>HTTP Status 500 - Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space</h1><div class="line"></div><p><b>type</b> Exception report</p><p><b>message</b> <u>Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space</u></p><p><b>description</b> <u>The server encountered an internal error that prevented it from fulfilling this request.</u></p><p><b>exception</b></p><pre>org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'scopedTarget.geoNodeOauth2RestTemplate' defined in org.geoserver.security.oauth2.GeoNodeOAuth2SecurityConfiguration: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space\n\torg.springframework.beans.factory.support.ConstructorResolver.instantiateUsingFactoryMethod(ConstructorResolver.java:599)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.instantiateUsingFactoryMethod(AbstractAutowireCapableBeanFactory.java:1123)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1018)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:510)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:482)\n\torg.springframework.beans.factory.support.AbstractBeanFactory$2.getObject(AbstractBeanFactory.java:345)\n\torg.springframework.web.context.request.AbstractRequestAttributesScope.get(AbstractRequestAttributesScope.java:44)\n\torg.springframework.web.context.request.SessionScope.get(SessionScope.java:93)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:340)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:197)\n\torg.springframework.aop.target.SimpleBeanTargetSource.getTarget(SimpleBeanTargetSource.java:35)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.getTarget(CglibAopProxy.java:687)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:637)\n\torg.springframework.security.oauth2.client.OAuth2RestTemplate$$EnhancerBySpringCGLIB$$38d5c3e4.getOAuth2ClientContext(&lt;generated&gt;)\n\torg.geoserver.security.oauth2.GeoServerOAuthAuthenticationFilter.doFilter(GeoServerOAuthAuthenticationFilter.java:110)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilterInternal(BasicAuthenticationFilter.java:213)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.geoserver.security.filter.GeoServerBasicAuthenticationFilter.doFilter(GeoServerBasicAuthenticationFilter.java:84)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:91)\n\torg.geoserver.security.filter.GeoServerSecurityContextPersistenceFilter$1.doFilter(GeoServerSecurityContextPersistenceFilter.java:53)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:213)\n\torg.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:176)\n\torg.geoserver.security.GeoServerSecurityFilterChainProxy.doFilter(GeoServerSecurityFilterChainProxy.java:152)\n\torg.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\n\torg.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\n\torg.geoserver.filters.LoggingFilter.doFilter(LoggingFilter.java:87)\n\torg.geoserver.filters.GZIPFilter.doFilter(GZIPFilter.java:42)\n\torg.geoserver.filters.SessionDebugFilter.doFilter(SessionDebugFilter.java:48)\n\torg.geoserver.filters.FlushSafeFilter.doFilter(FlushSafeFilter.java:44)\n\torg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:121)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n</pre><p><b>root cause</b></p><pre>org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.security.oauth2.client.OAuth2RestTemplate]: Factory method 'geoServerOauth2RestTemplate' threw exception; nested exception is java.lang.OutOfMemoryError: Java heap space\n\torg.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiate(SimpleInstantiationStrategy.java:189)\n\torg.springframework.beans.factory.support.ConstructorResolver.instantiateUsingFactoryMethod(ConstructorResolver.java:588)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.instantiateUsingFactoryMethod(AbstractAutowireCapableBeanFactory.java:1123)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1018)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:510)\n\torg.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:482)\n\torg.springframework.beans.factory.support.AbstractBeanFactory$2.getObject(AbstractBeanFactory.java:345)\n\torg.springframework.web.context.request.AbstractRequestAttributesScope.get(AbstractRequestAttributesScope.java:44)\n\torg.springframework.web.context.request.SessionScope.get(SessionScope.java:93)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:340)\n\torg.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:197)\n\torg.springframework.aop.target.SimpleBeanTargetSource.getTarget(SimpleBeanTargetSource.java:35)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.getTarget(CglibAopProxy.java:687)\n\torg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:637)\n\torg.springframework.security.oauth2.client.OAuth2RestTemplate$$EnhancerBySpringCGLIB$$38d5c3e4.getOAuth2ClientContext(&lt;generated&gt;)\n\torg.geoserver.security.oauth2.GeoServerOAuthAuthenticationFilter.doFilter(GeoServerOAuthAuthenticationFilter.java:110)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilterInternal(BasicAuthenticationFilter.java:213)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.geoserver.security.filter.GeoServerBasicAuthenticationFilter.doFilter(GeoServerBasicAuthenticationFilter.java:84)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:69)\n\torg.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:91)\n\torg.geoserver.security.filter.GeoServerSecurityContextPersistenceFilter$1.doFilter(GeoServerSecurityContextPersistenceFilter.java:53)\n\torg.geoserver.security.filter.GeoServerCompositeFilter$NestedFilterChain.doFilter(GeoServerCompositeFilter.java:73)\n\torg.geoserver.security.filter.GeoServerCompositeFilter.doFilter(GeoServerCompositeFilter.java:92)\n\torg.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330)\n\torg.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:213)\n\torg.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:176)\n\torg.geoserver.security.GeoServerSecurityFilterChainProxy.doFilter(GeoServerSecurityFilterChainProxy.java:152)\n\torg.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\n\torg.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\n\torg.geoserver.filters.LoggingFilter.doFilter(LoggingFilter.java:87)\n\torg.geoserver.filters.GZIPFilter.doFilter(GZIPFilter.java:42)\n\torg.geoserver.filters.SessionDebugFilter.doFilter(SessionDebugFilter.java:48)\n\torg.geoserver.filters.FlushSafeFilter.doFilter(FlushSafeFilter.java:44)\n\torg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:121)\n\torg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n</pre><p><b>root cause</b></p><pre>java.lang.OutOfMemoryError: Java heap space\n</pre><p><b>note</b> <u>The full stack trace of the root cause is available in the Apache Tomcat/8.0.32 (Ubuntu) logs.</u></p><hr class="line"><h3>Apache Tomcat/8.0.32 (Ubuntu)</h3></body></html>\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
44	2017-11-18 15:58:28.097438-05	t	\N	\N	\N	3
45	2017-11-28 11:39:18.892545-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
46	2017-11-28 11:39:50.69988-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
47	2017-11-28 11:45:06.335569-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
48	2017-11-28 11:49:03.125949-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
49	2017-11-28 11:50:59.460066-05	f	Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default	Traceback (most recent call last):\n  File "/home/geonode/geonode/geonode/layers/views.py", line 168, in layer_upload\n    metadata_uploaded_preserve=form.cleaned_data["metadata_uploaded_preserve"]\n  File "/home/geonode/geonode/geonode/layers/utils.py", line 499, in file_upload\n    defaults=defaults\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/manager.py", line 127, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 389, in get_or_create\n    return super(MultilingualQuerySet, self).get_or_create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 407, in get_or_create\n    return self._create_object_from_params(lookup, params)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 439, in _create_object_from_params\n    obj = self.create(**params)\n  File "/usr/local/lib/python2.7/dist-packages/modeltranslation/manager.py", line 381, in create\n    return super(MultilingualQuerySet, self).create(**kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/query.py", line 348, in create\n    obj.save(force_insert=True, using=self.db)\n  File "/usr/local/lib/python2.7/dist-packages/polymorphic/models.py", line 74, in save\n    return super(PolymorphicModel, self).save(*args, **kwargs)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 734, in save\n    force_update=force_update, update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/db/models/base.py", line 758, in save_base\n    update_fields=update_fields)\n  File "/usr/local/lib/python2.7/dist-packages/django/dispatch/dispatcher.py", line 189, in send\n    response = receiver(signal=self, sender=sender, **named)\n  File "/home/geonode/geonode/geonode/geoserver/signals.py", line 93, in geoserver_pre_save\n    charset=instance.charset)\n  File "/home/geonode/geonode/geonode/geoserver/helpers.py", line 1059, in geoserver_upload\n    workspace = cat.get_default_workspace()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 1043, in get_default_workspace\n    ws.fetch()\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/support.py", line 177, in fetch\n    self.dom = self.catalog.get_xml(self.href)\n  File "/usr/local/lib/python2.7/dist-packages/geoserver/catalog.py", line 216, in get_xml\n    raise FailedRequestError("Tried to make a GET request to %s but got a %d status code: \\n%s" % (rest_url, response.status, content))\nFailedRequestError: Tried to make a GET request to http://localhost/geoserver/rest/workspaces/default.xml but got a 404 status code: \nNo such workspace: default\n	No log file at /home/geonode/geonode/geoserver/data/logs/geoserver.log	3
\.


--
-- Name: layers_uploadsession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('layers_uploadsession_id_seq', 49, true);


--
-- Data for Name: maps_map; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY maps_map (resourcebase_ptr_id, title_en, abstract_en, purpose_en, constraints_other_en, supplemental_information_en, data_quality_statement_en, zoom, projection, center_x, center_y, last_modified, urlsuffix, featuredurl) FROM stdin;
\.


--
-- Data for Name: maps_maplayer; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY maps_maplayer (id, stack_order, format, name, opacity, styles, transparent, fixed, "group", visibility, ows_url, layer_params, source_params, local, map_id) FROM stdin;
\.


--
-- Name: maps_maplayer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('maps_maplayer_id_seq', 1, false);


--
-- Data for Name: maps_mapsnapshot; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY maps_mapsnapshot (id, config, created_dttm, map_id, user_id) FROM stdin;
\.


--
-- Name: maps_mapsnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('maps_mapsnapshot_id_seq', 1, false);


--
-- Data for Name: meteorology_entry; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY meteorology_entry (id, value, year, month, "timeSeries_id") FROM stdin;
1	1.19999999999999996	2017	1	1
2	4.29999999999999982	2017	2	1
3	5.59999999999999964	2017	3	1
4	6.70000000000000018	2017	4	1
5	8.69999999999999929	2017	5	1
6	7.59999999999999964	2017	6	1
\.


--
-- Name: meteorology_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('meteorology_entry_id_seq', 6, true);


--
-- Data for Name: meteorology_station; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY meteorology_station (id, code, name, province, longitude, latitude, elevation) FROM stdin;
1	GYE	Guayaquil	Guayas	-79.9745060000000052	-2.14193200000000017	15
2	SA	Salinas	Santa Elena	-80.8446150000000046	-2.27173800000000004	10
\.


--
-- Name: meteorology_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('meteorology_station_id_seq', 2, true);


--
-- Data for Name: meteorology_timeserie; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY meteorology_timeserie (id, name, variable_id) FROM stdin;
1	General	2
2	Anomalies	2
3	Average	2
\.


--
-- Name: meteorology_timeserie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('meteorology_timeserie_id_seq', 3, true);


--
-- Data for Name: meteorology_unit; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY meteorology_unit (id, representation, description) FROM stdin;
1	C	Grado centrigrado
\.


--
-- Name: meteorology_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('meteorology_unit_id_seq', 1, true);


--
-- Data for Name: meteorology_variable; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY meteorology_variable (id, name, description, station_id, unit_id) FROM stdin;
2	Temperatura	Medicion de la temperatura	1	1
3	TSM	Temperatura superficial del mar	1	1
\.


--
-- Name: meteorology_variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('meteorology_variable_id_seq', 3, true);


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id) FROM stdin;
2	gFq6vD2g21eNMAQ9HILSsNEwqXo8Gb	2017-11-28 15:49:20.120527-05		1	3
3	7uW0R61snCcqS5rNeNrNYEmG7Jw6oC	2017-11-29 10:20:53.183529-05		1	3
4	YYqBExyDKjgToV0CeOQhEJnJVKxExB	2017-11-29 10:22:49.202762-05		1	3
5	MrS8bRGSw5HeozhJAlrF6kGje3Vtr7	2017-11-29 10:52:34.797817-05		1	3
\.


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 5, true);


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization) FROM stdin;
1	4VgXcjd4q16YM1Talf5q3BtuK161J0JKLP2tbLsj	http://localhost:8080/geoserver\r\nhttp://localhost:8080/geoserver\r\nhttp://localhost/geoserver\r\nhttp://localhost/geoserver\r\n	confidential	authorization-code	W04JeohLjbun6P9pUoohBnBJquSylQ1muumToAmj27wEJ8nPBSVzuBJXCNH9kEMVViwwSQeEKmnDpqG7b9o42bWYLBm0xPhjXFfNab1UWe5qnSjcjpbgFdTJXPmg4bS0	GeoServer	3	f
\.


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('oauth2_provider_application_id_seq', 1, true);


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id) FROM stdin;
\.


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('oauth2_provider_grant_id_seq', 1, false);


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id) FROM stdin;
\.


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Data for Name: people_profile; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY people_profile (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, organization, profile, "position", voice, fax, delivery, city, area, zipcode, country) FROM stdin;
-1		\N	f	AnonymousUser				f	t	2017-10-22 11:31:40.310129-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	pbkdf2_sha256$20000$I8Qluc00nIeo$x15K0oDNJIEILkS/0TV8vAKy0tOqrfMaG2DCAmzfhm0=	2017-11-28 10:52:34.755399-05	t	obayona			obayona@espol.edu.ec	t	t	2017-10-27 13:49:06.371648-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: people_profile_groups; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY people_profile_groups (id, profile_id, group_id) FROM stdin;
1	-1	1
4	3	1
\.


--
-- Name: people_profile_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('people_profile_groups_id_seq', 4, true);


--
-- Name: people_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('people_profile_id_seq', 3, true);


--
-- Data for Name: people_profile_user_permissions; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY people_profile_user_permissions (id, profile_id, permission_id) FROM stdin;
\.


--
-- Name: people_profile_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('people_profile_user_permissions_id_seq', 1, false);


--
-- Data for Name: services_service; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY services_service (resourcebase_ptr_id, type, method, base_url, version, name, description, online_resource, fees, access_constraints, connection_params, username, password, api_key, workspace_ref, store_ref, resources_ref, created, last_updated, first_noanswer, noanswer_retries, external_id, parent_id) FROM stdin;
\.


--
-- Data for Name: services_servicelayer; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY services_servicelayer (id, typename, title, description, styles, layer_id, service_id) FROM stdin;
\.


--
-- Name: services_servicelayer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('services_servicelayer_id_seq', 1, false);


--
-- Data for Name: services_serviceprofilerole; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY services_serviceprofilerole (id, role, profiles_id, service_id) FROM stdin;
\.


--
-- Name: services_serviceprofilerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('services_serviceprofilerole_id_seq', 1, false);


--
-- Data for Name: services_webserviceharvestlayersjob; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY services_webserviceharvestlayersjob (id, status, service_id) FROM stdin;
\.


--
-- Name: services_webserviceharvestlayersjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('services_webserviceharvestlayersjob_id_seq', 1, false);


--
-- Data for Name: services_webserviceregistrationjob; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY services_webserviceregistrationjob (id, base_url, type, status) FROM stdin;
\.


--
-- Name: services_webserviceregistrationjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('services_webserviceregistrationjob_id_seq', 1, false);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: tastypie_apiaccess; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY tastypie_apiaccess (id, identifier, url, request_method, accessed) FROM stdin;
\.


--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('tastypie_apiaccess_id_seq', 1, false);


--
-- Data for Name: tastypie_apikey; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY tastypie_apikey (id, key, created, user_id) FROM stdin;
\.


--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('tastypie_apikey_id_seq', 1, false);


--
-- Data for Name: upload_upload; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY upload_upload (id, import_id, state, date, upload_dir, name, complete, session, metadata, mosaic_time_regex, mosaic_time_value, mosaic_elev_regex, mosaic_elev_value, layer_id, user_id) FROM stdin;
\.


--
-- Name: upload_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('upload_upload_id_seq', 1, false);


--
-- Data for Name: upload_uploadfile; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY upload_uploadfile (id, file, slug, upload_id) FROM stdin;
\.


--
-- Name: upload_uploadfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('upload_uploadfile_id_seq', 1, false);


--
-- Data for Name: user_messages_message; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY user_messages_message (id, sent_at, content, sender_id, thread_id) FROM stdin;
\.


--
-- Name: user_messages_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('user_messages_message_id_seq', 1, false);


--
-- Data for Name: user_messages_thread; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY user_messages_thread (id, subject) FROM stdin;
\.


--
-- Name: user_messages_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('user_messages_thread_id_seq', 1, false);


--
-- Data for Name: user_messages_userthread; Type: TABLE DATA; Schema: public; Owner: geonode
--

COPY user_messages_userthread (id, unread, deleted, thread_id, user_id) FROM stdin;
\.


--
-- Name: user_messages_userthread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: geonode
--

SELECT pg_catalog.setval('user_messages_userthread_id_seq', 1, false);


--
-- Name: account_account_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_account
    ADD CONSTRAINT account_account_pkey PRIMARY KEY (id);


--
-- Name: account_account_user_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_account
    ADD CONSTRAINT account_account_user_id_key UNIQUE (user_id);


--
-- Name: account_accountdeletion_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_accountdeletion
    ADD CONSTRAINT account_accountdeletion_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: account_passwordexpiry_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordexpiry
    ADD CONSTRAINT account_passwordexpiry_pkey PRIMARY KEY (id);


--
-- Name: account_passwordexpiry_user_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordexpiry
    ADD CONSTRAINT account_passwordexpiry_user_id_key UNIQUE (user_id);


--
-- Name: account_passwordhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordhistory
    ADD CONSTRAINT account_passwordhistory_pkey PRIMARY KEY (id);


--
-- Name: account_signupcode_code_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcode
    ADD CONSTRAINT account_signupcode_code_key UNIQUE (code);


--
-- Name: account_signupcode_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcode
    ADD CONSTRAINT account_signupcode_pkey PRIMARY KEY (id);


--
-- Name: account_signupcoderesult_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcoderesult
    ADD CONSTRAINT account_signupcoderesult_pkey PRIMARY KEY (id);


--
-- Name: actstream_action_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT actstream_action_pkey PRIMARY KEY (id);


--
-- Name: actstream_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_pkey PRIMARY KEY (id);


--
-- Name: actstream_follow_user_id_49f02cb6d67a13f2_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_user_id_49f02cb6d67a13f2_uniq UNIQUE (user_id, content_type_id, object_id);


--
-- Name: agon_ratings_overallrating_object_id_78a5ce0f54962845_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_overallrating
    ADD CONSTRAINT agon_ratings_overallrating_object_id_78a5ce0f54962845_uniq UNIQUE (object_id, content_type_id, category);


--
-- Name: agon_ratings_overallrating_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_overallrating
    ADD CONSTRAINT agon_ratings_overallrating_pkey PRIMARY KEY (id);


--
-- Name: agon_ratings_rating_object_id_4da1400c5e739f44_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating
    ADD CONSTRAINT agon_ratings_rating_object_id_4da1400c5e739f44_uniq UNIQUE (object_id, content_type_id, user_id, category);


--
-- Name: agon_ratings_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating
    ADD CONSTRAINT agon_ratings_rating_pkey PRIMARY KEY (id);


--
-- Name: announcements_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_announcement
    ADD CONSTRAINT announcements_announcement_pkey PRIMARY KEY (id);


--
-- Name: announcements_dismissal_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_dismissal
    ADD CONSTRAINT announcements_dismissal_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: avatar_avatar_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY avatar_avatar
    ADD CONSTRAINT avatar_avatar_pkey PRIMARY KEY (id);


--
-- Name: base_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_backup
    ADD CONSTRAINT base_backup_pkey PRIMARY KEY (id);


--
-- Name: base_contactrole_contact_id_200c61c2eed7063c_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_contactrole
    ADD CONSTRAINT base_contactrole_contact_id_200c61c2eed7063c_uniq UNIQUE (contact_id, resource_id, role);


--
-- Name: base_contactrole_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_contactrole
    ADD CONSTRAINT base_contactrole_pkey PRIMARY KEY (id);


--
-- Name: base_hierarchicalkeyword_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_hierarchicalkeyword
    ADD CONSTRAINT base_hierarchicalkeyword_name_key UNIQUE (name);


--
-- Name: base_hierarchicalkeyword_path_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_hierarchicalkeyword
    ADD CONSTRAINT base_hierarchicalkeyword_path_key UNIQUE (path);


--
-- Name: base_hierarchicalkeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_hierarchicalkeyword
    ADD CONSTRAINT base_hierarchicalkeyword_pkey PRIMARY KEY (id);


--
-- Name: base_hierarchicalkeyword_slug_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_hierarchicalkeyword
    ADD CONSTRAINT base_hierarchicalkeyword_slug_key UNIQUE (slug);


--
-- Name: base_license_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_license
    ADD CONSTRAINT base_license_pkey PRIMARY KEY (id);


--
-- Name: base_link_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_link
    ADD CONSTRAINT base_link_pkey PRIMARY KEY (id);


--
-- Name: base_region_code_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_region
    ADD CONSTRAINT base_region_code_key UNIQUE (code);


--
-- Name: base_region_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_region
    ADD CONSTRAINT base_region_pkey PRIMARY KEY (id);


--
-- Name: base_resourcebase_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT base_resourcebase_pkey PRIMARY KEY (id);


--
-- Name: base_resourcebase_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_regions
    ADD CONSTRAINT base_resourcebase_regions_pkey PRIMARY KEY (id);


--
-- Name: base_resourcebase_regions_resourcebase_id_region_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_regions
    ADD CONSTRAINT base_resourcebase_regions_resourcebase_id_region_id_key UNIQUE (resourcebase_id, region_id);


--
-- Name: base_resourcebase_tkeywords_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_tkeywords
    ADD CONSTRAINT base_resourcebase_tkeywords_pkey PRIMARY KEY (id);


--
-- Name: base_resourcebase_tkeywords_resourcebase_id_thesauruskeywor_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_tkeywords
    ADD CONSTRAINT base_resourcebase_tkeywords_resourcebase_id_thesauruskeywor_key UNIQUE (resourcebase_id, thesauruskeyword_id);


--
-- Name: base_restrictioncodetype_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_restrictioncodetype
    ADD CONSTRAINT base_restrictioncodetype_pkey PRIMARY KEY (id);


--
-- Name: base_spatialrepresentationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_spatialrepresentationtype
    ADD CONSTRAINT base_spatialrepresentationtype_pkey PRIMARY KEY (id);


--
-- Name: base_taggedcontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_taggedcontentitem
    ADD CONSTRAINT base_taggedcontentitem_pkey PRIMARY KEY (id);


--
-- Name: base_thesaurus_identifier_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesaurus
    ADD CONSTRAINT base_thesaurus_identifier_key UNIQUE (identifier);


--
-- Name: base_thesaurus_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesaurus
    ADD CONSTRAINT base_thesaurus_pkey PRIMARY KEY (id);


--
-- Name: base_thesauruskeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeyword
    ADD CONSTRAINT base_thesauruskeyword_pkey PRIMARY KEY (id);


--
-- Name: base_thesauruskeyword_thesaurus_id_3002ef6ea617c67b_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeyword
    ADD CONSTRAINT base_thesauruskeyword_thesaurus_id_3002ef6ea617c67b_uniq UNIQUE (thesaurus_id, alt_label);


--
-- Name: base_thesauruskeywordlabel_keyword_id_df4adfe4b86d3c8_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeywordlabel
    ADD CONSTRAINT base_thesauruskeywordlabel_keyword_id_df4adfe4b86d3c8_uniq UNIQUE (keyword_id, lang);


--
-- Name: base_thesauruskeywordlabel_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeywordlabel
    ADD CONSTRAINT base_thesauruskeywordlabel_pkey PRIMARY KEY (id);


--
-- Name: base_topiccategory_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_topiccategory
    ADD CONSTRAINT base_topiccategory_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: dialogos_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY dialogos_comment
    ADD CONSTRAINT dialogos_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: documents_document_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY documents_document
    ADD CONSTRAINT documents_document_pkey PRIMARY KEY (resourcebase_ptr_id);


--
-- Name: groups_groupinvitation_group_id_103432029110e1_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation
    ADD CONSTRAINT groups_groupinvitation_group_id_103432029110e1_uniq UNIQUE (group_id, email);


--
-- Name: groups_groupinvitation_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation
    ADD CONSTRAINT groups_groupinvitation_pkey PRIMARY KEY (id);


--
-- Name: groups_groupmember_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupmember
    ADD CONSTRAINT groups_groupmember_pkey PRIMARY KEY (id);


--
-- Name: groups_groupprofile_group_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupprofile
    ADD CONSTRAINT groups_groupprofile_group_id_key UNIQUE (group_id);


--
-- Name: groups_groupprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupprofile
    ADD CONSTRAINT groups_groupprofile_pkey PRIMARY KEY (id);


--
-- Name: groups_groupprofile_slug_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupprofile
    ADD CONSTRAINT groups_groupprofile_slug_key UNIQUE (slug);


--
-- Name: guardian_groupobjectpermission_group_id_1692da556eb7175b_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_1692da556eb7175b_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_3d019018f740de5f_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_3d019018f740de5f_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: layers_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_attribute
    ADD CONSTRAINT layers_attribute_pkey PRIMARY KEY (id);


--
-- Name: layers_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer
    ADD CONSTRAINT layers_layer_pkey PRIMARY KEY (resourcebase_ptr_id);


--
-- Name: layers_layer_styles_layer_id_style_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer_styles
    ADD CONSTRAINT layers_layer_styles_layer_id_style_id_key UNIQUE (layer_id, style_id);


--
-- Name: layers_layer_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer_styles
    ADD CONSTRAINT layers_layer_styles_pkey PRIMARY KEY (id);


--
-- Name: layers_layerfile_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layerfile
    ADD CONSTRAINT layers_layerfile_pkey PRIMARY KEY (id);


--
-- Name: layers_style_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_style
    ADD CONSTRAINT layers_style_name_key UNIQUE (name);


--
-- Name: layers_style_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_style
    ADD CONSTRAINT layers_style_pkey PRIMARY KEY (id);


--
-- Name: layers_uploadsession_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_uploadsession
    ADD CONSTRAINT layers_uploadsession_pkey PRIMARY KEY (id);


--
-- Name: maps_map_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_map
    ADD CONSTRAINT maps_map_pkey PRIMARY KEY (resourcebase_ptr_id);


--
-- Name: maps_maplayer_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_maplayer
    ADD CONSTRAINT maps_maplayer_pkey PRIMARY KEY (id);


--
-- Name: maps_mapsnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_mapsnapshot
    ADD CONSTRAINT maps_mapsnapshot_pkey PRIMARY KEY (id);


--
-- Name: meteorology_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_entry
    ADD CONSTRAINT meteorology_entry_pkey PRIMARY KEY (id);


--
-- Name: meteorology_station_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_station
    ADD CONSTRAINT meteorology_station_pkey PRIMARY KEY (id);


--
-- Name: meteorology_timeserie_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_timeserie
    ADD CONSTRAINT meteorology_timeserie_pkey PRIMARY KEY (id);


--
-- Name: meteorology_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_unit
    ADD CONSTRAINT meteorology_unit_pkey PRIMARY KEY (id);


--
-- Name: meteorology_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_variable
    ADD CONSTRAINT meteorology_variable_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken_token_3f77f86fb4ecbe0f_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_3f77f86fb4ecbe0f_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant_code_a5c88732687483b_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_a5c88732687483b_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken_token_1e4e9388e6a22527_uniq; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_1e4e9388e6a22527_uniq UNIQUE (token);


--
-- Name: people_profile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_groups
    ADD CONSTRAINT people_profile_groups_pkey PRIMARY KEY (id);


--
-- Name: people_profile_groups_profile_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_groups
    ADD CONSTRAINT people_profile_groups_profile_id_group_id_key UNIQUE (profile_id, group_id);


--
-- Name: people_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile
    ADD CONSTRAINT people_profile_pkey PRIMARY KEY (id);


--
-- Name: people_profile_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_user_permissions
    ADD CONSTRAINT people_profile_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: people_profile_user_permissions_profile_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_user_permissions
    ADD CONSTRAINT people_profile_user_permissions_profile_id_permission_id_key UNIQUE (profile_id, permission_id);


--
-- Name: people_profile_username_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile
    ADD CONSTRAINT people_profile_username_key UNIQUE (username);


--
-- Name: services_service_base_url_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_service
    ADD CONSTRAINT services_service_base_url_key UNIQUE (base_url);


--
-- Name: services_service_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_service
    ADD CONSTRAINT services_service_name_key UNIQUE (name);


--
-- Name: services_service_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_service
    ADD CONSTRAINT services_service_pkey PRIMARY KEY (resourcebase_ptr_id);


--
-- Name: services_servicelayer_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_servicelayer
    ADD CONSTRAINT services_servicelayer_pkey PRIMARY KEY (id);


--
-- Name: services_serviceprofilerole_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_serviceprofilerole
    ADD CONSTRAINT services_serviceprofilerole_pkey PRIMARY KEY (id);


--
-- Name: services_webserviceharvestlayersjob_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceharvestlayersjob
    ADD CONSTRAINT services_webserviceharvestlayersjob_pkey PRIMARY KEY (id);


--
-- Name: services_webserviceharvestlayersjob_service_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceharvestlayersjob
    ADD CONSTRAINT services_webserviceharvestlayersjob_service_id_key UNIQUE (service_id);


--
-- Name: services_webserviceregistrationjob_base_url_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceregistrationjob
    ADD CONSTRAINT services_webserviceregistrationjob_base_url_key UNIQUE (base_url);


--
-- Name: services_webserviceregistrationjob_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceregistrationjob
    ADD CONSTRAINT services_webserviceregistrationjob_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apiaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apiaccess
    ADD CONSTRAINT tastypie_apiaccess_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apikey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_key UNIQUE (user_id);


--
-- Name: upload_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_upload
    ADD CONSTRAINT upload_upload_pkey PRIMARY KEY (id);


--
-- Name: upload_uploadfile_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_uploadfile
    ADD CONSTRAINT upload_uploadfile_pkey PRIMARY KEY (id);


--
-- Name: user_messages_message_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_message
    ADD CONSTRAINT user_messages_message_pkey PRIMARY KEY (id);


--
-- Name: user_messages_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_thread
    ADD CONSTRAINT user_messages_thread_pkey PRIMARY KEY (id);


--
-- Name: user_messages_userthread_pkey; Type: CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_userthread
    ADD CONSTRAINT user_messages_userthread_pkey PRIMARY KEY (id);


--
-- Name: account_accountdeletion_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_accountdeletion_e8701ad4 ON account_accountdeletion USING btree (user_id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_206527469d8e1918_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_emailaddress_email_206527469d8e1918_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_7033a271201d424f_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_emailconfirmation_key_7033a271201d424f_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: account_passwordhistory_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_passwordhistory_e8701ad4 ON account_passwordhistory USING btree (user_id);


--
-- Name: account_signupcode_code_455425ce5a0e449b_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_signupcode_code_455425ce5a0e449b_like ON account_signupcode USING btree (code varchar_pattern_ops);


--
-- Name: account_signupcode_d9678107; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_signupcode_d9678107 ON account_signupcode USING btree (inviter_id);


--
-- Name: account_signupcoderesult_819faee9; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_signupcoderesult_819faee9 ON account_signupcoderesult USING btree (signup_code_id);


--
-- Name: account_signupcoderesult_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX account_signupcoderesult_e8701ad4 ON account_signupcoderesult USING btree (user_id);


--
-- Name: actstream_action_142874d9; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_142874d9 ON actstream_action USING btree (action_object_content_type_id);


--
-- Name: actstream_action_1cd2a6ae; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_1cd2a6ae ON actstream_action USING btree (target_object_id);


--
-- Name: actstream_action_4c9184f3; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_4c9184f3 ON actstream_action USING btree (public);


--
-- Name: actstream_action_53a09d9a; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_53a09d9a ON actstream_action USING btree (actor_content_type_id);


--
-- Name: actstream_action_9063443c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_9063443c ON actstream_action USING btree (action_object_object_id);


--
-- Name: actstream_action_action_object_object_id_2e33a3d4d877205f_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_action_object_object_id_2e33a3d4d877205f_like ON actstream_action USING btree (action_object_object_id varchar_pattern_ops);


--
-- Name: actstream_action_actor_object_id_6c93edc3fe0bc300_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_actor_object_id_6c93edc3fe0bc300_like ON actstream_action USING btree (actor_object_id varchar_pattern_ops);


--
-- Name: actstream_action_b512ddf1; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_b512ddf1 ON actstream_action USING btree (verb);


--
-- Name: actstream_action_c4f7c191; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_c4f7c191 ON actstream_action USING btree (actor_object_id);


--
-- Name: actstream_action_d7e6d55b; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_d7e6d55b ON actstream_action USING btree ("timestamp");


--
-- Name: actstream_action_e4f9dcc7; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_e4f9dcc7 ON actstream_action USING btree (target_content_type_id);


--
-- Name: actstream_action_target_object_id_7ca7b19f4e9f7a2f_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_target_object_id_7ca7b19f4e9f7a2f_like ON actstream_action USING btree (target_object_id varchar_pattern_ops);


--
-- Name: actstream_action_verb_4670610ba8e8043_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_action_verb_4670610ba8e8043_like ON actstream_action USING btree (verb varchar_pattern_ops);


--
-- Name: actstream_follow_3bebb2f8; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_follow_3bebb2f8 ON actstream_follow USING btree (started);


--
-- Name: actstream_follow_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_follow_417f1b1c ON actstream_follow USING btree (content_type_id);


--
-- Name: actstream_follow_af31437c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_follow_af31437c ON actstream_follow USING btree (object_id);


--
-- Name: actstream_follow_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_follow_e8701ad4 ON actstream_follow USING btree (user_id);


--
-- Name: actstream_follow_object_id_42f751fb772fddb3_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX actstream_follow_object_id_42f751fb772fddb3_like ON actstream_follow USING btree (object_id varchar_pattern_ops);


--
-- Name: agon_ratings_overallrating_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_overallrating_417f1b1c ON agon_ratings_overallrating USING btree (content_type_id);


--
-- Name: agon_ratings_overallrating_af31437c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_overallrating_af31437c ON agon_ratings_overallrating USING btree (object_id);


--
-- Name: agon_ratings_rating_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_rating_417f1b1c ON agon_ratings_rating USING btree (content_type_id);


--
-- Name: agon_ratings_rating_af31437c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_rating_af31437c ON agon_ratings_rating USING btree (object_id);


--
-- Name: agon_ratings_rating_c32276b6; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_rating_c32276b6 ON agon_ratings_rating USING btree (overall_rating_id);


--
-- Name: agon_ratings_rating_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX agon_ratings_rating_e8701ad4 ON agon_ratings_rating USING btree (user_id);


--
-- Name: announcements_announcement_3700153c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX announcements_announcement_3700153c ON announcements_announcement USING btree (creator_id);


--
-- Name: announcements_dismissal_b45f7c99; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX announcements_dismissal_b45f7c99 ON announcements_dismissal USING btree (announcement_id);


--
-- Name: announcements_dismissal_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX announcements_dismissal_e8701ad4 ON announcements_dismissal USING btree (user_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: avatar_avatar_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX avatar_avatar_e8701ad4 ON avatar_avatar USING btree (user_id);


--
-- Name: base_contactrole_6d82f13d; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_contactrole_6d82f13d ON base_contactrole USING btree (contact_id);


--
-- Name: base_contactrole_e2f3ef5b; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_contactrole_e2f3ef5b ON base_contactrole USING btree (resource_id);


--
-- Name: base_hierarchicalkeyword_name_9a549fea33d659e_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_hierarchicalkeyword_name_9a549fea33d659e_like ON base_hierarchicalkeyword USING btree (name varchar_pattern_ops);


--
-- Name: base_hierarchicalkeyword_path_c538237db4790f2_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_hierarchicalkeyword_path_c538237db4790f2_like ON base_hierarchicalkeyword USING btree (path varchar_pattern_ops);


--
-- Name: base_hierarchicalkeyword_slug_1a5bf37ed2642166_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_hierarchicalkeyword_slug_1a5bf37ed2642166_like ON base_hierarchicalkeyword USING btree (slug varchar_pattern_ops);


--
-- Name: base_link_e2f3ef5b; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_link_e2f3ef5b ON base_link USING btree (resource_id);


--
-- Name: base_region_3cfbd988; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_3cfbd988 ON base_region USING btree (rght);


--
-- Name: base_region_656442a0; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_656442a0 ON base_region USING btree (tree_id);


--
-- Name: base_region_6be37982; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_6be37982 ON base_region USING btree (parent_id);


--
-- Name: base_region_c9e9a848; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_c9e9a848 ON base_region USING btree (level);


--
-- Name: base_region_caf7cc51; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_caf7cc51 ON base_region USING btree (lft);


--
-- Name: base_region_code_5c91c2ff04db7251_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_region_code_5c91c2ff04db7251_like ON base_region USING btree (code varchar_pattern_ops);


--
-- Name: base_resourcebase_366393cd; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_366393cd ON base_resourcebase USING btree (license_id);


--
-- Name: base_resourcebase_5e7b1936; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_5e7b1936 ON base_resourcebase USING btree (owner_id);


--
-- Name: base_resourcebase_78eccdf7; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_78eccdf7 ON base_resourcebase USING btree (restriction_code_type_id);


--
-- Name: base_resourcebase_b583a629; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_b583a629 ON base_resourcebase USING btree (category_id);


--
-- Name: base_resourcebase_d12af31d; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_d12af31d ON base_resourcebase USING btree (spatial_representation_type_id);


--
-- Name: base_resourcebase_d3e32c49; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_d3e32c49 ON base_resourcebase USING btree (polymorphic_ctype_id);


--
-- Name: base_resourcebase_regions_0f442f96; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_regions_0f442f96 ON base_resourcebase_regions USING btree (region_id);


--
-- Name: base_resourcebase_regions_d31e16f1; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_regions_d31e16f1 ON base_resourcebase_regions USING btree (resourcebase_id);


--
-- Name: base_resourcebase_tkeywords_d31e16f1; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_tkeywords_d31e16f1 ON base_resourcebase_tkeywords USING btree (resourcebase_id);


--
-- Name: base_resourcebase_tkeywords_e0f614b7; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_resourcebase_tkeywords_e0f614b7 ON base_resourcebase_tkeywords USING btree (thesauruskeyword_id);


--
-- Name: base_taggedcontentitem_09a80f33; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_taggedcontentitem_09a80f33 ON base_taggedcontentitem USING btree (content_object_id);


--
-- Name: base_taggedcontentitem_76f094bc; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_taggedcontentitem_76f094bc ON base_taggedcontentitem USING btree (tag_id);


--
-- Name: base_thesaurus_identifier_4e566348455656fa_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_thesaurus_identifier_4e566348455656fa_like ON base_thesaurus USING btree (identifier varchar_pattern_ops);


--
-- Name: base_thesauruskeyword_808b7ae9; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_thesauruskeyword_808b7ae9 ON base_thesauruskeyword USING btree (thesaurus_id);


--
-- Name: base_thesauruskeywordlabel_5c003bba; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX base_thesauruskeywordlabel_5c003bba ON base_thesauruskeywordlabel USING btree (keyword_id);


--
-- Name: celery_taskmeta_662f707d; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX celery_taskmeta_662f707d ON celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_1efd6ed1da631331_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX celery_taskmeta_task_id_1efd6ed1da631331_like ON celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_662f707d; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX celery_tasksetmeta_662f707d ON celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_24b26c359742c9ab_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX celery_tasksetmeta_taskset_id_24b26c359742c9ab_like ON celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: dialogos_comment_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX dialogos_comment_417f1b1c ON dialogos_comment USING btree (content_type_id);


--
-- Name: dialogos_comment_4f331e2f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX dialogos_comment_4f331e2f ON dialogos_comment USING btree (author_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djcelery_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_periodictask_1dcd7040 ON djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_periodictask_f3f0d72a ON djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_name_47c621f8dc029d22_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_periodictask_name_47c621f8dc029d22_like ON djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_662f707d; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_662f707d ON djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_863bb2ee; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_863bb2ee ON djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_9ed39e2e; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_9ed39e2e ON djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_b068931c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_b068931c ON djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_ce77e6ef; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_ce77e6ef ON djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_taskstate_name_4337b4449e8827d_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_name_4337b4449e8827d_like ON djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state_19cb9b39780e399c_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_state_19cb9b39780e399c_like ON djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_29366bc6dcd6fd60_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_taskstate_task_id_29366bc6dcd6fd60_like ON djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_workerstate_f129901a; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_workerstate_f129901a ON djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djcelery_workerstate_hostname_3900851044588416_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX djcelery_workerstate_hostname_3900851044588416_like ON djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: documents_document_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX documents_document_417f1b1c ON documents_document USING btree (content_type_id);


--
-- Name: groups_groupinvitation_0e939a4f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupinvitation_0e939a4f ON groups_groupinvitation USING btree (group_id);


--
-- Name: groups_groupinvitation_6b4f059f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupinvitation_6b4f059f ON groups_groupinvitation USING btree (from_user_id);


--
-- Name: groups_groupinvitation_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupinvitation_e8701ad4 ON groups_groupinvitation USING btree (user_id);


--
-- Name: groups_groupmember_0e939a4f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupmember_0e939a4f ON groups_groupmember USING btree (group_id);


--
-- Name: groups_groupmember_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupmember_e8701ad4 ON groups_groupmember USING btree (user_id);


--
-- Name: groups_groupprofile_slug_6b92e51b821612fc_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX groups_groupprofile_slug_6b92e51b821612fc_like ON groups_groupprofile USING btree (slug varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_0e939a4f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_groupobjectpermission_0e939a4f ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_groupobjectpermission_417f1b1c ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_groupobjectpermission_8373b171 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_userobjectpermission_417f1b1c ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_userobjectpermission_8373b171 ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX guardian_userobjectpermission_e8701ad4 ON guardian_userobjectpermission USING btree (user_id);


--
-- Name: layers_attribute_7a39a38c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_attribute_7a39a38c ON layers_attribute USING btree (layer_id);


--
-- Name: layers_layer_d3785984; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_layer_d3785984 ON layers_layer USING btree (default_style_id);


--
-- Name: layers_layer_d87a0fa8; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_layer_d87a0fa8 ON layers_layer USING btree (upload_session_id);


--
-- Name: layers_layer_styles_528292b4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_layer_styles_528292b4 ON layers_layer_styles USING btree (style_id);


--
-- Name: layers_layer_styles_7a39a38c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_layer_styles_7a39a38c ON layers_layer_styles USING btree (layer_id);


--
-- Name: layers_layerfile_d87a0fa8; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_layerfile_d87a0fa8 ON layers_layerfile USING btree (upload_session_id);


--
-- Name: layers_style_name_457ffc63b583f778_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_style_name_457ffc63b583f778_like ON layers_style USING btree (name varchar_pattern_ops);


--
-- Name: layers_uploadsession_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX layers_uploadsession_e8701ad4 ON layers_uploadsession USING btree (user_id);


--
-- Name: maps_maplayer_728797e9; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX maps_maplayer_728797e9 ON maps_maplayer USING btree (map_id);


--
-- Name: maps_mapsnapshot_728797e9; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX maps_mapsnapshot_728797e9 ON maps_mapsnapshot USING btree (map_id);


--
-- Name: maps_mapsnapshot_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX maps_mapsnapshot_e8701ad4 ON maps_mapsnapshot USING btree (user_id);


--
-- Name: meteorology_entry_4d81b78a; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX meteorology_entry_4d81b78a ON meteorology_entry USING btree ("timeSeries_id");


--
-- Name: meteorology_timeserie_59bc5ce5; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX meteorology_timeserie_59bc5ce5 ON meteorology_timeserie USING btree (variable_id);


--
-- Name: meteorology_variable_c04dd157; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX meteorology_variable_c04dd157 ON meteorology_variable USING btree (station_id);


--
-- Name: meteorology_variable_e8175980; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX meteorology_variable_e8175980 ON meteorology_variable USING btree (unit_id);


--
-- Name: oauth2_provider_accesstoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_accesstoken_6bc0a4eb ON oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_accesstoken_e8701ad4 ON oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_9d667c2b; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_application_9d667c2b ON oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_id_58c909672dac14b2_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_application_client_id_58c909672dac14b2_like ON oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_7a03c41cdcace5e9_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_application_client_secret_7a03c41cdcace5e9_like ON oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_application_e8701ad4 ON oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_6bc0a4eb; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_grant_6bc0a4eb ON oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_grant_e8701ad4 ON oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_refreshtoken_6bc0a4eb ON oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX oauth2_provider_refreshtoken_e8701ad4 ON oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: people_profile_groups_0e939a4f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX people_profile_groups_0e939a4f ON people_profile_groups USING btree (group_id);


--
-- Name: people_profile_groups_83a0eb3f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX people_profile_groups_83a0eb3f ON people_profile_groups USING btree (profile_id);


--
-- Name: people_profile_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX people_profile_user_permissions_8373b171 ON people_profile_user_permissions USING btree (permission_id);


--
-- Name: people_profile_user_permissions_83a0eb3f; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX people_profile_user_permissions_83a0eb3f ON people_profile_user_permissions USING btree (profile_id);


--
-- Name: people_profile_username_79ae402c2585643a_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX people_profile_username_79ae402c2585643a_like ON people_profile USING btree (username varchar_pattern_ops);


--
-- Name: services_service_6be37982; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_service_6be37982 ON services_service USING btree (parent_id);


--
-- Name: services_service_base_url_7ec25cc4ba716240_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_service_base_url_7ec25cc4ba716240_like ON services_service USING btree (base_url varchar_pattern_ops);


--
-- Name: services_service_name_3b7e1895ab344468_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_service_name_3b7e1895ab344468_like ON services_service USING btree (name varchar_pattern_ops);


--
-- Name: services_servicelayer_7a39a38c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_servicelayer_7a39a38c ON services_servicelayer USING btree (layer_id);


--
-- Name: services_servicelayer_b0dc1e29; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_servicelayer_b0dc1e29 ON services_servicelayer USING btree (service_id);


--
-- Name: services_serviceprofilerole_246c83c5; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_serviceprofilerole_246c83c5 ON services_serviceprofilerole USING btree (profiles_id);


--
-- Name: services_serviceprofilerole_b0dc1e29; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_serviceprofilerole_b0dc1e29 ON services_serviceprofilerole USING btree (service_id);


--
-- Name: services_webserviceregistrationj_base_url_1c807c6f4bc2d982_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX services_webserviceregistrationj_base_url_1c807c6f4bc2d982_like ON services_webserviceregistrationjob USING btree (base_url varchar_pattern_ops);


--
-- Name: taggit_tag_name_4ed9aad194b72af1_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_tag_name_4ed9aad194b72af1_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_703438030cd922a7_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_tag_slug_703438030cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: tastypie_apikey_3c6e0b8a; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX tastypie_apikey_3c6e0b8a ON tastypie_apikey USING btree (key);


--
-- Name: tastypie_apikey_key_b86d63920e5bbcb_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX tastypie_apikey_key_b86d63920e5bbcb_like ON tastypie_apikey USING btree (key varchar_pattern_ops);


--
-- Name: upload_upload_7a39a38c; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX upload_upload_7a39a38c ON upload_upload USING btree (layer_id);


--
-- Name: upload_upload_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX upload_upload_e8701ad4 ON upload_upload USING btree (user_id);


--
-- Name: upload_uploadfile_23d3d4ae; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX upload_uploadfile_23d3d4ae ON upload_uploadfile USING btree (upload_id);


--
-- Name: upload_uploadfile_2dbcba41; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX upload_uploadfile_2dbcba41 ON upload_uploadfile USING btree (slug);


--
-- Name: upload_uploadfile_slug_30d5291a9c54a97a_like; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX upload_uploadfile_slug_30d5291a9c54a97a_like ON upload_uploadfile USING btree (slug varchar_pattern_ops);


--
-- Name: user_messages_message_924b1846; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX user_messages_message_924b1846 ON user_messages_message USING btree (sender_id);


--
-- Name: user_messages_message_e3464c97; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX user_messages_message_e3464c97 ON user_messages_message USING btree (thread_id);


--
-- Name: user_messages_userthread_e3464c97; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX user_messages_userthread_e3464c97 ON user_messages_userthread USING btree (thread_id);


--
-- Name: user_messages_userthread_e8701ad4; Type: INDEX; Schema: public; Owner: geonode
--

CREATE INDEX user_messages_userthread_e8701ad4 ON user_messages_userthread USING btree (user_id);


--
-- Name: D2a12d0e2faf277dc66c05213d0b0fbf; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D2a12d0e2faf277dc66c05213d0b0fbf" FOREIGN KEY (target_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D3777337be8ace959a3bccac7f2b601d; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D3777337be8ace959a3bccac7f2b601d" FOREIGN KEY (action_object_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D47397aaeaa2cb394fe1d56520db7f1a; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_tkeywords
    ADD CONSTRAINT "D47397aaeaa2cb394fe1d56520db7f1a" FOREIGN KEY (thesauruskeyword_id) REFERENCES base_thesauruskeyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D6f27058a0edec0b6bbc9b18efa8a484; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_webserviceharvestlayersjob
    ADD CONSTRAINT "D6f27058a0edec0b6bbc9b18efa8a484" FOREIGN KEY (service_id) REFERENCES services_service(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D7733692032a50f3a0aab575e00bb6e4; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D7733692032a50f3a0aab575e00bb6e4" FOREIGN KEY (actor_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D92b8c8454c94921c8f17ac3c4c109a0; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_serviceprofilerole
    ADD CONSTRAINT "D92b8c8454c94921c8f17ac3c4c109a0" FOREIGN KEY (service_id) REFERENCES services_service(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D9aead397b25d8154e554023da34d33b; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT "D9aead397b25d8154e554023da34d33b" FOREIGN KEY (access_token_id) REFERENCES oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: a17250f96ea449de36002be9c6c6acfb; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT a17250f96ea449de36002be9c6c6acfb FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ac_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT ac_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accoun_signup_code_id_6723bc43127309ef_fk_account_signupcode_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcoderesult
    ADD CONSTRAINT accoun_signup_code_id_6723bc43127309ef_fk_account_signupcode_id FOREIGN KEY (signup_code_id) REFERENCES account_signupcode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_account_user_id_c5f440932a9ad6b_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_account
    ADD CONSTRAINT account_account_user_id_c5f440932a9ad6b_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_accountde_user_id_2d7887738a43fedd_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_accountdeletion
    ADD CONSTRAINT account_accountde_user_id_2d7887738a43fedd_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddr_user_id_5c85949e40d9a61d_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddr_user_id_5c85949e40d9a61d_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_passworde_user_id_5f8829ebad639caf_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordexpiry
    ADD CONSTRAINT account_passworde_user_id_5f8829ebad639caf_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_passwordh_user_id_4720eeacca90a8e7_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_passwordhistory
    ADD CONSTRAINT account_passwordh_user_id_4720eeacca90a8e7_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_signup_inviter_id_7afa40ab6c43c9b1_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcode
    ADD CONSTRAINT account_signup_inviter_id_7afa40ab6c43c9b1_fk_people_profile_id FOREIGN KEY (inviter_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_signupcod_user_id_25e9d8ed65b0b4ff_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY account_signupcoderesult
    ADD CONSTRAINT account_signupcod_user_id_25e9d8ed65b0b4ff_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acts_content_type_id_30a29286dd004af8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT acts_content_type_id_30a29286dd004af8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: actstream_follow_user_id_2dbe1c43431b23ab_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_user_id_2dbe1c43431b23ab_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agon_content_type_id_4c0cc28f55536145_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating
    ADD CONSTRAINT agon_content_type_id_4c0cc28f55536145_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agon_content_type_id_6549986451e044fd_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_overallrating
    ADD CONSTRAINT agon_content_type_id_6549986451e044fd_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agon_ratings_rati_user_id_4a08f08374f7b7e8_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating
    ADD CONSTRAINT agon_ratings_rati_user_id_4a08f08374f7b7e8_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: announcements__creator_id_2550b7236088e5a3_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_announcement
    ADD CONSTRAINT announcements__creator_id_2550b7236088e5a3_fk_people_profile_id FOREIGN KEY (creator_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: announcements_dism_user_id_7beccd0fc07a2ee_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_dismissal
    ADD CONSTRAINT announcements_dism_user_id_7beccd0fc07a2ee_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: avatar_avatar_user_id_341d933ad2f6973_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY avatar_avatar
    ADD CONSTRAINT avatar_avatar_user_id_341d933ad2f6973_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: b28cf3a0ecffad4119bf626b00adb134; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT b28cf3a0ecffad4119bf626b00adb134 FOREIGN KEY (spatial_representation_type_id) REFERENCES base_spatialrepresentationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: b904224de61391c19ce1f779154bd840; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT b904224de61391c19ce1f779154bd840 FOREIGN KEY (restriction_code_type_id) REFERENCES base_restrictioncodetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_conta_resource_id_70b5a06834aae1b0_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_contactrole
    ADD CONSTRAINT base_conta_resource_id_70b5a06834aae1b0_fk_base_resourcebase_id FOREIGN KEY (resource_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_contactro_contact_id_78e948b0ab7d5335_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_contactrole
    ADD CONSTRAINT base_contactro_contact_id_78e948b0ab7d5335_fk_people_profile_id FOREIGN KEY (contact_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_link_resource_id_66e83afffae8bd81_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_link
    ADD CONSTRAINT base_link_resource_id_66e83afffae8bd81_fk_base_resourcebase_id FOREIGN KEY (resource_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_r_resourcebase_id_2c3e5e41baa89d71_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_regions
    ADD CONSTRAINT base_r_resourcebase_id_2c3e5e41baa89d71_fk_base_resourcebase_id FOREIGN KEY (resourcebase_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_re_resourcebase_id_d70dfc3f59d3f72_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_tkeywords
    ADD CONSTRAINT base_re_resourcebase_id_d70dfc3f59d3f72_fk_base_resourcebase_id FOREIGN KEY (resourcebase_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_region_parent_id_58b0699f710491a7_fk_base_region_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_region
    ADD CONSTRAINT base_region_parent_id_58b0699f710491a7_fk_base_region_id FOREIGN KEY (parent_id) REFERENCES base_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_reso_category_id_75f2899677ebd986_fk_base_topiccategory_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT base_reso_category_id_75f2899677ebd986_fk_base_topiccategory_id FOREIGN KEY (category_id) REFERENCES base_topiccategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_resourcebas_license_id_5b1cc004d70f9080_fk_base_license_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT base_resourcebas_license_id_5b1cc004d70f9080_fk_base_license_id FOREIGN KEY (license_id) REFERENCES base_license(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_resourcebas_owner_id_350049c3c6215b52_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT base_resourcebas_owner_id_350049c3c6215b52_fk_people_profile_id FOREIGN KEY (owner_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_resourcebase__region_id_480f98f1634268b2_fk_base_region_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase_regions
    ADD CONSTRAINT base_resourcebase__region_id_480f98f1634268b2_fk_base_region_id FOREIGN KEY (region_id) REFERENCES base_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_t_content_object_id_de57069b4726af_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_taggedcontentitem
    ADD CONSTRAINT base_t_content_object_id_de57069b4726af_fk_base_resourcebase_id FOREIGN KEY (content_object_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_tag_tag_id_24aeaaf4fb152233_fk_base_hierarchicalkeyword_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_taggedcontentitem
    ADD CONSTRAINT base_tag_tag_id_24aeaaf4fb152233_fk_base_hierarchicalkeyword_id FOREIGN KEY (tag_id) REFERENCES base_hierarchicalkeyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_th_keyword_id_721fe66a19bebfeb_fk_base_thesauruskeyword_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeywordlabel
    ADD CONSTRAINT base_th_keyword_id_721fe66a19bebfeb_fk_base_thesauruskeyword_id FOREIGN KEY (keyword_id) REFERENCES base_thesauruskeyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_thesaur_thesaurus_id_7969eb87a6a3fd75_fk_base_thesaurus_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_thesauruskeyword
    ADD CONSTRAINT base_thesaur_thesaurus_id_7969eb87a6a3fd75_fk_base_thesaurus_id FOREIGN KEY (thesaurus_id) REFERENCES base_thesaurus(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c82b7789df725bc603507425d1801bfa; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_service
    ADD CONSTRAINT c82b7789df725bc603507425d1801bfa FOREIGN KEY (parent_id) REFERENCES services_service(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: da2196e2988877260c8db8e9bb03265e; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT da2196e2988877260c8db8e9bb03265e FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dial_content_type_id_22d30df4434fdefc_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY dialogos_comment
    ADD CONSTRAINT dial_content_type_id_22d30df4434fdefc_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dialogos_commen_author_id_3ecf7aa9f3c414bd_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY dialogos_comment
    ADD CONSTRAINT dialogos_commen_author_id_3ecf7aa9f3c414bd_fk_people_profile_id FOREIGN KEY (author_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dj_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT dj_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djce_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djce_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery__worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery__worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id FOREIGN KEY (worker_id) REFERENCES djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: do_resourcebase_ptr_id_7cb83b58cea87e2a_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY documents_document
    ADD CONSTRAINT do_resourcebase_ptr_id_7cb83b58cea87e2a_fk_base_resourcebase_id FOREIGN KEY (resourcebase_ptr_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: docum_content_type_id_be3cdaa70d32e64_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY documents_document
    ADD CONSTRAINT docum_content_type_id_be3cdaa70d32e64_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e4b9f8b3aa7e2b739a85b466fc2c8c8f; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY announcements_dismissal
    ADD CONSTRAINT e4b9f8b3aa7e2b739a85b466fc2c8c8f FOREIGN KEY (announcement_id) REFERENCES announcements_announcement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e54e39f6aafd7fec50fd76ae95aedf8c; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY agon_ratings_rating
    ADD CONSTRAINT e54e39f6aafd7fec50fd76ae95aedf8c FOREIGN KEY (overall_rating_id) REFERENCES agon_ratings_overallrating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ed9fd5eb4f62c9b049823c4a9799fadb; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT ed9fd5eb4f62c9b049823c4a9799fadb FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: efcd86ae6bfd7c65911f995bb6ed6b85; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_servicelayer
    ADD CONSTRAINT efcd86ae6bfd7c65911f995bb6ed6b85 FOREIGN KEY (service_id) REFERENCES services_service(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fb17b55a7581c3217c069e7606beb946; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY base_resourcebase
    ADD CONSTRAINT fb17b55a7581c3217c069e7606beb946 FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_grou_group_id_7947f328d9f6f1a1_fk_groups_groupprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation
    ADD CONSTRAINT groups_grou_group_id_7947f328d9f6f1a1_fk_groups_groupprofile_id FOREIGN KEY (group_id) REFERENCES groups_groupprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_group_from_user_id_49b5e262c8ca9422_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation
    ADD CONSTRAINT groups_group_from_user_id_49b5e262c8ca9422_fk_people_profile_id FOREIGN KEY (from_user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_group_group_id_c903953a048b4ae_fk_groups_groupprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupmember
    ADD CONSTRAINT groups_group_group_id_c903953a048b4ae_fk_groups_groupprofile_id FOREIGN KEY (group_id) REFERENCES groups_groupprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_groupinvit_user_id_573b1b3475b95268_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupinvitation
    ADD CONSTRAINT groups_groupinvit_user_id_573b1b3475b95268_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_groupmembe_user_id_4c016ad1f31d08e7_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupmember
    ADD CONSTRAINT groups_groupmembe_user_id_4c016ad1f31d08e7_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: groups_groupprofile_group_id_4de793b07f259dea_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY groups_groupprofile
    ADD CONSTRAINT groups_groupprofile_group_id_4de793b07f259dea_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guar_content_type_id_1d41cfa581d8d978_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guar_content_type_id_1d41cfa581d8d978_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guar_content_type_id_597c953df5d1232d_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guar_content_type_id_597c953df5d1232d_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_g_permission_id_6db56426ae60788a_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_g_permission_id_6db56426ae60788a_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobject_group_id_713e154dfd2f5937_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_713e154dfd2f5937_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_u_permission_id_2e655ff0bbafb1c1_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_u_permission_id_2e655ff0bbafb1c1_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobje_user_id_4727c7e419caead5_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobje_user_id_4727c7e419caead5_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: l_layer_id_2b0e96763e796a47_fk_layers_layer_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_attribute
    ADD CONSTRAINT l_layer_id_2b0e96763e796a47_fk_layers_layer_resourcebase_ptr_id FOREIGN KEY (layer_id) REFERENCES layers_layer(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: l_upload_session_id_2c18de1952dfdf82_fk_layers_uploadsession_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer
    ADD CONSTRAINT l_upload_session_id_2c18de1952dfdf82_fk_layers_uploadsession_id FOREIGN KEY (upload_session_id) REFERENCES layers_uploadsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: l_upload_session_id_55fc511ff9172dc4_fk_layers_uploadsession_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layerfile
    ADD CONSTRAINT l_upload_session_id_55fc511ff9172dc4_fk_layers_uploadsession_id FOREIGN KEY (upload_session_id) REFERENCES layers_uploadsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: la_layer_id_fb1a8aaed1ff52e_fk_layers_layer_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer_styles
    ADD CONSTRAINT la_layer_id_fb1a8aaed1ff52e_fk_layers_layer_resourcebase_ptr_id FOREIGN KEY (layer_id) REFERENCES layers_layer(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: la_resourcebase_ptr_id_55276820ef646366_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer
    ADD CONSTRAINT la_resourcebase_ptr_id_55276820ef646366_fk_base_resourcebase_id FOREIGN KEY (resourcebase_ptr_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: layers_lay_default_style_id_6f6c76540c9b39d2_fk_layers_style_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer
    ADD CONSTRAINT layers_lay_default_style_id_6f6c76540c9b39d2_fk_layers_style_id FOREIGN KEY (default_style_id) REFERENCES layers_style(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: layers_layer_style_style_id_4d650d5f7607e6ce_fk_layers_style_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_layer_styles
    ADD CONSTRAINT layers_layer_style_style_id_4d650d5f7607e6ce_fk_layers_style_id FOREIGN KEY (style_id) REFERENCES layers_style(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: layers_uploadsess_user_id_622629ec01930897_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY layers_uploadsession
    ADD CONSTRAINT layers_uploadsess_user_id_622629ec01930897_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_resourcebase_ptr_id_a6ed5a62d49f3d0_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_map
    ADD CONSTRAINT map_resourcebase_ptr_id_a6ed5a62d49f3d0_fk_base_resourcebase_id FOREIGN KEY (resourcebase_ptr_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: maps_map_map_id_ddb6823378b3e35_fk_maps_map_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_maplayer
    ADD CONSTRAINT maps_map_map_id_ddb6823378b3e35_fk_maps_map_resourcebase_ptr_id FOREIGN KEY (map_id) REFERENCES maps_map(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: maps_map_map_id_f5aeb9f66b255e9_fk_maps_map_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_mapsnapshot
    ADD CONSTRAINT maps_map_map_id_f5aeb9f66b255e9_fk_maps_map_resourcebase_ptr_id FOREIGN KEY (map_id) REFERENCES maps_map(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: maps_mapsnapshot_user_id_313f9fc5c8ebddc9_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY maps_mapsnapshot
    ADD CONSTRAINT maps_mapsnapshot_user_id_313f9fc5c8ebddc9_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mete_timeSeries_id_1a3782a7a0023768_fk_meteorology_timeserie_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_entry
    ADD CONSTRAINT "mete_timeSeries_id_1a3782a7a0023768_fk_meteorology_timeserie_id" FOREIGN KEY ("timeSeries_id") REFERENCES meteorology_timeserie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meteoro_variable_id_63ec2d3d9d4ed44f_fk_meteorology_variable_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_timeserie
    ADD CONSTRAINT meteoro_variable_id_63ec2d3d9d4ed44f_fk_meteorology_variable_id FOREIGN KEY (variable_id) REFERENCES meteorology_variable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meteorolo_station_id_314112a5b0e4f426_fk_meteorology_station_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_variable
    ADD CONSTRAINT meteorolo_station_id_314112a5b0e4f426_fk_meteorology_station_id FOREIGN KEY (station_id) REFERENCES meteorology_station(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meteorology_var_unit_id_71002c0bababb891_fk_meteorology_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY meteorology_variable
    ADD CONSTRAINT meteorology_var_unit_id_71002c0bababb891_fk_meteorology_unit_id FOREIGN KEY (unit_id) REFERENCES meteorology_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_a_user_id_5e2f004fdebea22d_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_a_user_id_5e2f004fdebea22d_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_a_user_id_7fa13387c260b798_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_a_user_id_7fa13387c260b798_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_g_user_id_3111344894d452da_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_g_user_id_3111344894d452da_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_r_user_id_3f695b639cfbc9a3_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_r_user_id_3f695b639cfbc9a3_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_pro_permission_id_605736edb0993afc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_user_permissions
    ADD CONSTRAINT people_pro_permission_id_605736edb0993afc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_profile_group_group_id_7d644aab0f8bb5fb_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_groups
    ADD CONSTRAINT people_profile_group_group_id_7d644aab0f8bb5fb_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_profile_profile_id_3004d22b1bcaf4eb_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_groups
    ADD CONSTRAINT people_profile_profile_id_3004d22b1bcaf4eb_fk_people_profile_id FOREIGN KEY (profile_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_profile_profile_id_5a430c62a6c13107_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY people_profile_user_permissions
    ADD CONSTRAINT people_profile_profile_id_5a430c62a6c13107_fk_people_profile_id FOREIGN KEY (profile_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: se_layer_id_7a293bfa7e3fd1e_fk_layers_layer_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_servicelayer
    ADD CONSTRAINT se_layer_id_7a293bfa7e3fd1e_fk_layers_layer_resourcebase_ptr_id FOREIGN KEY (layer_id) REFERENCES layers_layer(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: se_resourcebase_ptr_id_2bff9b9b6b175ee6_fk_base_resourcebase_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_service
    ADD CONSTRAINT se_resourcebase_ptr_id_2bff9b9b6b175ee6_fk_base_resourcebase_id FOREIGN KEY (resourcebase_ptr_id) REFERENCES base_resourcebase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_serv_profiles_id_3be6cb599d38d6e0_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY services_serviceprofilerole
    ADD CONSTRAINT services_serv_profiles_id_3be6cb599d38d6e0_fk_people_profile_id FOREIGN KEY (profiles_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tastypie_apikey_user_id_ffeb4840e0b406b_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_ffeb4840e0b406b_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: u_layer_id_6346de911330a880_fk_layers_layer_resourcebase_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_upload
    ADD CONSTRAINT u_layer_id_6346de911330a880_fk_layers_layer_resourcebase_ptr_id FOREIGN KEY (layer_id) REFERENCES layers_layer(resourcebase_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: upload_upload_user_id_7fad116c8478bf31_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_upload
    ADD CONSTRAINT upload_upload_user_id_7fad116c8478bf31_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: upload_uploadfil_upload_id_21ef448d17dd4b6b_fk_upload_upload_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY upload_uploadfile
    ADD CONSTRAINT upload_uploadfil_upload_id_21ef448d17dd4b6b_fk_upload_upload_id FOREIGN KEY (upload_id) REFERENCES upload_upload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_mess_thread_id_2a39f32bdcb75b0e_fk_user_messages_thread_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_userthread
    ADD CONSTRAINT user_mess_thread_id_2a39f32bdcb75b0e_fk_user_messages_thread_id FOREIGN KEY (thread_id) REFERENCES user_messages_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_mess_thread_id_335c99149db39253_fk_user_messages_thread_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_message
    ADD CONSTRAINT user_mess_thread_id_335c99149db39253_fk_user_messages_thread_id FOREIGN KEY (thread_id) REFERENCES user_messages_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_messages_m_sender_id_7a21ec3698f782ba_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_message
    ADD CONSTRAINT user_messages_m_sender_id_7a21ec3698f782ba_fk_people_profile_id FOREIGN KEY (sender_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_messages_user_user_id_fadfb3cc476e7d3_fk_people_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: geonode
--

ALTER TABLE ONLY user_messages_userthread
    ADD CONSTRAINT user_messages_user_user_id_fadfb3cc476e7d3_fk_people_profile_id FOREIGN KEY (user_id) REFERENCES people_profile(id) DEFERRABLE INITIALLY DEFERRED;


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

