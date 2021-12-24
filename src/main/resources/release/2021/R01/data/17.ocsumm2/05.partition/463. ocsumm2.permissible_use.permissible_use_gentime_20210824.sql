CREATE TABLE ocsumm2.permissible_use_gentime_20210824
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');

