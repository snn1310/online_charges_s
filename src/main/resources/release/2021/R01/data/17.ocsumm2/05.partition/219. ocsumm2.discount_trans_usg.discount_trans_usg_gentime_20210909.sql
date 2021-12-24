CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210909
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-08 00:00:00') TO ('2021-09-09 00:00:00');

