CREATE TABLE ocsumm1.permissible_use_gentime_20210820
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');

