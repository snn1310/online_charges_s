CREATE TABLE ocsumm2.usage_gentime_20210816
        PARTITION OF ocsumm2.usage
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');

