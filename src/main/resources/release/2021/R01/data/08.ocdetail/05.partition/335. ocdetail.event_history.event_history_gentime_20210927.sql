CREATE TABLE ocdetail.event_history_gentime_20210927
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

