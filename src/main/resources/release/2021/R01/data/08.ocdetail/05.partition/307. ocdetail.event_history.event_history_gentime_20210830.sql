CREATE TABLE ocdetail.event_history_gentime_20210830
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

