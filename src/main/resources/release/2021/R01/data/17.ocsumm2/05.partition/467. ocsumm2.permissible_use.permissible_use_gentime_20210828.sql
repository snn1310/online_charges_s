CREATE TABLE ocsumm2.permissible_use_gentime_20210828
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

