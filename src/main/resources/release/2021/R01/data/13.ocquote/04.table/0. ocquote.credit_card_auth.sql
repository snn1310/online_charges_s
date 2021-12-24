CREATE TABLE ocquote.credit_card_auth(
    q_id CHARACTER VARYING(33) NOT NULL,
    cca_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    cca_confirmation_num CHARACTER VARYING(10) NOT NULL,
    cca_card_type CHARACTER VARYING(4) NOT NULL,
    cca_card_token CHARACTER VARYING(25) NOT NULL,
    cca_card_expiration TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cca_auth_number CHARACTER VARYING(10) NOT NULL,
    cca_auth_code CHARACTER VARYING(15) NOT NULL,
    cca_merchant_id CHARACTER VARYING(15) NOT NULL,
    cca_amount NUMERIC(11,2) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

