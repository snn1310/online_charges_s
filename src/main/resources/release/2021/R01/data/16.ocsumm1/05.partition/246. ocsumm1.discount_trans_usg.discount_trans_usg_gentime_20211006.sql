CREATE TABLE ocsumm1.discount_trans_usg_gentime_20211006
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

