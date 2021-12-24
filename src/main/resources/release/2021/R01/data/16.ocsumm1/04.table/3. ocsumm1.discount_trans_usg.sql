CREATE TABLE ocsumm1.discount_trans_usg(
    dtu_id CHARACTER VARYING(33) NOT NULL,
    dtu_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dtu_domain CHARACTER VARYING(15) NOT NULL,
    dtu_user_id CHARACTER VARYING(33) NOT NULL,
    dtu_company_code CHARACTER VARYING(4) NOT NULL,
    dtu_org_partner CHARACTER VARYING(10) NOT NULL,
    dtu_session_id CHARACTER VARYING(33) NOT NULL,
    dtu_doc_name CHARACTER VARYING(80),
    dtu_doc_id CHARACTER VARYING(33),
    dtu_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    dtu_offer_id CHARACTER VARYING(33) NOT NULL,
    dtu_data_owner CHARACTER VARYING(12) NOT NULL
)
    PARTITION BY RANGE (dtu_usage_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_id
     IS 'Unique id';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_usage_date
     IS 'Billing detail usage date (BD_USAGE_DATE)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_domain
     IS 'Customer domain (CD_DOMAIN)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_user_id
     IS 'Customer user id (CD_USER_ID)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_company_code
     IS 'Company code (CD_COMPANY_ID)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_org_partner
     IS 'Customer org partner (CD_ORG_PARTNER)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_session_id
     IS 'Session id (SSD_SESSION_ID)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_doc_name
     IS 'Transaction usage document name (TU_DOC_NAME)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_doc_id
     IS 'Transaction usage document id (TU_DOC_ID)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_timestamp
     IS 'Transaction usage timestamp (TU_TIMESTAMP)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_offer_id
     IS 'Discount detail offer id (DD_OFFER_ID)';
COMMENT ON COLUMN ocsumm1.discount_trans_usg.dtu_data_owner
     IS 'Customer data owner (CD_USER_ID_DATA_OWNER)';

