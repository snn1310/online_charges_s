CREATE TABLE ocsumm1.discount_trans_usg_gentime_20211016
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');

