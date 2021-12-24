CREATE TABLE ocsumm1.permissible_use_gentime_20211003
        PARTITION OF ocsumm1.permissible_use
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

