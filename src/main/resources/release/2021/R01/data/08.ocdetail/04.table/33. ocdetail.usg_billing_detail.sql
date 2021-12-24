CREATE TABLE ocdetail.usg_billing_detail(
    ubd_usage_id CHARACTER VARYING(33) NOT NULL,
    bd_id CHARACTER VARYING(33) NOT NULL,
    ubd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
)
    PARTITION BY RANGE (ubd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.usg_billing_detail
     IS 'Usage Billing Detail';
COMMENT ON COLUMN ocdetail.usg_billing_detail.ubd_usage_id
     IS 'Id of usage we are linking to.';
COMMENT ON COLUMN ocdetail.usg_billing_detail.bd_id
     IS 'bd_id from billing detail table.  Used to link usage and billing data.';
COMMENT ON COLUMN ocdetail.usg_billing_detail.ubd_session_start_date
     IS 'Session start date, used for partitioning.';

