CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210823
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');
