CREATE TABLE ccdetail2.warn_promo(
    wp_id CHARACTER VARYING(33) NOT NULL,
    w_id CHARACTER VARYING(33) NOT NULL,
    wp_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    wp_promo_num CHARACTER VARYING(8) NOT NULL
)
    PARTITION BY RANGE (wp_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail2.warn_promo
     IS 'Warn Promotions';
COMMENT ON COLUMN ccdetail2.warn_promo.wp_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.warn_promo.w_id
     IS 'Generated id from warn table.';
COMMENT ON COLUMN ccdetail2.warn_promo.wp_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail2.warn_promo.wp_promo_num
     IS 'Promotion number.';

