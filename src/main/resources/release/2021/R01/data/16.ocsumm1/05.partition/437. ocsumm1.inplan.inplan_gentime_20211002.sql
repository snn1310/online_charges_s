CREATE TABLE ocsumm1.inplan_gentime_20211002
        PARTITION OF ocsumm1.inplan
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

