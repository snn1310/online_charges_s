CREATE TABLE ocsumm2.permissible_use_gentime_20211003
        PARTITION OF ocsumm2.permissible_use
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

