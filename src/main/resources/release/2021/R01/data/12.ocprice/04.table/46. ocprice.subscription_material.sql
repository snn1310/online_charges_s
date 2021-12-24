CREATE TABLE ocprice.subscription_material(
    sm_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    sm_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sm_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sm_domain CHARACTER VARYING(15) NOT NULL,
    sm_sub_type CHARACTER VARYING(4) NOT NULL,
    sm_level_code CHARACTER VARYING(18) NOT NULL,
    sm_mat_prc_grp CHARACTER VARYING(2) NOT NULL,
    sm_prod_classification CHARACTER VARYING(20),
    sm_prod_classification_desc CHARACTER VARYING(30),
    sm_modified_by CHARACTER VARYING(12) NOT NULL,
    sm_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sm_company_code CHARACTER VARYING(4) NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.subscription_material.sm_sub_mat_num
     IS 'Material Number.';
COMMENT ON COLUMN ocprice.subscription_material.sm_eff_date
     IS 'Material number effective date.';
COMMENT ON COLUMN ocprice.subscription_material.sm_end_date
     IS 'Material number end date.';
COMMENT ON COLUMN ocprice.subscription_material.sm_domain
     IS 'Material number domain.';
COMMENT ON COLUMN ocprice.subscription_material.sm_sub_type
     IS 'Subscription type.';
COMMENT ON COLUMN ocprice.subscription_material.sm_level_code
     IS 'Subscription level code.';
COMMENT ON COLUMN ocprice.subscription_material.sm_mat_prc_grp
     IS 'Material Price Group.';
COMMENT ON COLUMN ocprice.subscription_material.sm_prod_classification
     IS 'Product classification.';
COMMENT ON COLUMN ocprice.subscription_material.sm_prod_classification_desc
     IS 'Product classification description.';
COMMENT ON COLUMN ocprice.subscription_material.sm_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocprice.subscription_material.sm_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocprice.subscription_material.sm_company_code
     IS 'Company Code used to create or update.';

