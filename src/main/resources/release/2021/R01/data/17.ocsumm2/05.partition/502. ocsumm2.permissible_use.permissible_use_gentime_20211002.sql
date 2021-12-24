CREATE TABLE ocsumm2.permissible_use_gentime_20211002
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

