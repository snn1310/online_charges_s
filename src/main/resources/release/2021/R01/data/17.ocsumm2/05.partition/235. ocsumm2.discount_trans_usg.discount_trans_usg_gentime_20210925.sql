CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210925
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM ('2021-09-24 00:00:00') TO ('2021-09-25 00:00:00');

