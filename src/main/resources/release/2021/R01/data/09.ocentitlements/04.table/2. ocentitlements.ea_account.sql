CREATE TABLE ocentitlements.ea_account(
    account_table_id CHARACTER VARYING(33) NOT NULL,
    account_id CHARACTER VARYING(10) NOT NULL,
    business_system_id CHARACTER VARYING(12) NOT NULL,
    billing_group_id CHARACTER VARYING(10),
    billing_group_name CHARACTER VARYING(35),
    city CHARACTER VARYING(35),
    state CHARACTER VARYING(3),
    country CHARACTER VARYING(3),
    jurisdiction_code CHARACTER VARYING(9),
    currency_code CHARACTER VARYING(5),
    billing_group_code CHARACTER VARYING(2),
    industry_code CHARACTER VARYING(4),
    industry_code_2 CHARACTER VARYING(10),
    payment_group_id CHARACTER VARYING(10),
    organization_id CHARACTER VARYING(10),
    organization_name CHARACTER VARYING(35),
    vat_reg_num CHARACTER VARYING(25),
    tax_class CHARACTER VARYING(1),
    modified_by CHARACTER VARYING(12) NOT NULL,
    ac_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_account.account_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_account.account_id
     IS 'ID representing the account.  Calling business system defines the value, but it must be unique per Business System ID.
Some sample account levels are location, organization, etc...';
COMMENT ON COLUMN ocentitlements.ea_account.business_system_id
     IS 'ID representing the business system calling the service.';
COMMENT ON COLUMN ocentitlements.ea_account.billing_group_name
     IS 'DATAROOM uses this information, but OCPRICE allows null';
COMMENT ON COLUMN ocentitlements.ea_account.city
     IS 'DATAROOM uses this information, but OCPRICE allows null';
COMMENT ON COLUMN ocentitlements.ea_account.state
     IS 'DATAROOM uses this information, but OCPRICE allows null';
COMMENT ON COLUMN ocentitlements.ea_account.modified_by
     IS 'Represents the requestor.  Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_account.ac_mod_timestamp
     IS 'Insert time on creation of updating of data. Database generated.';

