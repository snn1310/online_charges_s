CREATE TABLE ocsumm1.permissible_use_gentime_20210916
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

