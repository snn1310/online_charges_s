CREATE TABLE ocdetail.event_history_gentime_20211017
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

