CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210923
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');

