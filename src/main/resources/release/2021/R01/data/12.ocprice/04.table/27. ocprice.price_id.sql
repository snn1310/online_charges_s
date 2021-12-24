CREATE TABLE ocprice.price_id(
    pri_domain CHARACTER VARYING(15) NOT NULL,
    pri_price_id CHARACTER VARYING(2) NOT NULL,
    pri_price_id_desc CHARACTER VARYING(40) NOT NULL,
    pri_company_code CHARACTER VARYING(4) NOT NULL,
    pri_modified_by CHARACTER VARYING(12) NOT NULL,
    pri_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.price_id
     IS 'Price Id Information';
COMMENT ON COLUMN ocprice.price_id.pri_price_id
     IS 'Price id.';
COMMENT ON COLUMN ocprice.price_id.pri_price_id_desc
     IS 'Price id description.';
COMMENT ON COLUMN ocprice.price_id.pri_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.price_id.pri_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.price_id.pri_mod_timestamp
     IS 'Modified timestamp.';

