CREATE TABLE ocsumm2.permissible_use_gentime_20210817
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');
