CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210822
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

