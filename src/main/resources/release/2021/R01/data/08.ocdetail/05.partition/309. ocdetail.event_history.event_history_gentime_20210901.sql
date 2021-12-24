CREATE TABLE ocdetail.event_history_gentime_20210901
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');

