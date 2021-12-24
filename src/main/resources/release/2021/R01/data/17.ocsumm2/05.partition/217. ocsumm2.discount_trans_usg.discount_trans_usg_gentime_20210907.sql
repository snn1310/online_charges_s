CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210907
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');

