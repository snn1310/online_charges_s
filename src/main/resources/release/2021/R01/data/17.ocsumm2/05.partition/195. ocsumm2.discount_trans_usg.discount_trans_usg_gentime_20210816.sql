CREATE TABLE ocsumm2.discount_trans_usg_gentime_20210816
        PARTITION OF ocsumm2.discount_trans_usg
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');

