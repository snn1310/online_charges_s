CREATE TABLE ocprice.password_expiration(
    pe_level_code CHARACTER VARYING(50) NOT NULL,
    pe_level_value CHARACTER VARYING(50) NOT NULL,
    pe_domain CHARACTER VARYING(15) NOT NULL,
    pe_company_code CHARACTER VARYING(4) NOT NULL,
    pe_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pe_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pe_period SMALLINT NOT NULL,
    pe_reason_code CHARACTER VARYING(50) NOT NULL,
    pe_modified_by CHARACTER VARYING(12) NOT NULL,
    pe_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    pe_rule_name CHARACTER VARYING(50) NOT NULL DEFAULT 'PasswordLifetime'
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.password_expiration.pe_rule_name
     IS 'Rule Name.';

