CREATE TABLE ocsumm2.discount_trans_usg_gentime_20211002
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

