CREATE TABLE ocsumm1.discount_trans_usg_gentime_20210831
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');

