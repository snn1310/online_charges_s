CREATE TABLE ocdetail.availability(
    a_info_code CHARACTER VARYING(18) NOT NULL,
    a_domain CHARACTER VARYING(15) NOT NULL,
    a_begin_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    a_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    a_modified_by CHARACTER VARYING(12) NOT NULL,
    a_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.availability
     IS 'Online Charges Availability';
COMMENT ON COLUMN ocdetail.availability.a_info_code
     IS 'Available information code.';
COMMENT ON COLUMN ocdetail.availability.a_domain
     IS 'Domain';
COMMENT ON COLUMN ocdetail.availability.a_begin_date
     IS 'Begin date of OCDETAIL information.';
COMMENT ON COLUMN ocdetail.availability.a_end_date
     IS 'End date of OCDETAIL information.';
COMMENT ON COLUMN ocdetail.availability.a_modified_by
     IS 'Modified By';
COMMENT ON COLUMN ocdetail.availability.a_mod_timestamp
     IS 'Modified Timestamp';

