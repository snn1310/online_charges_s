CREATE TABLE ocprice.privacy_category_map(
    pcm_grp_id CHARACTER VARYING(15) NOT NULL,
    pcm_acct_criterion CHARACTER VARYING(4) NOT NULL,
    pcm_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pcm_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pcm_category CHARACTER VARYING(2) NOT NULL,
    pcm_company_id CHARACTER VARYING(4),
    pcm_work_request CHARACTER VARYING(12),
    pcm_modified_by CHARACTER VARYING(12) NOT NULL,
    pcm_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_grp_id
     IS 'Group identifier for the law or act (CCPA, TXPA, etc.)';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_acct_criterion
     IS 'Account data to map to the customer type (industry code)';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_eff_date
     IS 'Effective date';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_end_date
     IS 'End date';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_category
     IS 'Privacy category (customer type code)';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_company_id
     IS 'Company Id (sales org)';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_work_request
     IS 'Work request number for audit purposes';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_modified_by
     IS 'Identifier for user or group creating or updating the data';
COMMENT ON COLUMN ocprice.privacy_category_map.pcm_mod_timestamp
     IS 'Timestamp of the last modification';

