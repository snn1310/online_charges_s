CREATE TABLE ocdetail.event_history_gentime_20210913
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');
