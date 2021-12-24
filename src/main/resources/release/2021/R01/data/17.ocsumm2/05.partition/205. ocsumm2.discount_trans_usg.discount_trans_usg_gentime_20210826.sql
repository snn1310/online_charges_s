CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210826
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

