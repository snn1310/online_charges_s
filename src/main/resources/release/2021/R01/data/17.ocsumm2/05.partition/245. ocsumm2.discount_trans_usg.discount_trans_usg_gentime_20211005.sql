CREATE TABLE ocsumm2.discount_trans_usg_gentime_20211005
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

