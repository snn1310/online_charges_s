CREATE TABLE ocsumm2.discount_trans_usg_gentime_20211009
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

