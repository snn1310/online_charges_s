CREATE TABLE ocdetail.event_history_gentime_20210917
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');

