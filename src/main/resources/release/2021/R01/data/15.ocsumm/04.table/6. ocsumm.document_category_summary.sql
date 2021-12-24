CREATE TABLE ocsumm.document_category_summary(
    dcs_doc_id CHARACTER VARYING(33) NOT NULL,
    dcs_month TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dcs_categories CHARACTER VARYING(2000) NOT NULL,
    dcs_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
    PARTITION BY RANGE (dcs_month)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm.document_category_summary.dcs_doc_id
     IS 'Document ID';
COMMENT ON COLUMN ocsumm.document_category_summary.dcs_month
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm.document_category_summary.dcs_categories
     IS 'JSON structure with counts by category';
COMMENT ON COLUMN ocsumm.document_category_summary.dcs_mod_timestamp
     IS 'Timestamp of insertion or last update';

