CREATE TABLE ocsumm2.royalty(
    r_id CHARACTER VARYING(33) NOT NULL,
    u_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    r_domain CHARACTER VARYING(15) NOT NULL,
    r_company_id CHARACTER VARYING(4) NOT NULL,
    r_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    r_usage_type CHARACTER VARYING(18) NOT NULL,
    r_unit_cnt BIGINT NOT NULL,
    r_charge_rule CHARACTER(1) NOT NULL,
    r_royalty_id CHARACTER VARYING(18) NOT NULL,
    r_royalty_data CHARACTER VARYING(80),
    r_format_code CHARACTER VARYING(3),
    r_doc_id CHARACTER VARYING(33),
    r_doc_name CHARACTER VARYING(80),
    r_doc_pcnt NUMERIC(22,21) NOT NULL,
    r_char_cnt BIGINT NOT NULL,
    r_line_cnt BIGINT NOT NULL,
    r_doc_cnt BIGINT NOT NULL,
    r_from_usage_type CHARACTER VARYING(18),
    r_from_db_name CHARACTER VARYING(18),
    r_from_udm_ind CHARACTER(1),
    r_from_access_meth CHARACTER VARYING(3),
    r_disp_surcharge_ind CHARACTER(1) NOT NULL,
    r_from_inplan_hash BIGINT NOT NULL
)
    PARTITION BY RANGE (r_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm2.royalty
     IS 'Royalty';
COMMENT ON COLUMN ocsumm2.royalty.r_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm2.royalty.u_id
     IS 'Generated id to link to usage table.';
COMMENT ON COLUMN ocsumm2.royalty.c_id
     IS 'Generated id to link to customer table.';
COMMENT ON COLUMN ocsumm2.royalty.r_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm2.royalty.r_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm2.royalty.r_date
     IS 'Usage date';
COMMENT ON COLUMN ocsumm2.royalty.r_usage_type
     IS 'Usage type';
COMMENT ON COLUMN ocsumm2.royalty.r_unit_cnt
     IS 'Unit count';
COMMENT ON COLUMN ocsumm2.royalty.r_charge_rule
     IS 'Charge rule';
COMMENT ON COLUMN ocsumm2.royalty.r_royalty_id
     IS 'Royalty id';
COMMENT ON COLUMN ocsumm2.royalty.r_royalty_data
     IS 'Royalty data';
COMMENT ON COLUMN ocsumm2.royalty.r_format_code
     IS 'Format code';
COMMENT ON COLUMN ocsumm2.royalty.r_doc_id
     IS 'Document id';
COMMENT ON COLUMN ocsumm2.royalty.r_doc_name
     IS 'Document name';
COMMENT ON COLUMN ocsumm2.royalty.r_doc_pcnt
     IS 'Document percent';
COMMENT ON COLUMN ocsumm2.royalty.r_char_cnt
     IS 'Character count';
COMMENT ON COLUMN ocsumm2.royalty.r_line_cnt
     IS 'Line count';
COMMENT ON COLUMN ocsumm2.royalty.r_doc_cnt
     IS 'Document count';
COMMENT ON COLUMN ocsumm2.royalty.r_from_usage_type
     IS 'From usage type';
COMMENT ON COLUMN ocsumm2.royalty.r_from_db_name
     IS 'From database name';
COMMENT ON COLUMN ocsumm2.royalty.r_from_udm_ind
     IS 'From user defined multibase indicator';
COMMENT ON COLUMN ocsumm2.royalty.r_from_access_meth
     IS 'From access method';

