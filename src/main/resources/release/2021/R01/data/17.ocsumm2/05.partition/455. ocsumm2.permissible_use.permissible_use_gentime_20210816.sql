CREATE TABLE ocsumm2.permissible_use_gentime_20210816
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');

