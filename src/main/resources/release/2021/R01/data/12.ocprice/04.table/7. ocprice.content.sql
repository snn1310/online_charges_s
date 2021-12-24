CREATE TABLE ocprice.content(
    c_domain CHARACTER VARYING(15) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    c_content_type CHARACTER VARYING(3) NOT NULL,
    c_company_code CHARACTER VARYING(4) NOT NULL,
    c_modified_by CHARACTER VARYING(12) NOT NULL,
    c_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.content
     IS 'Content Information';
COMMENT ON COLUMN ocprice.content.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.content.c_content_type
     IS 'Content type.';
COMMENT ON COLUMN ocprice.content.c_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.content.c_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.content.c_mod_timestamp
     IS 'Modified timestamp.';

