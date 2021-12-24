CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210919
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

