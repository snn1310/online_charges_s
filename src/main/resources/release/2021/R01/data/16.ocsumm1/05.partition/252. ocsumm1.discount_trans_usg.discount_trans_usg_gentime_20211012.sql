CREATE TABLE ocsumm1.discount_trans_usg_gentime_20211012
        PARTITION OF ocsumm1.discount_trans_usg
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');

