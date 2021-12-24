CREATE TABLE ocdetail.event_history_gentime_20210907
        PARTITION OF ocdetail.event_history
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');

