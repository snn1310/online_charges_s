CREATE TABLE ocdetail.event_history_gentime_20210919
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

