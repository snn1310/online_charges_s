CREATE TABLE ocprice.content_exemplar(
    c_domain CHARACTER VARYING(15) NOT NULL,
    ce_exemplar_desc CHARACTER VARYING(40) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    ce_company_code CHARACTER VARYING(4) NOT NULL,
    ce_modified_by CHARACTER VARYING(12) NOT NULL,
    ce_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.content_exemplar
     IS 'Content Exemplar Information';
COMMENT ON COLUMN ocprice.content_exemplar.ce_exemplar_desc
     IS 'Exemplar description.';
COMMENT ON COLUMN ocprice.content_exemplar.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.content_exemplar.ce_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.content_exemplar.ce_mod_timestamp
     IS 'Modified timestamp.';

