CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210929
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');

