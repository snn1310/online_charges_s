CREATE TABLE ocprice.material_price_grp(
    mpg_mat_prc_grp CHARACTER VARYING(2) NOT NULL,
    pri_domain CHARACTER VARYING(15) NOT NULL,
    mpg_prc_grp_desc CHARACTER VARYING(40) NOT NULL,
    pri_price_id CHARACTER VARYING(2) NOT NULL,
    mpg_company_code CHARACTER VARYING(4) NOT NULL,
    mpg_modified_by CHARACTER VARYING(12) NOT NULL,
    mpg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.material_price_grp
     IS 'Material Price Group Information (Ancillary Subscription)';
COMMENT ON COLUMN ocprice.material_price_grp.mpg_mat_prc_grp
     IS 'Material price group.';
COMMENT ON COLUMN ocprice.material_price_grp.mpg_prc_grp_desc
     IS 'Material price group description.';
COMMENT ON COLUMN ocprice.material_price_grp.pri_price_id
     IS 'Price id.';
COMMENT ON COLUMN ocprice.material_price_grp.mpg_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.material_price_grp.mpg_mod_timestamp
     IS 'Modified timestamp.';

