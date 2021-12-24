CREATE TABLE ocdetail.event_history_gentime_20210905
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

