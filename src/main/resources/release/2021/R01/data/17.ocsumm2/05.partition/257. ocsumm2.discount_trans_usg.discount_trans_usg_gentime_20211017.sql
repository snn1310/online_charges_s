CREATE TABLE ocsumm2.discount_trans_usg_gentime_20211017
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

