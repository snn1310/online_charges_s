CREATE TABLE ocdetail.event_history_gentime_20211013
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');

