CREATE TABLE ocsumm1.discount_trans_usg_gentime_20211001
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');

