CREATE TABLE ocsumm1.discount_trans_usg_gentime_20211018
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-10-17 00:00:00') TO ('2021-10-18 00:00:00');

