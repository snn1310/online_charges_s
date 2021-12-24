CREATE TABLE ocquote.item_discount(
    id_appl_order SMALLINT NOT NULL,
    i_id CHARACTER VARYING(33) NOT NULL,
    id_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    id_level_code CHARACTER VARYING(18) NOT NULL,
    id_promo_type CHARACTER VARYING(3) NOT NULL,
    id_cond_type CHARACTER VARYING(4),
    id_promo_num CHARACTER VARYING(8),
    id_discount_usd NUMERIC(11,2) NOT NULL,
    id_discount_cur NUMERIC(11,2) NOT NULL,
    id_discount_pcnt NUMERIC(5,2) NOT NULL,
    id_company_id CHARACTER VARYING(4),
    id_promo_code CHARACTER VARYING(35)
)
        WITH (
        OIDS=FALSE
        );

