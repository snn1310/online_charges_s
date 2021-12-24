CREATE TABLE ocdetail.event_history_gentime_20211011
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');

