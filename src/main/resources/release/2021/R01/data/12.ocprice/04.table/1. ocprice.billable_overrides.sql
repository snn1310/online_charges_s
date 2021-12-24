CREATE TABLE ocprice.billable_overrides(
    bo_id CHARACTER VARYING(33) NOT NULL,
    bo_level_code CHARACTER VARYING(18) NOT NULL,
    bo_level_value CHARACTER VARYING(33) NOT NULL,
    bo_type CHARACTER VARYING(25) NOT NULL,
    bo_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bo_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bo_override_name CHARACTER VARYING(256),
    bo_client_expr CHARACTER VARYING(35),
    bo_expr_type CHARACTER VARYING(15),
    bo_all_sessions CHARACTER(1) NOT NULL,
    bo_filter_code CHARACTER VARYING(15),
    bo_override_value NUMERIC(9,2) NOT NULL,
    bo_unit CHARACTER VARYING(3) NOT NULL,
    bo_client_replacement CHARACTER VARYING(35),
    bo_modified_by CHARACTER VARYING(33) NOT NULL,
    bo_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    bo_company_code CHARACTER VARYING(4) NOT NULL,
    bo_deleted_flag CHARACTER(1)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.billable_overrides.bo_id
     IS 'Generated id.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_type
     IS 'Override type.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_override_name
     IS 'Override name.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_client_expr
     IS 'Client expiration.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_expr_type
     IS 'Expiration type.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_all_sessions
     IS 'All sessions indicator.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_filter_code
     IS 'Filter code.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_override_value
     IS 'Override value.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_unit
     IS 'Unit of measure.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_client_replacement
     IS 'Client replacement.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_modified_by
     IS 'Modified by (e.g. business system user name, pricing formating process name.)';
COMMENT ON COLUMN ocprice.billable_overrides.bo_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.billable_overrides.bo_deleted_flag
     IS 'Flag that indicates deteted Y = deleted, N or null = not deleted';

