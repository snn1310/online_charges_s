CREATE TABLE ocprice.database_group(
    dg_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    dg_database_name CHARACTER VARYING(18) NOT NULL,
    dg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dg_domain CHARACTER VARYING(15) NOT NULL,
    dg_company_code CHARACTER VARYING(4) NOT NULL,
    dg_modified_by CHARACTER VARYING(12) NOT NULL,
    dg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.database_group
     IS 'Database Group Information';
COMMENT ON COLUMN ocprice.database_group.dg_grp_mat_num
     IS 'Database group material number.';
COMMENT ON COLUMN ocprice.database_group.dg_database_name
     IS 'Database name.';
COMMENT ON COLUMN ocprice.database_group.dg_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.database_group.dg_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.database_group.dg_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.database_group.dg_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.database_group.dg_mod_timestamp
     IS 'Modified timestamp.';

