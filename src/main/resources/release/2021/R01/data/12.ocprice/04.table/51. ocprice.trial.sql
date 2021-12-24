CREATE TABLE ocprice.trial(
    t_offer_id CHARACTER VARYING(33) NOT NULL,
    t_bill_grp CHARACTER VARYING(10) NOT NULL,
    t_contact_num CHARACTER VARYING(10) NOT NULL,
    t_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    t_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    t_adjusted_end_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    t_reason_code CHARACTER VARYING(20),
    t_reactivate_count SMALLINT NOT NULL,
    t_modified_by CHARACTER VARYING(12) NOT NULL,
    t_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.trial.t_offer_id
     IS 'Offer tracking id from the accepted promotion.';
COMMENT ON COLUMN ocprice.trial.t_bill_grp
     IS 'Billing group.';
COMMENT ON COLUMN ocprice.trial.t_contact_num
     IS 'Contact number.';
COMMENT ON COLUMN ocprice.trial.t_eff_date
     IS 'Trial effective date.';
COMMENT ON COLUMN ocprice.trial.t_end_date
     IS 'Trial end date.';
COMMENT ON COLUMN ocprice.trial.t_adjusted_end_timestamp
     IS 'Trial adjusted end timestamp .';
COMMENT ON COLUMN ocprice.trial.t_reason_code
     IS 'Trial end reason code.';
COMMENT ON COLUMN ocprice.trial.t_reactivate_count
     IS 'Trial reactivation count.';
COMMENT ON COLUMN ocprice.trial.t_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocprice.trial.t_mod_timestamp
     IS 'Timestamp when last modified.';

