CREATE TABLE ocprice.storage_key(
    sk_storage_key CHARACTER VARYING(32) NOT NULL,
    sk_domain CHARACTER VARYING(15) NOT NULL,
    sk_storage_region CHARACTER VARYING(3) NOT NULL,
    sk_company_code CHARACTER VARYING(4) NOT NULL,
    sk_modified_by CHARACTER VARYING(12) NOT NULL,
    sk_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.storage_key
     IS 'Storage Key Information';
COMMENT ON COLUMN ocprice.storage_key.sk_storage_key
     IS 'Storage Key.';
COMMENT ON COLUMN ocprice.storage_key.sk_domain
     IS 'Domain.';
COMMENT ON COLUMN ocprice.storage_key.sk_storage_region
     IS 'Storage Region.';
COMMENT ON COLUMN ocprice.storage_key.sk_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.storage_key.sk_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.storage_key.sk_mod_timestamp
     IS 'Modified timestamp.';

