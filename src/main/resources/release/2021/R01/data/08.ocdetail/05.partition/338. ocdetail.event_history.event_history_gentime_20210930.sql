CREATE TABLE ocdetail.event_history_gentime_20210930
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

